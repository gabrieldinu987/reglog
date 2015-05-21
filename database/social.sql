-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
<<<<<<< HEAD
-- Generation Time: May 16, 2015 at 09:51 AM
=======
<<<<<<< HEAD
-- Generation Time: May 16, 2015 at 09:51 AM
=======
-- Generation Time: May 14, 2015 at 08:58 PM
>>>>>>> fc52545c08fb57b69f302c8ff2a7346ac1153613
>>>>>>> 41764e6d09399ba6efda30b2baf28dc02cb1a0ba
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `social`
--
CREATE DATABASE IF NOT EXISTS `social` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `social`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `temp_pass` varchar(32) DEFAULT NULL,
  `last_name` text NOT NULL,
  `first_name` text NOT NULL,
  `birthday` date NOT NULL,
  `gender` enum('m','f') NOT NULL,
  `city` text,
  `rank` enum('a','b') NOT NULL DEFAULT 'a',
  `avatar` varchar(255) DEFAULT NULL,
  `ip` varchar(45) NOT NULL,
  `date_registered` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` datetime DEFAULT NULL,
  `notification` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activated` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `username` (`email`)
<<<<<<< HEAD
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;
=======
<<<<<<< HEAD
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;
=======
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;
>>>>>>> fc52545c08fb57b69f302c8ff2a7346ac1153613
>>>>>>> 41764e6d09399ba6efda30b2baf28dc02cb1a0ba

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `email`, `password`, `temp_pass`, `last_name`, `first_name`, `birthday`, `gender`, `city`, `rank`, `avatar`, `ip`, `date_registered`, `last_login`, `notification`, `activated`) VALUES
<<<<<<< HEAD
(2, 'gimbolinu@gmail.com', '7aa5a4c6bcd0b4d49cbb83aa4860dc71', 'eb4cd0999ad0af9815f41c8df5ba0d8b', 'hihi', 'gimbolinu', '2010-08-05', 'm', 'Ploiesti', 'a', '/users/gimbolinu@gmail.com/m.png', '::1', '2015-05-15 22:27:47', NULL, '0000-00-00 00:00:00', '0');
=======
<<<<<<< HEAD
(2, 'gimbolinu@gmail.com', '7aa5a4c6bcd0b4d49cbb83aa4860dc71', 'eb4cd0999ad0af9815f41c8df5ba0d8b', 'hihi', 'gimbolinu', '2010-08-05', 'm', 'Ploiesti', 'a', '/users/gimbolinu@gmail.com/m.png', '::1', '2015-05-15 22:27:47', NULL, '0000-00-00 00:00:00', '0');
=======
(15, 'gabrieldinu987@gmail.com', '7aa5a4c6bcd0b4d49cbb83aa4860dc71', NULL, 'Dinu', 'Gabriel', '1987-12-02', 'm', 'Ploiesti', 'a', '/users/gabrieldinu987@gmail.com/m.png', '::1', '2015-05-12 20:38:22', NULL, '0000-00-00 00:00:00', '0'),
(16, 'adriandinu@yahoo.com', '2b30b6b434549fa4c9714ef12d9669b5', NULL, 'Dinu', 'Adrian', '2012-06-18', 'm', 'Ploiesti', 'a', '/users/adriandinu@yahoo.com/m.png', '::1', '2015-05-12 20:41:27', NULL, '0000-00-00 00:00:00', '0'),
(17, 'ionescu@gmail.com', '7aa5a4c6bcd0b4d49cbb83aa4860dc71', NULL, 'Octavian', 'Ionescu', '1987-12-03', 'm', 'Ploiesti', 'a', '/users/ionescu@gmail.com/m.png', '::1', '2015-05-12 20:46:57', NULL, '0000-00-00 00:00:00', '0'),
(18, 'iaona@adadasdd.adasdad', '7aa5a4c6bcd0b4d49cbb83aa4860dc71', NULL, 'Vilea', 'Ioana', '2014-02-01', 'm', 'Bucuresti', 'a', '/users/iaona@adadasdd.adasdad/m.png', '::1', '2015-05-13 09:15:14', NULL, '0000-00-00 00:00:00', '0'),
(19, 'niki@gmail.com', '7aa5a4c6bcd0b4d49cbb83aa4860dc71', NULL, 'NEchifor', 'Ciprian', '2013-05-19', 'm', 'Brasov', 'a', '/users/niki@gmail.com/m.png', '::1', '2015-05-14 12:12:15', NULL, '0000-00-00 00:00:00', '0'),
(20, 'sab@gmail.com', '7aa5a4c6bcd0b4d49cbb83aa4860dc71', NULL, 'Nistor', 'Sabina', '1994-02-02', 'f', 'Ploiesti', 'a', '/users/sab@gmail.com/f.png', '::1', '2015-05-14 12:16:51', NULL, '0000-00-00 00:00:00', '0'),
(21, 'gabidinu987@gmail.com', '7aa5a4c6bcd0b4d49cbb83aa4860dc71', '561dd3f9fd85dc84a9b9909734afbae6', 'Didi', 'Gimbo', '2012-02-29', 'm', 'Ploiesti', 'a', '/users/gabidinu987@gmail.com/m.png', '::1', '2015-05-14 19:45:24', NULL, '0000-00-00 00:00:00', '1'),
(22, 'jon@gmail.com', '7aa5a4c6bcd0b4d49cbb83aa4860dc71', NULL, 'pepersmint', 'jon', '2011-04-02', 'm', 'Suceava', 'a', '/users/jon@gmail.com/m.png', '::1', '2015-05-14 20:06:53', NULL, '0000-00-00 00:00:00', '0'),
(23, 'gina@gmail.com', '2b30b6b434549fa4c9714ef12d9669b5', NULL, 'Pistol', 'Gina', '2010-04-08', 'f', 'Bucuresti', 'a', '/users/gina@gmail.com/f.png', '::1', '2015-05-14 21:07:19', NULL, '0000-00-00 00:00:00', '0');
>>>>>>> fc52545c08fb57b69f302c8ff2a7346ac1153613
>>>>>>> 41764e6d09399ba6efda30b2baf28dc02cb1a0ba

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;