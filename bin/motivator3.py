#!/usr/bin/env python3

"""
Motivator 3k

displays a quote or goal from a list of quotes or goals

"""
import os
import os.path
import random
import mmap

QUOTES_DEST = os.path.join(os.environ['HOME'], 'doc/quotes')


# get # lines in file
with open(QUOTES_DEST, "r+") as f:
    buf = mmap.mmap(f.fileno(), 0)
    lines = 0
    readline = buf.readline
    while readline():
        lines += 1

    ceiling = random.randint(0, lines-1)
    
    f.seek(0)

    quote, author = f.readlines()[ceiling].strip('\n').split('+')
if author:
    print(""""%s" - %s""" % (quote, author))
else:
    print(quote)
