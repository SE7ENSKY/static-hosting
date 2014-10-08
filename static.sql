SET NAMES utf8;

DROP TABLE IF EXISTS `ftpgroup`;
CREATE TABLE `ftpgroup` (
  `gid` smallint(6) NOT NULL DEFAULT '5500',
  `groupname` varchar(16) NOT NULL,
  `members` varchar(16) NOT NULL,
  PRIMARY KEY (`gid`),
  KEY `groupname` (`groupname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ProFTP group table';

DROP TABLE IF EXISTS `ftpuser`;
CREATE TABLE `ftpuser` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(64) NOT NULL DEFAULT '',
  `passwd` varchar(32) NOT NULL DEFAULT '',
  `uid` smallint(6) NOT NULL DEFAULT '5500',
  `gid` smallint(6) NOT NULL DEFAULT '5500',
  `homedir` varchar(255) NOT NULL DEFAULT '',
  `shell` varchar(16) NOT NULL DEFAULT '/sbin/nologin',
  `count` int(11) NOT NULL DEFAULT '0',
  `accessed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='ProFTP user table';
