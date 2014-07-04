# -*- coding: utf-8 -*-
import os
from os.path import *
import stat
import shutil
from glob import iglob
from zipfile import is_zipfile, ZipFile
from collections import namedtuple

class Lib:

    def __init__(self, prefix, target, archive=u"archive"):
        self._prefix = prefix
        self._archive = join(prefix, archive)
        self._target = join(prefix, target)

    def tgt(self, fn):
        return join(self._target, basename(fn))

    def arc(self, fn):
        return join(self._archive, basename(fn))

    def targets(self, mask='*'):
        return iglob(join(self._target, mask))

    def archives(self, mask='*'):
        return iglob(join(self._archive, mask))

    def link(self, other, mask='*', dryrun=1):
        for fn in self.targets(mask):
            if not islink(fn):
                arc = other.arc(fn)
                if not exists(arc):
                    print("Moving: {} -> {}".format(fn, arc))
                    if not dryrun: os.move(fn)
                    print("Link: {} -> {}".format(fn, arc))
                    if not dryrun: os.symlink(arc, fn)


    def archive(self, mask='*', dryrun=1):
        for fn in self.targets(mask):
            if not islink(fn):
                arc = self.arc(fn)
                if exists(arc):
                    print("already exists: {}".format(badf))
                    continue
                if is_zipfile(fn):
                    print("checking: {}".format(fn))
                    zf = ZipFile(fn)
                    badf = zf.testzip()
                    print("badf = {}".format(badf))
                    if badf is None:
                        print("Moving: {} -> {}".format(fn, arc))
                        if not dryrun:
                            shutil.move(fn, arc)
                            os.chmod(arc, stat.S_IRUSR|stat.S_IRGRP|stat.S_IROTH)
                        print("Link: {} -> {}".format(fn, arc))
                        if not dryrun: os.symlink(arc, fn)



if __name__ == "__main__":

    f = Lib(prefix = u"/home/termim/Download/Books/libs/Flibusta",
            target = u"fb2.Flibusta.Net")
    l = Lib(prefix = u"/home/termim/Download/Books/libs/Librusec",
            target = u"_Lib.rus.ec - Официальная/lib.rus.ec")

    #f.link(l, "f.*", dryrun=0)
    f.archive("f.*", dryrun=0)

