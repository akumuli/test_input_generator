from __future__ import print_function
import argparse
import datetime
import random
import sys
from itertools import product


def bulk_msg(measurements, types, values, *tags):
    ncol = len(measurements)
    metrics = []
    for metric in measurements:
        sname = metric + ' ' + ' '.join(['{0}={1}'.format(key, val) for key, val in tags])
        metrics.append(sname)
    return "\n".join(metrics) + "\n"

def generate_rows(measurements, types, msg_fn, *tags):
    row = [10.0] * len(measurements)
    out = list(row)

    while True:
        msg = msg_fn(measurements, types, out, *tags)
        yield msg

def generate_rr(iters):
    N = len(iters)
    ix = 0
    while True:
        it = iters[ix % N]
        yield it.next()
        ix += 1

def main(seed):

    random.seed(seed)

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

    list_hosts = ["192.168.{0}.{1}".format(*m) for m in product(range (0, 255), range(0, 255))]

    tags = []
    for host in list_hosts:
        tagline = [('host', host)]
        for k, v in tag_combinations.iteritems():
            tagline.append((k, random.choice(v)))
        tagline.sort()
        tags.append(tagline)

    fn = bulk_msg
    lambdas = [generate_rows(measurements, types, fn, *t) for t in tags]

    limit = 1000000
    for ix, msg in enumerate(generate_rr(lambdas)):
        if ix > limit:
            break
        sys.stdout.write(msg)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Process some integers.')
    parser.add_argument('--seed',   required=False, help='custom seed', default=None)

    args = parser.parse_args()

    main(args.seed)
