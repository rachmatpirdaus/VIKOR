-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Feb 2022 pada 08.11
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vikor`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `hasil_perankingan`
--

CREATE TABLE `hasil_perankingan` (
  `id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_alternatif`
--

CREATE TABLE `tb_alternatif` (
  `id_user` int(15) NOT NULL,
  `kode_alternatif` varchar(35) NOT NULL,
  `nama_alternatif` varchar(55) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_alternatif`
--

INSERT INTO `tb_alternatif` (`id_user`, `kode_alternatif`, `nama_alternatif`, `keterangan`) VALUES
(2, 'A01', 'DKI JAKARTA', NULL),
(2, 'A02', 'JAWA BARAT', NULL),
(2, 'A03', 'JAWA TENGAH', NULL),
(2, 'A04', 'JAWA TIMUR', NULL),
(2, 'A05', 'SUMATERA UTARA', NULL),
(2, 'A06', 'KALIMANTAN TIMUR', NULL),
(2, 'A07', 'BANTEN', NULL),
(2, 'A08', 'DAERAH ISTIMEWA YOGYAKARTA', NULL),
(2, 'A09', 'BALI', NULL),
(2, 'A10', 'KEPULAUAN RIAU', NULL),
(2, 'A11', 'SULAWESI SELATAN', NULL),
(2, 'A12', 'PAPUA', NULL),
(2, 'A13', 'NUSA TENGGARA BARAT', NULL),
(2, 'A14', 'KALIMANTAN SELATAN', NULL),
(2, 'A15', 'SUMATERA SELATAN', NULL),
(2, 'A16', 'SUMATERA BARAT', NULL),
(2, 'A17', 'KALIMANTAN TENGAH', NULL),
(2, 'A18', 'KALIMANTAN UTARA', NULL),
(2, 'A19', 'KALIMANTAN BARAT', NULL),
(2, 'A20', 'LAMPUNG', NULL),
(2, 'A21', 'SULAWESI TENGGARA', NULL),
(2, 'A22', 'RIAU', NULL),
(2, 'A23', 'SULAWESI UTARA', NULL),
(2, 'A24', 'SULAWESI TENGAH', NULL),
(2, 'A25', 'MALUKU', NULL),
(2, 'A26', 'JAMBI', NULL),
(2, 'A27', 'MALUKU UTARA', NULL),
(2, 'A28', 'PAPUA BARAT', NULL),
(2, 'A29', 'BENGKULU', NULL),
(2, 'A30', 'KEPULAUAN BANGKA BELITUNG', NULL),
(2, 'A31', 'SULAWESI BARAT', NULL),
(2, 'A32', 'ACEH', NULL),
(2, 'A33', 'GORONTALO', NULL),
(2, 'A34', 'NUSA TENGGARA TIMUR', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kriteria`
--

CREATE TABLE `tb_kriteria` (
  `id_user` int(11) NOT NULL,
  `kode_kriteria` varchar(35) NOT NULL,
  `nama_kriteria` varchar(55) DEFAULT NULL,
  `atribut` varchar(16) DEFAULT NULL,
  `bobot` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_kriteria`
--

INSERT INTO `tb_kriteria` (`id_user`, `kode_kriteria`, `nama_kriteria`, `atribut`, `bobot`) VALUES
(2, 'C01', 'Jumlah Korban Infeksi', 'benefit', 0.3),
(2, 'C02', 'Tingkat Kesiapan Tenaga Medis', 'benefit', 0.1),
(2, 'C03', 'Biaya Pembangunan', 'cost', 0.1),
(2, 'C04', 'Jumlah Korban Sembuh', 'cost', 0.1),
(2, 'C05', 'Jumlah Korban Meninggal', 'benefit', 0.1),
(0, 'C06', 'Jumlah Rumah Sakit Rujukan', 'cost', 0.2),
(0, 'C07', 'Trend Pertumbuhan Infeksi (Polynomial Kubik)', 'benefit', 0.1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_nilai_alternatif`
--

CREATE TABLE `tb_nilai_alternatif` (
  `id` int(11) NOT NULL,
  `kode_alternatif` varchar(16) DEFAULT NULL,
  `kode_kriteria` varchar(16) DEFAULT NULL,
  `nilai` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_nilai_alternatif`
--

INSERT INTO `tb_nilai_alternatif` (`id`, `kode_alternatif`, `kode_kriteria`, `nilai`) VALUES
(236, 'A01', 'C01', 110083),
(237, 'A02', 'C01', 39138),
(238, 'A03', 'C01', 36591),
(239, 'A04', 'C01', 54080),
(240, 'A05', 'C01', 13589),
(243, 'A01', 'C02', 3),
(244, 'A02', 'C02', 3),
(245, 'A03', 'C02', 3),
(246, 'A04', 'C02', 3),
(247, 'A05', 'C02', 2),
(250, 'A01', 'C03', 3),
(251, 'A02', 'C03', 3),
(252, 'A03', 'C03', 2),
(253, 'A04', 'C03', 2),
(254, 'A05', 'C03', 2),
(257, 'A01', 'C04', 99739),
(258, 'A02', 'C04', 28179),
(259, 'A03', 'C04', 30203),
(260, 'A04', 'C04', 48042),
(261, 'A05', 'C04', 11118),
(264, 'A01', 'C05', 2346),
(265, 'A02', 'C05', 761),
(266, 'A03', 'C05', 1831),
(267, 'A04', 'C05', 3870),
(268, 'A05', 'C05', 560),
(278, 'A06', 'C01', 15140),
(279, 'A06', 'C02', 2),
(280, 'A06', 'C03', 2),
(281, 'A06', 'C04', 12262),
(282, 'A06', 'C05', 495),
(285, 'A07', 'C01', 9970),
(286, 'A07', 'C02', 2),
(287, 'A07', 'C03', 2),
(288, 'A07', 'C04', 7925),
(289, 'A07', 'C05', 287),
(292, 'A08', 'C01', 4165),
(293, 'A08', 'C02', 3),
(294, 'A08', 'C03', 2),
(295, 'A08', 'C04', 3338),
(296, 'A08', 'C05', 100),
(299, 'A09', 'C01', 12113),
(300, 'A09', 'C02', 3),
(301, 'A09', 'C03', 3),
(302, 'A09', 'C04', 11107),
(303, 'A09', 'C05', 399),
(306, 'A10', 'C01', 4230),
(307, 'A10', 'C02', 2),
(308, 'A10', 'C03', 3),
(309, 'A10', 'C04', 2900),
(310, 'A10', 'C05', 97),
(313, 'A11', 'C01', 18558),
(314, 'A11', 'C02', 2),
(315, 'A11', 'C03', 2),
(316, 'A11', 'C04', 16810),
(317, 'A11', 'C05', 470),
(320, 'A12', 'C01', 9275),
(321, 'A12', 'C02', 1),
(322, 'A12', 'C03', 2),
(323, 'A12', 'C04', 4820),
(324, 'A12', 'C05', 133),
(327, 'A13', 'C01', 4117),
(328, 'A13', 'C02', 2),
(329, 'A13', 'C03', 2),
(330, 'A13', 'C04', 3459),
(331, 'A13', 'C05', 227),
(334, 'A14', 'C01', 12080),
(335, 'A14', 'C02', 2),
(336, 'A14', 'C03', 1),
(337, 'A14', 'C04', 11034),
(338, 'A14', 'C05', 491),
(341, 'A15', 'C01', 8184),
(342, 'A15', 'C02', 2),
(343, 'A15', 'C03', 2),
(344, 'A15', 'C04', 6654),
(345, 'A15', 'C05', 443),
(348, 'A16', 'C01', 15656),
(349, 'A16', 'C02', 2),
(350, 'A16', 'C03', 2),
(351, 'A16', 'C04', 12347),
(352, 'A16', 'C05', 289),
(355, 'A17', 'C01', 4517),
(356, 'A17', 'C02', 2),
(357, 'A17', 'C03', 1),
(358, 'A17', 'C04', 3989),
(359, 'A17', 'C05', 160),
(362, 'A18', 'C01', 879),
(363, 'A18', 'C02', 2),
(364, 'A18', 'C03', 1),
(365, 'A18', 'C04', 759),
(366, 'A18', 'C05', 10),
(369, 'A19', 'C01', 1870),
(370, 'A19', 'C02', 2),
(371, 'A19', 'C03', 2),
(372, 'A19', 'C04', 1404),
(373, 'A19', 'C05', 22),
(376, 'A20', 'C01', 2066),
(377, 'A20', 'C02', 1),
(378, 'A20', 'C03', 2),
(379, 'A20', 'C04', 1163),
(380, 'A20', 'C05', 90),
(383, 'A21', 'C01', 5242),
(384, 'A21', 'C02', 1),
(385, 'A21', 'C03', 1),
(386, 'A21', 'C04', 4284),
(387, 'A21', 'C05', 87),
(390, 'A22', 'C01', 15421),
(391, 'A22', 'C02', 2),
(392, 'A22', 'C03', 2),
(393, 'A22', 'C04', 12611),
(394, 'A22', 'C05', 355),
(397, 'A23', 'C01', 5528),
(398, 'A23', 'C02', 2),
(399, 'A23', 'C03', 2),
(400, 'A23', 'C04', 12611),
(401, 'A23', 'C05', 355),
(404, 'A24', 'C01', 963),
(405, 'A24', 'C02', 2),
(406, 'A24', 'C03', 1),
(407, 'A24', 'C04', 709),
(408, 'A24', 'C05', 41),
(411, 'A25', 'C01', 3914),
(412, 'A25', 'C02', 1),
(413, 'A25', 'C03', 2),
(414, 'A25', 'C04', 3317),
(415, 'A25', 'C05', 48),
(418, 'A26', 'C01', 1267),
(419, 'A26', 'C02', 2),
(420, 'A26', 'C03', 2),
(421, 'A26', 'C04', 694),
(422, 'A26', 'C05', 24),
(425, 'A27', 'C01', 2238),
(426, 'A27', 'C02', 1),
(427, 'A27', 'C03', 2),
(428, 'A27', 'C04', 1946),
(429, 'A27', 'C05', 75),
(432, 'A28', 'C01', 4395),
(433, 'A28', 'C02', 1),
(434, 'A28', 'C03', 2),
(435, 'A28', 'C04', 3710),
(436, 'A28', 'C05', 69),
(439, 'A29', 'C01', 1157),
(440, 'A29', 'C02', 2),
(441, 'A29', 'C03', 2),
(442, 'A29', 'C04', 893),
(443, 'A29', 'C05', 54),
(446, 'A30', 'C01', 667),
(447, 'A30', 'C02', 2),
(448, 'A30', 'C03', 2),
(449, 'A30', 'C04', 562),
(450, 'A30', 'C05', 7),
(453, 'A31', 'C01', 1064),
(454, 'A31', 'C02', 2),
(455, 'A31', 'C03', 2),
(456, 'A31', 'C04', 863),
(457, 'A31', 'C05', 15),
(460, 'A32', 'C01', 7634),
(461, 'A32', 'C02', 3),
(462, 'A32', 'C03', 2),
(463, 'A32', 'C04', 5725),
(464, 'A32', 'C05', 279),
(467, 'A33', 'C01', 3032),
(468, 'A33', 'C02', 1),
(469, 'A33', 'C03', 2),
(470, 'A33', 'C04', 2871),
(471, 'A33', 'C05', 86),
(474, 'A34', 'C01', 751),
(475, 'A34', 'C02', 1),
(476, 'A34', 'C03', 2),
(477, 'A34', 'C04', 552),
(478, 'A34', 'C05', 11),
(479, 'A01', 'C06', 8),
(480, 'A02', 'C06', 8),
(481, 'A03', 'C06', 13),
(482, 'A04', 'C06', 11),
(483, 'A05', 'C06', 5),
(484, 'A06', 'C06', 5),
(485, 'A07', 'C06', 2),
(486, 'A08', 'C06', 4),
(487, 'A09', 'C06', 4),
(488, 'A10', 'C06', 4),
(489, 'A11', 'C06', 7),
(490, 'A12', 'C06', 3),
(491, 'A13', 'C06', 4),
(492, 'A14', 'C06', 2),
(493, 'A15', 'C06', 5),
(494, 'A16', 'C06', 2),
(495, 'A17', 'C06', 3),
(496, 'A18', 'C06', 2),
(497, 'A19', 'C06', 4),
(498, 'A20', 'C06', 4),
(499, 'A21', 'C06', 1),
(500, 'A22', 'C06', 3),
(501, 'A23', 'C06', 4),
(502, 'A24', 'C06', 5),
(503, 'A25', 'C06', 3),
(504, 'A26', 'C06', 1),
(505, 'A27', 'C06', 1),
(506, 'A28', 'C06', 2),
(507, 'A29', 'C06', 3),
(508, 'A30', 'C06', 2),
(509, 'A31', 'C06', 1),
(510, 'A32', 'C06', 2),
(511, 'A33', 'C06', 1),
(512, 'A34', 'C06', 3),
(513, 'A01', 'C07', 5),
(514, 'A02', 'C07', 5),
(515, 'A03', 'C07', 5),
(516, 'A04', 'C07', 5),
(517, 'A05', 'C07', 5),
(518, 'A06', 'C07', 5),
(519, 'A07', 'C07', 5),
(520, 'A08', 'C07', 3),
(521, 'A09', 'C07', 5),
(522, 'A10', 'C07', 5),
(523, 'A11', 'C07', 5),
(524, 'A12', 'C07', 5),
(525, 'A13', 'C07', 5),
(526, 'A14', 'C07', 5),
(527, 'A15', 'C07', 5),
(528, 'A16', 'C07', 3),
(529, 'A17', 'C07', 5),
(530, 'A18', 'C07', 5),
(531, 'A19', 'C07', 5),
(532, 'A20', 'C07', 5),
(533, 'A21', 'C07', 5),
(534, 'A22', 'C07', 5),
(535, 'A23', 'C07', 5),
(536, 'A24', 'C07', 5),
(537, 'A25', 'C07', 5),
(538, 'A26', 'C07', 3),
(539, 'A27', 'C07', 5),
(540, 'A28', 'C07', 3),
(541, 'A29', 'C07', 1),
(542, 'A30', 'C07', 3),
(543, 'A31', 'C07', 3),
(544, 'A32', 'C07', 5),
(545, 'A33', 'C07', 5),
(546, 'A34', 'C07', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username`, `password`) VALUES
(1, 'admin', 'admin'),
(2, 'rahmat', 'mrrachmat243');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `hasil_perankingan`
--
ALTER TABLE `hasil_perankingan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_alternatif`
--
ALTER TABLE `tb_alternatif`
  ADD PRIMARY KEY (`kode_alternatif`);

--
-- Indeks untuk tabel `tb_kriteria`
--
ALTER TABLE `tb_kriteria`
  ADD PRIMARY KEY (`kode_kriteria`);

--
-- Indeks untuk tabel `tb_nilai_alternatif`
--
ALTER TABLE `tb_nilai_alternatif`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_nilai_alternatif`
--
ALTER TABLE `tb_nilai_alternatif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=547;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
