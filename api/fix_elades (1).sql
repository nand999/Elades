-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2024 at 06:05 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fix_elades`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun_admin`
--

CREATE TABLE `akun_admin` (
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `kode_otp` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `akun_admin`
--

INSERT INTO `akun_admin` (`username`, `password`, `email`, `kode_otp`) VALUES
('admin', '$2y$12$uynvaYUXgooi0Va/MThdEuOsfALUyjHQ/jMwV7fw8TMONR7CIBnzu', 'ananda.aa70@gmail.com', 826604);

-- --------------------------------------------------------

--
-- Table structure for table `akun_user`
--

CREATE TABLE `akun_user` (
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `kode_otp` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `no_hp` varchar(14) NOT NULL,
  `foto_profil` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `akun_user`
--

INSERT INTO `akun_user` (`username`, `password`, `email`, `nama`, `kode_otp`, `created`, `no_hp`, `foto_profil`) VALUES
('a', '0cc175b9c0f1b6a831c399e269772661', 'a', 'a', 0, '2024-04-25 14:06:46', 'a', ''),
('admindesa', '0192023a7bbd73250516f069df18b500', 'elektroniklayangdesa2023@gmail.com', 'admin elades', 454755, '2023-11-22 08:41:41', '', ''),
('anandad', '25d55ad283aa400af464c76d713c07ad', 'wifitv000777@gmail.com', 'ananda dwi ariano', 0, '2024-05-13 09:49:47', '', '68c80aa3-2be0-4984-bd0d-bcbdccf79c18.jpg'),
('aripin ', 'b41d59fbf6820910aa4d80e3657b9cd7', 'prayoga.kusdiana12@gmail.com', 'aripin', 313739, '2023-11-09 09:43:48', '', ''),
('baru', '25d55ad283aa400af464c76d713c07ad', 'langitoranye001@gmail.com', 'baru iki', 0, '2024-05-16 09:24:22', '09090990909090', ''),
('eee', 'd2f2297d6e829cd3493aa7de4416a18f', 'alifanpamungkas@gmail.com', 'eee', 0, '2024-04-25 14:59:59', 'eee', ''),
('evi12345', '4593cacbd9fa82fa1815fae69b9c0c65', 'evichntyaa@gmail.com', 'evi', 213338, '2023-11-13 09:57:23', '', ''),
('halo world', 'c83b2d5bb1fb4d93d9d064593ed6eea2', 'santolowridas@gmail.com', 'Santo', 355549, '2023-11-15 09:48:05', '', ''),
('hntrsl', '00a7a6cff095e946703c1d522501c0b9', 'tresnat336@gmail.com', 'hanum', 977959, '2023-11-23 10:42:10', '', ''),
('ikhsan', '615aa84dd0d4f7d38fab57c9b1b71181', 'e41221830@student.polije.ac.id', 'E41221830 Prayoga Kusdiana Ikhsani', 399761, '2023-11-15 12:14:36', '', ''),
('kk', 'dc468c70fb574ebd07287b38d0d0676d', 'kk', 'kk', 0, '2024-04-25 14:26:26', 'kk', ''),
('nyoba', '81793dfa61181895c741ecd64f752bf9', 'ikhsaniprayoga@gmail.com', 'nyoba dulu', 847444, '2023-11-08 09:05:41', '', ''),
('okek', '0079fcb602361af76c4fd616d60f9414', 'okek', 'okek', 0, '2024-04-21 19:00:38', '', ''),
('p', '83878c91171338902e0fe0fb97a8c47a', 'p', 'p', 0, '2024-04-25 13:56:48', 'p', ''),
('qqq', 'b2ca678b4c936f905fb82f2733f5297f', 'teampendingb@gmail.com', 'qqq', 0, '2024-04-29 10:13:19', 'qqq', ''),
('rima12345', '', 'kocak@gmail.com', 'rima', 699948, '2023-11-16 09:38:40', '', ''),
('santoo', '', 'e41221535@student.polije.ac.id', 'santo', 753443, '2023-11-22 09:04:32', '', ''),
('ups', '7b0746dabfaed032913530c495453f0f', 'ups', 'ups', 0, '2024-04-21 18:30:55', 'ups', ''),
('username', '25d55ad283aa400af464c76d713c07ad', 'contoh@gmail.com', 'nama legkap update', 182871, '2023-10-26 00:00:00', '081223334445', '07e9af27-5885-4dfd-ad68-7f8ff92ff194.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id_berita` int(10) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `isi` text NOT NULL,
  `foto` varchar(100) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `berita`
--

INSERT INTO `berita` (`id_berita`, `judul`, `isi`, `foto`, `tanggal`, `created`) VALUES
(1, 'jual musang', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam justo ligula, efficitur in turpis sed, accumsan placerat nisl. Duis non felis sodales, auctor lacus in, vehicula ante. Integer eu odio nulla. Maecenas id ultrices lorem, id facilisis sem. Donec accumsan vitae ligula non euismod. Ut venenatis ultricies nibh, non suscipit mi efficitur at. Duis tempor risus nunc, eu iaculis turpis rutrum quis. Fusce hendrerit odio sed velit porttitor lobortis. Sed auctor et ex nec dapibus. Morbi in elit sodales, luctus quam eget, pharetra purus. In efficitur orci id augue fringilla, a faucibus metus lobortis. Nullam semper mauris quis dolor cursus, et rhoncus felis dapibus. Morbi dapibus commodo justo suscipit egestas. Vestibulum tristique nisl libero, ut tristique metus imperdiet ut. Nunc auctor pharetra lorem eu blandit. Nam vel iaculis mi.', 'img1.jpg', '2024-02-29', '2024-02-19 07:52:29'),
(2, 'musang kecil', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam justo ligula, efficitur in turpis sed, accumsan placerat nisl. Duis non felis sodales, auctor lacus in, vehicula ante. Integer eu odio nulla. Maecenas id ultrices lorem, id facilisis sem. Donec accumsan vitae ligula non euismod. Ut venenatis ultricies nibh, non suscipit mi efficitur at. Duis tempor risus nunc, eu iaculis turpis rutrum quis. Fusce hendrerit odio sed velit porttitor lobortis. Sed auctor et ex nec dapibus. Morbi in elit sodales, luctus quam eget, pharetra purus. In efficitur orci id augue fringilla, a faucibus metus lobortis. Nullam semper mauris quis dolor cursus, et rhoncus felis dapibus. Morbi dapibus commodo justo suscipit egestas. Vestibulum tristique nisl libero, ut tristique metus imperdiet ut. Nunc auctor pharetra lorem eu blandit. Nam vel iaculis mi.', 'img2.jpg', '2024-02-29', '2024-02-19 07:52:29'),
(3, 'kocak gaming', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam justo ligula, efficitur in turpis sed, accumsan placerat nisl. Duis non felis sodales, auctor lacus in, vehicula ante. Integer eu odio nulla. Maecenas id ultrices lorem, id facilisis sem. Donec accumsan vitae ligula non euismod. Ut venenatis ultricies nibh, non suscipit mi efficitur at. Duis tempor risus nunc, eu iaculis turpis rutrum quis. Fusce hendrerit odio sed velit porttitor lobortis. Sed auctor et ex nec dapibus. Morbi in elit sodales, luctus quam eget, pharetra purus. In efficitur orci id augue fringilla, a faucibus metus lobortis. Nullam semper mauris quis dolor cursus, et rhoncus felis dapibus. Morbi dapibus commodo justo suscipit egestas. Vestibulum tristique nisl libero, ut tristique metus imperdiet ut. Nunc auctor pharetra lorem eu blandit. Nam vel iaculis mi.', 'img1.jpg', '2024-02-08', '2024-02-19 08:08:15'),
(4, 'hahahahah', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam justo ligula, efficitur in turpis sed, accumsan placerat nisl. Duis non felis sodales, auctor lacus in, vehicula ante. Integer eu odio nulla. Maecenas id ultrices lorem, id facilisis sem. Donec accumsan vitae ligula non euismod. Ut venenatis ultricies nibh, non suscipit mi efficitur at. Duis tempor risus nunc, eu iaculis turpis rutrum quis. Fusce hendrerit odio sed velit porttitor lobortis. Sed auctor et ex nec dapibus. Morbi in elit sodales, luctus quam eget, pharetra purus. In efficitur orci id augue fringilla, a faucibus metus lobortis. Nullam semper mauris quis dolor cursus, et rhoncus felis dapibus. Morbi dapibus commodo justo suscipit egestas. Vestibulum tristique nisl libero, ut tristique metus imperdiet ut. Nunc auctor pharetra lorem eu blandit. Nam vel iaculis mi.', 'img2.jpg', '2024-02-21', '2024-02-19 08:08:15'),
(5, 'kuda lumping', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam justo ligula, efficitur in turpis sed, accumsan placerat nisl. Duis non felis sodales, auctor lacus in, vehicula ante. Integer eu odio nulla. Maecenas id ultrices lorem, id facilisis sem. Donec accumsan vitae ligula non euismod. Ut venenatis ultricies nibh, non suscipit mi efficitur at. Duis tempor risus nunc, eu iaculis turpis rutrum quis. Fusce hendrerit odio sed velit porttitor lobortis. Sed auctor et ex nec dapibus. Morbi in elit sodales, luctus quam eget, pharetra purus. In efficitur orci id augue fringilla, a faucibus metus lobortis. Nullam semper mauris quis dolor cursus, et rhoncus felis dapibus. Morbi dapibus commodo justo suscipit egestas. Vestibulum tristique nisl libero, ut tristique metus imperdiet ut. Nunc auctor pharetra lorem eu blandit. Nam vel iaculis mi.', 'img1.jpg', '2024-02-22', '2024-02-19 08:08:15'),
(6, 'makan', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam justo ligula, efficitur in turpis sed, accumsan placerat nisl. Duis non felis sodales, auctor lacus in, vehicula ante. Integer eu odio nulla. Maecenas id ultrices lorem, id facilisis sem. Donec accumsan vitae ligula non euismod. Ut venenatis ultricies nibh, non suscipit mi efficitur at. Duis tempor risus nunc, eu iaculis turpis rutrum quis. Fusce hendrerit odio sed velit porttitor lobortis. Sed auctor et ex nec dapibus. Morbi in elit sodales, luctus quam eget, pharetra purus. In efficitur orci id augue fringilla, a faucibus metus lobortis. Nullam semper mauris quis dolor cursus, et rhoncus felis dapibus. Morbi dapibus commodo justo suscipit egestas. Vestibulum tristique nisl libero, ut tristique metus imperdiet ut. Nunc auctor pharetra lorem eu blandit. Nam vel iaculis mi.', 'img1.jpg', '2024-02-14', '2024-02-19 08:08:15'),
(7, 'ups', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam justo ligula, efficitur in turpis sed, accumsan placerat nisl. Duis non felis sodales, auctor lacus in, vehicula ante. Integer eu odio nulla. Maecenas id ultrices lorem, id facilisis sem. Donec accumsan vitae ligula non euismod. Ut venenatis ultricies nibh, non suscipit mi efficitur at. Duis tempor risus nunc, eu iaculis turpis rutrum quis. Fusce hendrerit odio sed velit porttitor lobortis. Sed auctor et ex nec dapibus. Morbi in elit sodales, luctus quam eget, pharetra purus. In efficitur orci id augue fringilla, a faucibus metus lobortis. Nullam semper mauris quis dolor cursus, et rhoncus felis dapibus. Morbi dapibus commodo justo suscipit egestas. Vestibulum tristique nisl libero, ut tristique metus imperdiet ut. Nunc auctor pharetra lorem eu blandit. Nam vel iaculis mi.', 'img2.jpg', '2024-02-15', '2024-02-19 08:08:15'),
(8, 'kelomang ikatan cinta', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam justo ligula, efficitur in turpis sed, accumsan placerat nisl. Duis non felis sodales, auctor lacus in, vehicula ante. Integer eu odio nulla. Maecenas id ultrices lorem, id facilisis sem. Donec accumsan vitae ligula non euismod. Ut venenatis ultricies nibh, non suscipit mi efficitur at. Duis tempor risus nunc, eu iaculis turpis rutrum quis. Fusce hendrerit odio sed velit porttitor lobortis. Sed auctor et ex nec dapibus. Morbi in elit sodales, luctus quam eget, pharetra purus. In efficitur orci id augue fringilla, a faucibus metus lobortis. Nullam semper mauris quis dolor cursus, et rhoncus felis dapibus. Morbi dapibus commodo justo suscipit egestas. Vestibulum tristique nisl libero, ut tristique metus imperdiet ut. Nunc auctor pharetra lorem eu blandit. Nam vel iaculis mi.', 'img1.jpg', '2024-02-08', '2024-02-19 08:08:15'),
(9, 'naik haji', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam justo ligula, efficitur in turpis sed, accumsan placerat nisl. Duis non felis sodales, auctor lacus in, vehicula ante. Integer eu odio nulla. Maecenas id ultrices lorem, id facilisis sem. Donec accumsan vitae ligula non euismod. Ut venenatis ultricies nibh, non suscipit mi efficitur at. Duis tempor risus nunc, eu iaculis turpis rutrum quis. Fusce hendrerit odio sed velit porttitor lobortis. Sed auctor et ex nec dapibus. Morbi in elit sodales, luctus quam eget, pharetra purus. In efficitur orci id augue fringilla, a faucibus metus lobortis. Nullam semper mauris quis dolor cursus, et rhoncus felis dapibus. Morbi dapibus commodo justo suscipit egestas. Vestibulum tristique nisl libero, ut tristique metus imperdiet ut. Nunc auctor pharetra lorem eu blandit. Nam vel iaculis mi.', 'img2.jpg', '2024-02-15', '2024-02-19 08:08:15'),
(10, 'ikan bakar', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam justo ligula, efficitur in turpis sed, accumsan placerat nisl. Duis non felis sodales, auctor lacus in, vehicula ante. Integer eu odio nulla. Maecenas id ultrices lorem, id facilisis sem. Donec accumsan vitae ligula non euismod. Ut venenatis ultricies nibh, non suscipit mi efficitur at. Duis tempor risus nunc, eu iaculis turpis rutrum quis. Fusce hendrerit odio sed velit porttitor lobortis. Sed auctor et ex nec dapibus. Morbi in elit sodales, luctus quam eget, pharetra purus. In efficitur orci id augue fringilla, a faucibus metus lobortis. Nullam semper mauris quis dolor cursus, et rhoncus felis dapibus. Morbi dapibus commodo justo suscipit egestas. Vestibulum tristique nisl libero, ut tristique metus imperdiet ut. Nunc auctor pharetra lorem eu blandit. Nam vel iaculis mi.', 'img2.jpg', '2024-02-08', '2024-02-19 08:08:15'),
(11, 'ban sepur', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam justo ligula, efficitur in turpis sed, accumsan placerat nisl. Duis non felis sodales, auctor lacus in, vehicula ante. Integer eu odio nulla. Maecenas id ultrices lorem, id facilisis sem. Donec accumsan vitae ligula non euismod. Ut venenatis ultricies nibh, non suscipit mi efficitur at. Duis tempor risus nunc, eu iaculis turpis rutrum quis. Fusce hendrerit odio sed velit porttitor lobortis. Sed auctor et ex nec dapibus. Morbi in elit sodales, luctus quam eget, pharetra purus. In efficitur orci id augue fringilla, a faucibus metus lobortis. Nullam semper mauris quis dolor cursus, et rhoncus felis dapibus. Morbi dapibus commodo justo suscipit egestas. Vestibulum tristique nisl libero, ut tristique metus imperdiet ut. Nunc auctor pharetra lorem eu blandit. Nam vel iaculis mi.', 'img1.jpg', '2024-02-14', '2024-02-19 08:08:15'),
(12, 'siput gila', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam justo ligula, efficitur in turpis sed, accumsan placerat nisl. Duis non felis sodales, auctor lacus in, vehicula ante. Integer eu odio nulla. Maecenas id ultrices lorem, id facilisis sem. Donec accumsan vitae ligula non euismod. Ut venenatis ultricies nibh, non suscipit mi efficitur at. Duis tempor risus nunc, eu iaculis turpis rutrum quis. Fusce hendrerit odio sed velit porttitor lobortis. Sed auctor et ex nec dapibus. Morbi in elit sodales, luctus quam eget, pharetra purus. In efficitur orci id augue fringilla, a faucibus metus lobortis. Nullam semper mauris quis dolor cursus, et rhoncus felis dapibus. Morbi dapibus commodo justo suscipit egestas. Vestibulum tristique nisl libero, ut tristique metus imperdiet ut. Nunc auctor pharetra lorem eu blandit. Nam vel iaculis mi.', 'img2.jpg', '2024-02-15', '2024-02-19 08:08:15'),
(13, 'wewe', 'hahai', '1715572897_Screenshot (954).png', '2024-05-13', '2024-05-13 04:01:37');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE `laporan` (
  `id` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(10) DEFAULT 'Masuk',
  `alasan` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laporan`
--

INSERT INTO `laporan` (`id`, `tanggal`, `status`, `alasan`) VALUES
(76, '2023-11-28 14:06:52', 'Tolak', 'banyak salah'),
(77, '2024-05-01 12:04:06', 'Tolak', 'banyak salah'),
(78, '2024-05-01 12:04:52', 'Tolak', 'banyak salah'),
(79, '2024-05-08 01:44:15', 'Selesai', NULL),
(80, '2024-03-02 20:10:03', 'Masuk', NULL),
(81, '2024-03-04 00:34:06', 'Selesai', NULL),
(82, '2024-03-03 23:12:33', 'Masuk', NULL),
(83, '2024-03-03 23:12:35', 'Masuk', NULL),
(84, '2024-03-03 23:16:38', 'Masuk', NULL),
(85, '2024-03-04 00:04:41', 'Masuk', NULL),
(86, '2024-03-13 01:19:50', 'Masuk', NULL),
(87, '2024-04-21 11:26:05', 'Masuk', NULL),
(88, '2024-04-21 12:54:14', 'Masuk', NULL),
(89, '2024-04-25 04:15:29', 'Masuk', NULL),
(90, '2024-04-25 04:29:05', 'Masuk', NULL),
(91, '2024-04-25 04:31:54', 'Masuk', NULL),
(97, '2024-04-25 05:20:04', 'Masuk', NULL),
(98, '2024-04-25 05:26:35', 'Masuk', NULL),
(99, '2024-04-25 05:27:01', 'Masuk', NULL),
(100, '2024-04-25 05:28:42', 'Masuk', NULL),
(101, '2024-04-25 05:30:20', 'Masuk', NULL),
(102, '2024-04-25 06:09:34', 'Masuk', NULL),
(103, '2024-04-29 03:46:51', 'Masuk', NULL),
(104, '2024-04-29 03:50:06', 'Masuk', NULL),
(105, '2024-04-29 04:19:39', 'Masuk', NULL),
(106, '2024-04-29 06:50:08', 'Masuk', NULL),
(107, '2024-04-29 06:51:10', 'Masuk', NULL),
(108, '2024-04-29 07:12:12', 'Masuk', NULL),
(109, '2024-04-29 07:15:32', 'Masuk', NULL),
(110, '2024-04-29 07:17:47', 'Masuk', NULL),
(111, '2024-04-29 07:20:39', 'Masuk', NULL),
(112, '2024-04-29 07:21:52', 'Masuk', NULL),
(113, '2024-04-29 07:23:13', 'Masuk', NULL),
(114, '2024-05-02 02:44:03', 'Masuk', NULL),
(115, '2024-05-06 02:06:43', 'Masuk', NULL),
(116, '2024-05-06 07:07:21', 'Masuk', NULL),
(117, '2024-05-06 07:08:50', 'Masuk', NULL),
(118, '2024-05-06 07:10:46', 'Masuk', NULL),
(119, '2024-05-08 01:45:29', 'Selesai', NULL),
(120, '2024-05-08 01:50:39', 'Masuk', NULL),
(121, '2024-05-08 02:25:19', 'Masuk', NULL);

--
-- Triggers `laporan`
--
DELIMITER $$
CREATE TRIGGER `update_tanggal` BEFORE UPDATE ON `laporan` FOR EACH ROW BEGIN
    IF NEW.status = 'Selesai' OR NEW.status = 'Tolak' THEN
        SET NEW.tanggal = CURRENT_TIMESTAMP();
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_surat`
--

CREATE TABLE `pengajuan_surat` (
  `id` int(11) NOT NULL,
  `kode_surat` varchar(100) NOT NULL,
  `nik` varchar(255) NOT NULL,
  `tanggal` date NOT NULL DEFAULT current_timestamp(),
  `nama` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `no_pengajuan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengajuan_surat`
--

INSERT INTO `pengajuan_surat` (`id`, `kode_surat`, `nik`, `tanggal`, `nama`, `username`, `no_pengajuan`) VALUES
(76, 'skck', '49613751916', '2023-11-28', 'nyobasckck', 'username', 48),
(77, 'sktm', 'nyoba', '2023-11-28', 'sktm', 'username', 10),
(78, 'surat_ijin', '1343797787648', '2023-11-28', 'nyobasurat ijin', 'username', 72),
(79, 'skck', '', '2024-03-03', 'jajal', 'ikhsan', 49),
(80, 'sktm', 'adasdasasd', '2024-03-03', 'lakshldkahsdlasdh', 'rima12345', 12),
(81, 'sktm', 'adasdasasd', '2024-03-03', 'lakshldkahsdlasdh', 'rima12345', 13),
(82, 'skck', '', '2024-03-04', 'ilhan', 'ikhsan', 50),
(83, 'skck', '', '2024-03-04', 'ilhan', 'ikhsan', 51),
(84, 'skck', '', '2024-03-04', 'tomi', 'hntrsl', 52),
(85, 'surat_ijin', '', '2024-03-04', 'alvian', 'ikhsan', 73),
(86, 'sktm', 'asdasd', '2024-03-13', 'johan', 'hntrsl', 14),
(87, 'surat_mati', '', '2024-04-21', 'kk', 'username', 8),
(88, 'skck', 'nigga', '2024-04-21', 'nigga', 'username', 53),
(89, 'skck', '', '2024-04-25', '', 'username', 54),
(90, 'skck', '', '2024-04-25', '', 'username', 55),
(91, 'skck', '', '2024-04-25', '', 'username', 56),
(97, 'surat_penghasilan', '', '2024-04-25', 'Nama', 'username', 0),
(98, 'surat_penghasilan', '', '2024-04-25', 'Nama', 'username', 2),
(99, 'surat_penghasilan', '', '2024-04-25', '', 'username', 3),
(100, 'surat_penghasilan', '', '2024-04-25', 'nama', 'username', 4),
(101, 'surat_penghasilan', '', '2024-04-25', 'nama', 'username', 5),
(102, 'surat_penghasilan', '', '2024-04-25', '', 'username', 6),
(103, 'surat_penghasilan', '', '2024-04-29', 'nama', 'username', 7),
(104, 'surat_penghasilan', '', '2024-04-29', 'nama', 'username', 8),
(105, 'surat_mati', '', '2024-04-29', 'nama mati', 'username', 9),
(106, 'surat_mati', '', '2024-04-29', 'nama', 'username', 10),
(107, 'surat_mati', '', '2024-04-29', 'nama', 'username', 11),
(108, 'skck', 'aa', '2024-04-29', 'nama ini', 'username', 57),
(109, 'sktm', 'bapak', '2024-04-29', 'aa', 'username', 15),
(110, 'surat_ijin', '', '2024-04-29', '', 'username', 74),
(111, 'surat_ijin', 'nik', '2024-04-29', 'nama', 'username', 75),
(112, 'surat_mati', '', '2024-04-29', 'nama', 'username', 12),
(113, 'surat_penghasilan', '', '2024-04-29', 'namaku', 'username', 9),
(114, 'surat_ijin', 'hsiahsjsjs', '2024-05-02', 'aku', 'username', 76),
(115, 'surat_mati', '', '2024-05-06', 'aku', 'username', 13),
(116, 'sktm', 'nam', '2024-05-06', 'aa', 'username', 16),
(117, 'surat_ijin', '12344756476376376', '2024-05-06', 'sss', 'username', 77),
(118, 'surat_mati', '', '2024-05-06', 'nama', 'username', 14),
(119, 'surat_penghasilan', '', '2024-05-06', 'aa', 'username', 10),
(120, 'surat_mati', '', '2024-05-08', 'nama', 'username', 15),
(121, 'skck', '1234567890987676', '2024-05-08', 'hahai', 'username', 58);

--
-- Triggers `pengajuan_surat`
--
DELIMITER $$
CREATE TRIGGER `DEL_pengajuan_to_suratMasuk` AFTER DELETE ON `pengajuan_surat` FOR EACH ROW DELETE from surat_masuk 
where id = old.id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `DEL_to_Laporan` AFTER DELETE ON `pengajuan_surat` FOR EACH ROW DELETE FROM laporan where `id` =  old.id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `pengajuan_to_suratMasuk` AFTER INSERT ON `pengajuan_surat` FOR EACH ROW INSERT INTO surat_masuk(id,kode_surat) 
VALUES (new.id, new.kode_surat)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `to_laporan` AFTER INSERT ON `pengajuan_surat` FOR EACH ROW INSERT INTO laporan(`id`) VALUES (new.id)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `skck`
--

CREATE TABLE `skck` (
  `no_pengajuan` int(11) NOT NULL,
  `kode_surat` varchar(100) NOT NULL DEFAULT 'skck',
  `nama` varchar(100) NOT NULL,
  `nik` varchar(100) NOT NULL,
  `tempat_tgl_lahir` varchar(100) NOT NULL,
  `kebangsaan` varchar(100) NOT NULL,
  `agama` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `status_perkawinan` varchar(100) NOT NULL,
  `pekerjaan` varchar(100) NOT NULL,
  `tempat_tinggal` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `foto_ktp` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `skck`
--

INSERT INTO `skck` (`no_pengajuan`, `kode_surat`, `nama`, `nik`, `tempat_tgl_lahir`, `kebangsaan`, `agama`, `jenis_kelamin`, `status_perkawinan`, `pekerjaan`, `tempat_tinggal`, `username`, `foto_ktp`) VALUES
(48, 'skck', 'nyobasckck', '49613751916', 'shjdejsj, 12 November 2023', '', 'aksidjd', 'Laki-Laki', 'sididhdie', 'djdjdje', 'idhdie', 'username', ''),
(49, 'skck', 'jajal', '', '', '', '', '', '', '', '', 'ikhsan', ''),
(50, 'skck', 'ilhan', '', '', '', '', '', '', '', '', 'ikhsan', ''),
(51, 'skck', 'ilhan', '', '', '', '', '', '', '', '', 'ikhsan', ''),
(52, 'skck', 'tomi', '', '', '', '', '', '', '', '', 'hntrsl', ''),
(53, 'skck', 'nigga', 'nigga', 'nigga, 21-04-2024', 'nigga', 'nigga', 'Laki-laki', 'nigga', 'nigga', 'nigga', 'username', 'cc9fb4b5-b84c-4a02-87a5-5f808a53c968.jpg'),
(54, 'skck', '', '', ', ', '', '', 'Laki-laki', '', '', '', 'username', 'c1467b41-90ab-4162-bc8c-65992e499888.jpg'),
(55, 'skck', '', '', ', ', '', '', 'Laki-laki', '', '', '', 'username', ''),
(56, 'skck', '', '', ', ', '', '', 'Laki-laki', '', '', '', 'username', ''),
(57, 'skck', 'nama ini', 'aa', 'aa, 29-04-2024', 'aa', 'aa', 'Laki-laki', 'aa', 'aa', 'aa', 'username', '6b1512e8-f5e4-4bd6-a086-f3fb50952283.jpg'),
(58, 'skck', 'hahai', '1234567890987676', 'kkk, 08-05-2024', 'kakaka', 'akakaka', 'Laki-laki', 'Kawin tercatat', 'jhajkahja', 'jahjkah', 'username', '3601aa35-a8f0-4eb7-a53c-79407c72c1ca.jpg');

--
-- Triggers `skck`
--
DELIMITER $$
CREATE TRIGGER `skck_to_pengajuanSurat` AFTER INSERT ON `skck` FOR EACH ROW INSERT INTO pengajuan_surat(kode_surat,nik, nama,no_pengajuan,username)
VALUES(new.kode_surat,new.nik,new.nama,new.no_pengajuan
       ,new.username)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sktm`
--

CREATE TABLE `sktm` (
  `no_pengajuan` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `kode_surat` varchar(20) DEFAULT 'sktm',
  `nama_bapak` varchar(50) DEFAULT NULL,
  `tempat_tanggal_lahir_bapak` varchar(50) DEFAULT NULL,
  `pekerjaan_bapak` varchar(50) DEFAULT NULL,
  `alamat_bapak` varchar(100) DEFAULT NULL,
  `nama_ibu` varchar(50) DEFAULT NULL,
  `tempat_tanggal_lahir_ibu` varchar(50) DEFAULT NULL,
  `pekerjaan_ibu` varchar(50) DEFAULT NULL,
  `alamat_ibu` varchar(100) DEFAULT NULL,
  `nama_anak` varchar(50) DEFAULT NULL,
  `tempat_tanggal_lahir_anak` varchar(50) DEFAULT NULL,
  `jenis_kelamin_anak` varchar(10) DEFAULT NULL,
  `alamat_anak` varchar(100) DEFAULT NULL,
  `foto_kk` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sktm`
--

INSERT INTO `sktm` (`no_pengajuan`, `username`, `kode_surat`, `nama_bapak`, `tempat_tanggal_lahir_bapak`, `pekerjaan_bapak`, `alamat_bapak`, `nama_ibu`, `tempat_tanggal_lahir_ibu`, `pekerjaan_ibu`, `alamat_ibu`, `nama_anak`, `tempat_tanggal_lahir_anak`, `jenis_kelamin_anak`, `alamat_anak`, `foto_kk`) VALUES
(10, 'username', 'sktm', 'nyoba', 'sieheij, 05 November 2023', 'sheiebeieb', 'djdjdhebd', 'zksjsjsjjs', 'sisisjsjs, 05 November 2023', 'wiwjiwwjw', 'wjwiwjwiw', 'sktm', 'ekejdie, 12 November 2023', 'Laki-Laki', 'eisksjs', ''),
(12, 'rima12345', 'sktm', 'adasdasasd', NULL, NULL, NULL, 'asdasdas', NULL, NULL, NULL, 'lakshldkahsdlasdh', NULL, NULL, NULL, ''),
(13, 'rima12345', 'sktm', 'adasdasasd', NULL, NULL, NULL, 'asdasdas', NULL, NULL, NULL, 'lakshldkahsdlasdh', NULL, NULL, NULL, ''),
(14, 'hntrsl', 'sktm', 'asdasd', NULL, NULL, NULL, 'qwesal', NULL, NULL, NULL, 'johan', NULL, NULL, NULL, ''),
(15, 'username', 'sktm', 'bapak', 'aa, 29-04-2024', 'aa', 'aa', 'aa', 'aa, 29-04-2024', 'aa', 'aa', 'aa', 'aa, 29-04-2024', 'Laki-laki', 'aa', '5ac7b56c-19be-4656-a2d6-c6f1081c9eb5.jpg'),
(16, 'username', 'sktm', 'nam', 'aaa, 06-05-2024', 'aa', 'aa', 'aa', 'aa, 06-05-2024', 'aa', 'aaaa', 'aa', 'aa, 06-05-2024', 'Laki-laki', 'aa', '8b9ec158-6be8-47a2-a97f-3deb6018b982.jpg');

--
-- Triggers `sktm`
--
DELIMITER $$
CREATE TRIGGER `sktm_to_pengajuan` AFTER INSERT ON `sktm` FOR EACH ROW INSERT INTO pengajuan_surat(kode_surat,nik, nama,no_pengajuan,username)
VALUES(new.kode_surat,new.nama_bapak,new.nama_anak,new.no_pengajuan
       ,new.username)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `surat`
--

CREATE TABLE `surat` (
  `kode_surat` varchar(100) NOT NULL,
  `Keterangan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `surat`
--

INSERT INTO `surat` (`kode_surat`, `Keterangan`) VALUES
('skck', 'SURAT KETERANGAN ADAT ISTIADAT'),
('sktm', 'SURAT KETERANGAN TIDAK MAMPU'),
('surat_ijin', 'SURAT KETERANGAN  IJIN TIDAK MASUK KERJA'),
('surat_mati', 'SURAT KETERANGAN KEMATIAN\r\n'),
('surat_penghasilan', 'SURAT KETERANGAN PENGHASILAN');

-- --------------------------------------------------------

--
-- Table structure for table `surat_ijin`
--

CREATE TABLE `surat_ijin` (
  `no_pengajuan` int(11) NOT NULL,
  `kode_surat` varchar(100) NOT NULL DEFAULT 'surat_ijin',
  `username` varchar(20) DEFAULT NULL,
  `Nama` varchar(100) NOT NULL,
  `NIK` varchar(30) NOT NULL,
  `Jenis_kelamin` varchar(20) NOT NULL,
  `Tempat_tanggal_lahir` varchar(100) NOT NULL,
  `Kewarganegaraan` varchar(50) NOT NULL,
  `Agama` varchar(20) NOT NULL,
  `Pekerjaan` varchar(70) NOT NULL,
  `Alamat` varchar(100) NOT NULL,
  `Tempat_Kerja` varchar(100) NOT NULL,
  `Bagian` varchar(100) NOT NULL,
  `Tanggal` varchar(50) NOT NULL,
  `Alasan` varchar(255) NOT NULL,
  `foto_ktp` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `surat_ijin`
--

INSERT INTO `surat_ijin` (`no_pengajuan`, `kode_surat`, `username`, `Nama`, `NIK`, `Jenis_kelamin`, `Tempat_tanggal_lahir`, `Kewarganegaraan`, `Agama`, `Pekerjaan`, `Alamat`, `Tempat_Kerja`, `Bagian`, `Tanggal`, `Alasan`, `foto_ktp`) VALUES
(72, 'surat_ijin', 'username', 'nyoba surat ijin', '613484', 'Laki-Laki', 'haajji, 12 November 2023', 'aiah', 'wiwjw', 'sjssisisua', 'aiahsi', 'ishsa', 'aiwhw', '12 November 2023', 'wuwhiw', ''),
(73, 'surat_ijin', 'ikhsan', 'alvian', '', '', '', '', '', '', '', '', '', '', '', ''),
(74, 'surat_ijin', 'username', '', '', '', ', ', '', '', '', '', '', '', '', '', ''),
(75, 'surat_ijin', 'username', 'nama', 'nik', '', 'tempat, 29-04-2024', 'kwn', 'agm', 'pekerjaan', 'alamat', 'kerja', 'baian', '29-04-2024', 'alsan', 'ec711f8f-e1c3-461e-b042-b4eec04d60a8.jpg'),
(76, 'surat_ijin', 'username', 'aku', 'hsiahsjsjs', '', 'tempat, 18-05-2024', 'ajjajss', 'sjjsjss', 'jsjsjs', 'nanan', 'jsjsjs', 'jsjsjs', '02-05-2024', 'sjsjjs', '1b115b87-5869-4691-8da0-c6c102591213.jpg'),
(77, 'surat_ijin', 'username', 'sss', '12344756476376376', '', 'sss, 06-05-2024', 'sss', 'sss', 'sss', 'ss', 'sss', 'sss', '06-05-2024', 'ss', 'a2705e9f-7d4a-47e4-920c-fc0ada068345.jpg');

--
-- Triggers `surat_ijin`
--
DELIMITER $$
CREATE TRIGGER `ijin_to_suratmasuk` AFTER INSERT ON `surat_ijin` FOR EACH ROW INSERT INTO pengajuan_surat(kode_surat,nik, nama,no_pengajuan,username)
VALUES(new.kode_surat,new.NIK,new.Nama,new.no_pengajuan
       ,new.username)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `surat_kematian`
--

CREATE TABLE `surat_kematian` (
  `no_pengajuan` int(11) NOT NULL,
  `kode_surat` varchar(100) NOT NULL DEFAULT 'surat_mati',
  `username` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `tanggal_kematian` varchar(20) NOT NULL,
  `foto_ktp` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `surat_kematian`
--

INSERT INTO `surat_kematian` (`no_pengajuan`, `kode_surat`, `username`, `nama`, `alamat`, `jenis_kelamin`, `tanggal_kematian`, `foto_ktp`) VALUES
(1, 'surat_mati', 'username', 'Nama', 'Alamat', 'Jenis_kelamin', '', ''),
(2, 'surat_mati', 'username', 'Nama', 'Alamat', 'Jenis_kelamin', '', ''),
(3, 'surat_mati', 'username', 'Nama', 'Alamat', 'Jenis_kelamin', 'Alasan', ''),
(4, 'surat_mati', 'username', 'joko', 'nganjuk', '', '28-03-2024', ''),
(5, 'surat_mati', 'username', 'joko', 'nganjuk', 'Laki-laki', '28-03-2024', ''),
(8, 'surat_mati', 'username', 'kk', 'oo', 'Laki-laki', '21-04-2024', 'bf4304bf-cb24-45f3-868b-1fc0d0695307.jpg'),
(9, 'surat_mati', 'username', 'nama mati', 'alamat mati', 'Laki-laki', '29-04-2024', 'a5549d9d-b6bf-4f05-865c-6bd765e0176f.jpg'),
(10, 'surat_mati', 'username', 'nama', 'alamat', 'Laki-laki', '29-04-2024', 'cbfe4eb9-b39a-4965-872d-d19c29be23f4.jpg'),
(11, 'surat_mati', 'username', 'nama', 'alamay', 'Laki-laki', '29-04-2024', ''),
(12, 'surat_mati', 'username', 'nama', 'alamat', 'Laki-laki', '29-04-2024', 'de01041c-04fe-4131-a53d-b95997644dad.jpg'),
(13, 'surat_mati', 'username', 'aku', 'alamat', 'Laki-laki', '06-05-2024', '287556a2-c61a-4070-a12d-4a56b3595370.jpg'),
(14, 'surat_mati', 'username', 'nama', 'aa', 'Laki-laki', '06-05-2024', 'd1017e27-7d0a-4ffb-8aee-4b6e381462f9.jpg'),
(15, 'surat_mati', 'username', 'nama', 'alamat', 'Laki-laki', '08-05-2024', 'bb1a7c02-b87a-4119-bcc5-0dafc8f4d5e6.jpg');

--
-- Triggers `surat_kematian`
--
DELIMITER $$
CREATE TRIGGER `after_insert` AFTER INSERT ON `surat_kematian` FOR EACH ROW INSERT INTO pengajuan_surat(kode_surat, nama,no_pengajuan,username)
VALUES(new.kode_surat,new.nama,new.no_pengajuan
       ,new.username)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `surat_masuk`
--

CREATE TABLE `surat_masuk` (
  `id` int(11) NOT NULL,
  `kode_surat` varchar(100) NOT NULL,
  `tangal` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `surat_masuk`
--

INSERT INTO `surat_masuk` (`id`, `kode_surat`, `tangal`) VALUES
(76, 'skck', '2023-11-28'),
(77, 'sktm', '2023-11-28'),
(78, 'surat_ijin', '2023-11-28'),
(79, 'skck', '2024-03-03'),
(80, 'sktm', '2024-03-03'),
(81, 'sktm', '2024-03-03'),
(82, 'skck', '2024-03-04'),
(83, 'skck', '2024-03-04'),
(84, 'skck', '2024-03-04'),
(85, 'surat_ijin', '2024-03-04'),
(86, 'sktm', '2024-03-13'),
(87, 'surat_mati', '2024-04-21'),
(88, 'skck', '2024-04-21'),
(89, 'skck', '2024-04-25'),
(90, 'skck', '2024-04-25'),
(91, 'skck', '2024-04-25'),
(97, 'surat_penghasilan', '2024-04-25'),
(98, 'surat_penghasilan', '2024-04-25'),
(99, 'surat_penghasilan', '2024-04-25'),
(100, 'surat_penghasilan', '2024-04-25'),
(101, 'surat_penghasilan', '2024-04-25'),
(102, 'surat_penghasilan', '2024-04-25'),
(103, 'surat_penghasilan', '2024-04-29'),
(104, 'surat_penghasilan', '2024-04-29'),
(105, 'surat_mati', '2024-04-29'),
(106, 'surat_mati', '2024-04-29'),
(107, 'surat_mati', '2024-04-29'),
(108, 'skck', '2024-04-29'),
(109, 'sktm', '2024-04-29'),
(110, 'surat_ijin', '2024-04-29'),
(111, 'surat_ijin', '2024-04-29'),
(112, 'surat_mati', '2024-04-29'),
(113, 'surat_penghasilan', '2024-04-29'),
(114, 'surat_ijin', '2024-05-02'),
(115, 'surat_mati', '2024-05-06'),
(116, 'sktm', '2024-05-06'),
(117, 'surat_ijin', '2024-05-06'),
(118, 'surat_mati', '2024-05-06'),
(119, 'surat_penghasilan', '2024-05-06'),
(120, 'surat_mati', '2024-05-08'),
(121, 'skck', '2024-05-08');

-- --------------------------------------------------------

--
-- Table structure for table `surat_penghasilan`
--

CREATE TABLE `surat_penghasilan` (
  `no_pengajuan` int(11) NOT NULL,
  `kode_surat` varchar(100) NOT NULL DEFAULT 'surat_penghasilan',
  `username` varchar(20) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tanggal_lahir` varchar(20) NOT NULL,
  `pekerjaan` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `jumlah_penghasilan` varchar(100) NOT NULL,
  `kegunaan_surat` varchar(100) NOT NULL,
  `foto_ktp` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `surat_penghasilan`
--

INSERT INTO `surat_penghasilan` (`no_pengajuan`, `kode_surat`, `username`, `nama_lengkap`, `nik`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `pekerjaan`, `alamat`, `jumlah_penghasilan`, `kegunaan_surat`, `foto_ktp`) VALUES
(1, 'surat_penghasilan', 'username', 'Nama', 'NIK', 'laki_laki', 'Tempat_tanggal_lahir', '0000-00-00', 'Pekerjaan', 'pekerjaan', 'Agama', 'Pekerjaan', ''),
(2, 'surat_penghasilan', 'username', 'Nama', 'NIK', 'laki_laki', 'Tempat_tanggal_lahir', '0000-00-00', 'Pekerjaan', 'pekerjaan', 'Agama', 'Pekerjaan', ''),
(3, 'surat_penghasilan', 'username', '', '', '', '', '0000-00-00', '', '', '', '', ''),
(4, 'surat_penghasilan', 'username', 'nama', 'nik', '', 'tempat', '0000-00-00', 'pekerjaan', 'alamat', '1000', 'perlu', ''),
(5, 'surat_penghasilan', 'username', 'nama', '', '', '', '25-04-2024', '', '', '', '', ''),
(6, 'surat_penghasilan', 'username', '', '', '', '', '', '', '', '', '', '79a3c633-b241-4ddc-ab47-bc88055c76f1.jpg'),
(7, 'surat_penghasilan', 'username', 'nama', 'nik', '', 'tembat', '29-04-2024', 'pekerjaan', 'alamat', '10000', 'keperluan', 'ad30bff0-ae95-4f8d-aab1-2deadbbc66c1.jpg'),
(8, 'surat_penghasilan', 'username', 'nama', 'nik', 'Laki-laki', 'tempat', '29-04-2024', 'pekerjaan', 'alamat', '10000', 'keperluan', '27bcd415-def4-423d-a2b1-f9681c79d7e4.jpg'),
(9, 'surat_penghasilan', 'username', 'namaku', 'nik', 'Perempuan', 'tmp', '29-04-2024', 'krj', 'alamat', '10000', 'oioi', '4abde7ad-ffa9-451a-8643-081573bddb31.jpg'),
(10, 'surat_penghasilan', 'username', 'aa', '1234567890909878', 'Laki-laki', 'aa', '06-05-2024', 'k', 'aa', '10000', 'wdxwx', 'c3c60087-5542-40ea-b05f-00c9934b0a86.jpg');

--
-- Triggers `surat_penghasilan`
--
DELIMITER $$
CREATE TRIGGER `after_insert_sp` AFTER INSERT ON `surat_penghasilan` FOR EACH ROW INSERT INTO pengajuan_surat(kode_surat, nama,no_pengajuan,username)
VALUES(new.kode_surat,new.nama_lengkap,new.no_pengajuan
       ,new.username)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ttd`
--

CREATE TABLE `ttd` (
  `id` varchar(100) NOT NULL,
  `pangkat` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `foto_profil` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ttd`
--

INSERT INTO `ttd` (`id`, `pangkat`, `nama`, `foto_profil`) VALUES
('kepaladesa', 'KEPALA DESA PESUDUKUH', 'RAFAEL ALUN', ''),
('carik', 'SEKETARIS DESA PESUDUKUH', 'SAUDARA BLACK JACK', ''),
('bendahara', 'BENDAHARA DESA PESUDUKUH', 'NANDA', ''),
('kaurumum', 'KAUR UMUM DESA PESUDUKUH', 'NANDA', ''),
('kaurperencanaan', 'KAUR PERENCANAAN DESA PESUDUKUH', 'NANDA', ''),
('kasipelayanan', 'KASI PELAYANAN DESA PESUDUKUH', 'NANDA', ''),
('kasikesejahteraan', 'KASI KESEJAHTERAAN DESA PESUDUKUH', 'NANDA', ''),
('kasipemerintahan', 'KASI PEMERINTAHAN DESA PESUDUKUH', 'NANDA', ''),
('', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visi_misi`
--

CREATE TABLE `visi_misi` (
  `id` varchar(11) NOT NULL,
  `isi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `visi_misi`
--

INSERT INTO `visi_misi` (`id`, `isi`) VALUES
('misi', 'JOKOWI'),
('visi', 'KOCAK GAMING HEHEHEHEHEEHEHEHEHEHEHEHEHEHEHEHEH');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun_admin`
--
ALTER TABLE `akun_admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `akun_user`
--
ALTER TABLE `akun_user`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id_berita`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
  ADD UNIQUE KEY `id` (`id`) USING BTREE;

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pengajuan_surat`
--
ALTER TABLE `pengajuan_surat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_surat` (`kode_surat`,`nik`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `skck`
--
ALTER TABLE `skck`
  ADD PRIMARY KEY (`no_pengajuan`),
  ADD KEY `kode_surat` (`kode_surat`,`nik`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `sktm`
--
ALTER TABLE `sktm`
  ADD PRIMARY KEY (`no_pengajuan`),
  ADD KEY `username` (`username`,`kode_surat`),
  ADD KEY `kode_surat` (`kode_surat`);

--
-- Indexes for table `surat`
--
ALTER TABLE `surat`
  ADD PRIMARY KEY (`kode_surat`) USING BTREE;

--
-- Indexes for table `surat_ijin`
--
ALTER TABLE `surat_ijin`
  ADD PRIMARY KEY (`no_pengajuan`),
  ADD KEY `kode_surat` (`kode_surat`),
  ADD KEY `fk_username_surat_ijin` (`username`) USING BTREE;

--
-- Indexes for table `surat_kematian`
--
ALTER TABLE `surat_kematian`
  ADD PRIMARY KEY (`no_pengajuan`),
  ADD KEY `kode_surat` (`kode_surat`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `surat_masuk`
--
ALTER TABLE `surat_masuk`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `kd_surat` (`kode_surat`);

--
-- Indexes for table `surat_penghasilan`
--
ALTER TABLE `surat_penghasilan`
  ADD PRIMARY KEY (`no_pengajuan`),
  ADD KEY `kode_surat` (`kode_surat`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `visi_misi`
--
ALTER TABLE `visi_misi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id_berita` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pengajuan_surat`
--
ALTER TABLE `pengajuan_surat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `skck`
--
ALTER TABLE `skck`
  MODIFY `no_pengajuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `sktm`
--
ALTER TABLE `sktm`
  MODIFY `no_pengajuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `surat_ijin`
--
ALTER TABLE `surat_ijin`
  MODIFY `no_pengajuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `surat_kematian`
--
ALTER TABLE `surat_kematian`
  MODIFY `no_pengajuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `surat_penghasilan`
--
ALTER TABLE `surat_penghasilan`
  MODIFY `no_pengajuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `laporan`
--
ALTER TABLE `laporan`
  ADD CONSTRAINT `laporan_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pengajuan_surat` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pengajuan_surat`
--
ALTER TABLE `pengajuan_surat`
  ADD CONSTRAINT `pengajuan_surat_ibfk_1` FOREIGN KEY (`kode_surat`) REFERENCES `surat` (`kode_surat`),
  ADD CONSTRAINT `pengajuan_surat_ibfk_2` FOREIGN KEY (`username`) REFERENCES `akun_user` (`username`) ON UPDATE CASCADE;

--
-- Constraints for table `skck`
--
ALTER TABLE `skck`
  ADD CONSTRAINT `skck_ibfk_1` FOREIGN KEY (`kode_surat`) REFERENCES `surat` (`kode_surat`),
  ADD CONSTRAINT `skck_ibfk_2` FOREIGN KEY (`username`) REFERENCES `akun_user` (`username`) ON UPDATE CASCADE;

--
-- Constraints for table `sktm`
--
ALTER TABLE `sktm`
  ADD CONSTRAINT `sktm_ibfk_1` FOREIGN KEY (`username`) REFERENCES `akun_user` (`username`) ON UPDATE CASCADE,
  ADD CONSTRAINT `sktm_ibfk_2` FOREIGN KEY (`kode_surat`) REFERENCES `surat` (`kode_surat`);

--
-- Constraints for table `surat_ijin`
--
ALTER TABLE `surat_ijin`
  ADD CONSTRAINT `surat_ijin_ibfk_1` FOREIGN KEY (`username`) REFERENCES `akun_user` (`username`) ON UPDATE CASCADE,
  ADD CONSTRAINT `surat_ijin_ibfk_2` FOREIGN KEY (`kode_surat`) REFERENCES `surat` (`kode_surat`);

--
-- Constraints for table `surat_kematian`
--
ALTER TABLE `surat_kematian`
  ADD CONSTRAINT `surat_kematian_ibfk_1` FOREIGN KEY (`username`) REFERENCES `akun_user` (`username`) ON UPDATE CASCADE,
  ADD CONSTRAINT `surat_kematian_ibfk_2` FOREIGN KEY (`kode_surat`) REFERENCES `surat` (`kode_surat`);

--
-- Constraints for table `surat_masuk`
--
ALTER TABLE `surat_masuk`
  ADD CONSTRAINT `surat_masuk_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pengajuan_surat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `surat_penghasilan`
--
ALTER TABLE `surat_penghasilan`
  ADD CONSTRAINT `surat_penghasilan_ibfk_1` FOREIGN KEY (`kode_surat`) REFERENCES `surat` (`kode_surat`),
  ADD CONSTRAINT `surat_penghasilan_ibfk_2` FOREIGN KEY (`username`) REFERENCES `akun_user` (`username`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
