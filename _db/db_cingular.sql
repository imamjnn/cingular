-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 16 Jan 2018 pada 10.21
-- Versi Server: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_cingular`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  `orig_name` varchar(100) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `media`
--

INSERT INTO `media` (`id`, `name`, `path`, `orig_name`, `created`) VALUES
(1, 'e189700f662694785a9a2b8b671f6251.jpg', '/media/1515996652/e189700f662694785a9a2b8b671f6251.jpg', 'American_Made_(2017).jpg', '2018-01-15 00:10:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `address` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `password`, `email`, `avatar`, `address`, `created`) VALUES
(9, 'Testing', 'root', '$2y$12$kYPBAmMMcKIPfAR0h.aAbunnllnkkZLY9QxsfdoAG65yV8kowAlJq', 'testing@gmail.com', NULL, 'Jakarta', '2017-12-28 06:00:55'),
(13, 'sadas', 'asdsa', '', 'asdas@asd', NULL, 'asdsadas', '2017-12-28 10:10:21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_session`
--

CREATE TABLE `user_session` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `token` varchar(200) NOT NULL,
  `ip` varchar(12) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_session`
--

INSERT INTO `user_session` (`id`, `user`, `token`, `ip`, `created`) VALUES
(1, 9, '37ec60f7b26a2e9bd68ad662cd786c6b', '127.0.0.1', '2018-01-16 08:03:14'),
(2, 9, 'a41524b7eb6b92b70132d8c3d85828b6', '127.0.0.1', '2018-01-16 08:46:18'),
(3, 9, '510e30f0d3ba93d2b26c2441e6d2fed1', '127.0.0.1', '2018-01-16 09:13:48'),
(4, 9, '209494f9643cddf4e606f12d5201e4d9', '127.0.0.1', '2018-01-16 09:16:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_session`
--
ALTER TABLE `user_session`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_session`
--
ALTER TABLE `user_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
