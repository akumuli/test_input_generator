from __future__ import print_function
import argparse
import datetime
import random


def parse_timestamp(ts):
    """Parse ISO formatted timestamp"""
    try:
        return datetime.datetime.strptime(ts.rstrip('0').rstrip('.'), "%Y%m%dT%H%M%S.%f")
    except ValueError:
        return datetime.datetime.strptime(ts, "%Y%m%dT%H%M%S")

def parse_timedelta(delta):
    t = datetime.datetime.strptime(delta,"%H:%M:%S")
    return datetime.timedelta(hours=t.hour, minutes=t.minute, seconds=t.second)

def bulk_msg(ts, measurements, values, **tags):
    ncol = len(measurements)
    metric = "|".join(measurements)
    sname = "+" + metric + ' ' + ' '.join(['{0}={1}'.format(key, val) for key, val in tags.iteritems()])
    timestr = ts.strftime('+%Y%m%dT%H%M%S.%f')
    header = "*{0}".format(ncol)
    lines = [sname, timestr, header]
    for val in values:
        lines.append("+{0}".format(val))
    return '\r\n'.join(lines) + '\r\n'

def generate_rows(ts, measurements, delta, **tags):
    row = [0.0] * len(measurements)

    while True:
        for i in xrange(0, len(measurements)):
            row[i] += random.normal(0.0, 0.01, 0.01)
            msg = bulk_msg(ts, measurements, row, **tags)
            yield ts, msg
            ts += delta

def generate_rr(list_fn):
    N = len(list_fn)
    iters = [fn() for fn in list_fn]
    ix = 0
    while True:
        it = iters[ix % N]
        yield it.next()
        ix += 1


def main(idrange, timerange):
    print("Ids  - [{0}, {1}]".format(*idrange))
    print("Time - [{0}, {1}, {2}]".format(*timerange))

    begin, end, delta = timerange
    idbegin, idend = idrange

    measurements = [
        'cpu.user', 'cpu.sys', 'cpu.real', 'idle', 'mem.commit',
        'mem.virt', 'iops', 'tcp.packets.in', 'tcp.packets.out',
        'tcp.ret', 'pg.mem', 'pg.ncon'
    ]

    tag_combinations = {
        'region': ['NW', 'NE', 'Europe'],
        'OS': ['Ubuntu 16.04', 'Ubuntu 14.04']
        'instance-type': ['m3.large', 'm3.xlarge', 'm3.2xlarge', 'm4.large', 'm4.xlarge', 'm4.2xlarge']
    }

    list_hosts = ['host_{0}'.format(id) for id in range(idbegin, idend)]

    tags = []
    for host in list_hosts:
        tagline = {'host': host}
        for k, v in tag_combinations.iteritems():
            tagline[k] = random.chose(v)
        tags.append(tags)

    lambdas = [lambda: generate_rows(begin, delta, measurements, **t) for t in tags]

    for ts, msg in generate_rr(lambdas):
        if ts > end:
            break
        print(msg)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Process some integers.')
    parser.add_argument('--rbegin', required=True, help='begining of the id range')
    parser.add_argument('--rend',   required=True, help='end of the id range')
    parser.add_argument('--tbegin', required=True, help='begining of the time range')
    parser.add_argument('--tend',   required=True, help='end of the time range')
    parser.add_argument('--tdelta', required=True, help='time step')

    args = parser.parse_args()

    main((args.rbegin, args.rend), (parse_timestamp(args.tbegin), parse_timestamp(args.tend), parse_timedelta(args.tdelta)))
