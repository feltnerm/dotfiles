#!/usr/bin/env python

# .py
# @TODO:
# * symlink dotfiles from $DOTFILES to $HOME
# * read configuration

import argparse, difflib, functools, re, shutil, subprocess, sys, time, os
from pprint import pprint

__description__ = "Manage your dotfiles."

ls = lambda path: os.listdir(path)
ls_abs = lambda path: [os.path.join(path, x) for x in os.listdir(path)]
ln = lambda src, dst: os.symlink(src, dst)

def rm(path):
    try:
        if os.path.isdir(path):
            os.rmdir(path)
        else:
            os.remove(path)
    except OSError, e:
        print(e)

def diff(fromfile, tofile):
    if os.path.exists(tofile):
        fromdate = time.ctime(os.stat(fromfile).st_mtime)
        todate = time.ctime(os.stat(tofile).st_mtime)
        fromlines = open(fromfile, 'U').readlines()
        tolines = open(tofile, 'U').readlines()

        diff = difflib.unified_diff(fromlines, tolines,
                    fromfile, tofile, fromdate, todate)
        return diff

def parse_args(argv):

    DEFAULTS = {
        'source_dir': os.path.join(os.getenv("HOME"), "dotfiles"),
        'dest_dir': os.path.join(os.getenv("HOME"))
        }

    ap = argparse.ArgumentParser(prog='dots.py',
                                 description=__description__)

    ap.add_argument("-d", "--dest-dir", default=DEFAULTS['dest_dir'],
            help="Directory to process source files to.")
    ap.add_argument("-e", "--exclude", help="Regex of files to exclude")
    ap.add_argument("-f", "--force", help="Force the operation to continue.")
    ap.add_argument("-i", "--interactive", default=False, action='store_true',
            help="Run interactively.")
    ap.add_argument("-l", "--list-commands", default=False, action='store_true',
            help="List the possible commands.")
    ap.add_argument("-n", "--dry-run", default=False, action='store_true',
            help="Dry run.")
    ap.add_argument("--no-dot",
            help="Comma-separated list of files to not append a '.' to")
    ap.add_argument("-s", "--source-dir", default=DEFAULTS['source_dir'],
            help="Directory to process source files from.")
    ap.add_argument("-v", "--version", default=False, action='store_true',
            help="Print the version.")
    ap.add_argument("-V", "--verbose", default=False, action='store_true',
            help="Verbose mode.")
    ap.add_argument("commands", nargs="*",  help="Command to run.")

    args = ap.parse_args(argv)

    return args

def ask(msg):

    inp = raw_input(msg + " [Y]/n?").lower()
    while inp not in ('y','n'):
        inp = raw_input(msg + " [Y]/n?").lower()

    if inp == 'y':
        return True
    else:
        return False


#
# dotfiles command API
#
class Dotfiles(object):

    def __init__(self, opts):
        self.options = {
                "exclude": [
                    r'^\.'
                ],
                "exclude_list": [
                    'README.md',
                    'LICENSE',
                    'dots.py',
                ],
                "nodot_list": ['bin']
            }

        for key in opts.keys():
            if opts.get(key, None):
                self.options[key] = (opts.get(key))

        # Look for the source and destination directories
        self.src = self.options.get('source_dir', None)
        self.dst = self.options.get('dest_dir', None)
        if not (os.path.isdir(self.src) and os.path.isdir(self.dst)):
            raise Exception("BAD PATH: <Source: %s> <Dest: %s>" %
                    (self.src, self.dst))

        # Process files which to not add a '.' to
        _nodot = self.options.get('nodot', None)
        if _nodot:
            if "," in _nodot:
                self.options['nodot_list'].extend(_nodot.split(','))
            else:
                self.options['nodot_list'].append(_nodot)

        # Process regex for excluding files
        _re_excludes = self.options.get('exclude', None)
        if _re_excludes:
            for _re_exclude in _re_excludes:
                _re_exclude = _re_exclude.decode('string_escape')
                re_exclude = re.compile(_re_exclude)
                self.options['exclude_list'].extend(filter(lambda x: re_exclude.match(x), ls(self.src)))
        #_re_exclude = self.options.get('exclude', None)
        #if _re_exclude:
        #    _re_exclude = _re_exclude.decode('string_escape')
        #    re_exclude = re.compile(_re_exclude)
        #    self.options['exclude_list'].extend(filter(lambda x: re_exclude.match(x), ls(self.src)))

        # Pre-process (cache) these files for quick access
        #self.source_files = self._nodots(self._exclude(ls(self.src))()
        self.source_files = self._exclude(ls(self.src))()
        self.dest_files = ls(self.dst)

        self.verbose = self.options.get('verbose')
        self.interactive = self.options.get('interactive')
        self.dry_run = self.options.get('dry_run')

        if self.options.get('verbose', False):
            pprint(self.options)

    @property
    def commands(self):
        return filter(lambda method: method.startswith('cmd_'), dir(self))

    def _nodots(self, l):
        def map_func(x):
            return x.lstrip('.') if x in self.options['nodot_list'] else x

        return functools.partial(map, map_func, l)

    def _exclude(self, l):
        def filter_func(x):
            return x not in [os.path.basename(a) for a in self.options['exclude_list']]

        return functools.partial(filter, filter_func, l)

    def _execute(self, cmd, func):

        if self.dry_run:
            self.verbose = True
            self.func = None
        if self.verbose:
            print("# Execute: %s" % cmd)

        if func:
            func()


    def run(self, command):
        cmd = 'cmd_' + command
        if hasattr(self, cmd):
            func = getattr(self, cmd)
            if callable(func):
                try:
                    self._execute(cmd, func)
                except Exception, e:
                    print(e)

    #
    # Commands API
    #

    def cmd_init(self):
        """ Task to initialize dotfiles in your $HOME for the first time. """
        print(">> Initing ...")
        commands = ['update', 'diff', 'link']
        for cmd in commands:
            self.run(cmd)

    def cmd_diff(self):
        """ Show the differences between $DOTFILES and $HOME. """
        print(">> Diffing ...")
        for from_file in self.source_files:
            fromfile = os.path.join(self.options.get('source_dir'), from_file)
            if not os.path.isdir(fromfile):
                #to_file = os.path.join(self.options.get('dest_dir', from_file))
                tofile = os.path.join(self.options.get('dest_dir'), "." + from_file)

                sys.stdout.writelines(diff(fromfile, tofile))

    def cmd_link(self):
        """ Link files in $DOTFILES to corresponding files in $HOME. """
        print(">> Linking ...")
        for from_file in self.source_files:
            fromfile = os.path.join(self.options.get('source_dir'), from_file)
            tofile = os.path.join(self.options.get('dest_dir'), "." + from_file)

            if os.path.lexists(tofile):
                print("\nFile %s exists already!" % tofile)
                if not os.path.isdir(tofile):
                    diff(fromfile, tofile)
                if self.verbose:
                    print("ln(%s, %s)" % (fromfile, tofile))
                if self.interactive:
                    if ask("Link %s->%s" % (fromfile, tofile)):
                        rm(tofile)
                        ln(fromfile, tofile)
                else:
                    rm(tofile)
                    ln(fromfile, tofile)
            else:
                if self.verbose:
                    print("ln(%s, %s)" % (fromfile, tofile))
                if self.interactive:
                    if ask("Link %s->%s" % (fromfile, tofile)):
                        ln(fromfile, tofile)
                else:
                    ln(fromfile, tofile)

    def cmd_clean(self):
        """ Clean the dotfiles in $HOME. """
        print(">> Cleaning ...")
        for from_file in self.source_files:
            fromfile = os.path.join(self.options.get('source_dir'), from_file)
            tofile = os.path.join(self.options.get('dest_dir'), "." + from_file)

            if os.path.lexists(tofile):
                if self.verbose:
                    print("rm(%s)" % tofile)
                rm(tofile)

    def cmd_update(self):
        """ Update dotfiles and dependencies in $HOME with latest
        in the repo(s). """
        print(">> Updating ...")
        cmd = "cd %s; git pull" % self.options.get('source_dir')
        output = subprocess.check_output(
                    cmd,
                    stderr=subprocess.STDOUT,
                    shell=True)
        print(output)

    def cmd_status(self):
        """ Status of $DOTFILES. """
        print(">> Status: ")
        cmd = "cd %s; git status" % self.options.get('source_dir')
        output = subprocess.check_output(
                    cmd,
                    stderr=subprocess.STDOUT,
                    shell=True)
        print(output)


def run(commands, opts):

    df = Dotfiles(opts)
    if not opts['commands'] or opts['list_commands']:
        for cmd in df.commands:
            print(cmd.split("_")[1]+":")
            docstring = getattr(getattr(df, cmd), '__doc__')
            print(docstring)
    else:
        for command in commands:
            df.run(command)

#
# main
#
def main(argv=None):
    args = parse_args(argv)
    run(args.commands, vars(args))
    return 0 # success


if __name__ == '__main__':
    status = main()
    sys.exit(status)
