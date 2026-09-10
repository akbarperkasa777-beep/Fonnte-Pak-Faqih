-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Sep 2026 pada 08.16
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `api_wa_fonnte`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `created_at`) VALUES
(1, 'admin', '$2b$12$phhZ8dhJSDEIivEiudTDa.E33GsH7Owzaxyfh94gskPWEX3DXRxzy', '2026-09-10 02:01:06'),
(2, 'akbar', '$2y$10$W5hYYArXlzK5y4UdBb9IO.t1K47hrbYGDQpJ0v0WfKYK2ZOrtUiXu', '2026-09-10 04:24:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_whatsapp`
--

CREATE TABLE `log_whatsapp` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `no_tujuan` varchar(20) NOT NULL,
  `pesan` text NOT NULL,
  `status` enum('success','failed','pending') NOT NULL DEFAULT 'pending',
  `response` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `log_whatsapp`
--

INSERT INTO `log_whatsapp` (`id`, `user_id`, `no_tujuan`, `pesan`, `status`, `response`, `created_at`) VALUES
(1, NULL, '6283174943920', 'Selamat! kak HERI-GOOOOO 👋\nRegistrasi akun Anda telah berhasil.\n\nNama: HERI-GOOOOO\nEmail: heri@gmail.com\nAlamat: sukorejo\nNomor WhatsApp: 6283174943920\n\nTerima kasih telah melakukan registrasi.', 'success', '{\"reason\":\"invalid token\",\"status\":false}', '2026-09-10 02:02:52'),
(2, NULL, '6285606189729', 'Selamat! kak WAKID 👋\nRegistrasi akun Anda telah berhasil.\n\nNama: WAKID\nEmail: wakid@gmail.com\nAlamat: JETIS\nNomor WhatsApp: 6285606189729\n\nTerima kasih telah melakukan registrasi.', 'success', '{\"detail\":\"success! message in queue\",\"id\":[178361276],\"process\":\"pending\",\"quota\":{\"089519104607\":{\"details\":\"deduced from total quota\",\"quota\":998,\"remaining\":997,\"used\":1}},\"requestid\":724440002,\"status\":true,\"target\":[\"6285606189729\"]}', '2026-09-10 02:08:55'),
(3, NULL, '6285606189729', '🔔 PEMBARUAN PROFIL\nHalo SITI,\n\nProfil akun Anda baru saja diperbarui:\n- Username: WAKID → SITI\n- Email: wakid@gmail.com → SITI@gmail.com\n- Password: berhasil diganti\n\nJika Anda tidak melakukan perubahan ini, segera hubungi admin.', 'success', '{\"detail\":\"success! message in queue\",\"id\":[178361539],\"process\":\"pending\",\"quota\":{\"089519104607\":{\"details\":\"deduced from total quota\",\"quota\":997,\"remaining\":996,\"used\":1}},\"requestid\":724441497,\"status\":true,\"target\":[\"6285606189729\"]}', '2026-09-10 02:09:56'),
(4, NULL, '6283174943920', '🔔 PEMBARUAN PROFIL\nHalo HERI-GO,\n\nProfil akun Anda baru saja diperbarui:\n- Nama: HERI-GOOOOO → HERI-GO\n- Alamat: sukorejo → sukorejoo\n\nJika Anda tidak melakukan perubahan ini, segera hubungi admin.', 'success', '{\"detail\":\"success! message in queue\",\"id\":[178382563],\"process\":\"pending\",\"quota\":{\"089519104607\":{\"details\":\"deduced from total quota\",\"quota\":996,\"remaining\":995,\"used\":1}},\"requestid\":724596673,\"status\":true,\"target\":[\"6283174943920\"]}', '2026-09-10 03:25:51'),
(5, NULL, '6285606189729', '⚠️ AKUN DIHAPUS\nHalo SITI,\n\nAkun Anda telah berhasil dihapus dari sistem.\nDetail:\n- Nama: SITI\n- Email: SITI@gmail.com\n- Nomor WhatsApp: 6285606189729\n\nTerima kasih telah menjadi bagian dari aplikasi ini.', 'success', '{\"detail\":\"success! message in queue\",\"id\":[178383601],\"process\":\"pending\",\"quota\":{\"089519104607\":{\"details\":\"deduced from total quota\",\"quota\":995,\"remaining\":994,\"used\":1}},\"requestid\":724606168,\"status\":true,\"target\":[\"6285606189729\"]}', '2026-09-10 03:30:02'),
(6, 3, '6283129542047', '━━━━━━━━━━━━━━━━━━━━━━\n📣 REGISTRASI AKUN BERHASIL\n━━━━━━━━━━━━━━━━━━━━━━\nWaktu: 10 September 2026 / 11:06\n\nHalo TOBI,\n\nSelamat datang di sistem kami. Registrasi akun Anda telah berhasil dilakukan dengan baik.\n\n📧 Email: tobi@gmail.com\n📍 Alamat: Balong\n📱 Nomor WhatsApp: 6283129542047\n\nTerima kasih atas kepercayaan Anda untuk mendaftar dan menjadi bagian dari layanan kami.', 'success', '{\"detail\":\"success! message in queue\",\"id\":[178393051],\"process\":\"pending\",\"quota\":{\"089519104607\":{\"details\":\"deduced from total quota\",\"quota\":994,\"remaining\":993,\"used\":1}},\"requestid\":724688165,\"status\":true,\"target\":[\"6283129542047\"]}', '2026-09-10 04:06:24'),
(7, NULL, '6283174943920', '━━━━━━━━━━━━━━━━━━━━━━\n📣 UPDATE DATA AKUN OLEH ADMIN\n━━━━━━━━━━━━━━━━━━━━━━\nWaktu: 10 September 2026 / 11:10\n\nHalo HALO HERI,\n\nData akun Anda telah diperbarui secara resmi oleh administrator sistem kami.\n\n📧 Email: heri@gmail.com\n📝 Perubahan yang dilakukan:\n- Nama: HERI-GO -> HALO HERI\n\nJika Anda tidak melakukan perubahan ini, segera hubungi admin untuk proses verifikasi lebih lanjut.', 'success', '{\"detail\":\"success! message in queue\",\"id\":[178394454],\"process\":\"pending\",\"quota\":{\"089519104607\":{\"details\":\"deduced from total quota\",\"quota\":993,\"remaining\":992,\"used\":1}},\"requestid\":724695784,\"status\":true,\"target\":[\"6283174943920\"]}', '2026-09-10 04:10:13'),
(8, NULL, '6283174943920', '━━━━━━━━━━━━━━━━━━━━━━\n📣 AKUN DIHAPUS OLEH ADMIN\n━━━━━━━━━━━━━━━━━━━━━━\nWaktu: 10 September 2026 / 11:11\n\nHalo HALO HERI,\n\nInformasi resmi dari administrator, akun Anda telah dihapus dari sistem kami.\n\n📧 Email: heri@gmail.com\n📱 Nomor WhatsApp: 6283174943920\n\nJika Anda merasa ada kesalahan atau perubahan yang tidak sesuai, segera hubungi administrator untuk tindak lanjut yang diperlukan.', 'success', '{\"detail\":\"success! message in queue\",\"id\":[178394751],\"process\":\"pending\",\"quota\":{\"089519104607\":{\"details\":\"deduced from total quota\",\"quota\":992,\"remaining\":991,\"used\":1}},\"requestid\":724699582,\"status\":true,\"target\":[\"6283174943920\"]}', '2026-09-10 04:11:52'),
(9, 3, '6283129542047', '━━━━━━━━━━━━━━━━━━━━━━\n📣 PEMBARUAN DATA AKUN\n━━━━━━━━━━━━━━━━━━━━━━\nWaktu: 10 September 2026 / 11:12\n\nHalo TOBI PAKI i,\n\nData akun Anda telah diperbarui secara resmi oleh sistem kami.\n\n📧 Email: tobi@gmail.com\n📝 Perubahan yang dilakukan:\n- Nama: TOBI → TOBI PAKI i\n\nJika Anda tidak melakukan perubahan ini, segera hubungi administrator untuk verifikasi lebih lanjut.', 'success', '{\"detail\":\"success! message in queue\",\"id\":[178394978],\"process\":\"pending\",\"quota\":{\"089519104607\":{\"details\":\"deduced from total quota\",\"quota\":991,\"remaining\":990,\"used\":1}},\"requestid\":724701937,\"status\":true,\"target\":[\"6283129542047\"]}', '2026-09-10 04:12:48'),
(10, 3, '6283129542047', '━━━━━━━━━━━━━━━━━━━━━━\n📣 LOGIN BERHASIL\n━━━━━━━━━━━━━━━━━━━━━━\nWaktu: 10 September 2026 / 11:18\n\nHalo TOBI PAKI i,\n\nKegiatan login akun Anda berhasil dilakukan pada sistem kami.\n\n📧 Email: tobi@gmail.com\n📱 Nomor WhatsApp: 6283129542047\n🕒 Status: Login berhasil\n\nJika Anda merasa tidak melakukan login ini, segera hubungi administrator untuk keamanan akun Anda.', 'success', '{\"detail\":\"success! message in queue\",\"id\":[178396750],\"process\":\"pending\",\"quota\":{\"089519104607\":{\"details\":\"deduced from total quota\",\"quota\":990,\"remaining\":989,\"used\":1}},\"requestid\":724713359,\"status\":true,\"target\":[\"6283129542047\"]}', '2026-09-10 04:18:33'),
(11, NULL, '6285731637000', '━━━━━━━━━━━━━━━━━━━━━━\n📣 REGISTRASI AKUN BERHASIL\n━━━━━━━━━━━━━━━━━━━━━━\nWaktu: 10 September 2026 / 11:19\n\nHalo Muhammad Akbar Perkasa,\n\nSelamat datang di sistem kami. Registrasi akun Anda telah berhasil dilakukan dengan baik.\n\n📧 Email: akbarperkasa777@gmail.com\n📍 Alamat: PONOROGO\n📱 Nomor WhatsApp: 6285731637000\n\nTerima kasih atas kepercayaan Anda untuk mendaftar dan menjadi bagian dari layanan kami.', 'success', '{\"detail\":\"success! message in queue\",\"id\":[178396967],\"process\":\"pending\",\"quota\":{\"089519104607\":{\"details\":\"deduced from total quota\",\"quota\":989,\"remaining\":988,\"used\":1}},\"requestid\":724715226,\"status\":true,\"target\":[\"6285731637000\"]}', '2026-09-10 04:19:33'),
(12, NULL, '6285731637000', '━━━━━━━━━━━━━━━━━━━━━━\n📣 LOGIN BERHASIL\n━━━━━━━━━━━━━━━━━━━━━━\nWaktu: 10 September 2026 / 11:19\n\nHalo Muhammad Akbar Perkasa,\n\nKegiatan login akun Anda berhasil dilakukan pada sistem kami.\n\n📧 Email: akbarperkasa777@gmail.com\n📱 Nomor WhatsApp: 6285731637000\n🕒 Status: Login berhasil\n\nJika Anda merasa tidak melakukan login ini, segera hubungi administrator untuk keamanan akun Anda.', 'success', '{\"detail\":\"success! message in queue\",\"id\":[178397010],\"process\":\"pending\",\"quota\":{\"089519104607\":{\"details\":\"deduced from total quota\",\"quota\":988,\"remaining\":987,\"used\":1}},\"requestid\":724715633,\"status\":true,\"target\":[\"6285731637000\"]}', '2026-09-10 04:19:50'),
(13, NULL, '6285731637000', '━━━━━━━━━━━━━━━━━━━━━━\n📣 PEMBARUAN DATA AKUN\n━━━━━━━━━━━━━━━━━━━━━━\nWaktu: 10 September 2026 / 11:20\n\nHalo Akbar Gantengg,\n\nData akun Anda telah diperbarui secara resmi oleh sistem kami.\n\n📧 Email: akbarperkasa999@gmail.com\n📝 Perubahan yang dilakukan:\n- Nama: Muhammad Akbar Perkasa → Akbar Gantengg\n- Email: akbarperkasa777@gmail.com → akbarperkasa999@gmail.com\n- Password: berhasil diganti\n\nJika Anda tidak melakukan perubahan ini, segera hubungi administrator untuk verifikasi lebih lanjut.', 'success', '{\"detail\":\"success! message in queue\",\"id\":[178397174],\"process\":\"pending\",\"quota\":{\"089519104607\":{\"details\":\"deduced from total quota\",\"quota\":987,\"remaining\":986,\"used\":1}},\"requestid\":724717218,\"status\":true,\"target\":[\"6285731637000\"]}', '2026-09-10 04:20:34'),
(14, NULL, '6285731637000', '━━━━━━━━━━━━━━━━━━━━━━\n📣 AKUN BERHASIL DIHAPUS\n━━━━━━━━━━━━━━━━━━━━━━\nWaktu: 10 September 2026 / 11:21\n\nHalo Akbar Gantengg,\n\nDengan hormat, akun Anda telah berhasil dihapus dari sistem kami sesuai permintaan yang Anda ajukan.\n\n📧 Email: akbarperkasa999@gmail.com\n📱 Nomor WhatsApp: 6285731637000\n\nTerima kasih telah menjadi bagian dari layanan kami. Semoga hari Anda selalu dalam keadaan baik.', 'success', '{\"detail\":\"success! message in queue\",\"id\":[178397291],\"process\":\"pending\",\"quota\":{\"089519104607\":{\"details\":\"deduced from total quota\",\"quota\":986,\"remaining\":985,\"used\":1}},\"requestid\":724718343,\"status\":true,\"target\":[\"6285731637000\"]}', '2026-09-10 04:21:11'),
(15, 3, '6283129542047', '━━━━━━━━━━━━━━━━━━━━━━\n📣 LOGIN BERHASIL\n━━━━━━━━━━━━━━━━━━━━━━\nWaktu: 10 September 2026 / 11:23\n\nHalo TOBI PAKI i,\n\nKegiatan login akun Anda berhasil dilakukan pada sistem kami.\n\n📧 Email: tobi@gmail.com\n📱 Nomor WhatsApp: 6283129542047\n🕒 Status: Login berhasil\n\nJika Anda merasa tidak melakukan login ini, segera hubungi administrator untuk keamanan akun Anda.', 'success', '{\"detail\":\"success! message in queue\",\"id\":[178397914],\"process\":\"pending\",\"quota\":{\"089519104607\":{\"details\":\"deduced from total quota\",\"quota\":985,\"remaining\":984,\"used\":1}},\"requestid\":724723568,\"status\":true,\"target\":[\"6283129542047\"]}', '2026-09-10 04:23:45'),
(16, 3, '6283129542047', '━━━━━━━━━━━━━━━━━━━━━━\n📣 LOGIN BERHASIL\n━━━━━━━━━━━━━━━━━━━━━━\nWaktu: 10 September 2026 / 11:31\n\nHalo TOBI PAKI i,\n\nKegiatan login akun Anda berhasil dilakukan pada sistem kami.\n\n📧 Email: tobi@gmail.com\n📱 Nomor WhatsApp: 6283129542047\n🕒 Status: Login berhasil\n\nJika Anda merasa tidak melakukan login ini, segera hubungi administrator untuk keamanan akun Anda.', 'success', '{\"detail\":\"success! message in queue\",\"id\":[178399519],\"process\":\"pending\",\"quota\":{\"089519104607\":{\"details\":\"deduced from total quota\",\"quota\":984,\"remaining\":983,\"used\":1}},\"requestid\":724737471,\"status\":true,\"target\":[\"6283129542047\"]}', '2026-09-10 04:31:15'),
(17, NULL, '6285731637000', '━━━━━━━━━━━━━━━━━━━━━━\n📣 REGISTRASI AKUN BERHASIL\n━━━━━━━━━━━━━━━━━━━━━━\nWaktu: 10 September 2026 / 12:57\n\nHalo Muhammad Akbar Perkasa,\n\nSelamat datang di sistem kami. Registrasi akun Anda telah berhasil dilakukan dengan baik.\n\n📧 Email: akbarperkasa777@gmail.com\n📍 Alamat: PONOROGO\n📱 Nomor WhatsApp: 6285731637000\n\nTerima kasih atas kepercayaan Anda untuk mendaftar dan menjadi bagian dari layanan kami.', 'success', '{\"detail\":\"success! message in queue\",\"id\":[178418831],\"process\":\"pending\",\"quota\":{\"089519104607\":{\"details\":\"deduced from total quota\",\"quota\":983,\"remaining\":982,\"used\":1}},\"requestid\":724883871,\"status\":true,\"target\":[\"6285731637000\"]}', '2026-09-10 05:57:13'),
(18, NULL, '6285731637000', '━━━━━━━━━━━━━━━━━━━━━━\n📣 LOGIN BERHASIL\n━━━━━━━━━━━━━━━━━━━━━━\nWaktu: 10 September 2026 / 12:57\n\nHalo Muhammad Akbar Perkasa,\n\nKegiatan login akun Anda berhasil dilakukan pada sistem kami.\n\n📧 Email: akbarperkasa777@gmail.com\n📱 Nomor WhatsApp: 6285731637000\n🕒 Status: Login berhasil\n\nJika Anda merasa tidak melakukan login ini, segera hubungi administrator untuk keamanan akun Anda.', 'success', '{\"detail\":\"success! message in queue\",\"id\":[178418906],\"process\":\"pending\",\"quota\":{\"089519104607\":{\"details\":\"deduced from total quota\",\"quota\":982,\"remaining\":981,\"used\":1}},\"requestid\":724884965,\"status\":true,\"target\":[\"6285731637000\"]}', '2026-09-10 05:57:47'),
(19, NULL, '6285731637000', '━━━━━━━━━━━━━━━━━━━━━━\n📣 PEMBARUAN DATA AKUN\n━━━━━━━━━━━━━━━━━━━━━━\nWaktu: 10 September 2026 / 12:58\n\nHalo Muhammad Akbar Perkasa,\n\nData akun Anda telah diperbarui secara resmi oleh sistem kami.\n\n📧 Email: akbarperkasa999@gmail.com\n📝 Perubahan yang dilakukan:\n- Email: akbarperkasa777@gmail.com → akbarperkasa999@gmail.com\n\nJika Anda tidak melakukan perubahan ini, segera hubungi administrator untuk verifikasi lebih lanjut.', 'success', '{\"detail\":\"success! message in queue\",\"id\":[178418952],\"process\":\"pending\",\"quota\":{\"089519104607\":{\"details\":\"deduced from total quota\",\"quota\":981,\"remaining\":980,\"used\":1}},\"requestid\":724885622,\"status\":true,\"target\":[\"6285731637000\"]}', '2026-09-10 05:58:04'),
(20, NULL, '6285731637000', '━━━━━━━━━━━━━━━━━━━━━━\n📣 AKUN BERHASIL DIHAPUS\n━━━━━━━━━━━━━━━━━━━━━━\nWaktu: 10 September 2026 / 12:58\n\nHalo Muhammad Akbar Perkasa,\n\nDengan hormat, akun Anda telah berhasil dihapus dari sistem kami sesuai permintaan yang Anda ajukan.\n\n📧 Email: akbarperkasa999@gmail.com\n📱 Nomor WhatsApp: 6285731637000\n\nTerima kasih telah menjadi bagian dari layanan kami. Semoga hari Anda selalu dalam keadaan baik.', 'success', '{\"detail\":\"success! message in queue\",\"id\":[178419025],\"process\":\"pending\",\"quota\":{\"089519104607\":{\"details\":\"deduced from total quota\",\"quota\":980,\"remaining\":979,\"used\":1}},\"requestid\":724886436,\"status\":true,\"target\":[\"6285731637000\"]}', '2026-09-10 05:58:25'),
(21, 3, '6283129542047', '━━━━━━━━━━━━━━━━━━━━━━\n📣 LOGIN BERHASIL\n━━━━━━━━━━━━━━━━━━━━━━\nWaktu: 10 September 2026 / 13:04\n\nHalo TOBI PAKI i,\n\nKegiatan login akun Anda berhasil dilakukan pada sistem kami.\n\n📧 Email: tobi@gmail.com\n📱 Nomor WhatsApp: 6283129542047\n🕒 Status: Login berhasil\n\nJika Anda merasa tidak melakukan login ini, segera hubungi administrator untuk keamanan akun Anda.', 'success', '{\"detail\":\"success! message in queue\",\"id\":[178421115],\"process\":\"pending\",\"quota\":{\"089519104607\":{\"details\":\"deduced from total quota\",\"quota\":979,\"remaining\":978,\"used\":1}},\"requestid\":724902498,\"status\":true,\"target\":[\"6283129542047\"]}', '2026-09-10 06:05:00'),
(22, NULL, '6281553629743', '━━━━━━━━━━━━━━━━━━━━━━\n📣 REGISTRASI AKUN BERHASIL\n━━━━━━━━━━━━━━━━━━━━━━\nWaktu: 10 September 2026 / 13:11\n\nHalo NABILA JELEK,\n\nSelamat datang di sistem kami. Registrasi akun Anda telah berhasil dilakukan dengan baik.\n\n📧 Email: nabila@gmail.com\n📍 Alamat: KEDIRI\n📱 Nomor WhatsApp: 6281553629743\n\nTerima kasih atas kepercayaan Anda untuk mendaftar dan menjadi bagian dari layanan kami.', 'success', '{\"detail\":\"success! message in queue\",\"id\":[178422756],\"process\":\"pending\",\"quota\":{\"089519104607\":{\"details\":\"deduced from total quota\",\"quota\":978,\"remaining\":977,\"used\":1}},\"requestid\":724916171,\"status\":true,\"target\":[\"6281553629743\"]}', '2026-09-10 06:11:43'),
(23, NULL, '6281553629743', '━━━━━━━━━━━━━━━━━━━━━━\n📣 LOGIN BERHASIL\n━━━━━━━━━━━━━━━━━━━━━━\nWaktu: 10 September 2026 / 13:12\n\nHalo NABILA JELEK,\n\nKegiatan login akun Anda berhasil dilakukan pada sistem kami.\n\n📧 Email: nabila@gmail.com\n📱 Nomor WhatsApp: 6281553629743\n🕒 Status: Login berhasil\n\nJika Anda merasa tidak melakukan login ini, segera hubungi administrator untuk keamanan akun Anda.', 'success', '{\"detail\":\"success! message in queue\",\"id\":[178422819],\"process\":\"pending\",\"quota\":{\"089519104607\":{\"details\":\"deduced from total quota\",\"quota\":977,\"remaining\":976,\"used\":1}},\"requestid\":724916870,\"status\":true,\"target\":[\"6281553629743\"]}', '2026-09-10 06:12:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `no_hp`, `alamat`, `password`, `created_at`) VALUES
(3, 'TOBI PAKI i', 'tobi@gmail.com', '6283129542047', 'Balong', '$2y$10$EfPbtRIHP3R/N.j1oX8ryuWS6EcsEZtYc9ta4ioFuAL599QiqVm7C', '2026-09-10 04:06:24');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `log_whatsapp`
--
ALTER TABLE `log_whatsapp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_log_whatsapp_user` (`user_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `no_hp` (`no_hp`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `log_whatsapp`
--
ALTER TABLE `log_whatsapp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `log_whatsapp`
--
ALTER TABLE `log_whatsapp`
  ADD CONSTRAINT `fk_log_whatsapp_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
