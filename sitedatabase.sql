-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.12-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table site_last.bloks
CREATE TABLE IF NOT EXISTS `bloks` (
  `id_blok` int(11) unsigned NOT NULL,
  `id_manager` int(11) unsigned NOT NULL,
  `blok_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level_no` int(11) DEFAULT NULL,
  `how_many_KM` int(11) DEFAULT NULL,
  `blok_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `how_many_home` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_blok`),
  KEY `FK_bloks_manager` (`id_manager`),
  CONSTRAINT `FK_bloks_manager` FOREIGN KEY (`id_manager`) REFERENCES `manager` (`id_manager`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table site_last.bloks: ~4 rows (approximately)
/*!40000 ALTER TABLE `bloks` DISABLE KEYS */;
INSERT INTO `bloks` (`id_blok`, `id_manager`, `blok_name`, `level_no`, `how_many_KM`, `blok_type`, `how_many_home`) VALUES
	(1, 1, 'nabil', 1, 1, 'b', 11),
	(2, 1, '2', 2, 2, '2', 2),
	(3, 2, '3', 3, 3, '3', 3);
/*!40000 ALTER TABLE `bloks` ENABLE KEYS */;

-- Dumping structure for table site_last.home
CREATE TABLE IF NOT EXISTS `home` (
  `id_home` int(11) unsigned NOT NULL,
  `id_blok` int(11) unsigned NOT NULL,
  `floor_num` int(11) DEFAULT NULL,
  `door_num` int(11) DEFAULT NULL,
  `site_payments` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_home`),
  KEY `id_blok` (`id_blok`),
  CONSTRAINT `FK_home_bloks` FOREIGN KEY (`id_blok`) REFERENCES `bloks` (`id_blok`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table site_last.home: ~0 rows (approximately)
/*!40000 ALTER TABLE `home` DISABLE KEYS */;
INSERT INTO `home` (`id_home`, `id_blok`, `floor_num`, `door_num`, `site_payments`) VALUES
	(1, 1, 1, 1, 1),
	(2, 2, 2, 2, 2),
	(3, 2, 3, 3, 3);
/*!40000 ALTER TABLE `home` ENABLE KEYS */;

-- Dumping structure for table site_last.manager
CREATE TABLE IF NOT EXISTS `manager` (
  `id_manager` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TC` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `Phone` int(11) DEFAULT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_manager`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table site_last.manager: ~3 rows (approximately)
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` (`id_manager`, `name`, `last_name`, `TC`, `age`, `Phone`, `Email`) VALUES
	(1, 'nabil', 'anan', 234234, 23, 34234234, 'nan.com'),
	(2, 'nabil', 'anan', 234234, 25, 34234234, 'nan.com'),
	(3, 'www', 'qw', 7777, 21, 21, '2');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;

-- Dumping structure for table site_last.people
CREATE TABLE IF NOT EXISTS `people` (
  `id_people` int(11) unsigned NOT NULL,
  `id_home` int(11) unsigned NOT NULL,
  `id_manager` int(11) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TC` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `people_num` int(11) DEFAULT NULL,
  `payments` int(11) DEFAULT NULL,
  `rent_payments` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_people`),
  KEY `FK_people_home` (`id_home`),
  KEY `FK_people_manager` (`id_manager`),
  CONSTRAINT `FK_people_home` FOREIGN KEY (`id_home`) REFERENCES `home` (`id_home`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_people_manager` FOREIGN KEY (`id_manager`) REFERENCES `manager` (`id_manager`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table site_last.people: ~0 rows (approximately)
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` (`id_people`, `id_home`, `id_manager`, `name`, `last_name`, `TC`, `age`, `people_num`, `payments`, `rent_payments`) VALUES
	(1, 1, 1, '1', '1', 1, 1, 1, 1, 1);
/*!40000 ALTER TABLE `people` ENABLE KEYS */;

-- Dumping structure for table site_last.play_ground
CREATE TABLE IF NOT EXISTS `play_ground` (
  `id_play` int(11) unsigned NOT NULL,
  `play_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `play_num` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_play`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table site_last.play_ground: ~3 rows (approximately)
/*!40000 ALTER TABLE `play_ground` DISABLE KEYS */;
INSERT INTO `play_ground` (`id_play`, `play_name`, `play_num`) VALUES
	(2, 'dd', '2'),
	(3, '3', '3'),
	(4, '4', '4'),
	(5, '5', '5');
/*!40000 ALTER TABLE `play_ground` ENABLE KEYS */;

-- Dumping structure for table site_last.play_ground_workers
CREATE TABLE IF NOT EXISTS `play_ground_workers` (
  `id_play` int(11) unsigned NOT NULL,
  `id_workers` int(11) unsigned NOT NULL,
  KEY `FK_play_ground_workers_play_ground` (`id_play`),
  KEY `FK_play_ground_workers_workers` (`id_workers`),
  CONSTRAINT `FK_play_ground_workers_play_ground` FOREIGN KEY (`id_play`) REFERENCES `play_ground` (`id_play`) ON UPDATE CASCADE,
  CONSTRAINT `FK_play_ground_workers_workers` FOREIGN KEY (`id_workers`) REFERENCES `workers` (`id_workers`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table site_last.play_ground_workers: ~0 rows (approximately)
/*!40000 ALTER TABLE `play_ground_workers` DISABLE KEYS */;
INSERT INTO `play_ground_workers` (`id_play`, `id_workers`) VALUES
	(2, 2),
	(3, 3);
/*!40000 ALTER TABLE `play_ground_workers` ENABLE KEYS */;

-- Dumping structure for table site_last.play_visor
CREATE TABLE IF NOT EXISTS `play_visor` (
  `id_play` int(11) unsigned NOT NULL,
  `id_supervisor` int(11) unsigned NOT NULL,
  KEY `FK_play_visor_play_ground` (`id_play`),
  KEY `FK_play_visor_supervisor` (`id_supervisor`),
  CONSTRAINT `FK_play_visor_play_ground` FOREIGN KEY (`id_play`) REFERENCES `play_ground` (`id_play`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_play_visor_supervisor` FOREIGN KEY (`id_supervisor`) REFERENCES `supervisor` (`id_supervisor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table site_last.play_visor: ~3 rows (approximately)
/*!40000 ALTER TABLE `play_visor` DISABLE KEYS */;
/*!40000 ALTER TABLE `play_visor` ENABLE KEYS */;

-- Dumping structure for table site_last.pool_workers
CREATE TABLE IF NOT EXISTS `pool_workers` (
  `id_pool` int(11) unsigned NOT NULL,
  `id_workers` int(11) unsigned NOT NULL,
  KEY `FK_pool_workers_swimming_pool` (`id_pool`),
  KEY `FK_pool_workers_workers` (`id_workers`),
  CONSTRAINT `FK_pool_workers_swimming_pool` FOREIGN KEY (`id_pool`) REFERENCES `swimming_pool` (`id_pool`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_pool_workers_workers` FOREIGN KEY (`id_workers`) REFERENCES `workers` (`id_workers`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table site_last.pool_workers: ~0 rows (approximately)
/*!40000 ALTER TABLE `pool_workers` DISABLE KEYS */;
INSERT INTO `pool_workers` (`id_pool`, `id_workers`) VALUES
	(1, 1),
	(1, 1),
	(1, 1),
	(1, 1),
	(1, 1),
	(1, 1),
	(1, 1),
	(1, 1),
	(1, 1),
	(1, 1),
	(1, 1),
	(1, 1),
	(1, 1),
	(1, 1),
	(1, 1),
	(1, 1),
	(1, 1),
	(1, 1),
	(1, 1),
	(1, 1),
	(2, 2),
	(2, 2),
	(2, 2);
/*!40000 ALTER TABLE `pool_workers` ENABLE KEYS */;

-- Dumping structure for table site_last.supervisor
CREATE TABLE IF NOT EXISTS `supervisor` (
  `id_supervisor` int(11) unsigned NOT NULL,
  `id_manager` int(11) unsigned NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_supervisor`),
  KEY `id_manager` (`id_manager`),
  CONSTRAINT `FK super_manager` FOREIGN KEY (`id_manager`) REFERENCES `manager` (`id_manager`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table site_last.supervisor: ~3 rows (approximately)
/*!40000 ALTER TABLE `supervisor` DISABLE KEYS */;
INSERT INTO `supervisor` (`id_supervisor`, `id_manager`, `name`, `last_name`) VALUES
	(1, 2, '2', '2'),
	(2, 2, '2', '2'),
	(3, 2, '3', '3');
/*!40000 ALTER TABLE `supervisor` ENABLE KEYS */;

-- Dumping structure for table site_last.swimming_pool
CREATE TABLE IF NOT EXISTS `swimming_pool` (
  `id_pool` int(11) unsigned NOT NULL,
  `length` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pool`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table site_last.swimming_pool: ~5 rows (approximately)
/*!40000 ALTER TABLE `swimming_pool` DISABLE KEYS */;
INSERT INTO `swimming_pool` (`id_pool`, `length`, `width`, `depth`) VALUES
	(1, 1, 1, 1),
	(2, 2, 2, 2);
/*!40000 ALTER TABLE `swimming_pool` ENABLE KEYS */;

-- Dumping structure for table site_last.workers
CREATE TABLE IF NOT EXISTS `workers` (
  `id_workers` int(11) unsigned NOT NULL,
  `id_manager` int(11) unsigned NOT NULL,
  `id_work_type` int(11) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `TC` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_workers`),
  KEY `FK__manager` (`id_manager`),
  KEY `FK  worrker_work_type` (`id_work_type`),
  CONSTRAINT `FK  worrker_work_type` FOREIGN KEY (`id_work_type`) REFERENCES `work_type` (`id_work_type`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK__manager` FOREIGN KEY (`id_manager`) REFERENCES `manager` (`id_manager`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table site_last.workers: ~3 rows (approximately)
/*!40000 ALTER TABLE `workers` DISABLE KEYS */;
INSERT INTO `workers` (`id_workers`, `id_manager`, `id_work_type`, `name`, `last_name`, `age`, `phone`, `TC`) VALUES
	(1, 1, 3, 'nour', 'nournour', 11, 11, 11),
	(2, 2, 1, '2', '2', 2, 2, 2),
	(3, 2, 1, '3', '3', 3, 3, 3);
/*!40000 ALTER TABLE `workers` ENABLE KEYS */;

-- Dumping structure for table site_last.workers_blok
CREATE TABLE IF NOT EXISTS `workers_blok` (
  `id_blok` int(11) unsigned NOT NULL,
  `id_workers` int(11) unsigned NOT NULL,
  KEY `FK_workers_blok_bloks` (`id_blok`),
  KEY `FK_workers_blok_workers` (`id_workers`),
  CONSTRAINT `FK_workers_blok_bloks` FOREIGN KEY (`id_blok`) REFERENCES `bloks` (`id_blok`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_workers_blok_workers` FOREIGN KEY (`id_workers`) REFERENCES `workers` (`id_workers`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table site_last.workers_blok: ~0 rows (approximately)
/*!40000 ALTER TABLE `workers_blok` DISABLE KEYS */;
INSERT INTO `workers_blok` (`id_blok`, `id_workers`) VALUES
	(2, 2),
	(3, 3);
/*!40000 ALTER TABLE `workers_blok` ENABLE KEYS */;

-- Dumping structure for table site_last.work_type
CREATE TABLE IF NOT EXISTS `work_type` (
  `id_work_type` int(11) unsigned NOT NULL,
  `work_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_work_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table site_last.work_type: ~3 rows (approximately)
/*!40000 ALTER TABLE `work_type` DISABLE KEYS */;
INSERT INTO `work_type` (`id_work_type`, `work_type`) VALUES
	(1, 'ee'),
	(2, 'yyy'),
	(3, 'yy');
/*!40000 ALTER TABLE `work_type` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
