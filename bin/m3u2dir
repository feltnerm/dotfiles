#!/usr/bin/env python
"""
m3u2dir.py

Copies the files found in a .m3u file
o either the current working dir or a dir
specified on the command line.

IDEAS:
    automatically find .m3u in current working dir
    folder name defaults to name of m3u
    generate tracklist/filelist in folder after moving
    force overwrite or not?

usage:
    python m3u2dir.py --destination [path] [path_to_m3u]

A simple m3u file is like this:
#EXTM3U
#EXTINF:288,Boombox - Bassnectar
/Users/mark/Music/Tunes/Bassnectar - Cozza Frenzy (V0 - what)/01 Bassnectar - Boombox.mp3

- #EXTM3U (unchaged) - format descriptor
- #EXTINF (unchanged) - record marker
- : is a separator
- 288 - length of track, in seconds
- , is other separator
- /path/etc. etc. is the absolute/relative path to the file
"""
from datetime import datetime
import sys
import os
import os.path
import argparse
import shutil
from datetime import datetime

from mutagen.easyid3 import EasyID3 as id3

FORMAT_DESCRIPTOR = "#EXTM3U"
RECORD_MARKER = "#EXTINF"

def open_2(filename, mode = 'wb', *args, **kwargs):

    if mode not in ('w', 'wb'):
        return None
    (dirname, basename) = os.path.split(filename)
    if not os.path.exists(dirname):
        os.makedirs(dirname)
    return file(filename, mode, *args, **kwargs)

def mkdir_2(dirname):
    if not os.path.exists(dirname):
        os.makedirs(dirname)

def copy_2(src, dst):
    srcfd = file(src)
    dstfd = file(dst, 'wb')
    shutil.copyfileobj(srcfd, dstfd)

def get_tags(f):

    os.path.abspath(f)

    try:
        audio = id3(f)
        artist = audio['artist'][0]
        title = audio['title'][0]
        return (artist, title)
    except:
        return (f, None)

def write_tracklist(filename, paths):

    hd = 'TRACKLIST for %s' % filename
    d = 'Generated on %s' % datetime.now().strftime("%Y-%M-%D %H:%m%p")
    filename = filename + '_tracklist.txt'
    with open(filename, 'w') as f:
        f.write(hd + '\n')
        f.write(d + '\n')
        n, d = 1, len(paths)
        for p in paths:
            artist, title = get_tags(p)
            s = '%s/%s | %s - %s' % (n, d, artist, title)
            print s
            n += 1
            f.write(s + '\n')

def read_m3u(m3u_path, t):
    """ Return a list of paths to the mp3s found in an m3u
    if t is True, a tracklist ([m3u_name].txt) is created"""

    if m3u_path.endswith('.m3u') and os.path.isfile(m3u_path):
        paths = []
        with open(m3u_path, 'r') as f:
            data = f.readlines()
            data = data[0].split('\r') # fuck you, apple

            for l in data:
                if l.startswith(FORMAT_DESCRIPTOR) or l.startswith(RECORD_MARKER):
                    pass
                elif l:
                    p = l.strip()
                    paths.append(p)
                else:
                    pass
        if t:
            write_tracklist(m3u_path.split('.')[0], paths)

        return paths
    else:
        print 'Invalid m3u path'
        return None

def process_opts(argv):

    if not argv:
        argv = sys.argv[1:]

    p = argparse.ArgumentParser(description = "Move mp3s around on your hard drive")

    p.add_argument('m3u', metavar = '/path/to/m3u', nargs = '?'
                 , help = "Path to .m3u file.")
    p.add_argument('-d', '--destination', metavar = '/path/to/dest'
                 , help = 'Path to copy mp3s to')
    p.add_argument('-t', action = 'store_true', default = False
                 , help = "Generate tracklist")

    args = p.parse_args(argv)

    m3u, t = args.m3u, args.t

    if not m3u or not os.path.exists(m3u):
        print p.usage
        return None, None, None

    if args.destination:
        destination = args.destination
    else:
        destination = os.path.join(os.getcwd(), m3u.split('.')[0])

    if not os.path.exists(destination):
        os.makedirs(destination)


    return (m3u, destination, t)

def main(argv = None):

    timer1 = datetime.now()
    m3u, dest, t = process_opts(argv)
    if m3u:

        dest = os.path.realpath(dest)

        print 'PLAN:'
        print ' Copy files found in %s' % m3u
        print ' To dest provided by %s' % dest

        m3us = read_m3u(m3u, t)
        for m in m3us:
            if os.path.isfile(m):

                d = os.path.join(dest, os.path.basename(m))
                copy_2(m, d)

    else:
        print' Path to m3u required.'

    timer2 = datetime.now()
    print 'TOTALLY DONE.'

    r = timer2 - timer1
    print 'Timer: %s' % str(r)
    return 0    # success !

if __name__ == "__main__":
    status = main()
    sys.exit(status)

