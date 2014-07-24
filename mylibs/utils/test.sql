CREATE TABLE `libavtor` (
  `bid` int(10) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0',
  `role` binary(1) NOT NULL DEFAULT 'a' COMMENT 'a-автор,t-переводчик,i-иллюстратор',
  PRIMARY KEY (`bid`,`aid`),
  KEY `iav` (`aid`),
  KEY `role` (`role`),
  KEY `br` (`bid`,`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `libavtors` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(99) NOT NULL DEFAULT '',
  `MiddleName` varchar(99) NOT NULL DEFAULT '',
  `LastName` varchar(99) NOT NULL DEFAULT '',
  `NickName` varchar(33) NOT NULL DEFAULT '',
  `NoDonate` char(1) NOT NULL DEFAULT '',
  `uid` int(11) NOT NULL DEFAULT '0',
  `Email` varchar(255) NOT NULL DEFAULT '',
  `Homepage` varchar(255) NOT NULL DEFAULT '',
  `Blocked` char(1) NOT NULL,
  `public` char(1) NOT NULL,
  `pna` varchar(254) NOT NULL COMMENT 'UNIMARC.personal name $a',
  `pnb` varchar(254) NOT NULL DEFAULT '' COMMENT 'UNIMARC.personal name $b',
  `pnc` varchar(254) NOT NULL DEFAULT '' COMMENT 'UNIMARC.personal name $c',
  `pnd` varchar(254) NOT NULL DEFAULT '' COMMENT 'UNIMARC.personal name $d',
  `pnf` varchar(254) NOT NULL DEFAULT '' COMMENT 'UNIMARC.personal name $f',
  `png` varchar(254) NOT NULL DEFAULT '' COMMENT 'UNIMARC.personal name $g',
  `lang` char(2) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'Язык имени автора',
  `main` int(11) NOT NULL DEFAULT '0' COMMENT 'Основное имя',
  `gender` char(1) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'Male,Female,Group',
  PRIMARY KEY (`aid`) USING BTREE,
  KEY `FirstName` (`FirstName`(20)),
  KEY `LastName` (`LastName`(20)),
  KEY `NoDonate` (`NoDonate`),
  KEY `uid` (`uid`),
  KEY `public` (`public`),
  KEY `NickName` (`NickName`),
  KEY `name` (`pnc`),
  KEY `shortname` (`pnd`),
  KEY `pna` (`pna`),
  KEY `png` (`png`),
  KEY `main` (`main`)
) ENGINE=InnoDB AUTO_INCREMENT=237442 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE TABLE `libbook` (
  `bid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FileSize` int(10) unsigned NOT NULL DEFAULT '0',
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Title` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Title1` varchar(254) CHARACTER SET utf8 NOT NULL,
  `Lang` char(2) CHARACTER SET utf8 NOT NULL DEFAULT 'ru',
  `FileType` char(4) CHARACTER SET utf8 NOT NULL,
  `Year` smallint(6) NOT NULL DEFAULT '0',
  `Year1` smallint(6) NOT NULL DEFAULT '0' COMMENT 'год написания',
  `Deleted` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Ver` varchar(8) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `FileAuthor` varchar(64) CHARACTER SET utf8 NOT NULL,
  `keywords` varchar(255) CHARACTER SET utf8 NOT NULL,
  `Blocked` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `md5` binary(32) NOT NULL,
  `Broken` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT 'mark bad fb2',
  `Modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `authors` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`bid`),
  UNIQUE KEY `md5` (`md5`),
  KEY `Title` (`Title`),
  KEY `Year` (`Year`),
  KEY `Deleted` (`Deleted`),
  KEY `FileType` (`FileType`),
  KEY `Lang` (`Lang`),
  KEY `FileSize` (`FileSize`),
  KEY `FileAuthor` (`FileAuthor`),
  KEY `Title1` (`Title1`),
  KEY `Time` (`Time`)
) ENGINE=InnoDB AUTO_INCREMENT=495418 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `libgenremeta` (
  `gid` int(10) unsigned NOT NULL DEFAULT '0',
  `gidm` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `g` (`gid`,`gidm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `libgenre` (
  `bid` int(10) unsigned NOT NULL DEFAULT '0',
  `gid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`bid`,`gid`),
  KEY `igenre` (`gid`),
  KEY `ibook` (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE `libgenres` (
  `gid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gdesc` varchar(99) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `edesc` varchar(99) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`gid`),
  UNIQUE KEY `code` (`code`),
  KEY `gdesc` (`gdesc`)
) ENGINE=InnoDB AUTO_INCREMENT=1000022 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `libjoinedbooks` (
  `Time111` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `BadId` int(11) NOT NULL DEFAULT '0',
  `GoodId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`BadId`),
  KEY `Time` (`Time111`),
  KEY `GoodId` (`GoodId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `libmag` (
  `bid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `m` int(11) NOT NULL,
  UNIQUE KEY `bmy` (`bid`,`m`,`y`,`mid`),
  KEY `my` (`mid`,`y`),
  KEY `bid` (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `libmags` (
  `mid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Magazine ID',
  `class` char(9) NOT NULL COMMENT 'журнал/газета',
  `title` varchar(254) NOT NULL,
  `firstyear` int(11) NOT NULL,
  `lastyear` int(11) NOT NULL,
  `peryear` int(11) NOT NULL DEFAULT '12',
  PRIMARY KEY (`mid`),
  UNIQUE KEY `title` (`title`),
  KEY `class` (`class`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

CREATE TABLE `libpolka` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bid` int(11) NOT NULL DEFAULT '0',
  `type` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT 'b' COMMENT 'a,b,s,m',
  `uid` int(11) NOT NULL DEFAULT '0',
  `Text` text CHARACTER SET utf8 NOT NULL,
  `Flag` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`pid`),
  UNIQUE KEY `ubt` (`bid`,`type`,`uid`),
  KEY `type` (`type`),
  KEY `uid` (`uid`),
  KEY `bid` (`bid`),
  KEY `text` (`Text`(50))
) ENGINE=InnoDB AUTO_INCREMENT=2013929 DEFAULT CHARSET=latin1;

CREATE TABLE `libquality` (
  `bid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `q` char(1) NOT NULL,
  UNIQUE KEY `ub` (`bid`,`uid`),
  KEY `uid` (`uid`),
  KEY `q` (`q`),
  KEY `bid` (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `librate` (
  `bid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `Rate` char(1) NOT NULL,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bid`,`uid`),
  KEY `UserId` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `libseq` (
  `bid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `sn` int(11) NOT NULL,
  `sort` decimal(28,0) NOT NULL DEFAULT '999999999999999999999999' COMMENT '4   6 ',
  UNIQUE KEY `bs` (`bid`,`sid`),
  KEY `SeqId` (`sid`),
  KEY `bid` (`bid`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `libseqs` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `seqname` varchar(254) NOT NULL DEFAULT '',
  `parent` int(11) NOT NULL DEFAULT '0' COMMENT 'родительский сериал',
  `nn` int(11) NOT NULL DEFAULT '0' COMMENT 'место в родительском сериале',
  `good` int(10) unsigned NOT NULL DEFAULT '0',
  `lang` char(2) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT 'ru',
  `type` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT 'a',
  PRIMARY KEY (`sid`),
  UNIQUE KEY `SeqName_2` (`seqname`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=48659 DEFAULT CHARSET=utf8 COMMENT='Список форм (1-100) и названий сериа';

CREATE TABLE `libsrclang` (
  `bid` int(11) NOT NULL,
  `SrcLang` char(2) NOT NULL,
  PRIMARY KEY (`bid`),
  KEY `SrcLang` (`SrcLang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
