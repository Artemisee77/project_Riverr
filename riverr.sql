-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2025 at 04:35 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `riverr`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` varchar(50) NOT NULL,
  `Nama` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `Status_akun` enum('Aktif','Nonaktif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `masyarakat`
--

CREATE TABLE `masyarakat` (
  `id_pelapor` varchar(100) NOT NULL,
  `Nama` varchar(100) NOT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `melaporkan`
--

CREATE TABLE `melaporkan` (
  `id_laporan` varchar(50) NOT NULL,
  `id_pelapor` varchar(50) NOT NULL,
  `id_admin_validasi` varchar(50) DEFAULT NULL,
  `Tanggal` date NOT NULL,
  `Tanggal_validasi` date DEFAULT NULL,
  `Lokasi` varchar(255) DEFAULT NULL,
  `Status` enum('Diterima','Diproses','Selesai','Ditolak') NOT NULL,
  `Tingkat_pencemaran` varchar(50) DEFAULT NULL,
  `Jenis_pencemaran` varchar(50) DEFAULT NULL,
  `Deskripsi` text DEFAULT NULL,
  `Foto_Video` varchar(255) DEFAULT NULL,
  `Detail_Tindak_Lanjut` text DEFAULT NULL,
  `Validasi` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mengedukasi`
--

CREATE TABLE `mengedukasi` (
  `id_edukasi` varchar(50) NOT NULL,
  `id_admin` varchar(50) NOT NULL,
  `id_masyarakat` varchar(50) DEFAULT NULL,
  `Judul` varchar(255) NOT NULL,
  `isi_pesan` text NOT NULL,
  `tanggal_kirim` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `masyarakat`
--
ALTER TABLE `masyarakat`
  ADD PRIMARY KEY (`id_pelapor`);

--
-- Indexes for table `melaporkan`
--
ALTER TABLE `melaporkan`
  ADD PRIMARY KEY (`id_laporan`),
  ADD KEY `id_pelapor` (`id_pelapor`),
  ADD KEY `id_admin_validasi` (`id_admin_validasi`);

--
-- Indexes for table `mengedukasi`
--
ALTER TABLE `mengedukasi`
  ADD PRIMARY KEY (`id_edukasi`),
  ADD KEY `id_admin` (`id_admin`),
  ADD KEY `id_masyarakat` (`id_masyarakat`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `melaporkan`
--
ALTER TABLE `melaporkan`
  ADD CONSTRAINT `melaporkan_ibfk_1` FOREIGN KEY (`id_pelapor`) REFERENCES `masyarakat` (`id_pelapor`),
  ADD CONSTRAINT `melaporkan_ibfk_2` FOREIGN KEY (`id_admin_validasi`) REFERENCES `admin` (`id_admin`);

--
-- Constraints for table `mengedukasi`
--
ALTER TABLE `mengedukasi`
  ADD CONSTRAINT `mengedukasi_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`),
  ADD CONSTRAINT `mengedukasi_ibfk_2` FOREIGN KEY (`id_masyarakat`) REFERENCES `masyarakat` (`id_pelapor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
