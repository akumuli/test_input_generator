from __future__ import print_function
import argparse
import datetime
import random
import sys


def parse_timestamp(ts):
    """Parse ISO formatted timestamp"""
    try:
        return datetime.datetime.strptime(ts.rstrip('0').rstrip('.'), "%Y%m%dT%H%M%S.%f")
    except ValueError:
        return datetime.datetime.strptime(ts, "%Y%m%dT%H%M%S")

def parse_timedelta(delta):
    t = datetime.datetime.strptime(delta,"%H:%M:%S")
    return datetime.timedelta(hours=t.hour, minutes=t.minute, seconds=t.second)

def bulk_msg(ts, measurements, types, values, *tags):
    ncol = len(measurements)
    metric = "|".join(measurements)
    sname = "+" + metric + ' ' + ' '.join(['{0}={1}'.format(key, val) for key, val in tags])
    timestr = ts.strftime('+%Y%m%dT%H%M%S.000000000')
    header = "*{0}".format(ncol)
    lines = [sname, timestr, header]
    for i, val in enumerate(values):
        if types[i] == 0:
            lines.append("+{:.17}".format(val))
        else:
            lines.append("+{0}".format(val))
    return '\r\n'.join(lines) + '\r\n'

def open_tsdb_msg(ts, measurements, types, values, *tags):
    ncol = len(measurements)
    lines = []
    for i in range(0, ncol):
        metric = measurements[i]
        line = "put "
        line += metric
        line += " {0} ".format((ts - datetime.datetime(1970, 1, 1)).total_seconds())
        if types[i] == 0:
            line += "{:.17} ".format(values[i])
        else:
            line += "{0} ".format(values[i])
        line += ' '.join(['{0}={1}'.format(key, val) for key, val in tags])
        lines.append(line)
    return '\n'.join(lines) + '\n'

def generate_rows(ts, delta, measurements, types, msg_fn, *tags):
    row = [10.0] * len(measurements)
    out = list(row)

    while True:
        for i in xrange(0, len(measurements)):
            row[i] += random.gauss(0.0, 0.01)
            out[i] = row[i] if types[i] == 0 else int(row[i])
        msg = msg_fn(ts, measurements, types, out, *tags)
        yield ts, msg
        ts += delta

def generate_rr(iters):
    N = len(iters)
    ix = 0
    while True:
        it = iters[ix % N]
        yield it.next()
        ix += 1

def main(idrange, timerange, out_format, seed):

    random.seed(seed)

    begin, end, delta = timerange
    idbegin, idend = idrange

    measurements = [
        'cpu.user', 'cpu.sys', 'cpu.real', 'idle', 'mem.commit',
        'mem.virt', 'iops', 'tcp.packets.in', 'tcp.packets.out',
        'tcp.ret',
    ]

    # measurement types, 0 - float, 1 - int
    types = [
        0, 0, 0, 0, 1, 1, 1, 1, 1, 0
    ]

    tag_combinations = {
        'region': ['ap-southeast-1', 'us-east-1', 'eu-central-1'],
        'OS': ['Ubuntu_16.04', 'Ubuntu_14.04'],
        'instance-type': ['m3.large', 'm3.xlarge', 'm3.2xlarge', 'm4.large', 'm4.xlarge', 'm4.2xlarge'],
        'arch': ['x64'],
        'team': ['NY', 'NJ'],
        'rack': range(1, 100),
    }

    list_hosts = ['host_{0}'.format(id) for id in range(idbegin, idend)]

    tags = []
    for host in list_hosts:
        tagline = [('host', host)]
        for k, v in tag_combinations.iteritems():
            tagline.append((k, random.choice(v)))
        tagline.sort()
        tags.append(tagline)

    fn = bulk_msg if out_format == 'RESP' else open_tsdb_msg
    lambdas = [generate_rows(begin, delta, measurements, types, fn, *t) for t in tags]

    for ts, msg in generate_rr(lambdas):
        if ts > end:
            break
        sys.stdout.write(msg)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Process some integers.')
    parser.add_argument('--rbegin', required=True, help='begining of the id range')
    parser.add_argument('--rend',   required=True, help='end of the id range')
    parser.add_argument('--tbegin', required=True, help='begining of the time range')
    parser.add_argument('--tend',   required=True, help='end of the time range')
    parser.add_argument('--tdelta', required=True, help='time step')
    parser.add_argument('--format', required=True, help='format - RESP or OpenTSDB')
    parser.add_argument('--seed',   required=False, help='custom seed', default=None)

    args = parser.parse_args()

    main((int(args.rbegin), int(args.rend)), (parse_timestamp(args.tbegin), parse_timestamp(args.tend), parse_timedelta(args.tdelta)), args.format, args.seed)
