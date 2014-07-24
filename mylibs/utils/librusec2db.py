# -*- coding: utf-8 -*-
from os.path import *

from mysql2db import ConverterToSqlite

#ffdump = "/home2/termim/books/gen.lib.rus.ec/backup/upd-5part/backup/backup_ba.sql"
#ffdump = "/tmp/sql/libgenre.sql.gz"
ffdump = "/tmp/sql/libgenres.sql.gz"
#ffdump = "test.sql"
ffout = ffdump+".out"

lrc = [
    "libavtor.sql.gz",
    "libavtors.sql.gz",
    "libbook.sql.gz",
    "libgenremeta.sql.gz",
    "libgenre.sql.gz",
    "libgenres.sql.gz",
    "libjoinedbooks.sql.gz",
    "libmag.sql.gz",
    "libmags.sql.gz",
#]
#lrc = [
    "libpolka.sql.gz",
#]
#lrc = [
    "libquality.sql.gz",
    "librate.sql.gz",
    "libseq.sql.gz",
#]
#lrc = [
    "libseqs.sql.gz",
    "libsrclang.sql.gz",
#]
#lrc = [
#    "upd-5part/backup/backup_ba.sql",
]
for f in lrc:
    print f, "..."
    ffdump = join("/tmp/sql", f)
    #c = Converter(ffdump)
    #c.convert(ffout)
    #fout = "backup_ba_out.db"
    c = ConverterToSqlite(ffdump)
    c.convert(ffdump + ".db")
