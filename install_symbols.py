#!/usr/bin/python

import os
import sys
import re
import shutil


symbolsdir = '../symbols'

reg = re.compile('^MODULE\s(?P<system>\w+)\s(?P<arch>\w+)\s(?P<sign>[0-9A-F]+)\s(?P<elf>[\w\.]+)')


def prepare_sym(sympath,destpath):
    sympath = os.path.abspath(sympath)
    symdir,filename = os.path.split(sympath)
    elfname,symext = os.path.splitext(filename)

    if not symext == '.sym':
        print "Unkown extname:",symext
        return False

    cmd_cat_module = 'head -n1 %s' % (sympath)
    modulestr = os.popen(cmd_cat_module).read()
    
    regMatch = reg.match(modulestr)
    dict = regMatch.groupdict()

    if not dict.has_key('sign'):
        print 'Can not found module sign for %s' % sympath
        return False

    sign = dict['sign']

    targetpath = os.path.join(destpath,elfname,sign)

    if not os.path.exists(targetpath):
        os.makedirs(targetpath)

    targetfile = os.path.join(targetpath,filename)
    if os.path.isfile(targetfile):
        os.remove(targetfile)

    shutil.copy(sympath,targetfile)
    return True


def main():
    if len(sys.argv) <> 3:
        print "need symbol path"
        return
    prepare_sym(sys.argv[1],sys.argv[2])

main()
