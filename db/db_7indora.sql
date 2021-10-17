/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100137
 Source Host           : localhost:3306
 Source Schema         : db_7indora

 Target Server Type    : MySQL
 Target Server Version : 100137
 File Encoding         : 65001

 Date: 12/01/2021 09:00:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_admin
-- ----------------------------
DROP TABLE IF EXISTS `tbl_admin`;
CREATE TABLE `tbl_admin`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `level` int NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_outlet` int NOT NULL,
  `tgl_update` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tbl_admin
-- ----------------------------
INSERT INTO `tbl_admin` VALUES (1, 'admin', 'VFZSSmVnPT0=', '', 'admin-1605766520.png', 1, 'Admin A', 1, '2020-10-25 23:12:40');
INSERT INTO `tbl_admin` VALUES (2, 'kasirlingga', 'VFZSSmVnPT0=', '', 'kasir-1602690484.png', 2, 'Lingga', 1, '2020-10-25 23:13:21');
INSERT INTO `tbl_admin` VALUES (3, 'sukarela', 'VFZSSmVnPT0=', '', 'keanggotaan-1603508569.png', 3, 'Admin Keanggotaan Indora', 1, '2020-11-22 15:39:18');
INSERT INTO `tbl_admin` VALUES (4, 'adminb', 'VFZSSmVrNUVWVEpPZW1jOQ==', '', '', 1, 'Admin B', 1, '2020-10-25 23:14:37');
INSERT INTO `tbl_admin` VALUES (5, 'adminc', 'VFZSSmVrNUVWVEpPZW1jOQ==', '', '', 1, 'Admin C', 1, '2020-10-25 23:14:58');
INSERT INTO `tbl_admin` VALUES (6, 'lingga1', 'WWtkc2RWb3llSEJpYldNOQ==', '', '', 2, 'Lingga', 1, '2020-11-14 10:56:06');
INSERT INTO `tbl_admin` VALUES (7, 'kasirasti', 'VFZSSmVrNUVWVEpPZW1jOQ==', '', '', 2, 'Asti', 1, '2020-12-14 07:26:33');
INSERT INTO `tbl_admin` VALUES (8, 'baymax', 'VFZSSmVnPT0=', '', '', 2, 'kasir Baymax', 1, '2020-11-13 11:43:39');
INSERT INTO `tbl_admin` VALUES (9, 'kasirriyan', 'VFZSSmVnPT0=', '', 'kasir-1605583403.png', 2, 'Riyan', 1, '2020-10-25 23:15:21');
INSERT INTO `tbl_admin` VALUES (10, 'kasir', 'VFZSSmVrNUVWVEpPZW1jOQ==', '', '', 2, 'YULIANA ', 1, '2020-12-14 08:17:23');

-- ----------------------------
-- Table structure for tbl_bayar_apk
-- ----------------------------
DROP TABLE IF EXISTS `tbl_bayar_apk`;
CREATE TABLE `tbl_bayar_apk`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl` datetime NULL DEFAULT NULL,
  `nominal` int NULL DEFAULT NULL,
  `file` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `verif` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `simpanan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_verif` datetime NULL DEFAULT NULL,
  `id_admin` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_bayar_apk
-- ----------------------------
INSERT INTO `tbl_bayar_apk` VALUES (1, '154', '2020-12-23 21:17:21', 4000, '123.000.123-2020-12-23_21:17:21.png', 'Y', 'Simpanan Wajib', '2020-12-23 23:46:31', '3');
INSERT INTO `tbl_bayar_apk` VALUES (3, '154', '2020-12-23 21:36:11', 100000, '123.000.123-2020-12-23_21:36:11.png', 'Y', 'Simpanan Sukarela', '2020-12-23 23:46:01', '3');
INSERT INTO `tbl_bayar_apk` VALUES (4, '154', '2020-12-23 21:48:14', 1000000, '154-2020-12-23_21:48:14.png', 'Y', 'Simpanan Sukarela', '2020-12-23 23:45:21', '3');

-- ----------------------------
-- Table structure for tbl_iklan
-- ----------------------------
DROP TABLE IF EXISTS `tbl_iklan`;
CREATE TABLE `tbl_iklan`  (
  `id_iklan` int NOT NULL AUTO_INCREMENT,
  `foto` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `deskripsi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_iklan`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_iklan
-- ----------------------------
INSERT INTO `tbl_iklan` VALUES (1, 'promo.jpeg', '');

-- ----------------------------
-- Table structure for tbl_kabupaten
-- ----------------------------
DROP TABLE IF EXISTS `tbl_kabupaten`;
CREATE TABLE `tbl_kabupaten`  (
  `id_kabupaten` int NOT NULL AUTO_INCREMENT,
  `id_provinsi` int NOT NULL,
  `kabupaten` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_kabupaten`) USING BTREE,
  INDEX `id_provinsi`(`id_provinsi`) USING BTREE,
  CONSTRAINT `tbl_kabupaten_ibfk_1` FOREIGN KEY (`id_provinsi`) REFERENCES `tbl_provinsi` (`id_provinsi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tbl_kabupaten
-- ----------------------------
INSERT INTO `tbl_kabupaten` VALUES (1, 1, 'Pilih Kabupaten');
INSERT INTO `tbl_kabupaten` VALUES (3, 2, 'Blora');
INSERT INTO `tbl_kabupaten` VALUES (4, 3, 'ALB');

-- ----------------------------
-- Table structure for tbl_kategori
-- ----------------------------
DROP TABLE IF EXISTS `tbl_kategori`;
CREATE TABLE `tbl_kategori`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `foto` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_urut` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tbl_kategori
-- ----------------------------
INSERT INTO `tbl_kategori` VALUES (1, 'Makanan Ringan', 'kategori-1608343110.jpeg', 1);
INSERT INTO `tbl_kategori` VALUES (2, 'Sembako', 'kategori-1604635685.png', 5);
INSERT INTO `tbl_kategori` VALUES (19, 'Pembersih', 'kategori-1607911810.jpg', 3);
INSERT INTO `tbl_kategori` VALUES (20, 'Minuman', 'kategori-1607918841.jpg', 4);
INSERT INTO `tbl_kategori` VALUES (21, 'Sabun', 'kategori-1607998482.jpeg', 5);

-- ----------------------------
-- Table structure for tbl_kecamatan
-- ----------------------------
DROP TABLE IF EXISTS `tbl_kecamatan`;
CREATE TABLE `tbl_kecamatan`  (
  `id_kecamatan` int NOT NULL AUTO_INCREMENT,
  `id_kabupaten` int NOT NULL,
  `kecamatan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_kecamatan`) USING BTREE,
  INDEX `id_kabupaten`(`id_kabupaten`) USING BTREE,
  CONSTRAINT `tbl_kecamatan_ibfk_1` FOREIGN KEY (`id_kabupaten`) REFERENCES `tbl_kabupaten` (`id_kabupaten`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tbl_kecamatan
-- ----------------------------
INSERT INTO `tbl_kecamatan` VALUES (1, 1, 'Pilih Kecamatan');
INSERT INTO `tbl_kecamatan` VALUES (2, 3, 'BANJAREJO');
INSERT INTO `tbl_kecamatan` VALUES (3, 3, 'BLORA KOTA');
INSERT INTO `tbl_kecamatan` VALUES (4, 3, 'BOGOREJO');
INSERT INTO `tbl_kecamatan` VALUES (5, 3, 'CEPU');
INSERT INTO `tbl_kecamatan` VALUES (6, 3, 'JAPAH');
INSERT INTO `tbl_kecamatan` VALUES (7, 3, 'JATI');
INSERT INTO `tbl_kecamatan` VALUES (8, 3, 'JEPON');
INSERT INTO `tbl_kecamatan` VALUES (9, 3, 'JIKEN');
INSERT INTO `tbl_kecamatan` VALUES (10, 3, 'KEDUNGTUBAN');
INSERT INTO `tbl_kecamatan` VALUES (11, 3, 'KRADENAN');
INSERT INTO `tbl_kecamatan` VALUES (12, 3, 'KUNDURAN');
INSERT INTO `tbl_kecamatan` VALUES (13, 3, 'NGAWEN');
INSERT INTO `tbl_kecamatan` VALUES (14, 3, 'RANDUBLATUNG');
INSERT INTO `tbl_kecamatan` VALUES (15, 3, 'SAMBONG');
INSERT INTO `tbl_kecamatan` VALUES (16, 3, 'TODANAN');
INSERT INTO `tbl_kecamatan` VALUES (17, 3, 'TUNJUNGAN');
INSERT INTO `tbl_kecamatan` VALUES (54, 4, 'ALB');

-- ----------------------------
-- Table structure for tbl_kelurahan
-- ----------------------------
DROP TABLE IF EXISTS `tbl_kelurahan`;
CREATE TABLE `tbl_kelurahan`  (
  `id_kelurahan` int NOT NULL AUTO_INCREMENT,
  `id_kecamatan` int NULL DEFAULT NULL,
  `kelurahan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_kelurahan`) USING BTREE,
  INDEX `id_kecamatan`(`id_kecamatan`) USING BTREE,
  CONSTRAINT `tbl_kelurahan_ibfk_1` FOREIGN KEY (`id_kecamatan`) REFERENCES `tbl_kecamatan` (`id_kecamatan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 299 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tbl_kelurahan
-- ----------------------------
INSERT INTO `tbl_kelurahan` VALUES (1, 2, 'BACEM');
INSERT INTO `tbl_kelurahan` VALUES (2, 2, 'BALONGREJO');
INSERT INTO `tbl_kelurahan` VALUES (3, 2, 'BALONGSARI');
INSERT INTO `tbl_kelurahan` VALUES (4, 2, 'BANJAREJO');
INSERT INTO `tbl_kelurahan` VALUES (5, 2, 'BULUROTO');
INSERT INTO `tbl_kelurahan` VALUES (6, 2, 'GEDONGSARI');
INSERT INTO `tbl_kelurahan` VALUES (7, 2, 'JATIKLAMPOK');
INSERT INTO `tbl_kelurahan` VALUES (8, 2, 'JATISARI');
INSERT INTO `tbl_kelurahan` VALUES (9, 2, 'KARANGTALUN');
INSERT INTO `tbl_kelurahan` VALUES (10, 2, 'KEBONREJO');
INSERT INTO `tbl_kelurahan` VALUES (11, 2, 'KEMBANG');
INSERT INTO `tbl_kelurahan` VALUES (12, 2, 'KLOPODUWUR');
INSERT INTO `tbl_kelurahan` VALUES (13, 2, 'MOJOWETAN');
INSERT INTO `tbl_kelurahan` VALUES (14, 2, 'PLOSOREJO');
INSERT INTO `tbl_kelurahan` VALUES (15, 2, 'SEMBONGIN');
INSERT INTO `tbl_kelurahan` VALUES (16, 2, 'SENDANGGAYAM');
INSERT INTO `tbl_kelurahan` VALUES (17, 2, 'SENDANGWUNGU');
INSERT INTO `tbl_kelurahan` VALUES (18, 2, 'SIDOMULYO');
INSERT INTO `tbl_kelurahan` VALUES (19, 2, 'SUMBERAGUNG');
INSERT INTO `tbl_kelurahan` VALUES (20, 2, 'WONOSEMI');
INSERT INTO `tbl_kelurahan` VALUES (21, 3, 'TEMPELAN');
INSERT INTO `tbl_kelurahan` VALUES (22, 3, 'KUNDEN');
INSERT INTO `tbl_kelurahan` VALUES (23, 3, 'KAUMAN');
INSERT INTO `tbl_kelurahan` VALUES (24, 3, 'SONOREJO');
INSERT INTO `tbl_kelurahan` VALUES (25, 3, 'JETIS');
INSERT INTO `tbl_kelurahan` VALUES (26, 3, 'TAMBAHREJO');
INSERT INTO `tbl_kelurahan` VALUES (27, 3, 'MLANGSEN');
INSERT INTO `tbl_kelurahan` VALUES (28, 3, 'BERAN');
INSERT INTO `tbl_kelurahan` VALUES (29, 3, 'KEDUNG JENAR');
INSERT INTO `tbl_kelurahan` VALUES (30, 3, 'BANGKLE');
INSERT INTO `tbl_kelurahan` VALUES (31, 3, 'ANDONGREJO');
INSERT INTO `tbl_kelurahan` VALUES (32, 3, 'JEJERUK');
INSERT INTO `tbl_kelurahan` VALUES (33, 3, 'JEPANGREJO');
INSERT INTO `tbl_kelurahan` VALUES (34, 3, 'KAMOLAN');
INSERT INTO `tbl_kelurahan` VALUES (35, 3, 'KARANGJATI');
INSERT INTO `tbl_kelurahan` VALUES (36, 3, 'NGADIPURWO');
INSERT INTO `tbl_kelurahan` VALUES (37, 3, 'NGAMPEL');
INSERT INTO `tbl_kelurahan` VALUES (38, 3, 'PATALAN');
INSERT INTO `tbl_kelurahan` VALUES (39, 3, 'PELEM');
INSERT INTO `tbl_kelurahan` VALUES (40, 3, 'PLANTUNGAN');
INSERT INTO `tbl_kelurahan` VALUES (41, 3, 'PURWOREJO');
INSERT INTO `tbl_kelurahan` VALUES (42, 3, 'PURWOSARI');
INSERT INTO `tbl_kelurahan` VALUES (43, 3, 'SENDANGHARJO');
INSERT INTO `tbl_kelurahan` VALUES (44, 3, 'TAMBAKSARI');
INSERT INTO `tbl_kelurahan` VALUES (45, 3, 'TEGALGUNUNG');
INSERT INTO `tbl_kelurahan` VALUES (46, 3, 'TEMPURAN');
INSERT INTO `tbl_kelurahan` VALUES (47, 3, 'TEMPUREJO');
INSERT INTO `tbl_kelurahan` VALUES (48, 3, 'TEMUREJO');
INSERT INTO `tbl_kelurahan` VALUES (49, 4, 'BOGOREJO');
INSERT INTO `tbl_kelurahan` VALUES (50, 4, 'GANDU');
INSERT INTO `tbl_kelurahan` VALUES (51, 4, 'GAYAM');
INSERT INTO `tbl_kelurahan` VALUES (52, 4, 'GEMBOL');
INSERT INTO `tbl_kelurahan` VALUES (53, 4, 'GOMBANG');
INSERT INTO `tbl_kelurahan` VALUES (54, 4, 'JERUK');
INSERT INTO `tbl_kelurahan` VALUES (55, 4, 'JURANGJERO');
INSERT INTO `tbl_kelurahan` VALUES (56, 4, 'KARANG');
INSERT INTO `tbl_kelurahan` VALUES (57, 4, 'KARANGANYAR');
INSERT INTO `tbl_kelurahan` VALUES (58, 4, 'NGLENGKIR');
INSERT INTO `tbl_kelurahan` VALUES (59, 4, 'PRANTAAN');
INSERT INTO `tbl_kelurahan` VALUES (60, 4, 'SARIREJO');
INSERT INTO `tbl_kelurahan` VALUES (61, 4, 'SENDANGREJO');
INSERT INTO `tbl_kelurahan` VALUES (62, 4, 'TEMPUREJO');
INSERT INTO `tbl_kelurahan` VALUES (63, 5, 'BALUN');
INSERT INTO `tbl_kelurahan` VALUES (64, 5, 'CEPU');
INSERT INTO `tbl_kelurahan` VALUES (65, 5, 'NGELO');
INSERT INTO `tbl_kelurahan` VALUES (66, 5, 'NGROTO');
INSERT INTO `tbl_kelurahan` VALUES (67, 5, 'CABEYAN (CABEAN)');
INSERT INTO `tbl_kelurahan` VALUES (68, 5, 'GADON');
INSERT INTO `tbl_kelurahan` VALUES (69, 5, 'GETAS');
INSERT INTO `tbl_kelurahan` VALUES (70, 5, 'JIPANG');
INSERT INTO `tbl_kelurahan` VALUES (71, 5, 'KAPUAN');
INSERT INTO `tbl_kelurahan` VALUES (72, 5, 'KARANGBOYO');
INSERT INTO `tbl_kelurahan` VALUES (73, 5, 'KENTONG');
INSERT INTO `tbl_kelurahan` VALUES (74, 5, 'MERNUNG');
INSERT INTO `tbl_kelurahan` VALUES (75, 5, 'MULYOREJO');
INSERT INTO `tbl_kelurahan` VALUES (76, 5, 'NGLANJUK');
INSERT INTO `tbl_kelurahan` VALUES (77, 5, 'NGLORAM');
INSERT INTO `tbl_kelurahan` VALUES (78, 5, 'SUMBERPITU');
INSERT INTO `tbl_kelurahan` VALUES (79, 5, 'TAMBAKROMO');
INSERT INTO `tbl_kelurahan` VALUES (80, 6, 'BEGANJING');
INSERT INTO `tbl_kelurahan` VALUES (81, 6, 'BOGEM');
INSERT INTO `tbl_kelurahan` VALUES (82, 6, 'BOGOREJO');
INSERT INTO `tbl_kelurahan` VALUES (83, 6, 'DOLOGAN');
INSERT INTO `tbl_kelurahan` VALUES (84, 6, 'GAPLOKAN');
INSERT INTO `tbl_kelurahan` VALUES (85, 6, 'HARJOWINANGUN');
INSERT INTO `tbl_kelurahan` VALUES (86, 6, 'JAPAH');
INSERT INTO `tbl_kelurahan` VALUES (87, 6, 'KALINANAS');
INSERT INTO `tbl_kelurahan` VALUES (88, 6, 'KROCOK');
INSERT INTO `tbl_kelurahan` VALUES (89, 6, 'NGAPUS');
INSERT INTO `tbl_kelurahan` VALUES (90, 6, 'NGIYONO');
INSERT INTO `tbl_kelurahan` VALUES (91, 6, 'NGRAMBITAN');
INSERT INTO `tbl_kelurahan` VALUES (92, 6, 'PADAAN');
INSERT INTO `tbl_kelurahan` VALUES (93, 6, 'PENGKOLREJO');
INSERT INTO `tbl_kelurahan` VALUES (94, 6, 'SUMBEREJO');
INSERT INTO `tbl_kelurahan` VALUES (95, 6, 'TENGGER');
INSERT INTO `tbl_kelurahan` VALUES (96, 6, 'TLOGOWUNGU');
INSERT INTO `tbl_kelurahan` VALUES (97, 6, 'WOTBAKAH');
INSERT INTO `tbl_kelurahan` VALUES (98, 7, 'BANGKLEYAN');
INSERT INTO `tbl_kelurahan` VALUES (99, 7, 'DOPLANG');
INSERT INTO `tbl_kelurahan` VALUES (100, 7, 'GABUSAN');
INSERT INTO `tbl_kelurahan` VALUES (101, 7, 'GEMPOL');
INSERT INTO `tbl_kelurahan` VALUES (102, 7, 'JATI');
INSERT INTO `tbl_kelurahan` VALUES (103, 7, 'JEGONG');
INSERT INTO `tbl_kelurahan` VALUES (104, 7, 'KEPOH');
INSERT INTO `tbl_kelurahan` VALUES (105, 7, 'PELEM');
INSERT INTO `tbl_kelurahan` VALUES (106, 7, 'PENGKOLJAGONG');
INSERT INTO `tbl_kelurahan` VALUES (107, 7, 'RANDULAWANG');
INSERT INTO `tbl_kelurahan` VALUES (108, 7, 'SINGGET');
INSERT INTO `tbl_kelurahan` VALUES (109, 7, 'TOBO');
INSERT INTO `tbl_kelurahan` VALUES (110, 8, 'BACEM');
INSERT INTO `tbl_kelurahan` VALUES (111, 8, 'BALONG');
INSERT INTO `tbl_kelurahan` VALUES (112, 8, 'BANGSRI');
INSERT INTO `tbl_kelurahan` VALUES (113, 8, 'BLUNGUN');
INSERT INTO `tbl_kelurahan` VALUES (114, 8, 'BRUMBUNG');
INSERT INTO `tbl_kelurahan` VALUES (115, 8, 'GEDANGDOWO');
INSERT INTO `tbl_kelurahan` VALUES (116, 8, 'GENENG');
INSERT INTO `tbl_kelurahan` VALUES (117, 8, 'GERSI');
INSERT INTO `tbl_kelurahan` VALUES (118, 8, 'JATIREJO');
INSERT INTO `tbl_kelurahan` VALUES (119, 8, 'JEPON');
INSERT INTO `tbl_kelurahan` VALUES (120, 8, 'JOMBLANG');
INSERT INTO `tbl_kelurahan` VALUES (121, 8, 'KAWENGAN');
INSERT INTO `tbl_kelurahan` VALUES (122, 8, 'KEMIRI');
INSERT INTO `tbl_kelurahan` VALUES (123, 8, 'NGAMPON');
INSERT INTO `tbl_kelurahan` VALUES (124, 8, 'NGLAROHGUNUNG');
INSERT INTO `tbl_kelurahan` VALUES (125, 8, 'PALON');
INSERT INTO `tbl_kelurahan` VALUES (126, 8, 'PULEDAGEL');
INSERT INTO `tbl_kelurahan` VALUES (127, 8, 'SEMAMPIR');
INSERT INTO `tbl_kelurahan` VALUES (128, 8, 'SEMANGGI');
INSERT INTO `tbl_kelurahan` VALUES (129, 8, 'SESO');
INSERT INTO `tbl_kelurahan` VALUES (130, 8, 'SOKO');
INSERT INTO `tbl_kelurahan` VALUES (131, 8, 'SUMURBOTO');
INSERT INTO `tbl_kelurahan` VALUES (132, 8, 'TEMPELLEMAHBANG');
INSERT INTO `tbl_kelurahan` VALUES (133, 8, 'TURIREJO');
INSERT INTO `tbl_kelurahan` VALUES (134, 8, 'WARU');
INSERT INTO `tbl_kelurahan` VALUES (135, 9, 'BANGOWAN');
INSERT INTO `tbl_kelurahan` VALUES (136, 9, 'BLEBOH');
INSERT INTO `tbl_kelurahan` VALUES (137, 9, 'CABAK');
INSERT INTO `tbl_kelurahan` VALUES (138, 9, 'GENJAHAN');
INSERT INTO `tbl_kelurahan` VALUES (139, 9, 'JANJANG');
INSERT INTO `tbl_kelurahan` VALUES (140, 9, 'JIKEN');
INSERT INTO `tbl_kelurahan` VALUES (141, 9, 'JIWOREJO');
INSERT INTO `tbl_kelurahan` VALUES (142, 9, 'KETRINGAN');
INSERT INTO `tbl_kelurahan` VALUES (143, 9, 'NGLEBUR');
INSERT INTO `tbl_kelurahan` VALUES (144, 9, 'NGLOBO');
INSERT INTO `tbl_kelurahan` VALUES (145, 9, 'SINGONEGORO');
INSERT INTO `tbl_kelurahan` VALUES (146, 10, 'BAJO');
INSERT INTO `tbl_kelurahan` VALUES (147, 10, 'GALUK');
INSERT INTO `tbl_kelurahan` VALUES (148, 10, 'GONDEL');
INSERT INTO `tbl_kelurahan` VALUES (149, 10, 'JIMBUNG');
INSERT INTO `tbl_kelurahan` VALUES (150, 10, 'KALEN');
INSERT INTO `tbl_kelurahan` VALUES (151, 10, 'KEDUNGTUBAN');
INSERT INTO `tbl_kelurahan` VALUES (152, 10, 'KEMANTREN');
INSERT INTO `tbl_kelurahan` VALUES (153, 10, 'KETUWAN');
INSERT INTO `tbl_kelurahan` VALUES (154, 10, 'KLAGEN');
INSERT INTO `tbl_kelurahan` VALUES (155, 10, 'NGLANDEYAN');
INSERT INTO `tbl_kelurahan` VALUES (156, 10, 'NGRAHO');
INSERT INTO `tbl_kelurahan` VALUES (157, 10, 'PANOLAN');
INSERT INTO `tbl_kelurahan` VALUES (158, 10, 'PULO');
INSERT INTO `tbl_kelurahan` VALUES (159, 10, 'SIDOREJO');
INSERT INTO `tbl_kelurahan` VALUES (160, 10, 'SOGO');
INSERT INTO `tbl_kelurahan` VALUES (161, 10, 'TANJUNG');
INSERT INTO `tbl_kelurahan` VALUES (162, 10, 'WADO');
INSERT INTO `tbl_kelurahan` VALUES (163, 11, 'GETAS');
INSERT INTO `tbl_kelurahan` VALUES (164, 11, 'MEDALEM');
INSERT INTO `tbl_kelurahan` VALUES (165, 11, 'MEGERI');
INSERT INTO `tbl_kelurahan` VALUES (166, 11, 'MENDENREJO');
INSERT INTO `tbl_kelurahan` VALUES (167, 11, 'MOJOREMBUN');
INSERT INTO `tbl_kelurahan` VALUES (168, 11, 'NGINGGIL');
INSERT INTO `tbl_kelurahan` VALUES (169, 11, 'NGLEBAK');
INSERT INTO `tbl_kelurahan` VALUES (170, 11, 'NGLUNGGER');
INSERT INTO `tbl_kelurahan` VALUES (171, 11, 'NGRAWOH');
INSERT INTO `tbl_kelurahan` VALUES (172, 11, 'SUMBER');
INSERT INTO `tbl_kelurahan` VALUES (173, 12, 'BAKAH');
INSERT INTO `tbl_kelurahan` VALUES (174, 12, 'BALONG');
INSERT INTO `tbl_kelurahan` VALUES (175, 12, 'BEJIREJO');
INSERT INTO `tbl_kelurahan` VALUES (176, 12, 'BLUMBANGREJO');
INSERT INTO `tbl_kelurahan` VALUES (177, 12, 'BOTORECO');
INSERT INTO `tbl_kelurahan` VALUES (178, 12, 'BULOH');
INSERT INTO `tbl_kelurahan` VALUES (179, 12, 'CUNGKUP');
INSERT INTO `tbl_kelurahan` VALUES (180, 12, 'GAGAAN');
INSERT INTO `tbl_kelurahan` VALUES (181, 12, 'JAGONG');
INSERT INTO `tbl_kelurahan` VALUES (182, 12, 'JETAK');
INSERT INTO `tbl_kelurahan` VALUES (183, 12, 'KALANGREJO');
INSERT INTO `tbl_kelurahan` VALUES (184, 12, 'KARANGGENENG');
INSERT INTO `tbl_kelurahan` VALUES (185, 12, 'KEDUNGWARU');
INSERT INTO `tbl_kelurahan` VALUES (186, 12, 'KEMIRI');
INSERT INTO `tbl_kelurahan` VALUES (187, 12, 'KLOKAH');
INSERT INTO `tbl_kelurahan` VALUES (188, 12, 'KODOKAN');
INSERT INTO `tbl_kelurahan` VALUES (189, 12, 'KUNDURAN');
INSERT INTO `tbl_kelurahan` VALUES (190, 12, 'MURAHARJO');
INSERT INTO `tbl_kelurahan` VALUES (191, 12, 'NGAWENOMBO');
INSERT INTO `tbl_kelurahan` VALUES (192, 12, 'NGILEN');
INSERT INTO `tbl_kelurahan` VALUES (193, 12, 'PLOSO REJO');
INSERT INTO `tbl_kelurahan` VALUES (194, 12, 'SAMBIROTO');
INSERT INTO `tbl_kelurahan` VALUES (195, 12, 'SEMPU');
INSERT INTO `tbl_kelurahan` VALUES (196, 12, 'SENDANGWATES');
INSERT INTO `tbl_kelurahan` VALUES (197, 12, 'SONOKIDUL');
INSERT INTO `tbl_kelurahan` VALUES (198, 12, 'TAWANGREJO');
INSERT INTO `tbl_kelurahan` VALUES (199, 13, 'BANDUNGROJO');
INSERT INTO `tbl_kelurahan` VALUES (200, 13, 'BERBAK');
INSERT INTO `tbl_kelurahan` VALUES (201, 13, 'BERGOLO');
INSERT INTO `tbl_kelurahan` VALUES (202, 13, 'BOGOWANTI');
INSERT INTO `tbl_kelurahan` VALUES (203, 13, 'BRADAG');
INSERT INTO `tbl_kelurahan` VALUES (204, 13, 'GEDEBEG');
INSERT INTO `tbl_kelurahan` VALUES (205, 13, 'GONDANG');
INSERT INTO `tbl_kelurahan` VALUES (206, 13, 'GOTPUTUK');
INSERT INTO `tbl_kelurahan` VALUES (207, 13, 'JETAKWANGER');
INSERT INTO `tbl_kelurahan` VALUES (208, 13, 'KARANGJONG');
INSERT INTO `tbl_kelurahan` VALUES (209, 13, 'KARANGTENGAH');
INSERT INTO `tbl_kelurahan` VALUES (210, 13, 'KEDUNGSATRIYAN');
INSERT INTO `tbl_kelurahan` VALUES (211, 13, 'KENDAYAAN');
INSERT INTO `tbl_kelurahan` VALUES (212, 13, 'NGAWEN');
INSERT INTO `tbl_kelurahan` VALUES (213, 13, 'PLUMBON');
INSERT INTO `tbl_kelurahan` VALUES (214, 13, 'PUNGGURSUGIH');
INSERT INTO `tbl_kelurahan` VALUES (215, 13, 'ROWOBUNGKUL');
INSERT INTO `tbl_kelurahan` VALUES (216, 13, 'SAMBONGANYAR');
INSERT INTO `tbl_kelurahan` VALUES (217, 13, 'SAMBONGREJO');
INSERT INTO `tbl_kelurahan` VALUES (218, 13, 'SARIMULYO');
INSERT INTO `tbl_kelurahan` VALUES (219, 13, 'SEMAWUR');
INSERT INTO `tbl_kelurahan` VALUES (220, 13, 'SENDANGAGUNG');
INSERT INTO `tbl_kelurahan` VALUES (221, 13, 'SENDANGMULYO');
INSERT INTO `tbl_kelurahan` VALUES (222, 13, 'SENDANGREJO');
INSERT INTO `tbl_kelurahan` VALUES (223, 13, 'SRIGADING');
INSERT INTO `tbl_kelurahan` VALUES (224, 13, 'SUMBEREJO');
INSERT INTO `tbl_kelurahan` VALUES (225, 13, 'TALOKWOHMOJO');
INSERT INTO `tbl_kelurahan` VALUES (226, 13, 'TREMBULREJO');
INSERT INTO `tbl_kelurahan` VALUES (227, 13, 'WANTILGUNG');
INSERT INTO `tbl_kelurahan` VALUES (228, 14, 'BEKUTUK');
INSERT INTO `tbl_kelurahan` VALUES (229, 14, 'BODEH');
INSERT INTO `tbl_kelurahan` VALUES (230, 14, 'GEMBYUNGAN');
INSERT INTO `tbl_kelurahan` VALUES (231, 14, 'JERUK');
INSERT INTO `tbl_kelurahan` VALUES (232, 14, 'KADENGAN');
INSERT INTO `tbl_kelurahan` VALUES (233, 14, 'KALISARI');
INSERT INTO `tbl_kelurahan` VALUES (234, 14, 'KEDIREN');
INSERT INTO `tbl_kelurahan` VALUES (235, 14, 'KUTUKAN');
INSERT INTO `tbl_kelurahan` VALUES (236, 14, 'NGLIRON');
INSERT INTO `tbl_kelurahan` VALUES (237, 14, 'PILANG');
INSERT INTO `tbl_kelurahan` VALUES (238, 14, 'PLOSOREJO');
INSERT INTO `tbl_kelurahan` VALUES (239, 14, 'RANDUBLATUNG');
INSERT INTO `tbl_kelurahan` VALUES (240, 14, 'SAMBONGWANGAN');
INSERT INTO `tbl_kelurahan` VALUES (241, 14, 'SUMBERJO');
INSERT INTO `tbl_kelurahan` VALUES (242, 14, 'TANGGEL');
INSERT INTO `tbl_kelurahan` VALUES (243, 14, 'TEMULUS');
INSERT INTO `tbl_kelurahan` VALUES (244, 14, 'TLOGOTUWUNG');
INSERT INTO `tbl_kelurahan` VALUES (245, 14, 'WULUNG');
INSERT INTO `tbl_kelurahan` VALUES (246, 15, 'BITING');
INSERT INTO `tbl_kelurahan` VALUES (247, 15, 'BRABOWAN');
INSERT INTO `tbl_kelurahan` VALUES (248, 15, 'GADU');
INSERT INTO `tbl_kelurahan` VALUES (249, 15, 'GAGAKAN');
INSERT INTO `tbl_kelurahan` VALUES (250, 15, 'GIYANTI');
INSERT INTO `tbl_kelurahan` VALUES (251, 15, 'LEDOK');
INSERT INTO `tbl_kelurahan` VALUES (252, 15, 'POJOKWATU');
INSERT INTO `tbl_kelurahan` VALUES (253, 15, 'SAMBONG');
INSERT INTO `tbl_kelurahan` VALUES (254, 15, 'SAMBONGREJO');
INSERT INTO `tbl_kelurahan` VALUES (255, 15, 'TEMENGENG');
INSERT INTO `tbl_kelurahan` VALUES (256, 16, 'BEDINGIN');
INSERT INTO `tbl_kelurahan` VALUES (257, 16, 'BICAK');
INSERT INTO `tbl_kelurahan` VALUES (258, 16, 'CANDI');
INSERT INTO `tbl_kelurahan` VALUES (259, 16, 'COKROWATI');
INSERT INTO `tbl_kelurahan` VALUES (260, 16, 'DALANGAN');
INSERT INTO `tbl_kelurahan` VALUES (261, 16, 'DRINGO');
INSERT INTO `tbl_kelurahan` VALUES (262, 16, 'GONDORIYO');
INSERT INTO `tbl_kelurahan` VALUES (263, 16, 'GUNUNGAN');
INSERT INTO `tbl_kelurahan` VALUES (264, 16, 'KACANGAN');
INSERT INTO `tbl_kelurahan` VALUES (265, 16, 'KAJENGAN');
INSERT INTO `tbl_kelurahan` VALUES (266, 16, 'KARANGANYAR');
INSERT INTO `tbl_kelurahan` VALUES (267, 16, 'KEDUNGBACIN');
INSERT INTO `tbl_kelurahan` VALUES (268, 16, 'KEDUNGWUNGU');
INSERT INTO `tbl_kelurahan` VALUES (269, 16, 'KEMBANG');
INSERT INTO `tbl_kelurahan` VALUES (270, 16, 'KETILENG');
INSERT INTO `tbl_kelurahan` VALUES (271, 16, 'LEDOK');
INSERT INTO `tbl_kelurahan` VALUES (272, 16, 'NGUMBUL');
INSERT INTO `tbl_kelurahan` VALUES (273, 16, 'PELEMSENGIR');
INSERT INTO `tbl_kelurahan` VALUES (274, 16, 'PRIGI');
INSERT INTO `tbl_kelurahan` VALUES (275, 16, 'SAMBENG');
INSERT INTO `tbl_kelurahan` VALUES (276, 16, 'SENDANG');
INSERT INTO `tbl_kelurahan` VALUES (277, 16, 'SONOKULON');
INSERT INTO `tbl_kelurahan` VALUES (278, 16, 'TINAPAN');
INSERT INTO `tbl_kelurahan` VALUES (279, 16, 'TODANAN');
INSERT INTO `tbl_kelurahan` VALUES (280, 16, 'WUKIRSARI');
INSERT INTO `tbl_kelurahan` VALUES (281, 17, 'ADIREJO');
INSERT INTO `tbl_kelurahan` VALUES (282, 17, 'GEMPOLREJO');
INSERT INTO `tbl_kelurahan` VALUES (283, 17, 'KALANGAN');
INSERT INTO `tbl_kelurahan` VALUES (284, 17, 'KEDUNGREJO');
INSERT INTO `tbl_kelurahan` VALUES (285, 17, 'KEDUNGRINGIN');
INSERT INTO `tbl_kelurahan` VALUES (286, 17, 'KESER');
INSERT INTO `tbl_kelurahan` VALUES (287, 17, 'NGLANGITAN');
INSERT INTO `tbl_kelurahan` VALUES (288, 17, 'SAMBONGREJO');
INSERT INTO `tbl_kelurahan` VALUES (289, 17, 'SITIREJO');
INSERT INTO `tbl_kelurahan` VALUES (290, 17, 'SUKOREJO');
INSERT INTO `tbl_kelurahan` VALUES (291, 17, 'TAMANREJO');
INSERT INTO `tbl_kelurahan` VALUES (292, 17, 'TAMBAHREJO');
INSERT INTO `tbl_kelurahan` VALUES (293, 17, 'TAWANGREJO');
INSERT INTO `tbl_kelurahan` VALUES (294, 17, 'TUNJUNGAN');
INSERT INTO `tbl_kelurahan` VALUES (295, 17, 'TUTUP');
INSERT INTO `tbl_kelurahan` VALUES (296, 11, 'bnb');
INSERT INTO `tbl_kelurahan` VALUES (298, 54, 'ALB');

-- ----------------------------
-- Table structure for tbl_kontak
-- ----------------------------
DROP TABLE IF EXISTS `tbl_kontak`;
CREATE TABLE `tbl_kontak`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jenis` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alamat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_pos` int NULL DEFAULT NULL,
  `kode` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `telp` varchar(14) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `catatan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `status` enum('aktif','tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_kontak
-- ----------------------------
INSERT INTO `tbl_kontak` VALUES (3, 'KPRI Sehat DKK', 'distributor', 'rt 01 / 06', 53171, 'SUP-201025001', '0895', 'kop@gmail.com', '-', 'aktif');
INSERT INTO `tbl_kontak` VALUES (4, 'Kopendik Banjarejo', 'Distributor', 'rt 01 / 09', 53171, 'SUP-201025002', '0895', 'kop@gmail.com', '-', 'aktif');
INSERT INTO `tbl_kontak` VALUES (5, 'KPRI Wargo Tunggal', 'Distributor', 'Blora', 123, 'SUP-201123003', '08123456789', 'kop@gmail.com', '-', 'aktif');
INSERT INTO `tbl_kontak` VALUES (6, 'KPRI Ihklas Kemenag', 'Distributor', 'Blora', 123, 'SUP-201123004', '08123456789', 'kop@gmail.com', '-', 'aktif');
INSERT INTO `tbl_kontak` VALUES (7, 'KUD Tani Jaya Banjarejo', 'Distributor', 'Blora', 123, 'SUP-201123005', '08123456789', 'kop@gmail.com', '-', 'aktif');
INSERT INTO `tbl_kontak` VALUES (8, 'KOPKAR Bhakti Usaha', 'Distributor', 'Blora', 123, 'SUP-201123006', '08123456789', 'kop@gmail.com', '-', 'aktif');
INSERT INTO `tbl_kontak` VALUES (9, 'KPRI Guyub Rukun', 'Distributor', 'Blora', 123, 'SUP-201123007', '08123456789', 'kop@gmail.com', '-', 'aktif');
INSERT INTO `tbl_kontak` VALUES (10, 'KPRI Eko Santosa', 'Distributor', 'Blora', 123, 'SUP-201123008', '08123456789', 'kop@gmail.com', '-', 'aktif');
INSERT INTO `tbl_kontak` VALUES (11, 'KPRI Eko Santosa', 'Distributor', 'Blora', 123, 'SUP-201123009', '08123456789', 'kop@gmail.com', '-', 'aktif');
INSERT INTO `tbl_kontak` VALUES (12, 'KPRI Karya Sejahtera', 'Distributor', 'Blora', 123, 'SUP-2011230010', '08123456789', 'kop@gmail.com', '-', 'aktif');
INSERT INTO `tbl_kontak` VALUES (13, 'KUD Makmur Jati', 'Distributor', 'Blora', 123, 'SUP-201123011', '08123456789', 'kop@gmail.com', '-', 'aktif');
INSERT INTO `tbl_kontak` VALUES (14, 'KPRI Dwi Eksa', 'Distributor', 'Blora', 123, 'SUP-201123012', '08123456789', 'kop@gmail.com', '-', 'aktif');
INSERT INTO `tbl_kontak` VALUES (15, 'KPRI Dwija Mustika', 'Distributor', 'Blora', 234, 'SUP-201123013', '08123456789', 'kop@gmail.com', '-', 'aktif');
INSERT INTO `tbl_kontak` VALUES (16, 'KPRI Serba Usaha Migas', 'Distributor', 'Blora', 123, 'SUP-201123014', '08123456789', 'kop@gmail.com', '-', 'aktif');
INSERT INTO `tbl_kontak` VALUES (17, 'KPRI Dwijo Santosa', 'Distributor', 'Blora', 123, 'SUP-201123015', '08123456789', 'kop@gmail.com', '-', 'aktif');
INSERT INTO `tbl_kontak` VALUES (18, 'Koperasi Dwi Makmur', 'Distributor', 'Blora', 123, 'SUP-201123016', '08123456789', 'kop@gmail.com', '-', 'aktif');
INSERT INTO `tbl_kontak` VALUES (20, 'SALWA JEPON', 'Supplier', 'Jln. Blora - cepu km 3', 58253, 'SUP-201214017', '085327540289', '', '-', 'aktif');

-- ----------------------------
-- Table structure for tbl_koperasi
-- ----------------------------
DROP TABLE IF EXISTS `tbl_koperasi`;
CREATE TABLE `tbl_koperasi`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alamat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `telp` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 17 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_koperasi
-- ----------------------------
INSERT INTO `tbl_koperasi` VALUES (1, 'Koperasi Seven', NULL, NULL, NULL);
INSERT INTO `tbl_koperasi` VALUES (2, 'KPRI Sehat DKK', NULL, NULL, NULL);
INSERT INTO `tbl_koperasi` VALUES (3, 'Kopendik Banjarejo', NULL, NULL, NULL);
INSERT INTO `tbl_koperasi` VALUES (4, 'KPRI Wargo Tunggal', NULL, NULL, NULL);
INSERT INTO `tbl_koperasi` VALUES (5, 'KPRI Ihklas Kemenag', NULL, NULL, NULL);
INSERT INTO `tbl_koperasi` VALUES (6, 'KUD Tani Jaya Banjarejo', NULL, NULL, NULL);
INSERT INTO `tbl_koperasi` VALUES (7, 'KOPKAR Bhakti Usaha', NULL, NULL, NULL);
INSERT INTO `tbl_koperasi` VALUES (8, 'KPRI Guyub Rukun', NULL, NULL, NULL);
INSERT INTO `tbl_koperasi` VALUES (9, 'KPRI Eko Santosa', NULL, NULL, NULL);
INSERT INTO `tbl_koperasi` VALUES (10, 'KPRI Karya Sejahtera', NULL, NULL, NULL);
INSERT INTO `tbl_koperasi` VALUES (11, 'KUD Makmur Jati', NULL, NULL, NULL);
INSERT INTO `tbl_koperasi` VALUES (12, 'KPRI Dwi Eksa', NULL, NULL, NULL);
INSERT INTO `tbl_koperasi` VALUES (13, 'KPRI Dwija Mustika', NULL, NULL, NULL);
INSERT INTO `tbl_koperasi` VALUES (14, 'KPRI Serba Usaha Migas', NULL, NULL, NULL);
INSERT INTO `tbl_koperasi` VALUES (15, 'KPRI Dwijo Santosa', NULL, NULL, NULL);
INSERT INTO `tbl_koperasi` VALUES (16, 'Koperasi Dwi Makmur', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tbl_notif
-- ----------------------------
DROP TABLE IF EXISTS `tbl_notif`;
CREATE TABLE `tbl_notif`  (
  `id_notif` int NOT NULL AUTO_INCREMENT,
  `id_user` int NULL DEFAULT NULL,
  `judul` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `status` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  PRIMARY KEY (`id_notif`) USING BTREE,
  INDEX `id_user`(`id_user`) USING BTREE,
  CONSTRAINT `tbl_notif_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 441 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tbl_notif
-- ----------------------------
INSERT INTO `tbl_notif` VALUES (10, NULL, 'Pembayaran', 'Simpanan Wajib Rp. ', 'Y', NULL);
INSERT INTO `tbl_notif` VALUES (21, 1, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-10-26');
INSERT INTO `tbl_notif` VALUES (26, 127, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-05');
INSERT INTO `tbl_notif` VALUES (27, 128, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-05');
INSERT INTO `tbl_notif` VALUES (28, 129, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-05');
INSERT INTO `tbl_notif` VALUES (29, 130, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-05');
INSERT INTO `tbl_notif` VALUES (30, 131, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-05');
INSERT INTO `tbl_notif` VALUES (31, 132, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-05');
INSERT INTO `tbl_notif` VALUES (32, 133, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-05');
INSERT INTO `tbl_notif` VALUES (33, 134, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-05');
INSERT INTO `tbl_notif` VALUES (34, 135, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-05');
INSERT INTO `tbl_notif` VALUES (35, 136, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-05');
INSERT INTO `tbl_notif` VALUES (36, 137, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-05');
INSERT INTO `tbl_notif` VALUES (37, 138, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-05');
INSERT INTO `tbl_notif` VALUES (38, 139, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-05');
INSERT INTO `tbl_notif` VALUES (39, 140, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-05');
INSERT INTO `tbl_notif` VALUES (40, 141, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-05');
INSERT INTO `tbl_notif` VALUES (41, 142, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-05');
INSERT INTO `tbl_notif` VALUES (42, 143, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-05');
INSERT INTO `tbl_notif` VALUES (43, 144, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-05');
INSERT INTO `tbl_notif` VALUES (44, 145, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-05');
INSERT INTO `tbl_notif` VALUES (45, 146, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-05');
INSERT INTO `tbl_notif` VALUES (46, 147, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-05');
INSERT INTO `tbl_notif` VALUES (47, 148, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-05');
INSERT INTO `tbl_notif` VALUES (48, 149, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-05');
INSERT INTO `tbl_notif` VALUES (49, 150, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-05');
INSERT INTO `tbl_notif` VALUES (50, 151, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-05');
INSERT INTO `tbl_notif` VALUES (51, 152, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-09');
INSERT INTO `tbl_notif` VALUES (52, 153, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-09');
INSERT INTO `tbl_notif` VALUES (53, 154, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-09');
INSERT INTO `tbl_notif` VALUES (54, 155, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-17');
INSERT INTO `tbl_notif` VALUES (55, 156, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-17');
INSERT INTO `tbl_notif` VALUES (56, 157, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-17');
INSERT INTO `tbl_notif` VALUES (57, 158, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-17');
INSERT INTO `tbl_notif` VALUES (58, 159, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-17');
INSERT INTO `tbl_notif` VALUES (59, 160, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-17');
INSERT INTO `tbl_notif` VALUES (60, 161, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-17');
INSERT INTO `tbl_notif` VALUES (61, 162, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-17');
INSERT INTO `tbl_notif` VALUES (62, 163, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-17');
INSERT INTO `tbl_notif` VALUES (63, 164, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-17');
INSERT INTO `tbl_notif` VALUES (64, 165, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-17');
INSERT INTO `tbl_notif` VALUES (65, 166, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-17');
INSERT INTO `tbl_notif` VALUES (66, 167, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-17');
INSERT INTO `tbl_notif` VALUES (67, 168, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-17');
INSERT INTO `tbl_notif` VALUES (68, 169, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-17');
INSERT INTO `tbl_notif` VALUES (69, 169, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-17');
INSERT INTO `tbl_notif` VALUES (70, 171, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-17');
INSERT INTO `tbl_notif` VALUES (71, 172, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-17');
INSERT INTO `tbl_notif` VALUES (72, 173, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-17');
INSERT INTO `tbl_notif` VALUES (73, 174, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-17');
INSERT INTO `tbl_notif` VALUES (74, 174, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-17');
INSERT INTO `tbl_notif` VALUES (75, 176, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-17');
INSERT INTO `tbl_notif` VALUES (76, 177, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-17');
INSERT INTO `tbl_notif` VALUES (77, 178, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-17');
INSERT INTO `tbl_notif` VALUES (78, 179, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-11-17');
INSERT INTO `tbl_notif` VALUES (79, 179, 'Pembayaran', 'Simpanan Wajib Rp. 15000', 'Y', '2020-11-17');
INSERT INTO `tbl_notif` VALUES (80, 179, 'Pembayaran', 'Simpanan Wajib Rp. 15000', 'Y', '2020-11-17');
INSERT INTO `tbl_notif` VALUES (81, 179, 'Pembayaran', 'Simpanan Wajib Rp. 15000', 'Y', '2020-11-17');
INSERT INTO `tbl_notif` VALUES (82, 179, 'Pembayaran', 'Simpanan Wajib Rp. 15000', 'Y', '2020-11-17');
INSERT INTO `tbl_notif` VALUES (83, 154, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-11-18');
INSERT INTO `tbl_notif` VALUES (84, 157, 'Pembayaran', 'Simpanan Wajib Rp. 15000', 'Y', '2020-11-20');
INSERT INTO `tbl_notif` VALUES (85, 157, 'Pembayaran', 'Simpanan Sukarela Rp. 15000', 'Y', '2020-11-20');
INSERT INTO `tbl_notif` VALUES (86, 176, 'Pembayaran', 'Simpanan Wajib Rp. 15000', 'Y', '2020-11-20');
INSERT INTO `tbl_notif` VALUES (87, 176, 'Pembayaran', 'Simpanan Sukarela Rp. 10000', 'Y', '2020-11-20');
INSERT INTO `tbl_notif` VALUES (88, 177, 'Pembayaran', 'Simpanan Sukarela Rp. 40000', 'Y', '2020-11-20');
INSERT INTO `tbl_notif` VALUES (89, 177, 'Pembayaran', 'Simpanan Wajib Rp. 15000', 'Y', '2020-11-20');
INSERT INTO `tbl_notif` VALUES (90, 177, 'Pembayaran', 'Simpanan Wajib Rp. 15000', 'Y', '2020-11-20');
INSERT INTO `tbl_notif` VALUES (91, 177, 'Pembayaran', 'Simpanan Wajib Rp. 15000', 'Y', '2020-11-20');
INSERT INTO `tbl_notif` VALUES (92, 177, 'Pembayaran', 'Simpanan Sukarela Rp. 40000', 'Y', '2020-11-11');
INSERT INTO `tbl_notif` VALUES (93, 177, 'Pembayaran', 'Simpanan Wajib Rp. 15000', 'Y', '2020-11-11');
INSERT INTO `tbl_notif` VALUES (94, 177, 'Pembayaran', 'Simpanan Wajib Rp. 15000', 'Y', '2020-12-11');
INSERT INTO `tbl_notif` VALUES (95, 177, 'Pembayaran', 'Simpanan Sukarela Rp. 15000', 'Y', '2021-01-11');
INSERT INTO `tbl_notif` VALUES (96, 177, 'Pembayaran', 'Simpanan Wajib Rp. 15000', 'Y', '2021-01-11');
INSERT INTO `tbl_notif` VALUES (97, 177, 'Pembayaran', 'Simpanan Wajib Rp. 15000', 'Y', '2021-02-11');
INSERT INTO `tbl_notif` VALUES (98, 133, 'Pembayaran', 'Simpanan Wajib Rp. 15000', 'Y', '2020-11-20');
INSERT INTO `tbl_notif` VALUES (99, 131, 'Pembayaran', 'Simpanan Sukarela Rp. 10000', 'Y', '2020-11-20');
INSERT INTO `tbl_notif` VALUES (100, 1, 'Pembayaran', 'Simpanan Sukarela Rp. 10000', 'Y', '2020-11-20');
INSERT INTO `tbl_notif` VALUES (101, 126, 'Pembayaran', 'Simpanan Sukarela Rp. 20000', 'Y', '2020-11-20');
INSERT INTO `tbl_notif` VALUES (102, 154, 'Pembayaran', 'Simpanan Sukarela Rp. 50000', 'Y', '2020-11-20');
INSERT INTO `tbl_notif` VALUES (103, 154, 'Pembayaran', 'Simpanan Wajib Rp. 15000', 'Y', '2020-12-02');
INSERT INTO `tbl_notif` VALUES (104, 180, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-12-04');
INSERT INTO `tbl_notif` VALUES (105, 180, 'Pembayaran', 'Simpanan Wajib Rp. 5000', 'Y', '2020-12-04');
INSERT INTO `tbl_notif` VALUES (106, 180, 'Pembayaran', 'Simpanan Sukarela Rp. 500000', 'Y', '2020-12-04');
INSERT INTO `tbl_notif` VALUES (107, 181, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-12-04');
INSERT INTO `tbl_notif` VALUES (108, 181, 'Pembayaran', 'Simpanan Sukarela Rp. 500000', 'Y', '2020-12-04');
INSERT INTO `tbl_notif` VALUES (109, 181, 'Pembayaran', 'Simpanan Wajib Rp. 5000', 'Y', '2020-12-04');
INSERT INTO `tbl_notif` VALUES (110, 1, 'Pembayaran', 'Simpanan Sukarela Rp. 5000', 'Y', '2020-12-13');
INSERT INTO `tbl_notif` VALUES (111, 1, 'Pembayaran', 'Simpanan Sukarela Rp. 5000', 'Y', '2020-12-13');
INSERT INTO `tbl_notif` VALUES (112, 182, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-12-13');
INSERT INTO `tbl_notif` VALUES (113, 126, 'Pembayaran', 'Simpanan Sukarela Rp. 5000', 'Y', '2020-12-13');
INSERT INTO `tbl_notif` VALUES (114, 128, 'Pembayaran', 'Simpanan Sukarela Rp. 5000', 'Y', '2020-12-13');
INSERT INTO `tbl_notif` VALUES (115, 128, 'Pembayaran', 'Simpanan Sukarela Rp. 5000', 'Y', '2020-12-13');
INSERT INTO `tbl_notif` VALUES (116, 182, 'Pembayaran', 'Simpanan Sukarela Rp. 50000', 'Y', '2020-12-13');
INSERT INTO `tbl_notif` VALUES (117, 182, 'Pembayaran', 'Simpanan Sukarela Rp. 50000', 'Y', '2020-12-13');
INSERT INTO `tbl_notif` VALUES (118, 139, 'Pembayaran', 'Simpanan Wajib Rp. 100000', 'Y', '2020-12-13');
INSERT INTO `tbl_notif` VALUES (119, 182, 'Pengambilan', 'Simpanan Sukarela Rp. 5000', 'Y', '2020-10-09');
INSERT INTO `tbl_notif` VALUES (120, 182, 'Pengambilan', 'Simpanan Sukarela Rp. 5000', 'Y', '2020-10-09');
INSERT INTO `tbl_notif` VALUES (121, 182, 'Pengambilan', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-10-09');
INSERT INTO `tbl_notif` VALUES (122, 183, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-12-13');
INSERT INTO `tbl_notif` VALUES (123, 183, 'Pembayaran', 'Simpanan Sukarela Rp. 500000', 'Y', '2020-12-13');
INSERT INTO `tbl_notif` VALUES (124, 183, 'Pembayaran', 'Simpanan Wajib Rp. 5000', 'Y', '2020-12-13');
INSERT INTO `tbl_notif` VALUES (125, 184, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-12-14');
INSERT INTO `tbl_notif` VALUES (126, 185, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-12-14');
INSERT INTO `tbl_notif` VALUES (127, 184, 'Pembayaran', 'Simpanan Sukarela Rp. 500000', 'Y', '2020-12-14');
INSERT INTO `tbl_notif` VALUES (128, 185, 'Pembayaran', 'Simpanan Sukarela Rp. 500000', 'Y', '2020-12-14');
INSERT INTO `tbl_notif` VALUES (129, 186, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-12-14');
INSERT INTO `tbl_notif` VALUES (130, 186, 'Pembayaran', 'Simpanan Sukarela Rp. 50000', 'Y', '2020-12-14');
INSERT INTO `tbl_notif` VALUES (131, 186, 'Pembayaran', 'Simpanan Wajib Rp. 15000', 'Y', '2020-12-14');
INSERT INTO `tbl_notif` VALUES (132, 186, 'Pengambilan', 'Simpanan Sukarela Rp. 10000', 'Y', '2020-10-09');
INSERT INTO `tbl_notif` VALUES (133, 186, 'Pembayaran', 'Simpanan Sukarela Rp. 10000', 'Y', '2020-12-14');
INSERT INTO `tbl_notif` VALUES (134, 186, 'Pengambilan', 'Simpanan Sukarela Rp. 10000', 'Y', '2020-10-09');
INSERT INTO `tbl_notif` VALUES (135, 186, 'Pengambilan', 'Simpanan Sukarela Rp. 10000', 'Y', '2020-10-09');
INSERT INTO `tbl_notif` VALUES (136, 187, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-12-14');
INSERT INTO `tbl_notif` VALUES (137, 187, 'Pembayaran', 'Simpanan Wajib Rp. 15000', 'Y', '2020-12-14');
INSERT INTO `tbl_notif` VALUES (138, 187, 'Pembayaran', 'Simpanan Sukarela Rp. 50000', 'Y', '2020-12-14');
INSERT INTO `tbl_notif` VALUES (139, 187, 'Pembayaran', 'Simpanan Sukarela Rp. 15000', 'Y', '2020-12-14');
INSERT INTO `tbl_notif` VALUES (140, 186, 'Pembayaran', 'Simpanan Sukarela Rp. 15000', 'Y', '2020-12-14');
INSERT INTO `tbl_notif` VALUES (141, 187, 'Pembayaran', 'Simpanan Wajib Rp. 15000', 'Y', '2020-12-14');
INSERT INTO `tbl_notif` VALUES (142, 183, 'Pembayaran', 'Simpanan Sukarela Rp. 2500', 'Y', '2020-12-15');
INSERT INTO `tbl_notif` VALUES (143, 188, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-12-15');
INSERT INTO `tbl_notif` VALUES (144, 188, 'Pembayaran', 'Simpanan Sukarela Rp. 5000', 'Y', '2020-12-15');
INSERT INTO `tbl_notif` VALUES (145, 188, 'Pengambilan', 'Simpanan Sukarela Rp. 3000', 'Y', '2020-10-09');
INSERT INTO `tbl_notif` VALUES (146, 180, 'Pembayaran', 'Simpanan Sukarela Rp. 7500', 'Y', '2020-12-16');
INSERT INTO `tbl_notif` VALUES (147, 180, 'Pembayaran', 'Simpanan Sukarela Rp. 20000', 'Y', '2020-12-17');
INSERT INTO `tbl_notif` VALUES (148, 180, 'Pembayaran', 'Simpanan Wajib Rp. 5000', 'Y', '2020-12-17');
INSERT INTO `tbl_notif` VALUES (149, 180, 'Pembayaran', 'Simpanan Sukarela Rp. 500000', 'Y', '2020-12-17');
INSERT INTO `tbl_notif` VALUES (150, 183, 'Pembayaran', 'Simpanan Sukarela Rp. 500000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (151, 181, 'Pembayaran', 'Simpanan Sukarela Rp. 500000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (152, 181, 'Pembayaran', 'Simpanan Sukarela Rp. 8000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (153, 181, 'Pembayaran', 'Simpanan Sukarela Rp. 8000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (154, 154, 'Pembayaran', 'Simpanan Sukarela Rp. 500000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (155, 189, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (156, 190, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (157, 191, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (158, 192, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (159, 193, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (160, 194, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (161, 195, 'Pembayaran', 'Simpanan Pokok Rp. 50.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (162, 189, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (163, 190, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (164, 191, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (165, 192, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (166, 193, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (167, 194, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (168, 195, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (169, 154, 'Pembayaran', 'Simpanan Sukarela Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (170, 196, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (171, 197, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (172, 197, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (173, 198, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (174, 199, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (175, 200, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (176, 201, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (177, 202, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (178, 198, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (179, 204, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (180, 205, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (181, 206, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (182, 199, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (183, 207, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (184, 200, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (185, 201, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (186, 208, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (187, 202, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (188, 204, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (189, 209, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (190, 205, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (191, 206, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (192, 207, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (193, 210, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (194, 208, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (195, 209, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (196, 211, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (197, 209, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (198, 211, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (199, 212, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (200, 212, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (201, 213, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (202, 213, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (203, 214, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (204, 214, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (205, 215, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (206, 216, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (207, 209, 'Pengambilan', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-10-09');
INSERT INTO `tbl_notif` VALUES (208, 217, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (209, 218, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (210, 210, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (211, 215, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (212, 219, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (213, 216, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (214, 217, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (215, 218, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (216, 220, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (217, 219, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (218, 220, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (219, 221, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (220, 221, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (221, 222, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (222, 222, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (223, 223, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (224, 224, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (225, 223, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (226, 224, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (227, 225, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (228, 226, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (229, 225, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (230, 226, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (231, 227, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (232, 228, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (233, 229, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (234, 227, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (235, 228, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (236, 230, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (237, 229, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (238, 230, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (239, 231, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (240, 231, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (241, 232, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (242, 232, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (243, 233, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (244, 233, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (245, 234, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (246, 234, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (247, 235, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (248, 235, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (249, 236, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (250, 236, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (251, 237, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (252, 237, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (253, 238, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (254, 238, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (255, 239, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (256, 239, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (257, 209, 'Pengambilan', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-10-09');
INSERT INTO `tbl_notif` VALUES (258, 209, 'Pengambilan', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-10-09');
INSERT INTO `tbl_notif` VALUES (259, 189, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (260, 190, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (261, 191, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (262, 192, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (263, 193, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (264, 194, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (265, 195, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (266, 196, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (267, 197, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (268, 198, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (269, 199, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (270, 200, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (271, 201, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (272, 202, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (273, 204, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (274, 205, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (275, 206, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (276, 207, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (277, 208, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (278, 209, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (279, 210, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (280, 211, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (281, 212, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (282, 213, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (283, 214, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (284, 215, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (285, 216, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (286, 217, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (287, 218, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (288, 219, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (289, 220, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (290, 221, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (291, 222, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (292, 223, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (293, 224, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (294, 225, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (295, 226, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (296, 227, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (297, 228, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (298, 229, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (299, 230, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (300, 231, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (301, 232, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (302, 233, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (303, 234, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (304, 235, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (305, 236, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (306, 237, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (307, 238, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (308, 239, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-18');
INSERT INTO `tbl_notif` VALUES (309, 240, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (310, 241, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (311, 242, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (312, 243, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (313, 244, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (314, 245, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (315, 246, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (316, 247, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (317, 248, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (318, 249, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (319, 250, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (320, 251, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (321, 252, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (322, 253, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (323, 254, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (324, 255, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (325, 255, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (326, 257, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (327, 258, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (328, 259, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (329, 260, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (330, 261, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (331, 262, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (332, 263, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (333, 264, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (334, 265, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (335, 266, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (336, 267, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (337, 268, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (338, 269, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (339, 270, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (340, 271, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (341, 272, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (342, 273, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (343, 274, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (344, 275, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (345, 276, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (346, 277, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (347, 278, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (348, 240, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (349, 240, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (350, 240, 'Pengambilan', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-10-09');
INSERT INTO `tbl_notif` VALUES (351, 241, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (352, 242, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (353, 243, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (354, 244, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (355, 245, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (356, 246, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (357, 247, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (358, 248, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (359, 249, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (360, 250, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (361, 251, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (362, 252, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (363, 253, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (364, 254, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (365, 255, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (366, 256, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (367, 257, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (368, 258, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (369, 259, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (370, 260, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (371, 261, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (372, 262, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (373, 263, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (374, 264, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (375, 265, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (376, 266, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (377, 267, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (378, 268, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (379, 269, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (380, 270, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (381, 271, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (382, 272, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (383, 273, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (384, 274, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (385, 275, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (386, 276, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (387, 277, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (388, 278, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (389, 279, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (390, 279, 'Pembayaran', 'Simpanan Sukarela Rp. 100000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (391, 240, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (392, 241, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (393, 242, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (394, 243, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (395, 244, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (396, 245, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (397, 246, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (398, 247, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (399, 248, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (400, 249, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (401, 250, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (402, 251, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (403, 252, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (404, 279, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (405, 253, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (406, 254, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (407, 255, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (408, 255, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (409, 256, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (410, 257, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (411, 258, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (412, 259, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (413, 260, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (414, 261, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (415, 262, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (416, 263, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (417, 181, 'Pembayaran', 'Simpanan Sukarela Rp. 5000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (418, 264, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (419, 265, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (420, 266, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (421, 267, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (422, 268, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (423, 269, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (424, 270, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (425, 271, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (426, 272, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (427, 273, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (428, 274, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (429, 275, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (430, 276, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (431, 277, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (432, 278, 'Pembayaran', 'Simpanan Wajib Rp. 10000', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (433, 280, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (434, 281, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (435, 282, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (436, 283, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (437, 284, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (438, 284, 'Pembayaran', 'Simpanan Pokok Rp. 20.000,00', 'Y', '2020-12-19');
INSERT INTO `tbl_notif` VALUES (439, 270, 'Pembayaran', 'Simpanan Sukarela Rp. 400000', 'Y', '2020-12-22');
INSERT INTO `tbl_notif` VALUES (440, 154, 'Pembayaran', 'Simpanan Wajib Rp. 100000', 'Y', '2020-12-22');

-- ----------------------------
-- Table structure for tbl_notif_broadcast
-- ----------------------------
DROP TABLE IF EXISTS `tbl_notif_broadcast`;
CREATE TABLE `tbl_notif_broadcast`  (
  `id_notif` int NOT NULL AUTO_INCREMENT,
  `id_user` int NULL DEFAULT NULL,
  `foto` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `judul` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tanggal` date NULL DEFAULT NULL,
  `status` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id_notif`) USING BTREE,
  INDEX `id_user`(`id_user`) USING BTREE,
  CONSTRAINT `tbl_notif_broadcast_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 145 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tbl_notif_broadcast
-- ----------------------------
INSERT INTO `tbl_notif_broadcast` VALUES (91, 179, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (92, 178, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (93, 177, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (94, 176, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (95, 175, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (96, 174, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (97, 173, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (98, 172, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (99, 171, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (100, 170, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (101, 169, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (102, 168, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (103, 167, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (104, 166, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (105, 165, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (106, 164, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (107, 163, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (108, 162, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (109, 161, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (110, 160, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (111, 159, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (112, 158, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (113, 157, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (114, 156, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (115, 155, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (117, 153, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (118, 152, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (119, 151, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (120, 150, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (121, 149, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (122, 148, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (123, 147, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (124, 146, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (125, 145, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (126, 144, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (127, 143, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (128, 142, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (129, 141, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (130, 140, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (131, 139, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (132, 138, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (133, 137, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (134, 136, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (135, 135, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (136, 134, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (137, 133, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (138, 132, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (139, 131, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (140, 130, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (141, 129, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (142, 128, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (143, 127, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');
INSERT INTO `tbl_notif_broadcast` VALUES (144, 126, 'notif-1606006453.png', 'Yuk berkoperasi', 'Dengan berkoperasi pasti kita bisa', '2020-11-22', 'Y');

-- ----------------------------
-- Table structure for tbl_ongkir
-- ----------------------------
DROP TABLE IF EXISTS `tbl_ongkir`;
CREATE TABLE `tbl_ongkir`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ongkir` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_ongkir
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_outlet
-- ----------------------------
DROP TABLE IF EXISTS `tbl_outlet`;
CREATE TABLE `tbl_outlet`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alamat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_outlet
-- ----------------------------
INSERT INTO `tbl_outlet` VALUES (1, 'OUTLET-001', 'Outlet Pertama', 'Blora');

-- ----------------------------
-- Table structure for tbl_pajak
-- ----------------------------
DROP TABLE IF EXISTS `tbl_pajak`;
CREATE TABLE `tbl_pajak`  (
  `id` int NOT NULL,
  `kode` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_pajak
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_pembayaran
-- ----------------------------
DROP TABLE IF EXISTS `tbl_pembayaran`;
CREATE TABLE `tbl_pembayaran`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `foto` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tipe` enum('Transfer','Langsung','Wajib','Sukarela','Pokok') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rekening` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tbl_pembayaran
-- ----------------------------
INSERT INTO `tbl_pembayaran` VALUES (1, 'Potong Simpanan Sukarela', 'icon_simpanan_kud.png', 'Dengan menggunakan simpanan sukarela otomatis simpanan sukarela anda akan berkurang untuk pembayaran simpanan wajib ', 'Langsung', NULL);
INSERT INTO `tbl_pembayaran` VALUES (2, 'Online Simpanan Sukarela', 'splash_kopranesia_02hay.png', 'Dengan menggunakan simpanan sukarela otomatis simpanan sukarela anda akan berkurang untuk pembayaran simpanan wajib ', 'Transfer', NULL);
INSERT INTO `tbl_pembayaran` VALUES (3, 'Tunai', NULL, 'Dengan menggunakan uang cash', 'Langsung', NULL);
INSERT INTO `tbl_pembayaran` VALUES (4, 'BCA - 7INDORA', 'bca.jpg', NULL, 'Sukarela', '123454312');
INSERT INTO `tbl_pembayaran` VALUES (5, 'BRI - 7INDORA', 'bri.jpg', NULL, 'Sukarela', '123454312');
INSERT INTO `tbl_pembayaran` VALUES (6, 'BPD JATENG - 7INDOORA', 'bank-jateng.png', NULL, 'Sukarela', '123454312');
INSERT INTO `tbl_pembayaran` VALUES (7, 'BNI - 7INDORA', 'bni.png', NULL, 'Sukarela', '123454312');
INSERT INTO `tbl_pembayaran` VALUES (8, 'BCA - 7INDORA', 'bca.jpg', NULL, 'Wajib', '123454312');
INSERT INTO `tbl_pembayaran` VALUES (9, 'BRI - 7INDORA', 'bri.jpg', NULL, 'Wajib', '123454312');
INSERT INTO `tbl_pembayaran` VALUES (10, 'BPD JATENG - 7INDOORA', 'bank-jateng.png', NULL, 'Wajib', '123454312');
INSERT INTO `tbl_pembayaran` VALUES (11, 'BNI - 7INDORA', 'bni.png', NULL, 'Wajib', '123454312');

-- ----------------------------
-- Table structure for tbl_pembelian
-- ----------------------------
DROP TABLE IF EXISTS `tbl_pembelian`;
CREATE TABLE `tbl_pembelian`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode_pembelian` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_admin` int NULL DEFAULT NULL,
  `harga_total` float(11, 2) NULL DEFAULT NULL,
  `status_trx` enum('selesai','batal','dikirim','diproses','aktif','tmp') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ongkir` int NULL DEFAULT NULL,
  `bayar_kredit` int NULL DEFAULT NULL,
  `bayar_lunas` int NULL DEFAULT NULL,
  `tgl_transaksi` datetime NULL DEFAULT NULL,
  `tgl_terima` datetime NULL DEFAULT NULL,
  `penerima` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_supplier` int NULL DEFAULT NULL,
  `id_produk` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tbl_pembelian
-- ----------------------------
INSERT INTO `tbl_pembelian` VALUES (3, NULL, 1, 0.00, 'diproses', NULL, NULL, NULL, '2020-11-19 12:33:11', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_pembelian` VALUES (4, 'KOP-20112211', 1, 350000.00, 'diproses', NULL, NULL, NULL, '2020-11-22 08:38:38', NULL, NULL, 3, NULL);
INSERT INTO `tbl_pembelian` VALUES (5, 'KOP-20121512', 1, 40000.00, 'diproses', NULL, NULL, NULL, '2020-12-15 09:22:24', NULL, NULL, 18, NULL);

-- ----------------------------
-- Table structure for tbl_pembelian_detail
-- ----------------------------
DROP TABLE IF EXISTS `tbl_pembelian_detail`;
CREATE TABLE `tbl_pembelian_detail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pembelian` int NULL DEFAULT NULL,
  `tgl_beli` date NULL DEFAULT NULL,
  `tgl_pelunasan` date NULL DEFAULT NULL,
  `status` enum('Belum Dibayar','Sudah Dibayar') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pajak` enum('Ya','Tidak') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_produk` int NULL DEFAULT NULL,
  `harga` int NULL DEFAULT NULL,
  `qty` float NULL DEFAULT NULL,
  `diskon` int NULL DEFAULT NULL,
  `total` int NULL DEFAULT NULL,
  `id_pajak` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tbl_pembelian_detail_ibfk_1`(`id_pembelian`) USING BTREE,
  CONSTRAINT `tbl_pembelian_detail_ibfk_1` FOREIGN KEY (`id_pembelian`) REFERENCES `tbl_pembelian` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tbl_pembelian_detail
-- ----------------------------
INSERT INTO `tbl_pembelian_detail` VALUES (2, 4, '2020-11-22', NULL, 'Belum Dibayar', NULL, 9, 10000, 34, NULL, 340000, NULL);
INSERT INTO `tbl_pembelian_detail` VALUES (3, 4, '2020-11-22', NULL, 'Belum Dibayar', NULL, 14, 10000, 1, NULL, 10000, NULL);
INSERT INTO `tbl_pembelian_detail` VALUES (4, 5, '2020-12-15', NULL, 'Belum Dibayar', NULL, 18, 2000, 20, NULL, 40000, NULL);

-- ----------------------------
-- Table structure for tbl_pembelian_diterima
-- ----------------------------
DROP TABLE IF EXISTS `tbl_pembelian_diterima`;
CREATE TABLE `tbl_pembelian_diterima`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_admin` int NULL DEFAULT NULL,
  `id_pembelian` int NULL DEFAULT NULL,
  `id_produk` int NULL DEFAULT NULL,
  `harga_beli` int NOT NULL,
  `qty` float NULL DEFAULT NULL,
  `tgl` datetime NULL DEFAULT NULL,
  `catatan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_admin`(`id_admin`) USING BTREE,
  INDEX `id_pembelian`(`id_pembelian`) USING BTREE,
  INDEX `id_produk`(`id_produk`) USING BTREE,
  CONSTRAINT `tbl_pembelian_diterima_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `tbl_admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_pembelian_diterima_ibfk_2` FOREIGN KEY (`id_pembelian`) REFERENCES `tbl_pembelian` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_pembelian_diterima_ibfk_3` FOREIGN KEY (`id_produk`) REFERENCES `tbl_produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tbl_pembelian_diterima
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_pengambilan_sukarela
-- ----------------------------
DROP TABLE IF EXISTS `tbl_pengambilan_sukarela`;
CREATE TABLE `tbl_pengambilan_sukarela`  (
  `id_pengambilan` int NOT NULL AUTO_INCREMENT,
  `id_admin` int NULL DEFAULT NULL,
  `id_user` int NULL DEFAULT NULL,
  `nominal` int NULL DEFAULT NULL,
  `tanggal` datetime NULL DEFAULT NULL,
  `kode_unik` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_pengambilan`) USING BTREE,
  INDEX `id_admin`(`id_admin`) USING BTREE,
  INDEX `id_user`(`id_user`) USING BTREE,
  CONSTRAINT `tbl_pengambilan_sukarela_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `tbl_admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_pengambilan_sukarela_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tbl_pengambilan_sukarela
-- ----------------------------
INSERT INTO `tbl_pengambilan_sukarela` VALUES (3, NULL, 182, 5000, '2020-10-09 07:34:31', 'GOK0TKAM3', 'Y');
INSERT INTO `tbl_pengambilan_sukarela` VALUES (4, NULL, 182, 5000, '2020-10-09 07:34:48', 'MHR7OUM76', 'Y');
INSERT INTO `tbl_pengambilan_sukarela` VALUES (5, NULL, 182, 100000, '2020-10-09 07:35:45', 'Q75IA1DH8', 'N');
INSERT INTO `tbl_pengambilan_sukarela` VALUES (6, 3, 186, 10000, '2020-10-09 08:35:07', 'SKS4N8TME', 'N');
INSERT INTO `tbl_pengambilan_sukarela` VALUES (7, 10, 186, 10000, '2020-10-09 10:00:04', 'FJ6402PL5', 'Y');
INSERT INTO `tbl_pengambilan_sukarela` VALUES (8, 10, 186, 10000, '2020-10-09 10:00:16', 'A3RBMILT2', 'Y');
INSERT INTO `tbl_pengambilan_sukarela` VALUES (9, 3, 188, 3000, '2020-10-09 09:30:28', '48FAC821S', 'N');
INSERT INTO `tbl_pengambilan_sukarela` VALUES (10, 10, 209, 100000, '2020-10-09 22:09:02', 'ERCN321F1', 'Y');
INSERT INTO `tbl_pengambilan_sukarela` VALUES (11, 10, 209, 100000, '2020-10-09 22:28:06', '8DUJMO3UJ', 'Y');
INSERT INTO `tbl_pengambilan_sukarela` VALUES (12, 3, 209, 100000, '2020-10-09 22:31:56', 'GPSMK4D39', 'N');
INSERT INTO `tbl_pengambilan_sukarela` VALUES (13, 3, 240, 100000, '2020-10-09 05:38:15', '0ECHCBS35', 'N');

-- ----------------------------
-- Table structure for tbl_ppob
-- ----------------------------
DROP TABLE IF EXISTS `tbl_ppob`;
CREATE TABLE `tbl_ppob`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `foto` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_ppob
-- ----------------------------
INSERT INTO `tbl_ppob` VALUES (1, 'pulsa', 'icon_pulsa.png', 'Pulsa');
INSERT INTO `tbl_ppob` VALUES (2, 'data', 'icon_data.png', 'Paket Data');
INSERT INTO `tbl_ppob` VALUES (3, 'pln', 'icon_tokenlistrik.png', 'PLN');
INSERT INTO `tbl_ppob` VALUES (4, 'kereta', 'icon_kereta.png', 'Tiket KAI');
INSERT INTO `tbl_ppob` VALUES (5, 'telkom', 'icon_telepon_telkom.png', 'Telkom');
INSERT INTO `tbl_ppob` VALUES (6, 'internet', 'icon_indihome.png', 'Internet & TV Kabel');
INSERT INTO `tbl_ppob` VALUES (7, 'bus', 'icon_bus.png', 'Bus / Travel');
INSERT INTO `tbl_ppob` VALUES (9, 'asuransi', 'icon_asuransi.png', 'Asuransi');

-- ----------------------------
-- Table structure for tbl_ppob_nohp
-- ----------------------------
DROP TABLE IF EXISTS `tbl_ppob_nohp`;
CREATE TABLE `tbl_ppob_nohp`  (
  `id_hp` int NOT NULL AUTO_INCREMENT,
  `nomor` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `provider` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `provider_pusat` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `foto` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_hp`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_ppob_nohp
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_ppob_nohp_copy1
-- ----------------------------
DROP TABLE IF EXISTS `tbl_ppob_nohp_copy1`;
CREATE TABLE `tbl_ppob_nohp_copy1`  (
  `id_hp` int NOT NULL AUTO_INCREMENT,
  `nomor` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `provider` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `provider_pusat` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `foto` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_hp`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 48 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_ppob_nohp_copy1
-- ----------------------------
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (1, '0811', 'Halo', 'Telkomsel', 'https://kopranesia.id/apk/pulsa/telkomsel.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (2, '0812', 'Simpati', 'Telkomsel', 'https://kopranesia.id/apk/pulsa/telkomsel.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (3, '0813', 'Simpati', 'Telkomsel', 'https://kopranesia.id/apk/pulsa/telkomsel.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (4, '0821', 'Simpati', 'Telkomsel', 'https://kopranesia.id/apk/pulsa/telkomsel.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (5, '0822', 'Simpati', 'Telkomsel', 'https://kopranesia.id/apk/pulsa/telkomsel.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (6, '0852', 'AS', 'Telkomsel', 'https://kopranesia.id/apk/pulsa/telkomsel.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (7, '0853', 'AS', 'Telkomsel', 'https://kopranesia.id/apk/pulsa/telkomsel.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (8, '0823', 'AS', 'Telkomsel', 'https://kopranesia.id/apk/pulsa/telkomsel.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (9, '0851', 'AS', 'Telkomsel', 'https://kopranesia.id/apk/pulsa/telkomsel.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (11, '0814', 'Indosat M2 Broadband', 'Indosat ', 'https://kopranesia.id/apk/pulsa/indosat.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (12, '0815', 'Matrix dan Mentari', 'Indosat ', 'https://kopranesia.id/apk/pulsa/indosat.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (13, '0816', 'Matrix dan Mentari', 'Indosat ', 'https://kopranesia.id/apk/pulsa/indosat.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (14, '0855', 'Matrix', 'Indosat ', 'https://kopranesia.id/apk/pulsa/indosat.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (15, '0856', 'IM3', 'Indosat ', 'https://kopranesia.id/apk/pulsa/indosat.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (16, '0857', 'IM3', 'Indosat ', 'https://kopranesia.id/apk/pulsa/indosat.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (17, '0858', 'Mentari', 'Indosat ', 'https://kopranesia.id/apk/pulsa/indosat.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (18, '0817', NULL, 'XL', 'https://kopranesia.id/apk/pulsa/xl.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (19, '0818', NULL, 'XL', 'https://kopranesia.id/apk/pulsa/xl.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (20, '0819', NULL, 'XL', 'https://kopranesia.id/apk/pulsa/xl.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (21, '0859', NULL, 'XL', 'https://kopranesia.id/apk/pulsa/xl.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (22, '0877', NULL, 'XL', 'https://kopranesia.id/apk/pulsa/xl.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (23, '0878', NULL, 'XL', 'https://kopranesia.id/apk/pulsa/xl.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (24, '0838', NULL, 'Axis', 'https://kopranesia.id/apk/pulsa/axis.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (25, '0831', NULL, 'Axis', 'https://kopranesia.id/apk/pulsa/axis.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (26, '0832', NULL, 'Axis', 'https://kopranesia.id/apk/pulsa/axis.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (27, '0833', NULL, 'Axis', 'https://kopranesia.id/apk/pulsa/axis.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (34, '0896', NULL, 'Three', 'https://kopranesia.id/apk/pulsa/three.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (33, '0895', NULL, 'Three', 'https://kopranesia.id/apk/pulsa/three.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (35, '0897', NULL, 'Three', 'https://kopranesia.id/apk/pulsa/three.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (36, '0898', NULL, 'Three', 'https://kopranesia.id/apk/pulsa/three.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (37, '0899', NULL, 'Three', 'https://kopranesia.id/apk/pulsa/three.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (39, '0881', NULL, 'Smartfren', 'https://kopranesia.id/apk/pulsa/smartfren.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (40, '0882', NULL, 'Smartfren', 'https://kopranesia.id/apk/pulsa/smartfren.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (41, '0883', NULL, 'Smartfren', 'https://kopranesia.id/apk/pulsa/smartfren.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (42, '0884', NULL, 'Smartfren', 'https://kopranesia.id/apk/pulsa/smartfren.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (43, '0885', NULL, 'Smartfren', 'https://kopranesia.id/apk/pulsa/smartfren.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (44, '0886', NULL, 'Smartfren', 'https://kopranesia.id/apk/pulsa/smartfren.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (45, '0887', NULL, 'Smartfren', 'https://kopranesia.id/apk/pulsa/smartfren.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (46, '0888', NULL, 'Smartfren', 'https://kopranesia.id/apk/pulsa/smartfren.PNG');
INSERT INTO `tbl_ppob_nohp_copy1` VALUES (47, '0889', NULL, 'Smartfren', 'https://kopranesia.id/apk/pulsa/smartfren.PNG');

-- ----------------------------
-- Table structure for tbl_produk
-- ----------------------------
DROP TABLE IF EXISTS `tbl_produk`;
CREATE TABLE `tbl_produk`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `barcode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_kategori` int NULL DEFAULT NULL,
  `jenis` enum('pokok','aksesoris','lainnya') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `foto` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `harga_beli` int NULL DEFAULT NULL,
  `harga` int NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `deskripsi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `harga_grosir` int NOT NULL,
  `status` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `stok` float NULL DEFAULT NULL,
  `diskon` int NULL DEFAULT NULL,
  `tgl_input` datetime NULL DEFAULT NULL,
  `poin` int NULL DEFAULT NULL,
  `id_admin` int NULL DEFAULT NULL,
  `id_outlet` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_kategori`(`id_kategori`) USING BTREE,
  INDEX `id_admin`(`id_admin`) USING BTREE,
  CONSTRAINT `tbl_produk_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `tbl_admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_produk_ibfk_3` FOREIGN KEY (`id_kategori`) REFERENCES `tbl_kategori` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_produk
-- ----------------------------
INSERT INTO `tbl_produk` VALUES (1, '1', 'Obat Nyamuk Jumbo', 1, NULL, '7indora-1606034204.jpeg', 3500, 4000, '<p>Obat nyamuk super ampuh</p>\r\n', 'Obat nyamuk super ampuh', 3700, 'Y', 92, 0, '2020-12-14 08:49:06', 5, 1, 1);
INSERT INTO `tbl_produk` VALUES (2, '2', 'Teh Pucuk', 1, NULL, '7indora-1606034520.jpg', 3000, 3500, '<p>Teh Pucuk Segar Alami</p>\r\n', '200ml', 3400, 'Y', 100, 0, '2020-11-22 15:42:00', 1, 1, 1);
INSERT INTO `tbl_produk` VALUES (3, '3', 'Saus Sambal Laris Special 600ml', 2, NULL, '7indora-1606034795.jpg', 5000, 6000, '<h2>Deskripsi&nbsp;Saus Sambal Laris Special 600ml Murah ( Pedas )</h2>\r\n\r\n<p>Saus sambal laris special 600ml (Pedas)</p>\r\n', '600ml', 5500, 'Y', 100, 0, '2020-11-22 15:46:35', 1, 1, 1);
INSERT INTO `tbl_produk` VALUES (4, '4', 'Kratingdaeng Energy Drink 150 ml', 1, NULL, '7indora-1606034885.jpg', 7000, 7800, '<h3>Deskripsi&nbsp;Kratingdaeng Energy Drink 150 ml</h3>\r\n\r\n<p>Minuman berenergi KRATINGDAENG. dengan kandungan taurine. Mengurangi kelelahan dan nyeri otot. Menjaga stamina tubuh tetap dalam kondisi segar. Minuman suplemen membantu menyegarkan tubuh pada saat kerja keras atau berolahraga. Diproduksi oleh PT. Asia Health Energi Beverages</p>\r\n', '150ml', 7500, 'Y', 100, 0, '2020-11-22 15:48:05', 1, 1, 1);
INSERT INTO `tbl_produk` VALUES (5, '5', 'Larutan Penyegar Cap Badak Jambu Kaleng 320 ml (1 Kaleng)', 1, NULL, '7indora-1606035000.jpg', 6000, 6750, '<h3>Deskripsi&nbsp;Larutan Penyegar Cap Badak Jambu Kaleng 320 ml (1 Kaleng)</h3>\r\n\r\n<p>Selamat datang di Warung Pintar!<br />\r\nSEKARANG WARUNG PINTAR MELAYANI ORDER DAN PENGIRIMAN KE SELURUH WILAYAH INDONESIA LHOH!</p>\r\n', '320 ml', 6500, 'Y', 100, 0, '2020-11-22 15:50:00', 1, 1, 1);
INSERT INTO `tbl_produk` VALUES (6, '6', 'Minyak Goreng Hemart 1 Liter Botol', 2, NULL, '7indora-1606035076.jpg', 11000, 12500, '<h3>Minyak Goreng Hemart 1 Liter Botol</h3>\r\n', '1L', 12000, 'Y', 100, 0, '2020-11-22 15:51:52', 1, 1, 1);
INSERT INTO `tbl_produk` VALUES (8, '7', 'kecap bango 550 ml', 1, NULL, '7indora-1606529146.jpg', 19500, 21500, '<p>-kecap bango kedelai pilihan berkualitas</p>\r\n', 'kecap bangau dari kedelai pilihan berkualitas', 21000, 'N', 100, 0, '2020-11-30 08:07:24', 1, 1, 1);
INSERT INTO `tbl_produk` VALUES (9, '8', 'gulaku 1 kg', 1, NULL, '7indora-1606530305.jpg', 11500, 14500, '<p>-gulaku manis alami dari tebu pilihan berkualitas,dan pastinya sehat!</p>\r\n', 'gulaku manis alami dari tebu pilihan berkualitas', 13000, 'N', 100, 0, '2020-11-30 08:15:10', 1, 1, 1);
INSERT INTO `tbl_produk` VALUES (10, '9', 'mie lemonilo 70 gr', 1, NULL, '7indora-1606530723.jpg', 6500, 7500, '<p>-mie lemonilo 70 gr sehat alami tanpa ada bahan kimia!</p>\r\n', 'mie lemonilo sehat alami tanpa ada bahan kimia', 7000, 'N', 100, 0, '2020-11-30 08:15:33', 1, 1, 1);
INSERT INTO `tbl_produk` VALUES (11, '10', 'Minyak Goreng Bimoli 2 Liter', 1, NULL, '7indora-1606530753.jpg', 24000, 25500, '<p>Minyak Goreng Bimoli 2 Liter</p>\r\n', '~ Minyak Goreng Bimoli 2 Liter ~', 25000, 'N', 100, 0, '2020-12-05 09:04:51', 1, 1, 1);
INSERT INTO `tbl_produk` VALUES (12, '11', 'sarden asahi 425 gr', 1, NULL, '7indora-1606531269.jpg', 14000, 15500, '<p>-sarden asahi 425 gr saus tomat super lezat&nbsp;</p>\r\n', 'sarden asahi saus tomat super lezat ', 15000, 'N', 100, 0, '2020-11-30 08:16:11', 1, 1, 1);
INSERT INTO `tbl_produk` VALUES (13, '12', 'Kecap Cap Ikan Lele 200 ml ', 1, NULL, '7indora-1606535351.jpg', 19000, 20500, '<p>-Kecap Cap Ikan Lele 200 ml</p>\r\n', 'Kecap cap ikan lele 200 ml', 20000, 'N', 100, 0, '2020-11-30 08:16:30', 1, 1, 1);
INSERT INTO `tbl_produk` VALUES (14, '13', 'beras pandan wangi 5kg', 1, NULL, '7indora-1606536735.jpg', 55000, 70000, '<p>-beras pandan wangi super buji murni putih!</p>\r\n', 'beras pandan wangi super buji murni putih!', 60000, 'N', 100, 0, '2020-11-28 13:25:47', 1, 1, 1);
INSERT INTO `tbl_produk` VALUES (15, '8997019580215', 'TISU GREEN POP UP', 19, NULL, '7indora-1607911083.jpg', 2700, 3500, '<p>-</p>\r\n', 'tisu serba guna ', 0, 'Y', 100, 0, '2020-12-14 11:09:45', 0, 1, 1);
INSERT INTO `tbl_produk` VALUES (16, '8886008101053', 'aqua 600ml', 20, NULL, '7indora-1607917784.jpg', 2100, 2500, '<p>-</p>\r\n', 'air mineral', 2300, 'Y', 98, 0, '2020-12-14 11:08:06', 0, 1, 1);
INSERT INTO `tbl_produk` VALUES (17, '4767726652', 'ale ale jambu biji', 20, NULL, '7indora-1607998351.jpeg', 750, 1000, '<p>-</p>\r\n', 'Minuman ', 900, 'Y', 100, 0, '2020-12-15 09:12:31', 0, 1, 1);
INSERT INTO `tbl_produk` VALUES (18, '565765764', 'sabun nuvo', 21, NULL, '7indora-1607998629.jpeg', 2000, 2500, '<p>-</p>\r\n', 'sabun mandi', 2100, 'Y', 100, 0, '2020-12-15 09:17:09', 0, 1, 1);
INSERT INTO `tbl_produk` VALUES (19, '8998866605250', 'NUVO Hand Sanitizer 85 mL', 21, NULL, '7indora-1608002116.jpg', 6500, 7000, '<p>Nuvo hand sanitizer 60 ml terdiri dari 3 Variant : Merah , Biru , Hijau Tidak lengket di tangan</p>\r\n\r\n<p>Nuvo Hand sanitizer adalah hand sanitizer yang menggandung Alcohol dan Triclosan yang efektif 99.9% dalam membunuh kuman pada tangan.</p>\r\n\r\n<p>Hand sanitizer ini dilengkapi dengan moisturizer yang tinggi untuk melindungi tangan dari kekeringan, serta dengan aroma yang segar, ringan, dan tahan lama.</p>\r\n\r\n<p>Manfaat Moisturizer Triclosan Nuvo Hand Sanitizer dapat: 1. Membunuh Kuman 2. Terasa Lembut dan Halus di kulit 3. Membersihkan tangan 4. Praktis tanpa air (Bila varian kosong akan diinfo via chat)</p>\r\n', 'hand Soab', 0, 'Y', 100, 0, '2020-12-18 17:03:54', 0, 1, 1);
INSERT INTO `tbl_produk` VALUES (20, '1912001', 'Bimoli 1 Liter', 2, NULL, 'produk-1608300340.jpeg', 13500, 13500, '<p>-</p>\r\n', 'minyak goreng', 0, 'Y', 100, 0, '2020-12-18 21:05:40', 0, 1, 1);
INSERT INTO `tbl_produk` VALUES (21, '1912002', 'Bimoli 2 Liter', 2, NULL, '7indora-1608297408.jpg', 25750, 25750, '<p>-</p>\r\n', 'minyak goreng', 0, 'Y', 100, 0, '2020-12-18 20:54:31', 0, 1, 1);
INSERT INTO `tbl_produk` VALUES (22, '1912003', 'mie sedaap ayam bawang', 2, NULL, '7indora-1608298947.jpeg', 2200, 2200, '<p>-</p>\r\n', 'mie instant', 0, 'Y', 91, 0, '2020-12-18 20:54:51', 0, 1, 1);
INSERT INTO `tbl_produk` VALUES (23, '1912004', 'mie sedaap goreng', 2, NULL, '7indora-1608299635.jpeg', 2300, 2300, '<p>-</p>\r\n', 'mie instant', 0, 'Y', 99, 0, '2020-12-18 20:55:54', 0, 1, 1);
INSERT INTO `tbl_produk` VALUES (24, '1912005', 'teh pucuk 350 ml', 20, NULL, 'produk-1608299962.jpg', 2200, 2200, '<p>-</p>\r\n', 'Minuman ', 0, 'Y', 95, 0, '2020-12-20 14:57:43', 0, 1, 1);
INSERT INTO `tbl_produk` VALUES (25, '1912006', 'sprite 390 ml', 20, NULL, '7indora-1608300063.jpeg', 4000, 4000, '<p>-</p>\r\n', 'Minuman ', 0, 'Y', 96, 0, '2020-12-18 21:01:03', 0, 1, 1);
INSERT INTO `tbl_produk` VALUES (26, '1912007', 'gula 1 kg', 2, NULL, '7indora-1608300193.jpeg', 11500, 11500, '<p>-</p>\r\n', 'gula pasir', 0, 'Y', 93, 0, '2020-12-18 21:03:13', 0, 1, 1);

-- ----------------------------
-- Table structure for tbl_promo
-- ----------------------------
DROP TABLE IF EXISTS `tbl_promo`;
CREATE TABLE `tbl_promo`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `kd_promo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `foto` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `no_urut` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 18 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_promo
-- ----------------------------
INSERT INTO `tbl_promo` VALUES (1, 'PROMO2021', 'kategori-1608343178.jpg', 'PROMO HANDSANITIZER AIKEN 200ML', 1, 1);
INSERT INTO `tbl_promo` VALUES (16, 'PROMO123', 'promo-1608343049.jpeg', NULL, NULL, 3);
INSERT INTO `tbl_promo` VALUES (17, 'PROMONATAL', 'promo-1608343200.jpg', NULL, NULL, 4);

-- ----------------------------
-- Table structure for tbl_promo_detail
-- ----------------------------
DROP TABLE IF EXISTS `tbl_promo_detail`;
CREATE TABLE `tbl_promo_detail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_promo` int NULL DEFAULT NULL,
  `id_produk` int NULL DEFAULT NULL,
  `harga_promo` int NULL DEFAULT NULL,
  `jumlah` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_promo`(`id_promo`) USING BTREE,
  INDEX `id_produk`(`id_produk`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of tbl_promo_detail
-- ----------------------------
INSERT INTO `tbl_promo_detail` VALUES (1, 1, 15, 3000, 1);
INSERT INTO `tbl_promo_detail` VALUES (2, 1, 20, 10000, 1);

-- ----------------------------
-- Table structure for tbl_provinsi
-- ----------------------------
DROP TABLE IF EXISTS `tbl_provinsi`;
CREATE TABLE `tbl_provinsi`  (
  `id_provinsi` int NOT NULL AUTO_INCREMENT,
  `provinsi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_provinsi`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tbl_provinsi
-- ----------------------------
INSERT INTO `tbl_provinsi` VALUES (1, 'Pilih Provinsi');
INSERT INTO `tbl_provinsi` VALUES (2, 'Jawa Tengah');
INSERT INTO `tbl_provinsi` VALUES (3, 'ALB');

-- ----------------------------
-- Table structure for tbl_retur
-- ----------------------------
DROP TABLE IF EXISTS `tbl_retur`;
CREATE TABLE `tbl_retur`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode_faktur` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_admin` int NULL DEFAULT NULL,
  `tgl_transaksi` datetime NULL DEFAULT NULL,
  `id_supplier` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_admin`(`id_admin`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_retur
-- ----------------------------
INSERT INTO `tbl_retur` VALUES (2, 'RET-20121410', 1, '2020-12-14 10:10:59', 20);
INSERT INTO `tbl_retur` VALUES (3, 'RET-20121410', 1, '2020-12-14 10:13:03', 20);

-- ----------------------------
-- Table structure for tbl_retur_detail
-- ----------------------------
DROP TABLE IF EXISTS `tbl_retur_detail`;
CREATE TABLE `tbl_retur_detail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_retur` int NULL DEFAULT NULL,
  `tgl_retur` date NULL DEFAULT NULL,
  `id_produk` int NULL DEFAULT NULL,
  `qty` float NULL DEFAULT NULL,
  `catatan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_retur_detail
-- ----------------------------
INSERT INTO `tbl_retur_detail` VALUES (1, NULL, '2020-12-14', 15, 3, '-');
INSERT INTO `tbl_retur_detail` VALUES (2, NULL, '2020-12-14', 15, 1, '-');
INSERT INTO `tbl_retur_detail` VALUES (3, 2, '2020-12-14', 15, 1, '-');
INSERT INTO `tbl_retur_detail` VALUES (4, 2, '2020-12-14', 15, 4, '-');

-- ----------------------------
-- Table structure for tbl_riwayat
-- ----------------------------
DROP TABLE IF EXISTS `tbl_riwayat`;
CREATE TABLE `tbl_riwayat`  (
  `id_riwayat` int NOT NULL AUTO_INCREMENT,
  `id_user` int NULL DEFAULT NULL,
  `id_admin` int NULL DEFAULT NULL,
  `judul` enum('Pembayaran','Pembelian Produk') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `deskripsi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nominal` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal` datetime NULL DEFAULT NULL,
  `keterangan` enum('tunai') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_riwayat`) USING BTREE,
  INDEX `id_user`(`id_user`) USING BTREE,
  INDEX `id_admin`(`id_admin`) USING BTREE,
  CONSTRAINT `tbl_riwayat_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_riwayat_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `tbl_admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tbl_riwayat
-- ----------------------------
INSERT INTO `tbl_riwayat` VALUES (1, 180, 10, 'Pembelian Produk', 'BB4DD7ME7', '21500.00', '2020-12-19 11:03:33', 'tunai');
INSERT INTO `tbl_riwayat` VALUES (2, 180, 10, 'Pembelian Produk', '6713LKTUG', '21300.00', '2020-12-20 14:51:08', 'tunai');
INSERT INTO `tbl_riwayat` VALUES (3, 239, 10, 'Pembelian Produk', 'EKL7A437G', '24300.00', '2020-12-20 14:58:04', 'tunai');
INSERT INTO `tbl_riwayat` VALUES (4, 180, 10, 'Pembelian Produk', '2S6K3GDA4', '10000.00', '2020-12-20 15:00:50', 'tunai');
INSERT INTO `tbl_riwayat` VALUES (5, 276, 10, 'Pembelian Produk', '3NI623OSD', '31200.00', '2020-12-20 15:02:03', 'tunai');
INSERT INTO `tbl_riwayat` VALUES (6, 244, 10, 'Pembelian Produk', 'UR1CLQA50', '12500.00', '2020-12-22 10:33:30', 'tunai');
INSERT INTO `tbl_riwayat` VALUES (7, 270, 10, 'Pembayaran', 'Simpanan Sukarela Rp. 400000', '400000', '2020-12-22 10:46:23', 'tunai');
INSERT INTO `tbl_riwayat` VALUES (8, 154, 8, 'Pembayaran', 'Simpanan Wajib Rp. 100000', '100000', '2020-12-22 11:06:01', 'tunai');
INSERT INTO `tbl_riwayat` VALUES (9, 154, NULL, 'Pembayaran', 'Pembayaran simpanan wajib Rp. 100000', '100000', '2020-12-22 14:40:55', '');

-- ----------------------------
-- Table structure for tbl_setting
-- ----------------------------
DROP TABLE IF EXISTS `tbl_setting`;
CREATE TABLE `tbl_setting`  (
  `id_setting` int NOT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email_support` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `app_version` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `link_web` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `app_developed_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `app_privacy_policy` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tgl_publish` datetime NULL DEFAULT NULL,
  `syarat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `alamat` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `visi` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `rekening` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `bdn_hukum` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `link_apk` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rating_apk` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kontak` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wa` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ket_order` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tentang` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `parseMaps` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_setting`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_setting
-- ----------------------------
INSERT INTO `tbl_setting` VALUES (1, 'Koperasi Sekunder Indo Bersama Sejahtera', 'admin@7indora.com', NULL, '1.0.3', NULL, '', NULL, NULL, NULL, '<p>no syarat&nbsp;</p>\r\n', 'Jl Raya Jend Sudirman Kav 4 Bangkle', '', NULL, '', 'https://play.google.com/store/apps/details?id=com.kop.a7indora', 'com.kop.a7indora', '02988888888', 'admin@7indora.com', '0866666666', NULL, '<p>Adanya keinginan kuat dari beperapa pengurus koperasi di kabupaten Blora untuk meningkatkan kinerja koperasi dan meningkatkan kinerja koperasi dan meningkatkan peran serta koperasi dalam perputaran roda perekonomian di kab Blora maka dibentuklah Koperasi Sekunder Indo Sejahtera Bersama ( Indora ) yang menggabungkan 16 Koperasi di Kabupaten Blora yaitu :</p>\r\n\r\n<p>1.Koperasi Seven<br />\r\n2.KPRI Sehat DKK<br />\r\n3.Kopendik Banjarejo<br />\r\n4.KPRI Wargo Tunggal<br />\r\n5.KPRI Ihklas Kemenag<br />\r\n6.KUD Tani Jaya Banjarejo<br />\r\n7.KOPKAR Bhakti Usaha<br />\r\n8.KPRI Guyub Rukun<br />\r\n9.KPRI Eko Santosa<br />\r\n10.KPRI Karya Sejahtera<br />\r\n11.KUD Makmur Jati<br />\r\n12.KPRI Dwi Eksa<br />\r\n13.KPRI Dwija Mustika<br />\r\n14.KPRI Serba Usaha Migas<br />\r\n15.KPRI Dwijo Santosa<br />\r\n16.Koperasi Dwi Makmur</p>\r\n', 'Alun alun Blora');

-- ----------------------------
-- Table structure for tbl_shu
-- ----------------------------
DROP TABLE IF EXISTS `tbl_shu`;
CREATE TABLE `tbl_shu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `periode` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nominal_shu` int NULL DEFAULT NULL,
  `total_simpanan_anggota` int NULL DEFAULT NULL,
  `total_akumulasi_simpanan` int NULL DEFAULT NULL,
  `perolehan_shu` float(11, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_user`(`id_user`) USING BTREE,
  CONSTRAINT `tbl_shu_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 481 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_shu
-- ----------------------------
INSERT INTO `tbl_shu` VALUES (321, 1, '2020-12-29', '2020', 2500000, 0, 4385000, 0.00);
INSERT INTO `tbl_shu` VALUES (322, 126, '2020-12-29', '2020', 2500000, 0, 4385000, 0.00);
INSERT INTO `tbl_shu` VALUES (323, 127, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (324, 128, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (325, 129, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (326, 130, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (327, 131, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (328, 132, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (329, 133, '2020-12-29', '2020', 2500000, 35000, 4385000, 19954.39);
INSERT INTO `tbl_shu` VALUES (330, 134, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (331, 135, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (332, 136, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (333, 137, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (334, 138, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (335, 139, '2020-12-29', '2020', 2500000, 120000, 4385000, 68415.05);
INSERT INTO `tbl_shu` VALUES (336, 140, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (337, 141, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (338, 142, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (339, 143, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (340, 144, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (341, 145, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (342, 146, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (343, 147, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (344, 148, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (345, 149, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (346, 150, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (347, 151, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (348, 152, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (349, 153, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (350, 154, '2020-12-29', '2020', 2500000, 135000, 4385000, 76966.93);
INSERT INTO `tbl_shu` VALUES (351, 155, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (352, 156, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (353, 157, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (354, 158, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (355, 159, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (356, 160, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (357, 161, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (358, 162, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (359, 163, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (360, 164, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (361, 165, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (362, 166, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (363, 167, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (364, 168, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (365, 169, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (366, 170, '2020-12-29', '2020', 2500000, 0, 4385000, 0.00);
INSERT INTO `tbl_shu` VALUES (367, 171, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (368, 172, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (369, 173, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (370, 174, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (371, 175, '2020-12-29', '2020', 2500000, 0, 4385000, 0.00);
INSERT INTO `tbl_shu` VALUES (372, 176, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (373, 177, '2020-12-29', '2020', 2500000, 80000, 4385000, 45610.03);
INSERT INTO `tbl_shu` VALUES (374, 178, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (375, 179, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (376, 180, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (377, 181, '2020-12-29', '2020', 2500000, 25000, 4385000, 14253.14);
INSERT INTO `tbl_shu` VALUES (378, 182, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (379, 183, '2020-12-29', '2020', 2500000, 25000, 4385000, 14253.14);
INSERT INTO `tbl_shu` VALUES (380, 184, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (381, 185, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (382, 186, '2020-12-29', '2020', 2500000, 35000, 4385000, 19954.39);
INSERT INTO `tbl_shu` VALUES (383, 187, '2020-12-29', '2020', 2500000, 50000, 4385000, 28506.27);
INSERT INTO `tbl_shu` VALUES (384, 188, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (385, 189, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (386, 190, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (387, 191, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (388, 192, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (389, 193, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (390, 194, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (391, 195, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (392, 196, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (393, 197, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (394, 198, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (395, 199, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (396, 200, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (397, 201, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (398, 202, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (399, 204, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (400, 205, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (401, 206, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (402, 207, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (403, 208, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (404, 209, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (405, 210, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (406, 211, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (407, 212, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (408, 213, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (409, 214, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (410, 215, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (411, 216, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (412, 217, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (413, 218, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (414, 219, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (415, 220, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (416, 221, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (417, 222, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (418, 223, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (419, 224, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (420, 225, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (421, 226, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (422, 227, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (423, 228, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (424, 229, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (425, 230, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (426, 231, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (427, 232, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (428, 233, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (429, 234, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (430, 235, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (431, 236, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (432, 237, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (433, 238, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (434, 239, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (435, 240, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (436, 241, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (437, 242, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (438, 243, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (439, 244, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (440, 245, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (441, 246, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (442, 247, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (443, 248, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (444, 249, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (445, 250, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (446, 251, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (447, 252, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (448, 253, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (449, 254, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (450, 255, '2020-12-29', '2020', 2500000, 60000, 4385000, 34207.53);
INSERT INTO `tbl_shu` VALUES (451, 256, '2020-12-29', '2020', 2500000, 10000, 4385000, 5701.25);
INSERT INTO `tbl_shu` VALUES (452, 257, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (453, 258, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (454, 259, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (455, 260, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (456, 261, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (457, 262, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (458, 263, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (459, 264, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (460, 265, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (461, 266, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (462, 267, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (463, 268, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (464, 269, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (465, 270, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (466, 271, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (467, 272, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (468, 273, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (469, 274, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (470, 275, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (471, 276, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (472, 277, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (473, 278, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (474, 279, '2020-12-29', '2020', 2500000, 30000, 4385000, 17103.76);
INSERT INTO `tbl_shu` VALUES (475, 280, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (476, 281, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (477, 282, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (478, 283, '2020-12-29', '2020', 2500000, 20000, 4385000, 11402.51);
INSERT INTO `tbl_shu` VALUES (479, 284, '2020-12-29', '2020', 2500000, 40000, 4385000, 22805.02);
INSERT INTO `tbl_shu` VALUES (480, 285, '2020-12-29', '2020', 2500000, 0, 4385000, 0.00);

-- ----------------------------
-- Table structure for tbl_sim
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sim`;
CREATE TABLE `tbl_sim`  (
  `id_simpanan` int NOT NULL AUTO_INCREMENT,
  `pokok` int NULL DEFAULT NULL,
  `wajib` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_simpanan`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of tbl_sim
-- ----------------------------
INSERT INTO `tbl_sim` VALUES (1, 50000, 15000);

-- ----------------------------
-- Table structure for tbl_sim_pokok
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sim_pokok`;
CREATE TABLE `tbl_sim_pokok`  (
  `id_simpanan` int NOT NULL AUTO_INCREMENT,
  `id_user` int NULL DEFAULT NULL,
  `id_admin` int NULL DEFAULT NULL,
  `nominal` int NULL DEFAULT NULL,
  `tanggal` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_simpanan`) USING BTREE,
  INDEX `id_user`(`id_user`) USING BTREE,
  INDEX `id_admin`(`id_admin`) USING BTREE,
  CONSTRAINT `tbl_sim_pokok_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_sim_pokok_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `tbl_admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 161 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tbl_sim_pokok
-- ----------------------------
INSERT INTO `tbl_sim_pokok` VALUES (3, 127, 3, 20000, '2020-11-05 09:34:45');
INSERT INTO `tbl_sim_pokok` VALUES (4, 128, 3, 20000, '2020-11-05 09:40:59');
INSERT INTO `tbl_sim_pokok` VALUES (5, 129, 3, 20000, '2020-11-05 09:44:49');
INSERT INTO `tbl_sim_pokok` VALUES (6, 130, 3, 20000, '2020-11-05 09:49:20');
INSERT INTO `tbl_sim_pokok` VALUES (7, 131, 3, 20000, '2020-11-05 09:53:08');
INSERT INTO `tbl_sim_pokok` VALUES (8, 132, 3, 20000, '2020-11-05 09:55:38');
INSERT INTO `tbl_sim_pokok` VALUES (9, 133, 3, 20000, '2020-11-05 09:57:41');
INSERT INTO `tbl_sim_pokok` VALUES (10, 134, 3, 20000, '2020-11-05 09:59:20');
INSERT INTO `tbl_sim_pokok` VALUES (11, 135, 3, 20000, '2020-11-05 10:02:53');
INSERT INTO `tbl_sim_pokok` VALUES (12, 136, 3, 20000, '2020-11-05 10:06:10');
INSERT INTO `tbl_sim_pokok` VALUES (13, 137, 3, 20000, '2020-11-05 10:08:22');
INSERT INTO `tbl_sim_pokok` VALUES (14, 138, 3, 20000, '2020-11-05 10:10:21');
INSERT INTO `tbl_sim_pokok` VALUES (15, 139, 3, 20000, '2020-11-05 10:11:45');
INSERT INTO `tbl_sim_pokok` VALUES (16, 140, 3, 20000, '2020-11-05 10:13:13');
INSERT INTO `tbl_sim_pokok` VALUES (17, 141, 3, 20000, '2020-11-05 10:16:26');
INSERT INTO `tbl_sim_pokok` VALUES (18, 142, 3, 20000, '2020-11-05 10:18:16');
INSERT INTO `tbl_sim_pokok` VALUES (19, 143, 3, 20000, '2020-11-05 10:19:36');
INSERT INTO `tbl_sim_pokok` VALUES (20, 144, 3, 20000, '2020-11-05 10:20:52');
INSERT INTO `tbl_sim_pokok` VALUES (21, 145, 3, 20000, '2020-11-05 10:22:42');
INSERT INTO `tbl_sim_pokok` VALUES (22, 146, 3, 20000, '2020-11-05 10:24:15');
INSERT INTO `tbl_sim_pokok` VALUES (23, 147, 3, 20000, '2020-11-05 10:36:21');
INSERT INTO `tbl_sim_pokok` VALUES (24, 148, 3, 20000, '2020-11-05 10:38:12');
INSERT INTO `tbl_sim_pokok` VALUES (25, 149, 3, 20000, '2020-11-05 10:40:42');
INSERT INTO `tbl_sim_pokok` VALUES (26, 150, 3, 20000, '2020-11-05 10:43:35');
INSERT INTO `tbl_sim_pokok` VALUES (27, 151, 3, 20000, '2020-11-05 10:45:02');
INSERT INTO `tbl_sim_pokok` VALUES (28, 152, 3, 20000, '2020-11-09 09:55:46');
INSERT INTO `tbl_sim_pokok` VALUES (29, 153, 3, 20000, '2020-11-09 10:12:53');
INSERT INTO `tbl_sim_pokok` VALUES (30, 154, 3, 20000, '2020-11-09 14:07:04');
INSERT INTO `tbl_sim_pokok` VALUES (31, 155, 3, 20000, '2020-11-17 11:59:04');
INSERT INTO `tbl_sim_pokok` VALUES (32, 156, 3, 20000, '2020-11-17 13:35:53');
INSERT INTO `tbl_sim_pokok` VALUES (33, 157, 3, 20000, '2020-11-17 14:06:19');
INSERT INTO `tbl_sim_pokok` VALUES (34, 158, 3, 20000, '2020-11-17 14:09:24');
INSERT INTO `tbl_sim_pokok` VALUES (35, 159, 3, 20000, '2020-11-17 14:13:12');
INSERT INTO `tbl_sim_pokok` VALUES (36, 160, 3, 20000, '2020-11-17 14:25:03');
INSERT INTO `tbl_sim_pokok` VALUES (37, 161, 3, 20000, '2020-11-17 14:27:56');
INSERT INTO `tbl_sim_pokok` VALUES (38, 162, 3, 20000, '2020-11-17 14:58:22');
INSERT INTO `tbl_sim_pokok` VALUES (39, 163, 3, 20000, '2020-11-17 15:02:05');
INSERT INTO `tbl_sim_pokok` VALUES (40, 164, 3, 20000, '2020-11-17 15:17:18');
INSERT INTO `tbl_sim_pokok` VALUES (41, 165, 3, 20000, '2020-11-17 15:19:54');
INSERT INTO `tbl_sim_pokok` VALUES (42, 166, 3, 20000, '2020-11-17 15:28:41');
INSERT INTO `tbl_sim_pokok` VALUES (43, 167, 3, 20000, '2020-11-17 15:30:33');
INSERT INTO `tbl_sim_pokok` VALUES (44, 168, 3, 20000, '2020-11-17 15:36:21');
INSERT INTO `tbl_sim_pokok` VALUES (45, 169, 3, 20000, '2020-11-17 15:45:41');
INSERT INTO `tbl_sim_pokok` VALUES (47, 171, 3, 20000, '2020-11-17 15:48:45');
INSERT INTO `tbl_sim_pokok` VALUES (48, 172, 3, 20000, '2020-11-17 16:03:33');
INSERT INTO `tbl_sim_pokok` VALUES (49, 173, 3, 20000, '2020-11-17 16:08:53');
INSERT INTO `tbl_sim_pokok` VALUES (50, 174, 3, 20000, '2020-11-17 16:29:05');
INSERT INTO `tbl_sim_pokok` VALUES (52, 176, 3, 20000, '2020-11-17 16:34:24');
INSERT INTO `tbl_sim_pokok` VALUES (53, 177, 3, 20000, '2020-11-17 17:06:38');
INSERT INTO `tbl_sim_pokok` VALUES (54, 178, 3, 20000, '2020-11-17 17:15:00');
INSERT INTO `tbl_sim_pokok` VALUES (55, 179, 3, 20000, '2020-11-17 17:18:02');
INSERT INTO `tbl_sim_pokok` VALUES (56, 180, NULL, 20000, '2020-12-04 21:14:42');
INSERT INTO `tbl_sim_pokok` VALUES (57, 181, NULL, 20000, '2020-12-04 21:44:45');
INSERT INTO `tbl_sim_pokok` VALUES (58, 182, NULL, 20000, '2020-12-13 07:25:10');
INSERT INTO `tbl_sim_pokok` VALUES (59, 183, 3, 20000, '2020-12-13 21:32:07');
INSERT INTO `tbl_sim_pokok` VALUES (60, 184, 3, 20000, '2020-12-14 07:18:30');
INSERT INTO `tbl_sim_pokok` VALUES (61, 185, 3, 20000, '2020-12-14 07:19:32');
INSERT INTO `tbl_sim_pokok` VALUES (62, 186, 3, 20000, '2020-12-14 08:11:03');
INSERT INTO `tbl_sim_pokok` VALUES (63, 187, 3, 20000, '2020-12-14 10:33:48');
INSERT INTO `tbl_sim_pokok` VALUES (64, 188, 3, 20000, '2020-12-15 09:28:31');
INSERT INTO `tbl_sim_pokok` VALUES (65, 189, 3, 20000, '2020-12-18 12:56:13');
INSERT INTO `tbl_sim_pokok` VALUES (66, 190, 3, 20000, '2020-12-18 12:57:54');
INSERT INTO `tbl_sim_pokok` VALUES (67, 191, 3, 20000, '2020-12-18 12:59:12');
INSERT INTO `tbl_sim_pokok` VALUES (68, 192, 3, 20000, '2020-12-18 13:00:30');
INSERT INTO `tbl_sim_pokok` VALUES (69, 193, 3, 20000, '2020-12-18 13:01:36');
INSERT INTO `tbl_sim_pokok` VALUES (70, 194, 3, 20000, '2020-12-18 13:02:30');
INSERT INTO `tbl_sim_pokok` VALUES (71, 195, 3, 20000, '2020-12-18 13:03:28');
INSERT INTO `tbl_sim_pokok` VALUES (72, 196, 3, 20000, '2020-12-18 21:39:07');
INSERT INTO `tbl_sim_pokok` VALUES (73, 197, 3, 20000, '2020-12-18 21:54:48');
INSERT INTO `tbl_sim_pokok` VALUES (74, 198, 3, 20000, '2020-12-18 21:56:30');
INSERT INTO `tbl_sim_pokok` VALUES (75, 199, 3, 20000, '2020-12-18 21:57:05');
INSERT INTO `tbl_sim_pokok` VALUES (76, 200, 3, 20000, '2020-12-18 21:57:37');
INSERT INTO `tbl_sim_pokok` VALUES (77, 201, 3, 20000, '2020-12-18 21:58:23');
INSERT INTO `tbl_sim_pokok` VALUES (78, 202, 3, 20000, '2020-12-18 21:59:39');
INSERT INTO `tbl_sim_pokok` VALUES (79, 204, 3, 20000, '2020-12-18 22:01:18');
INSERT INTO `tbl_sim_pokok` VALUES (80, 205, 3, 20000, '2020-12-18 22:02:00');
INSERT INTO `tbl_sim_pokok` VALUES (81, 206, 3, 20000, '2020-12-18 22:02:29');
INSERT INTO `tbl_sim_pokok` VALUES (82, 207, 3, 20000, '2020-12-18 22:03:03');
INSERT INTO `tbl_sim_pokok` VALUES (83, 208, 3, 20000, '2020-12-18 22:03:30');
INSERT INTO `tbl_sim_pokok` VALUES (84, 209, 3, 20000, '2020-12-18 22:04:01');
INSERT INTO `tbl_sim_pokok` VALUES (85, 210, 3, 20000, '2020-12-18 22:04:31');
INSERT INTO `tbl_sim_pokok` VALUES (86, 211, 3, 20000, '2020-12-18 22:05:02');
INSERT INTO `tbl_sim_pokok` VALUES (87, 212, 3, 20000, '2020-12-18 22:05:28');
INSERT INTO `tbl_sim_pokok` VALUES (88, 213, 3, 20000, '2020-12-18 22:05:57');
INSERT INTO `tbl_sim_pokok` VALUES (89, 214, 3, 20000, '2020-12-18 22:06:23');
INSERT INTO `tbl_sim_pokok` VALUES (90, 215, 3, 20000, '2020-12-18 22:06:48');
INSERT INTO `tbl_sim_pokok` VALUES (91, 216, 3, 20000, '2020-12-18 22:07:23');
INSERT INTO `tbl_sim_pokok` VALUES (92, 217, 3, 20000, '2020-12-18 22:09:09');
INSERT INTO `tbl_sim_pokok` VALUES (93, 218, 3, 20000, '2020-12-18 22:10:21');
INSERT INTO `tbl_sim_pokok` VALUES (94, 219, 3, 20000, '2020-12-18 22:11:57');
INSERT INTO `tbl_sim_pokok` VALUES (95, 220, 3, 20000, '2020-12-18 22:12:49');
INSERT INTO `tbl_sim_pokok` VALUES (96, 221, 3, 20000, '2020-12-18 22:13:22');
INSERT INTO `tbl_sim_pokok` VALUES (97, 222, 3, 20000, '2020-12-18 22:13:50');
INSERT INTO `tbl_sim_pokok` VALUES (98, 223, 3, 20000, '2020-12-18 22:14:19');
INSERT INTO `tbl_sim_pokok` VALUES (99, 224, 3, 20000, '2020-12-18 22:14:49');
INSERT INTO `tbl_sim_pokok` VALUES (100, 225, 3, 20000, '2020-12-18 22:15:39');
INSERT INTO `tbl_sim_pokok` VALUES (101, 226, 3, 20000, '2020-12-18 22:16:07');
INSERT INTO `tbl_sim_pokok` VALUES (102, 227, 3, 20000, '2020-12-18 22:16:34');
INSERT INTO `tbl_sim_pokok` VALUES (103, 228, 3, 20000, '2020-12-18 22:17:11');
INSERT INTO `tbl_sim_pokok` VALUES (104, 229, 3, 20000, '2020-12-18 22:17:44');
INSERT INTO `tbl_sim_pokok` VALUES (105, 230, 3, 20000, '2020-12-18 22:18:26');
INSERT INTO `tbl_sim_pokok` VALUES (106, 231, 3, 20000, '2020-12-18 22:18:51');
INSERT INTO `tbl_sim_pokok` VALUES (107, 232, 3, 20000, '2020-12-18 22:19:25');
INSERT INTO `tbl_sim_pokok` VALUES (108, 233, 3, 20000, '2020-12-18 22:19:52');
INSERT INTO `tbl_sim_pokok` VALUES (109, 234, 3, 20000, '2020-12-18 22:20:20');
INSERT INTO `tbl_sim_pokok` VALUES (110, 235, 3, 20000, '2020-12-18 22:20:51');
INSERT INTO `tbl_sim_pokok` VALUES (111, 236, 3, 20000, '2020-12-18 22:21:25');
INSERT INTO `tbl_sim_pokok` VALUES (112, 237, 3, 20000, '2020-12-18 22:21:51');
INSERT INTO `tbl_sim_pokok` VALUES (113, 238, 3, 20000, '2020-12-18 22:22:34');
INSERT INTO `tbl_sim_pokok` VALUES (114, 239, 3, 20000, '2020-12-18 22:23:11');
INSERT INTO `tbl_sim_pokok` VALUES (115, 240, 3, 20000, '2020-12-19 04:56:20');
INSERT INTO `tbl_sim_pokok` VALUES (116, 241, 3, 20000, '2020-12-19 04:56:54');
INSERT INTO `tbl_sim_pokok` VALUES (117, 242, 3, 20000, '2020-12-19 04:57:31');
INSERT INTO `tbl_sim_pokok` VALUES (118, 243, 3, 20000, '2020-12-19 05:02:38');
INSERT INTO `tbl_sim_pokok` VALUES (119, 244, 3, 20000, '2020-12-19 05:03:10');
INSERT INTO `tbl_sim_pokok` VALUES (120, 245, 3, 20000, '2020-12-19 05:03:40');
INSERT INTO `tbl_sim_pokok` VALUES (121, 246, 3, 20000, '2020-12-19 05:04:44');
INSERT INTO `tbl_sim_pokok` VALUES (122, 247, 3, 20000, '2020-12-19 05:05:11');
INSERT INTO `tbl_sim_pokok` VALUES (123, 248, 3, 20000, '2020-12-19 05:05:41');
INSERT INTO `tbl_sim_pokok` VALUES (124, 249, 3, 20000, '2020-12-19 05:06:08');
INSERT INTO `tbl_sim_pokok` VALUES (125, 250, 3, 20000, '2020-12-19 05:06:36');
INSERT INTO `tbl_sim_pokok` VALUES (126, 251, 3, 20000, '2020-12-19 05:09:01');
INSERT INTO `tbl_sim_pokok` VALUES (127, 252, 3, 20000, '2020-12-19 05:09:32');
INSERT INTO `tbl_sim_pokok` VALUES (128, 253, 3, 20000, '2020-12-19 05:10:08');
INSERT INTO `tbl_sim_pokok` VALUES (129, 254, 3, 20000, '2020-12-19 05:10:34');
INSERT INTO `tbl_sim_pokok` VALUES (130, 255, 3, 20000, '2020-12-19 05:11:02');
INSERT INTO `tbl_sim_pokok` VALUES (131, 255, 3, 20000, '2020-12-19 05:11:29');
INSERT INTO `tbl_sim_pokok` VALUES (132, 257, 3, 20000, '2020-12-19 05:12:55');
INSERT INTO `tbl_sim_pokok` VALUES (133, 258, 3, 20000, '2020-12-19 05:13:24');
INSERT INTO `tbl_sim_pokok` VALUES (134, 259, 3, 20000, '2020-12-19 05:13:54');
INSERT INTO `tbl_sim_pokok` VALUES (135, 260, 3, 20000, '2020-12-19 05:14:20');
INSERT INTO `tbl_sim_pokok` VALUES (136, 261, 3, 20000, '2020-12-19 05:14:48');
INSERT INTO `tbl_sim_pokok` VALUES (137, 262, 3, 20000, '2020-12-19 05:15:16');
INSERT INTO `tbl_sim_pokok` VALUES (138, 263, 3, 20000, '2020-12-19 05:15:44');
INSERT INTO `tbl_sim_pokok` VALUES (139, 264, 3, 20000, '2020-12-19 05:16:10');
INSERT INTO `tbl_sim_pokok` VALUES (140, 265, 3, 20000, '2020-12-19 05:16:42');
INSERT INTO `tbl_sim_pokok` VALUES (141, 266, 3, 20000, '2020-12-19 05:27:01');
INSERT INTO `tbl_sim_pokok` VALUES (142, 267, 3, 20000, '2020-12-19 05:27:30');
INSERT INTO `tbl_sim_pokok` VALUES (143, 268, 3, 20000, '2020-12-19 05:27:59');
INSERT INTO `tbl_sim_pokok` VALUES (144, 269, 3, 20000, '2020-12-19 05:28:25');
INSERT INTO `tbl_sim_pokok` VALUES (145, 270, 3, 20000, '2020-12-19 05:28:51');
INSERT INTO `tbl_sim_pokok` VALUES (146, 271, 3, 20000, '2020-12-19 05:29:20');
INSERT INTO `tbl_sim_pokok` VALUES (147, 272, 3, 20000, '2020-12-19 05:29:45');
INSERT INTO `tbl_sim_pokok` VALUES (148, 273, 3, 20000, '2020-12-19 05:32:42');
INSERT INTO `tbl_sim_pokok` VALUES (149, 274, 3, 20000, '2020-12-19 05:33:04');
INSERT INTO `tbl_sim_pokok` VALUES (150, 275, 3, 20000, '2020-12-19 05:33:26');
INSERT INTO `tbl_sim_pokok` VALUES (151, 276, 3, 20000, '2020-12-19 05:33:50');
INSERT INTO `tbl_sim_pokok` VALUES (152, 277, 3, 20000, '2020-12-19 05:34:14');
INSERT INTO `tbl_sim_pokok` VALUES (153, 278, 3, 20000, '2020-12-19 05:34:41');
INSERT INTO `tbl_sim_pokok` VALUES (154, 279, 3, 20000, '2020-12-19 05:59:01');
INSERT INTO `tbl_sim_pokok` VALUES (155, 280, 3, 20000, '2020-12-19 08:35:14');
INSERT INTO `tbl_sim_pokok` VALUES (156, 281, 3, 20000, '2020-12-19 08:36:23');
INSERT INTO `tbl_sim_pokok` VALUES (157, 282, 3, 20000, '2020-12-19 08:38:28');
INSERT INTO `tbl_sim_pokok` VALUES (158, 283, 3, 20000, '2020-12-19 08:39:27');
INSERT INTO `tbl_sim_pokok` VALUES (159, 284, 3, 20000, '2020-12-19 08:40:42');
INSERT INTO `tbl_sim_pokok` VALUES (160, 284, 3, 20000, '2020-12-19 08:41:34');

-- ----------------------------
-- Table structure for tbl_sim_sukarela
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sim_sukarela`;
CREATE TABLE `tbl_sim_sukarela`  (
  `id_simpanan` int NOT NULL AUTO_INCREMENT,
  `id_user` int NULL DEFAULT NULL,
  `id_admin` int NULL DEFAULT NULL,
  `nominal` int NULL DEFAULT NULL,
  `tanggal` datetime NULL DEFAULT NULL,
  `metode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `periode` date NULL DEFAULT NULL,
  PRIMARY KEY (`id_simpanan`) USING BTREE,
  INDEX `id_user`(`id_user`) USING BTREE,
  INDEX `id_admin`(`id_admin`) USING BTREE,
  CONSTRAINT `tbl_sim_sukarela_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_sim_sukarela_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `tbl_admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 131 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tbl_sim_sukarela
-- ----------------------------
INSERT INTO `tbl_sim_sukarela` VALUES (25, 180, 8, 500000, '2020-12-17 12:56:41', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (26, 183, 8, 500000, '2020-12-18 10:01:28', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (27, 181, 8, 500000, '2020-12-18 10:10:52', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (28, 181, 10, 8000, '2020-12-18 10:45:02', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (29, 181, 10, 8000, '2020-12-18 10:47:30', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (30, 154, 8, 500000, '2020-12-18 12:03:00', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (31, 189, 3, 100000, '2020-12-18 13:04:55', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (32, 190, 3, 100000, '2020-12-18 13:05:16', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (33, 191, 3, 100000, '2020-12-18 13:05:26', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (34, 192, 3, 100000, '2020-12-18 13:05:39', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (35, 193, 3, 100000, '2020-12-18 13:05:51', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (37, 194, 3, 100000, '2020-12-18 13:06:22', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (38, 195, 3, 100000, '2020-12-18 13:06:40', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (39, 154, 9, 10000, '2020-12-18 15:36:30', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (40, 197, 10, 100000, '2020-12-18 21:56:19', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (41, 198, 10, 100000, '2020-12-18 22:00:02', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (42, 199, 10, 100000, '2020-12-18 22:02:52', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (43, 200, 10, 100000, '2020-12-18 22:03:12', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (44, 201, 10, 100000, '2020-12-18 22:03:26', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (45, 202, 10, 100000, '2020-12-18 22:03:38', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (46, 204, 10, 100000, '2020-12-18 22:03:51', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (47, 205, 10, 100000, '2020-12-18 22:04:04', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (48, 206, 10, 100000, '2020-12-18 22:04:18', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (49, 207, 10, 100000, '2020-12-18 22:04:31', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (50, 208, 10, 100000, '2020-12-18 22:04:43', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (51, 209, 10, 100000, '2020-12-18 22:04:55', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (52, 209, 10, 100000, '2020-12-18 22:05:05', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (53, 211, 10, 100000, '2020-12-18 22:05:18', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (54, 212, 10, 100000, '2020-12-18 22:05:44', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (55, 213, 10, 100000, '2020-12-18 22:06:08', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (56, 214, 10, 100000, '2020-12-18 22:06:34', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (57, 210, 10, 100000, '2020-12-18 22:10:52', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (58, 215, 10, 100000, '2020-12-18 22:11:49', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (59, 216, 10, 100000, '2020-12-18 22:12:05', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (60, 217, 10, 100000, '2020-12-18 22:12:17', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (61, 218, 10, 100000, '2020-12-18 22:12:30', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (62, 219, 10, 100000, '2020-12-18 22:13:00', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (63, 220, 10, 100000, '2020-12-18 22:13:13', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (64, 221, 10, 100000, '2020-12-18 22:13:32', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (65, 222, 10, 100000, '2020-12-18 22:14:09', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (66, 223, 10, 100000, '2020-12-18 22:15:03', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (67, 224, 10, 100000, '2020-12-18 22:15:14', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (68, 225, 10, 100000, '2020-12-18 22:16:16', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (69, 226, 10, 100000, '2020-12-18 22:16:27', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (70, 227, 10, 100000, '2020-12-18 22:18:01', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (71, 228, 10, 100000, '2020-12-18 22:18:13', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (72, 229, 10, 100000, '2020-12-18 22:18:28', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (73, 230, 10, 100000, '2020-12-18 22:18:45', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (74, 231, 10, 100000, '2020-12-18 22:18:58', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (75, 232, 10, 100000, '2020-12-18 22:19:32', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (76, 233, 10, 100000, '2020-12-18 22:20:02', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (77, 234, 10, 100000, '2020-12-18 22:20:26', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (78, 235, 10, 100000, '2020-12-18 22:21:23', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (79, 236, 10, 100000, '2020-12-18 22:21:42', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (80, 237, 10, 100000, '2020-12-18 22:21:59', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (81, 238, 10, 100000, '2020-12-18 22:22:39', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (82, 239, 10, 100000, '2020-12-18 22:23:25', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (83, 240, 10, 100000, '2020-12-19 05:36:51', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (84, 240, 10, 100000, '2020-12-19 05:37:10', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (85, 241, 3, 100000, '2020-12-19 05:39:48', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (86, 242, 3, 100000, '2020-12-19 05:40:02', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (87, 243, 3, 100000, '2020-12-19 05:40:15', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (88, 244, 3, 100000, '2020-12-19 05:40:27', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (89, 245, 3, 100000, '2020-12-19 05:40:37', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (90, 246, 3, 100000, '2020-12-19 05:40:54', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (91, 247, 3, 100000, '2020-12-19 05:41:05', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (92, 248, 3, 100000, '2020-12-19 05:41:16', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (93, 249, 3, 100000, '2020-12-19 05:41:28', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (94, 250, 3, 100000, '2020-12-19 05:41:38', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (95, 251, 3, 100000, '2020-12-19 05:41:50', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (96, 252, 3, 100000, '2020-12-19 05:42:01', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (99, 253, 3, 100000, '2020-12-19 05:51:05', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (101, 254, 3, 100000, '2020-12-19 05:51:26', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (102, 255, 3, 100000, '2020-12-19 05:51:54', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (103, 256, 3, 100000, '2020-12-19 05:52:05', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (104, 257, 3, 100000, '2020-12-19 05:54:14', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (105, 258, 3, 100000, '2020-12-19 05:54:26', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (106, 259, 3, 100000, '2020-12-19 05:54:36', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (107, 260, 3, 100000, '2020-12-19 05:54:45', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (108, 261, 3, 100000, '2020-12-19 05:54:54', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (109, 262, 3, 100000, '2020-12-19 05:55:05', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (110, 263, 3, 100000, '2020-12-19 05:55:17', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (111, 264, 3, 100000, '2020-12-19 05:55:27', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (112, 265, 3, 100000, '2020-12-19 05:55:36', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (113, 266, 3, 100000, '2020-12-19 05:55:45', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (114, 267, 3, 100000, '2020-12-19 05:55:59', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (115, 268, 3, 100000, '2020-12-19 05:56:15', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (116, 269, 3, 100000, '2020-12-19 05:56:25', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (117, 270, 3, 100000, '2020-12-19 05:56:35', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (118, 271, 3, 100000, '2020-12-19 05:56:48', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (119, 272, 3, 100000, '2020-12-19 05:57:02', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (120, 273, 3, 100000, '2020-12-19 05:57:12', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (121, 274, 3, 100000, '2020-12-19 05:57:22', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (122, 275, 3, 100000, '2020-12-19 05:57:32', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (123, 276, 3, 100000, '2020-12-19 05:57:43', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (124, 277, 3, 100000, '2020-12-19 05:57:55', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (125, 278, 3, 100000, '2020-12-19 05:58:10', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (126, 279, 3, 100000, '2020-12-19 05:59:27', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (127, 181, 3, 5000, '2020-12-19 06:11:35', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (128, 270, 10, 400000, '2020-12-22 10:46:23', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (129, 154, 3, 1000000, '2020-12-23 21:48:14', NULL, '0000-00-00');
INSERT INTO `tbl_sim_sukarela` VALUES (130, 154, 3, 100000, '2020-12-23 21:36:11', NULL, '2020-12-23');

-- ----------------------------
-- Table structure for tbl_sim_wajib
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sim_wajib`;
CREATE TABLE `tbl_sim_wajib`  (
  `id_simpanan` int NOT NULL AUTO_INCREMENT,
  `id_user` int NULL DEFAULT NULL,
  `id_admin` int NULL DEFAULT NULL,
  `nominal` int NULL DEFAULT NULL,
  `tanggal` datetime NULL DEFAULT NULL,
  `metode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `periode` year NULL DEFAULT NULL,
  `verif` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_simpanan`) USING BTREE,
  INDEX `id_user`(`id_user`) USING BTREE,
  INDEX `id_admin`(`id_admin`) USING BTREE,
  CONSTRAINT `tbl_sim_wajib_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_sim_wajib_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `tbl_admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 131 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tbl_sim_wajib
-- ----------------------------
INSERT INTO `tbl_sim_wajib` VALUES (22, 177, 3, 15000, '2020-11-11 10:13:28', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (23, 177, 3, 15000, '2020-12-11 10:14:42', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (24, 177, 3, 15000, '2021-01-11 10:15:43', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (25, 177, 3, 15000, '2021-02-11 10:18:42', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (26, 133, 3, 15000, '2020-11-20 14:34:57', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (29, 180, 3, 5000, '2020-12-04 21:18:25', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (30, 181, 3, 5000, '2020-12-04 21:48:31', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (31, 139, 10, 100000, '2020-12-13 07:32:32', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (32, 183, 3, 5000, '2020-12-13 21:42:53', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (33, 186, 3, 15000, '2020-12-14 08:32:20', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (34, 187, 3, 15000, '2020-12-14 10:34:49', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (35, 187, 10, 15000, '2020-12-14 12:59:35', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (36, 180, 10, 5000, '2020-12-17 06:43:06', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (37, 189, 10, 10000, '2020-12-18 22:40:45', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (38, 190, 10, 10000, '2020-12-18 22:41:02', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (39, 191, 10, 10000, '2020-12-18 22:41:15', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (40, 192, 10, 10000, '2020-12-18 22:41:27', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (41, 193, 10, 10000, '2020-12-18 22:41:39', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (42, 194, 10, 10000, '2020-12-18 22:41:56', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (43, 195, 10, 10000, '2020-12-18 22:42:07', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (44, 196, 10, 10000, '2020-12-18 22:42:18', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (45, 197, 10, 10000, '2020-12-18 22:42:29', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (46, 198, 10, 10000, '2020-12-18 22:42:40', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (47, 199, 10, 10000, '2020-12-18 22:42:52', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (48, 200, 10, 10000, '2020-12-18 22:43:17', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (49, 201, 10, 10000, '2020-12-18 22:43:29', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (50, 202, 10, 10000, '2020-12-18 22:43:44', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (51, 204, 10, 10000, '2020-12-18 22:44:10', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (52, 205, 10, 10000, '2020-12-18 22:44:22', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (53, 206, 10, 10000, '2020-12-18 22:44:31', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (54, 207, 10, 10000, '2020-12-18 22:44:47', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (55, 208, 10, 10000, '2020-12-18 22:44:57', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (56, 209, 10, 10000, '2020-12-18 22:45:13', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (57, 210, 10, 10000, '2020-12-18 22:45:23', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (58, 211, 10, 10000, '2020-12-18 22:45:35', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (59, 212, 10, 10000, '2020-12-18 22:45:46', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (60, 213, 10, 10000, '2020-12-18 22:45:58', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (61, 214, 10, 10000, '2020-12-18 22:46:10', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (62, 215, 10, 10000, '2020-12-18 22:46:22', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (63, 216, 10, 10000, '2020-12-18 22:46:34', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (64, 217, 10, 10000, '2020-12-18 22:46:45', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (65, 218, 10, 10000, '2020-12-18 22:46:56', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (66, 219, 10, 10000, '2020-12-18 22:47:10', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (67, 220, 10, 10000, '2020-12-18 22:47:23', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (68, 221, 10, 10000, '2020-12-18 22:47:34', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (69, 222, 10, 10000, '2020-12-18 22:47:45', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (70, 223, 10, 10000, '2020-12-18 22:47:58', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (71, 224, 10, 10000, '2020-12-18 22:48:10', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (72, 225, 10, 10000, '2020-12-18 22:48:21', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (73, 226, 10, 10000, '2020-12-18 22:48:34', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (74, 227, 10, 10000, '2020-12-18 22:48:45', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (75, 228, 10, 10000, '2020-12-18 22:48:58', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (76, 229, 10, 10000, '2020-12-18 22:49:10', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (77, 230, 10, 10000, '2020-12-18 22:49:22', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (78, 231, 10, 10000, '2020-12-18 22:49:34', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (79, 232, 10, 10000, '2020-12-18 22:49:47', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (80, 233, 10, 10000, '2020-12-18 22:49:59', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (81, 234, 10, 10000, '2020-12-18 22:50:11', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (82, 235, 10, 10000, '2020-12-18 22:50:24', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (83, 236, 10, 10000, '2020-12-18 22:50:38', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (84, 237, 10, 10000, '2020-12-18 22:50:50', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (85, 238, 10, 10000, '2020-12-18 22:51:02', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (86, 239, 10, 10000, '2020-12-18 22:51:15', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (87, 240, 10, 10000, '2020-12-19 06:04:31', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (88, 241, 10, 10000, '2020-12-19 06:04:45', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (89, 242, 10, 10000, '2020-12-19 06:04:56', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (90, 243, 10, 10000, '2020-12-19 06:05:09', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (91, 244, 10, 10000, '2020-12-19 06:05:37', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (92, 245, 10, 10000, '2020-12-19 06:05:57', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (93, 246, 10, 10000, '2020-12-19 06:06:10', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (94, 247, 10, 10000, '2020-12-19 06:06:20', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (95, 248, 10, 10000, '2020-12-19 06:06:31', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (96, 249, 10, 10000, '2020-12-19 06:06:51', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (97, 250, 10, 10000, '2020-12-19 06:07:05', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (98, 251, 10, 10000, '2020-12-19 06:07:17', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (99, 252, 10, 10000, '2020-12-19 06:07:29', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (100, 279, 10, 10000, '2020-12-19 06:07:41', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (101, 253, 10, 10000, '2020-12-19 06:07:54', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (102, 254, 10, 10000, '2020-12-19 06:08:06', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (103, 255, 10, 10000, '2020-12-19 06:08:17', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (104, 255, 10, 10000, '2020-12-19 06:08:28', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (105, 256, 10, 10000, '2020-12-19 06:09:10', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (106, 257, 10, 10000, '2020-12-19 06:09:32', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (107, 258, 10, 10000, '2020-12-19 06:09:51', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (108, 259, 10, 10000, '2020-12-19 06:10:08', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (109, 260, 10, 10000, '2020-12-19 06:10:26', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (110, 261, 10, 10000, '2020-12-19 06:10:46', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (111, 262, 10, 10000, '2020-12-19 06:11:08', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (112, 263, 10, 10000, '2020-12-19 06:11:30', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (113, 264, 10, 10000, '2020-12-19 06:11:51', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (114, 265, 10, 10000, '2020-12-19 06:12:20', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (115, 266, 10, 10000, '2020-12-19 06:12:40', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (116, 267, 10, 10000, '2020-12-19 06:12:55', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (117, 268, 10, 10000, '2020-12-19 06:13:10', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (118, 269, 10, 10000, '2020-12-19 06:13:35', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (119, 270, 10, 10000, '2020-12-19 06:13:54', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (120, 271, 10, 10000, '2020-12-19 06:14:10', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (121, 272, 10, 10000, '2020-12-19 06:14:24', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (122, 273, 10, 10000, '2020-12-19 06:14:40', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (123, 274, 10, 10000, '2020-12-19 06:15:01', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (124, 275, 10, 10000, '2020-12-19 06:15:18', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (125, 276, 10, 10000, '2020-12-19 06:15:49', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (126, 277, 10, 10000, '2020-12-19 06:16:15', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (127, 278, 10, 10000, '2020-12-19 06:16:38', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (128, 154, 8, 11000, '2020-11-22 11:06:01', NULL, 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (129, 154, NULL, 100000, '2020-12-22 14:40:55', 'simpanan', 2020, 'Y');
INSERT INTO `tbl_sim_wajib` VALUES (130, 154, 3, 4000, '2020-12-23 21:17:21', NULL, 2020, 'Y');

-- ----------------------------
-- Table structure for tbl_stok_opname
-- ----------------------------
DROP TABLE IF EXISTS `tbl_stok_opname`;
CREATE TABLE `tbl_stok_opname`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_admin` int NULL DEFAULT NULL,
  `id_produk` int NULL DEFAULT NULL,
  `harga` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `stok_awal` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `stok_lapangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `selisih` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_admin`(`id_admin`) USING BTREE,
  INDEX `id_produk`(`id_produk`) USING BTREE,
  CONSTRAINT `tbl_stok_opname_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `tbl_admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_stok_opname_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `tbl_produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_stok_opname
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_transaksi
-- ----------------------------
DROP TABLE IF EXISTS `tbl_transaksi`;
CREATE TABLE `tbl_transaksi`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_admin` int NULL DEFAULT NULL,
  `id_user` int NULL DEFAULT NULL,
  `harga_total` float(11, 2) NULL DEFAULT NULL,
  `status_trx` enum('selesai','batal','dikirim','diproses','aktif','tmp') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ongkir` int NULL DEFAULT NULL,
  `poin_total` int NULL DEFAULT NULL,
  `alamat_kirim` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_hp` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `uang_kembali` int NULL DEFAULT NULL,
  `uang_masuk` int NULL DEFAULT NULL,
  `tgl_transaksi` datetime NULL DEFAULT NULL,
  `id_pembayaran` int NULL DEFAULT NULL,
  `pengiriman` enum('Dikirim','Diambil') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kodeunik` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lokasi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_kirim` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penerima` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_admin`(`id_admin`) USING BTREE,
  INDEX `id_user`(`id_user`) USING BTREE,
  INDEX `tbl_transaksi_ibfk_3`(`id_pembayaran`) USING BTREE,
  CONSTRAINT `tbl_transaksi_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `tbl_admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_transaksi_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_transaksi_ibfk_3` FOREIGN KEY (`id_pembayaran`) REFERENCES `tbl_pembayaran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tbl_transaksi
-- ----------------------------
INSERT INTO `tbl_transaksi` VALUES (1, NULL, 154, 32000.00, 'aktif', NULL, 40, '-', '0', NULL, NULL, '2020-12-23 11:12:44', 1, 'Diambil', 'H6HAE7LI9', NULL, '0', '-');
INSERT INTO `tbl_transaksi` VALUES (2, 9, NULL, 23000.00, 'selesai', NULL, 0, NULL, NULL, NULL, NULL, '2021-01-05 13:12:24', 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_transaksi` VALUES (3, 9, NULL, 23000.00, 'selesai', NULL, 0, NULL, NULL, NULL, NULL, '2021-01-05 13:12:34', 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_transaksi` VALUES (4, 9, NULL, 23000.00, 'selesai', NULL, 0, NULL, NULL, NULL, NULL, '2021-01-05 13:15:11', 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_transaksi` VALUES (5, 9, NULL, 27400.00, 'selesai', NULL, 0, NULL, NULL, NULL, NULL, '2021-01-05 13:15:24', 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_transaksi` VALUES (6, 9, NULL, 64100.00, 'selesai', NULL, 0, NULL, NULL, NULL, NULL, '2021-01-05 13:16:41', 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_transaksi` VALUES (7, 9, NULL, 64100.00, 'selesai', NULL, 0, NULL, NULL, 900, 65000, '2021-01-05 13:16:50', 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_transaksi` VALUES (8, 9, NULL, 36300.00, 'selesai', NULL, 0, NULL, NULL, NULL, NULL, '2021-01-05 13:33:52', 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_transaksi` VALUES (9, 9, NULL, 36300.00, 'selesai', NULL, 0, NULL, NULL, NULL, NULL, '2021-01-05 13:34:22', 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_transaksi` VALUES (10, 9, NULL, 36300.00, 'selesai', NULL, 0, NULL, NULL, 3700, 40000, '2021-01-05 13:34:53', 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_transaksi` VALUES (11, 9, NULL, 11500.00, 'selesai', NULL, 0, NULL, NULL, 3500, 15000, '2021-01-05 13:36:06', 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_transaksi` VALUES (12, 9, NULL, 6200.00, 'selesai', NULL, 0, NULL, NULL, 3800, 10000, '2021-01-05 13:37:46', 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_transaksi` VALUES (13, 9, NULL, 11500.00, 'selesai', NULL, 0, NULL, NULL, 3500, 15000, '2021-01-05 14:34:57', 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_transaksi` VALUES (14, 9, NULL, 5000.00, 'selesai', NULL, 0, NULL, NULL, 5000, 10000, '2021-01-05 14:35:40', 3, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tbl_transaksi_detail
-- ----------------------------
DROP TABLE IF EXISTS `tbl_transaksi_detail`;
CREATE TABLE `tbl_transaksi_detail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_transaksi` int NULL DEFAULT NULL,
  `id_produk` int NULL DEFAULT NULL,
  `jumlah` int NULL DEFAULT NULL,
  `tanggal` datetime NULL DEFAULT NULL,
  `id_user` int NULL DEFAULT NULL,
  `status` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `harga` int NULL DEFAULT NULL,
  `harga_beli` int NULL DEFAULT NULL,
  `total_poin` int NULL DEFAULT NULL,
  `diskon` int NULL DEFAULT NULL,
  `status_trx` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hrg_jual_pritem` int NULL DEFAULT NULL,
  `hrg_beli_pritem` int NULL DEFAULT NULL,
  `isgrosir` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_transaksi`(`id_transaksi`) USING BTREE,
  INDEX `id_produk`(`id_produk`) USING BTREE,
  INDEX `tbl_transaksi_detail_ibfk_3`(`id_user`) USING BTREE,
  CONSTRAINT `tbl_transaksi_detail_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `tbl_produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_transaksi_detail_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_transaksi_detail_ibfk_4` FOREIGN KEY (`id_transaksi`) REFERENCES `tbl_transaksi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 166 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tbl_transaksi_detail
-- ----------------------------
INSERT INTO `tbl_transaksi_detail` VALUES (151, 1, 1, 5, '2020-12-23 11:12:34', 154, 'selesai', 20000, NULL, 25, NULL, 'tmp', NULL, NULL, NULL);
INSERT INTO `tbl_transaksi_detail` VALUES (153, 1, 1, 3, '2020-12-23 11:15:50', 154, 'selesai', 12000, NULL, 15, NULL, 'tmp', NULL, NULL, NULL);
INSERT INTO `tbl_transaksi_detail` VALUES (154, 7, 26, 5, '2021-01-05 13:19:23', NULL, '', 11500, NULL, NULL, 0, 'selesai', NULL, NULL, NULL);
INSERT INTO `tbl_transaksi_detail` VALUES (155, 7, 22, 2, '2021-01-05 13:19:23', NULL, '', 2200, NULL, NULL, 0, 'selesai', NULL, NULL, NULL);
INSERT INTO `tbl_transaksi_detail` VALUES (156, 7, 24, 1, '2021-01-05 13:19:23', NULL, '', 2200, NULL, NULL, 0, 'selesai', NULL, NULL, NULL);
INSERT INTO `tbl_transaksi_detail` VALUES (157, 10, 22, 6, '2021-01-05 13:35:00', NULL, '', 2200, NULL, NULL, 0, 'selesai', NULL, NULL, NULL);
INSERT INTO `tbl_transaksi_detail` VALUES (158, 10, 24, 4, '2021-01-05 13:35:00', NULL, '', 2200, NULL, NULL, 0, 'selesai', NULL, NULL, NULL);
INSERT INTO `tbl_transaksi_detail` VALUES (159, 10, 23, 1, '2021-01-05 13:35:00', NULL, '', 2300, NULL, NULL, 0, 'selesai', NULL, NULL, NULL);
INSERT INTO `tbl_transaksi_detail` VALUES (160, 10, 25, 3, '2021-01-05 13:35:00', NULL, '', 4000, NULL, NULL, 0, 'selesai', NULL, NULL, NULL);
INSERT INTO `tbl_transaksi_detail` VALUES (161, 11, 26, 1, '2021-01-05 13:37:02', NULL, '', 11500, NULL, NULL, 0, 'selesai', NULL, NULL, NULL);
INSERT INTO `tbl_transaksi_detail` VALUES (162, 12, 22, 1, '2021-01-05 13:41:33', NULL, '', 2200, NULL, NULL, 0, 'selesai', NULL, NULL, NULL);
INSERT INTO `tbl_transaksi_detail` VALUES (163, 12, 25, 1, '2021-01-05 13:41:33', NULL, '', 4000, NULL, NULL, 0, 'selesai', NULL, NULL, NULL);
INSERT INTO `tbl_transaksi_detail` VALUES (164, 13, 26, 1, '2021-01-05 14:35:05', NULL, '', 11500, NULL, NULL, 0, 'selesai', NULL, NULL, NULL);
INSERT INTO `tbl_transaksi_detail` VALUES (165, 14, 16, 2, '2021-01-05 14:35:50', NULL, '', 2500, NULL, NULL, 0, 'selesai', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user`  (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `no_anggota` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `level` int NULL DEFAULT NULL,
  `jenis_kelamin` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ktp` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `foto` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `versi` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_hp` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pekerjaan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_kelurahan` int NULL DEFAULT NULL,
  `rt` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rw` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_registrasi` datetime NULL DEFAULT NULL,
  `poin` int NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_firebase` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_user`) USING BTREE,
  INDEX `id_kelurahan`(`id_kelurahan`) USING BTREE,
  CONSTRAINT `tbl_user_ibfk_1` FOREIGN KEY (`id_kelurahan`) REFERENCES `tbl_kelurahan` (`id_kelurahan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 286 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES (1, '002.811004.000043', 'siti khamroin', 3, 'Perempuan', '3316094410800005', 'VFVSQmVVeHFaM2hOVkVGM1RrTTBkMDFFUVhkT1JFMDk=', NULL, NULL, '081228189108', 'Karyawan Swasta', 47, '01', '07', 'Y', '2020-11-07 14:33:20', 0, '', 'Kopranesia');
INSERT INTO `tbl_user` VALUES (126, '02.940310.000026', 'joko tri hariyanto', 3, 'Laki-laki', '33160111003940003', 'VFVSSmRVOVVVWGROZWtWM1RHcEJkMDFFUVhsT1p6MDk=', NULL, NULL, '08995876140', 'tidak berkerja', 99, '08', '02', 'Y', '2020-11-07 10:03:48', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (127, '06.810115.00001', 'Katimun', 3, 'Laki-laki', '3316011501810002', 'VFVSWmRVOUVSWGROVkVVeFRHcEJkMDFFUVhnPQ==', NULL, NULL, '087833005803', 'Karyawan suwasta', 103, '01', '01', 'Y', '2020-07-21 14:36:55', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (128, '010.001117.00002', 'Novita Sari', 3, 'Perempuan', '3316015711000008', 'VFVSRmQweHFRWGROVkVWNFRuazBkMDFFUVhkTlp6MDk=', NULL, NULL, '081326430292', 'Tidak Berkerja', 107, '22', '10', 'Y', '2020-07-21 09:40:59', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (129, '010.990228.00003', 'Edy Saputro', 3, 'Laki-laki', '3316012802990004', 'VFVSRmQweHFhelZOUkVsNVQwTTBkMDFFUVhkTmR6MDk=', NULL, NULL, '081289275571', 'Belum Berkerja', 107, '21', '09', 'Y', '2020-07-21 09:44:49', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (130, '011.991013.00004', 'Sutomo', 3, 'Laki-laki', '3316011310990001', 'VFVSRmVFeHFhelZOVkVGNFRYazBkMDFFUVhkT1FUMDk=', NULL, NULL, '00000', 'Belum Berkerja', 108, '02', '06', 'Y', '2020-07-21 09:49:20', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (131, '03.900312.00005', 'Agung Widodo ', 3, 'Laki-laki', '3315081203900002', 'VFVSTmRVOVVRWGROZWtWNVRHcEJkMDFFUVRFPQ==', NULL, NULL, '0', 'Petani', 100, '01', '04', 'Y', '2020-07-21 09:53:08', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (132, '02.990719.00006', 'Ahmat Alamsyah ', 3, 'Laki-laki', '3316011907990002', 'VFVSSmRVOVVhM2RPZWtVMVRHcEJkMDFFUVRJPQ==', NULL, NULL, '0', 'Belum Berkerja', 99, '47', '09', 'Y', '2020-07-21 09:55:38', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (133, '03.931031.00007', 'Endang Sayuti', 3, 'Perempuan', '3316137110930003', 'VFVSTmRVOVVUWGhOUkUxNFRHcEJkMDFFUVRNPQ==', NULL, NULL, '0', 'Belum Berkerja', 100, '02', '03', 'Y', '2020-07-21 09:57:41', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (134, '05.89091800009', 'Siti Wahyuni', 3, 'Laki-laki', '3316015809890001', 'VFVSVmRVOUVhM2RQVkVVMFRVUkJkMDFFYXowPQ==', NULL, NULL, '0', 'Ibu Rumah Tangga', 102, '02', '04', 'Y', '2020-07-21 10:00:49', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (135, '06.010223.000010', 'Muhammad Rehan Adi Saputra', 3, 'Laki-laki', '3316012302010002', 'VFVSWmRVMUVSWGROYWtsNlRHcEJkMDFFUVhoTlFUMDk=', NULL, NULL, '0', 'Belum Berkerja', 103, '01', '01', 'Y', '2020-07-21 10:02:53', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (136, '03.921005.000011', 'Jeni Andra Wibowo', 3, 'Laki-laki', '3316010510920002', 'VFVSTmRVOVVTWGhOUkVFeFRHcEJkMDFFUVhoTlVUMDk=', NULL, NULL, '082341682323', 'Belum Berkerja', 100, '05', '03', 'Y', '2020-07-21 10:06:10', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (137, '03.930804000012', 'Titi Purnamasari', 3, 'Perempuan', '3316014408930001', 'VFVSTmRVOVVUWGRQUkVFd1RVUkJkMDFFUlhrPQ==', NULL, NULL, '085228379685', 'Belum Berkerja', 100, '01', '05', 'Y', '2020-07-21 10:08:22', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (138, '02.741221.000013', 'Bambang Mashadi', 3, 'Laki-laki', '3316012112740001', 'VFVSSmRVNTZVWGhOYWtsNFRHcEJkMDFFUVhoTmR6MDk=', NULL, NULL, '081391615171', 'wiraswasta', 99, '013', '002', 'Y', '2020-07-21 10:10:21', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (139, '03.870421.000014', 'Sriyanto', 3, 'Laki-laki', '3316012104870002', 'VFVSTmRVOUVZM2RPUkVsNFRHcEJkMDFFUVhoT1FUMDk=', NULL, NULL, '0', 'Karyawan Swasta', 100, '02', '03', 'Y', '2020-07-21 10:11:45', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (140, '03.021102.000015', 'Sahrul Ramadan', 3, 'Laki-laki', '3316010211020001', 'VFVSTmRVMUVTWGhOVkVGNVRHcEJkMDFFUVhoT1VUMDk=', NULL, NULL, '0', 'Belum Berkerja', 100, '002', '003', 'Y', '2020-07-21 10:13:13', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (141, '02.970731.000016', 'Dewi Anggraeni', 3, 'Perempuan', '3316017107970001', 'VFVSSmRVOVVZM2RPZWsxNFRHcEJkMDFFUVhoT1p6MDk=', NULL, NULL, '081234486332', 'Belum Berkerja', 99, '07', '01', 'Y', '2020-07-21 10:16:26', 0, 'anggra97eni@gmail.com', NULL);
INSERT INTO `tbl_user` VALUES (142, '02.680506.000017', 'Agus Supriyono', 3, 'Laki-laki', '3316010605680002', 'VFVSSmRVNXFaM2RPVkVFeVRHcEJkMDFFUVhoT2R6MDk=', NULL, NULL, '0', 'Tentara Nasional Indonesia', 99, '30', '005', 'Y', '2020-07-21 10:18:16', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (143, '03.000529.000018', 'Sofa Deni Rahmawati', 3, 'Perempuan', '3316016905000001', 'VFVSTmRVMUVRWGRPVkVrMVRHcEJkMDFFUVhoUFFUMDk=', NULL, NULL, '0', 'Belum Berkerja', 100, '005', '003', 'Y', '2020-07-21 10:19:36', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (144, '05.980430.000020', 'Siti Rumiyanti', 3, 'Perempuan', '3316017004980002', 'VFVSVmRVOVVaM2RPUkUxM1RHcEJkMDFFUVhsTlFUMDk=', NULL, NULL, '0', 'Belum Berkerja', 102, '002', '002', 'Y', '2020-07-21 10:20:52', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (145, '07.940705.000022', 'Yudi Kurniawan', 3, 'Laki-laki', '3316010507940004', 'VFVSamRVOVVVWGRPZWtFeFRHcEJkMDFFUVhsTlp6MDk=', NULL, NULL, '083893769591', 'Belum Berkerja', 104, '010', '006', 'Y', '2020-07-21 10:22:42', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (146, '03.000328.000023', 'Ary Adi Sucipto', 3, 'Laki-laki', '3316012803000002', 'VFVSTmRVMUVRWGROZWtrMFRHcEJkMDFFUVhsTmR6MDk=', NULL, NULL, '0', 'Belum Berkerja', 100, '001', '005', 'Y', '2020-07-21 10:24:15', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (147, '00000000', 'Darji', 3, 'Laki-laki', '0000', 'VFVSQmQwMUVRWGROUkVFOQ==', NULL, NULL, '000', 'Petani', 108, '06', '02', 'Y', '2020-07-21 10:36:21', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (148, '03.890310.000021', 'Jaman', 3, 'Laki-laki', '3316011003890004', 'VFVSTmRVOUVhM2ROZWtWM1RHcEJkMDFFUVhsTlVUMDk=', NULL, NULL, '00000000000000', 'Belum Berkerja', 100, '02', '02', 'Y', '2020-07-21 16:55:31', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (149, '001.000000.000019', 'Ipsin Umi Rahayu', 3, 'Perempuan', '6026111970002', 'VFVSQmVFeHFRWGROUkVGM1RVTTBkMDFFUVhkTlZHczk=', NULL, NULL, '082313797086', 'Belum Berkerja', 239, '04', '01', 'Y', '2020-07-21 14:31:28', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (150, '02.870723.000025', 'Lucky Nufiadrian F', 3, 'Laki-laki', '3316012307870002', 'VFVSSmRVOUVZM2RPZWtsNlRHcEJkMDFFUVhsT1VUMDk=', NULL, NULL, '0000000000', 'Belum Berkerja', 99, '016', '03', 'Y', '2020-07-21 11:34:34', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (151, '03.930607.000024', 'Safei', 3, 'Laki-laki', '3316010706930001', 'VFVSTmRVOVVUWGRPYWtFelRHcEJkMDFFUVhsT1FUMDk=', NULL, NULL, '00000', 'Belum Berkerja', 100, '08', '05', 'Y', '2020-07-21 10:45:02', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (152, '003.760610.000043', 'Hadi Suharto', 3, 'Laki-laki', '3174011006760019', 'VFVSQmVreHFZekpOUkZsNFRVTTBkMDFFUVhkT1JFMDk=', NULL, NULL, '08128683511', 'karyawan swasta', 298, '06', '06', 'Y', '2020-11-09 14:31:50', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (153, '02.010612.000027', 'Ersa sevia nalurita', 3, 'Perempuan', '3316015206010001', 'VFVSSmRVMUVSWGRPYWtWNVRHcEJkMDFFUVhsT2R6MDk=', NULL, NULL, '085848995975', 'belum berkerja', 99, '22', '04', 'Y', '2020-11-09 10:12:53', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (154, '123.000.123', 'M.Toha Mustofa', 3, 'Laki-laki', '1234567890', 'VFZSSmVreHFRWGROUXpSNFRXcE5QUT09', NULL, '1.0.3', '088888', 'Karyawan Swasta', 298, '01', '06', 'Y', '2020-11-09 14:07:22', 0, 'imamjvofficial@gmail.com', 'Firebase Reg Id is not received yet!');
INSERT INTO `tbl_user` VALUES (155, '02.970824.000028', 'Dwi Fajar Wahyu Prasetyo', 3, 'Laki-laki', '3316012408970001', 'VFVSSmRVOVVZM2RQUkVrd1RHcEJkMDFFUVhsUFFUMDk=', NULL, NULL, '081542503900', 'karyawan swasta', 100, '09', '05', 'Y', '2020-11-17 12:00:12', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (156, '02.010604.000029', 'Erlingga Tito Maulana', 3, 'Perempuan', '3316014406010002', 'VFVSSmRVMUVSWGRPYWtFd1RHcEJkMDFFUVhsUFVUMDk=', NULL, NULL, '0812325658467', 'karyawan swasta', 99, '32', '05', 'Y', '2020-10-31 13:35:53', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (157, '06.931001.000030', 'suliyati', 3, 'Perempuan', '3316014110930001', 'VFVSWmRVOVVUWGhOUkVGNFRHcEJkMDFFUVhwTlFUMDk=', NULL, NULL, '081290290861', 'wiraswasta', 103, '01', '04', 'Y', '2020-11-10 14:06:19', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (158, '06.690909.000031', 'sulastri', 3, 'Perempuan', '3316014909690003', 'VFVSWmRVNXFhM2RQVkVFMVRHcEJkMDFFUVhwTlVUMDk=', NULL, NULL, '08190290861', 'petani', 103, '01', '04', 'Y', '2020-11-10 14:09:24', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (159, '06.581231.000032', 'marno', 3, 'Laki-laki', '3316013112580015', 'VFVSWmRVNVVaM2hOYWsxNFRHcEJkMDFFUVhwTlp6MDk=', NULL, NULL, '0', 'petani', 103, '01', '04', 'Y', '2020-11-11 14:13:12', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (160, '06.010509.000033', 'nur asti wulandari', 3, 'Perempuan', '3316014905010001', 'VFVSWmRVMUVSWGRPVkVFMVRHcEJkMDFFUVhwTmR6MDk=', NULL, NULL, '0', 'belum berkerja', 103, '02', '04', 'Y', '2020-11-12 14:25:03', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (161, '05.98001.000034', 'adriyan puguh rahmadan', 3, 'Laki-laki', '3316010104980004', 'VFVSVmRVOVVaM2ROUkVWMVRVUkJkMDFFVFRBPQ==', NULL, NULL, '0', 'belum berkerja', 102, '04', '03', 'Y', '2020-11-12 14:27:56', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (162, '03.021228.0000', 'deby dwi kirana', 3, 'Perempuan', '3316016812020002', 'VFVSTmRVMUVTWGhOYWtrMFRHcEJkMDFFUVQwPQ==', NULL, NULL, '087764846692', 'belum berkerja', 100, '02', '07', 'Y', '2020-11-11 14:58:22', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (163, '02.75129.000036', 'sri rahayu', 3, 'Perempuan', '316016912750002', 'VFVSSmRVNTZWWGhOYW10MVRVUkJkMDFFVFRJPQ==', NULL, NULL, '081227921703', 'wiraswasta', 99, '03', '01', 'Y', '2020-11-12 15:02:05', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (164, '05.760712.000037', 'haryanti', 3, 'Perempuan', '3316015207760003', 'VFVSVmRVNTZXWGRPZWtWNVRHcEJkMDFFUVhwT2R6MDk=', NULL, NULL, '085327447552', 'petani', 102, '03', '03', 'Y', '2020-11-12 15:17:18', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (165, '010.710406.000038', 'suyono', 3, 'Laki-laki', '3316010604710003', 'VFVSRmQweHFZM2hOUkZGM1RtazBkMDFFUVhkTmVtYzk=', NULL, NULL, '085925758250', 'wiraswasta', 107, '19', '08', 'Y', '2020-11-11 15:19:54', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (166, '010.030324.000039', 'amelia nuraningtias', 3, 'Perempuan', '3316016403030002', 'VFVSRmQweHFRWHBOUkUxNVRrTTBkMDFFUVhkTmVtczk=', NULL, NULL, '085925758250', 'belum berkerja', 107, '019', '08', 'Y', '2020-11-12 15:31:07', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (167, '08.760820.000040', 'sarni', 3, 'Perempuan', '3316016008760001', 'VFVSbmRVNTZXWGRQUkVsM1RHcEJkMDFFUVRCTlFUMDk=', NULL, NULL, '085848963491', 'belum berkerja', 107, '16', '06', 'Y', '2020-11-12 15:30:33', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (168, '02.761014.000041', 'yuyun haryati ', 3, 'Laki-laki', '3316015410750004', 'VFVSSmRVNTZXWGhOUkVVd1RHcEJkMDFFUVRCTlVUMDk=', NULL, NULL, '08215318600', 'wiraswasta', 99, '37', '06', 'Y', '2020-11-09 15:36:21', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (169, '02.760308.000042', 'muchamad darusman', 3, 'Laki-laki', '3316010803760001', 'VFVSSmRVNTZXWGROZWtFMFRHcEJkMDFFUVRCTlp6MDk=', NULL, NULL, '081339909287', 'wiraswasta', 99, '21', '03', 'Y', '2020-11-13 15:45:41', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (170, '02.760308.000042', 'muchamad darusman', 3, 'Laki-laki', '3316010803760001', 'VFVSSmRVNTZXWGROZWtFMFRHcEJkMDFFUVRCTlp6MDk=', NULL, NULL, '081339909287', 'wiraswasta', 99, '21', '03', 'Y', '2020-11-13 15:45:41', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (171, '004.811004.000043', 'siti khamroin', 3, 'Perempuan', '3316094410800005', 'VFVSQk1FeHFaM2hOVkVGM1RrTTBkMDFFUVhkT1JFMDk=', NULL, NULL, '081228189108', 'karyawan swasta', 47, '01', '07', 'Y', '2020-11-13 15:48:45', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (172, '02.871210.000044', 'destu praponco', 3, 'Laki-laki', '3316011012870002', 'VFVSSmRVOUVZM2hOYWtWM1RHcEJkMDFFUVRCT1FUMDk=', NULL, NULL, '081326669166', 'wiraswasta', 99, '40', '06', 'Y', '2020-11-13 16:03:33', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (173, '02.730931.000045', 'sukirin', 3, 'Laki-laki', '000', 'VFVSSmRVNTZUWGRQVkUxNFRHcEJkMDFFUVRCT1VUMDk=', NULL, NULL, '082322090035', 'wiraswasta', 99, '00', '00', 'Y', '2020-11-11 16:08:53', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (174, '005.910511.000047', 'may doni saputro', 3, 'Laki-laki', '3201371105910005', 'VFVSQk1VeHFhM2hOUkZWNFRWTTBkMDFFUVhkT1JHTTk=', NULL, NULL, '0812868683511', 'wiraswasta', 41, '01', '11', 'Y', '2020-11-08 16:29:05', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (175, '005.910511.000047', 'may doni saputro', 3, 'Laki-laki', '3201371105910005', 'VFVSQk1VeHFhM2hOUkZWNFRWTTBkMDFFUVhkT1JHTTk=', NULL, NULL, '0812868683511', 'wiraswasta', 41, '01', '11', 'Y', '2020-11-08 16:29:05', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (176, '006.981012.000048', 'riris andikasaputra', 3, 'Laki-laki', '3316081210980001', 'VFVSQk1reHFhelJOVkVGNFRXazBkMDFFUVhkT1JHYzk=', NULL, NULL, '0', 'wiraswasta', 143, '04', '06', 'Y', '2020-11-12 16:34:24', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (177, '007.931005.000049', 'dhanny hamid ustady', 3, 'Laki-laki', '3316090510930001', 'VFVSQk0weHFhM3BOVkVGM1RsTTBkMDFFUVhkT1JHczk=', NULL, NULL, '0', 'wiraswasta', 21, '02', '01', 'Y', '2020-11-14 17:06:38', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (178, '008.951019.000050', 'okta pradita kusuma putra', 3, 'Laki-laki', '331611910950001', 'VFVSQk5FeHFhekZOVkVGNFQxTTBkMDFFUVhkT1ZFRTk=', NULL, NULL, '0', 'wiraswasta', 21, '00', '00', 'Y', '2020-11-12 17:15:00', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (179, '007.851105.000055', 'farida yuni kurniawan', 3, 'Laki-laki', '3315084511850004', 'VFVSQk0weHFaekZOVkVWM1RsTTBkMDFFUVhkT1ZGVTk=', NULL, NULL, '0', 'wiraswasta', 21, '02', '03', 'Y', '2020-11-13 17:18:02', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (180, '3316100030109.49', 'Teguh Ratmono, S.Kep', 3, 'Laki-laki', '3316160303700001', 'VFhwTmVFNXFSWGROUkVGNlRVUkZkMDlUTkRCUFVUMDk=', NULL, '1.0.3', '0', 'Perawat', 38, '1', '2', 'Y', '2020-12-04 21:14:42', 0, '', 'Indora');
INSERT INTO `tbl_user` VALUES (181, '3316100030109.000', 'Toha', 3, 'Laki-laki', '3370111508700001', 'VFhwTmVFNXFSWGROUkVGNlRVUkZkMDlUTkhkTlJFRTk=', NULL, '1.0.1', '0', 'ASN', 39, '2', '1', 'Y', '2020-12-04 21:45:43', 0, '', 'Indora');
INSERT INTO `tbl_user` VALUES (182, '3316100030109.001', 'irhamna', 3, 'Perempuan', '3316160303700002', 'VFhwTmVFNXFSWGROUkVGNlRVUkZkMDlUTkhkTlJFVTk=', NULL, NULL, '0', 'mahasiswa', 291, '1', '3', 'Y', '2020-12-13 10:29:50', 0, 'irhamnanaa@gmail.com', NULL);
INSERT INTO `tbl_user` VALUES (183, '5066002', 'Suraji, S. Pd', 3, 'Laki-laki', '3316110506600002', 'VGxSQk1rNXFRWGROWnowOQ==', NULL, '1.0.2', '0', 'PNS', 9, '8', '1', 'Y', '2020-12-13 21:32:07', 0, '', 'edVW8cVFRkw:APA91bGMvPl-ipgRHHX7PuWZcf2zP57OtdkPlTtqOYs4x8qt7txrC7p2G74UMhPz3ch3Qr1LETr5k7CyuI1cErgC3j8yUT0WTnw4LISk3XVTgQ6UkEWfQZWdtNGHVmBRig-42_RF-PBU');
INSERT INTO `tbl_user` VALUES (184, '11101072', 'Bagus', 3, 'Laki-laki', '3302317929581002', 'VFZSRmVFMUVSWGRPZWtrOQ==', NULL, '1.0.3', '081906369911', 'PNS', 244, '2', '1', 'Y', '2020-12-14 07:18:30', 0, '', 'Indora');
INSERT INTO `tbl_user` VALUES (185, '11101073', 'Agus Widodo', 3, 'Laki-laki', '3302317929581001', 'VFZSRmVFMUVSWGRPZWswOQ==', NULL, NULL, '081906369912', 'PNS', 290, '2', '3', 'Y', '2020-12-14 07:19:32', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (186, '001', 'Muhammad Rosyidi', 3, 'Laki-laki', '3316110505960003', 'VFVSQmVBPT0=', NULL, '1.0.2', '085291987993', 'pegawai swasta', 6, '008', '001', 'Y', '2020-12-14 08:11:03', 0, 'rosyidridho41@gmail.com', 'Indora');
INSERT INTO `tbl_user` VALUES (187, '002', 'yuliana', 3, 'Perempuan', '655644', 'VFVSQmVRPT0=', NULL, '1.0.2', '083876654435', 'pegawai swasta', 282, '01', '05', 'Y', '2020-12-14 10:33:48', 0, 'yulianasaraswati993@gmail.com', 'Indora');
INSERT INTO `tbl_user` VALUES (188, '0052', 'brigita', 3, 'Perempuan', '33010', 'VFVSQk1VMW5QVDA9', NULL, NULL, '0', 'swasta', 21, '01', '02', 'Y', '2020-12-15 09:28:31', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (189, '19001', 'Daryanto', 3, 'Laki-laki', '19001', 'VFZScmQwMUVSVDA9', NULL, '1.0.3', '0858866325999', 'Swasta', 29, '01', '01', 'Y', '2020-12-18 12:56:13', 0, '', 'cbPbuEgGbk0:APA91bF2RKcZBaxDUUYYeEeXOsfdLoizhud7_vzhq1QluQ2H4X0YTv7FBLfnS59d1DN7ek_ruspGsQUKK3Dfjg4lYoMBZuVXQOE-60_X7AwXfA8wvaGTRM3mGwgmD9hz06ztg4ix2sRG');
INSERT INTO `tbl_user` VALUES (190, '19002', 'Ririn', 3, 'Perempuan', '19002', 'VFZScmQwMUVTVDA9', NULL, NULL, '085292149513', 'Swasta', 29, '01', '01', 'Y', '2020-12-18 12:57:54', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (191, '19003', 'Ade Rahmad', 3, 'Laki-laki', '19003', 'VFZScmQwMUVUVDA9', NULL, NULL, '082137237372', 'Swasta', 29, '01', '01', 'Y', '2020-12-18 12:59:12', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (192, '19004', 'Perumnas', 3, 'Laki-laki', '19004', 'VFZScmQwMUVVVDA9', NULL, NULL, '081228331163', 'Swasta', 29, '01', '01', 'Y', '2020-12-18 13:00:30', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (193, '19005', 'Harto', 3, 'Laki-laki', '19005', 'VFZScmQwMUVWVDA9', NULL, NULL, '085848965900', 'Swasta', 29, '01', '01', 'Y', '2020-12-18 13:01:36', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (194, '19006', 'Marni', 3, 'Perempuan', '19006', 'VFZScmQwMUVXVDA9', NULL, '1.0.2', '082314602626', 'Swasta', 29, '01', '01', 'Y', '2020-12-18 13:02:30', 0, '', 'Indora');
INSERT INTO `tbl_user` VALUES (195, '19007', 'Tiah', 3, 'Perempuan', '19007', 'VFZScmQwMUVZejA9', NULL, NULL, '085230607239', 'Swasta', 29, '01', '01', 'Y', '2020-12-18 13:03:28', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (196, '19008', 'Djasmo', 3, 'Laki-laki', '3316091303590001', 'VFZScmQwMUVaejA9', NULL, NULL, '0', 'Swasta', 29, '01', '01', 'Y', '2020-12-18 21:39:07', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (197, '19009', '-', 3, 'Laki-laki', '0', 'VFZScmQwMUVhejA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 21:54:48', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (198, '19010', '-', 3, 'Laki-laki', '0', 'VFZScmQwMVVRVDA9', NULL, '1.0.3', '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 21:56:30', 0, '', 'fk1sqnMEbx0:APA91bFZQqnoqpg-yiKwTXGw3L5J1mv2cCzicgtOJ43Wpj2Se4NscpokM7NtJyAkY38-h6ZgN7zfCVAMJT-ok4_Kbo5KlO0NBv2GBYeplr-BEe4A5Z4bnT2WRQdbBXMAfRfc5PgpEtTe');
INSERT INTO `tbl_user` VALUES (199, '19011', '-', 3, 'Laki-laki', '0', 'VFZScmQwMVVSVDA9', NULL, '1.0.3', '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 21:57:05', 0, '', 'Indora');
INSERT INTO `tbl_user` VALUES (200, '19012', '-', 3, 'Laki-laki', '0', 'VFZScmQwMVVTVDA9', NULL, '1.0.3', '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 21:57:37', 0, '', 'Indora');
INSERT INTO `tbl_user` VALUES (201, '19013', '-', 3, 'Laki-laki', '0', 'VFZScmQwMVVUVDA9', NULL, '1.0.3', '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 21:58:23', 0, '', 'Indora');
INSERT INTO `tbl_user` VALUES (202, '19014', '-', 3, 'Laki-laki', '0', 'VFZScmQwMVVVVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 21:59:39', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (204, '19015', '-', 3, 'Laki-laki', '', 'VFZScmQwMVVWVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:01:18', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (205, '19016', '-', 3, 'Laki-laki', '0', 'VFZScmQwMVVXVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:02:00', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (206, '19017', '-', 3, 'Laki-laki', '0', 'VFZScmQwMVVZejA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:02:29', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (207, '19018', '-', 3, 'Laki-laki', '0', 'VFZScmQwMVVaejA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:03:03', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (208, '19019', '-', 3, 'Laki-laki', '0', 'VFZScmQwMVVhejA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:03:30', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (209, '19020', '-', 3, 'Laki-laki', '0', 'VFZScmQwMXFRVDA9', NULL, '1.0.3', '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:04:01', 0, '', 'Indora');
INSERT INTO `tbl_user` VALUES (210, '19021', '-', 3, 'Laki-laki', '0', 'VFZScmQwMXFSVDA9', NULL, '1.0.3', '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:04:31', 0, '', 'Indora');
INSERT INTO `tbl_user` VALUES (211, '19022', '-', 3, 'Laki-laki', '0', 'VFZScmQwMXFTVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:05:02', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (212, '19023', '-', 3, 'Laki-laki', '0', 'VFZScmQwMXFUVDA9', NULL, '1.0.3', '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:05:28', 0, '', 'Indora');
INSERT INTO `tbl_user` VALUES (213, '19024', '-', 3, 'Laki-laki', '0', 'VFZScmQwMXFVVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:05:57', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (214, '19025', '-', 3, 'Laki-laki', '0', 'VFZScmQwMXFWVDA9', NULL, '1.0.3', '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:06:23', 0, '', 'Indora');
INSERT INTO `tbl_user` VALUES (215, '19026', '-', 3, 'Laki-laki', '0', 'VFZScmQwMXFXVDA9', NULL, '1.0.3', '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:06:48', 0, '', 'Indora');
INSERT INTO `tbl_user` VALUES (216, '19027', '-', 3, 'Laki-laki', '0', 'VFZScmQwMXFZejA9', NULL, '1.0.3', '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:08:17', 0, '', 'Indora');
INSERT INTO `tbl_user` VALUES (217, '19028', '-', 3, 'Laki-laki', '0', 'VFZScmQwMXFaejA9', NULL, '1.0.3', '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:09:09', 0, '', 'Indora');
INSERT INTO `tbl_user` VALUES (218, '19029', '-', 3, 'Laki-laki', '0', 'VFZScmQwMXFhejA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:10:59', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (219, '19030', '-', 3, 'Laki-laki', '0', 'VFZScmQwMTZRVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:11:57', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (220, '19031', '-', 3, 'Laki-laki', '0', 'VFZScmQwMTZSVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:12:49', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (221, '19032', '-', 3, 'Laki-laki', '0', 'VFZScmQwMTZTVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:13:22', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (222, '19033', '-', 3, 'Laki-laki', '0', 'VFZScmQwMTZUVDA9', NULL, '1.0.3', '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:13:50', 0, '', 'Indora');
INSERT INTO `tbl_user` VALUES (223, '19034', '-', 3, 'Laki-laki', '0', 'VFZScmQwMTZVVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:14:19', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (224, '19035', '-', 3, 'Laki-laki', '0', 'VFZScmQwMTZWVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:14:49', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (225, '19036', '-', 3, 'Laki-laki', '0', 'VFZScmQwMTZXVDA9', NULL, '1.0.3', '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:15:39', 0, '', 'Indora');
INSERT INTO `tbl_user` VALUES (226, '19037', '-', 3, 'Laki-laki', '0', 'VFZScmQwMTZZejA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:16:07', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (227, '19038', '-', 3, 'Laki-laki', '0', 'VFZScmQwMTZaejA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:16:34', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (228, '19039', '-', 3, 'Laki-laki', '0', 'VFZScmQwMTZhejA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:17:11', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (229, '19040', '-', 3, 'Laki-laki', '0', 'VFZScmQwNUVRVDA9', NULL, '1.0.3', '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:17:44', 0, '', 'Indora');
INSERT INTO `tbl_user` VALUES (230, '19041', '-', 3, 'Laki-laki', '0', 'VFZScmQwNUVSVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:18:26', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (231, '19042', '-', 3, 'Laki-laki', '0', 'VFZScmQwNUVTVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:18:51', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (232, '19043', '-', 3, 'Laki-laki', '0', 'VFZScmQwNUVUVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:19:25', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (233, '19044', '-', 3, 'Laki-laki', '0', 'VFZScmQwNUVVVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:19:52', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (234, '19045', '-', 3, 'Laki-laki', '0', 'VFZScmQwNUVWVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:20:20', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (235, '19046', '-', 3, 'Laki-laki', '0', 'VFZScmQwNUVXVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:20:51', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (236, '19047', '-', 3, 'Laki-laki', '0', 'VFZScmQwNUVZejA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:21:25', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (237, '19048', '-', 3, 'Laki-laki', '0', 'VFZScmQwNUVaejA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:21:51', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (238, '19049', '-', 3, 'Laki-laki', '0', 'VFZScmQwNUVhejA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:22:34', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (239, '19050', '-', 3, 'Laki-laki', '0', 'VFZScmQwNVVRVDA9', NULL, '1.0.3', '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-18 22:23:11', 0, '', 'Indora');
INSERT INTO `tbl_user` VALUES (240, '19051', '-', 3, 'Laki-laki', '0', 'VFZScmQwNVVSVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 04:56:20', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (241, '19052', '-', 3, 'Laki-laki', '0', 'VFZScmQwNVVTVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 04:56:54', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (242, '19053', '-', 3, 'Laki-laki', '0', 'VFZScmQwNVVUVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 04:57:31', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (243, '19054', '-', 3, 'Laki-laki', '0', 'VFZScmQwNVVVVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:02:38', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (244, '19055', '-', 3, 'Laki-laki', '0', 'VFZScmQwNVVWVDA9', NULL, '1.0.3', '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:03:10', 0, '', 'dtoEX3Up5vI:APA91bEPoGFtQgFw0R5NI1IAVVV5eBzi642QP-MOrU9K8OMWGik6oNK7wk1Utcm-Ij7YfbZI-tvk7Lc7_TUl0J5OpgB77T6ZN5upTHRosMgGlvacxYAEDaen6m8yWyVlqzTqjLJ1I373');
INSERT INTO `tbl_user` VALUES (245, '19056', '-', 3, 'Laki-laki', '0', 'VFZScmQwNVVXVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:03:40', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (246, '19057', '-', 3, 'Laki-laki', '0', 'VFZScmQwNVVZejA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:04:44', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (247, '19058', '-', 3, 'Laki-laki', '0', 'VFZScmQwNVVaejA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:05:11', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (248, '19059', '-', 3, 'Laki-laki', '0', 'VFZScmQwNVVhejA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:05:41', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (249, '19060', '-', 3, 'Laki-laki', '0', 'VFZScmQwNXFRVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:06:08', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (250, '19061', '-', 3, 'Laki-laki', '0', 'VFZScmQwNXFSVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:06:36', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (251, '19062', '-', 3, 'Laki-laki', '0', 'VFZScmQwNXFTVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:09:01', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (252, '19063', '-', 3, 'Laki-laki', '0', 'VFZScmQwNXFUVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:09:32', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (253, '19065', '-', 3, 'Laki-laki', '0', 'VFZScmQwNXFWVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:10:08', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (254, '19066', '-', 3, 'Laki-laki', '0', 'VFZScmQwNXFXVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:10:34', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (255, '19067', '-', 3, 'Laki-laki', '0', 'VFZScmQwNXFZejA9', NULL, '1.0.3', '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:11:02', 0, '', 'Indora');
INSERT INTO `tbl_user` VALUES (256, '19068', '-', 3, 'Laki-laki', '0', 'VFZScmQwNXFaejA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:12:02', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (257, '19069', '-', 3, 'Laki-laki', '0', 'VFZScmQwNXFhejA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:12:55', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (258, '19070', '-', 3, 'Laki-laki', '0', 'VFZScmQwNTZRVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:13:24', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (259, '19071', '-', 3, 'Laki-laki', '0', 'VFZScmQwNTZSVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:13:54', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (260, '19072', '-', 3, 'Laki-laki', '0', 'VFZScmQwNTZTVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:14:20', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (261, '19073', '-', 3, 'Laki-laki', '0', 'VFZScmQwNTZUVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:14:48', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (262, '19074', '-', 3, 'Laki-laki', '0', 'VFZScmQwNTZVVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:15:16', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (263, '19075', '-', 3, 'Laki-laki', '', 'VFZScmQwNTZWVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:15:44', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (264, '19076', '-', 3, 'Laki-laki', '0', 'VFZScmQwNTZXVDA9', NULL, '1.0.3', '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:16:10', 0, '', 'Indora');
INSERT INTO `tbl_user` VALUES (265, '19077', '-', 3, 'Laki-laki', '0', 'VFZScmQwNTZZejA9', NULL, '1.0.3', '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:16:42', 0, '', 'Indora');
INSERT INTO `tbl_user` VALUES (266, '19078', '-', 3, 'Laki-laki', '0', 'VFZScmQwNTZaejA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:27:01', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (267, '19079', '-', 3, 'Laki-laki', '0', 'VFZScmQwNTZhejA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:27:30', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (268, '19080', '-', 3, 'Laki-laki', '0', 'VFZScmQwOUVRVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:27:59', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (269, '19081', '-', 3, 'Laki-laki', '0', 'VFZScmQwOUVSVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:28:25', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (270, '19082', '-', 3, 'Laki-laki', '0', 'VFZScmQwOUVTVDA9', NULL, '1.0.3', '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:28:51', 0, '', 'f4boguyU1xM:APA91bGPvTe-AiQEx_D3WjJPo1IAi9P1wTikBLIMc35CMW4d-rn0TkhWFwOtLADzn4w8JHaRPR-v3oO1jz0JJtfQetn7dmmqD1XbKm6XgNREx7bgtxlV2s066zSlOvErQmDCxSMvLfcf');
INSERT INTO `tbl_user` VALUES (271, '19083', '-', 3, 'Laki-laki', '0', 'VFZScmQwOUVUVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:29:20', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (272, '19084', '-', 3, 'Laki-laki', '0', 'VFZScmQwOUVVVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:29:45', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (273, '19085', '-', 3, 'Laki-laki', '0', 'VFZScmQwOUVWVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:32:42', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (274, '19086', '-', 3, 'Laki-laki', '', 'VFZScmQwOUVXVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:33:04', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (275, '19087', '-', 3, 'Laki-laki', '0', 'VFZScmQwOUVZejA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:33:26', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (276, '19088', '-', 3, 'Laki-laki', '0', 'VFZScmQwOUVaejA9', NULL, '1.0.3', '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:33:50', 0, '', 'Indora');
INSERT INTO `tbl_user` VALUES (277, '19089', '-', 3, 'Laki-laki', '0', 'VFZScmQwOUVhejA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:34:14', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (278, '19090', '-', 3, 'Laki-laki', '0', 'VFZScmQwOVVRVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:34:41', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (279, '19064', '-', 3, 'Laki-laki', '0', 'VFZScmQwNXFVVDA9', NULL, NULL, '0', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 05:59:01', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (280, '20001', 'Rusman', 3, 'Laki-laki', '0', 'VFdwQmQwMUVSVDA9', NULL, NULL, '085747064595', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 08:36:57', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (281, '20002', 'Budi', 3, 'Laki-laki', '0', 'VFdwQmQwMUVTVDA9', NULL, NULL, '081326510427', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 08:36:23', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (282, '20003', 'Damiati', 3, 'Perempuan', '0', 'VFdwQmQwMUVUVDA9', NULL, NULL, '081331420643', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 08:38:28', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (283, '20004', 'Suhirmanto', 3, 'Laki-laki', '0', 'VFdwQmQwMUVVVDA9', NULL, NULL, '0895320999417', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 08:39:27', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (284, '20006', 'Mujahid', 3, 'Laki-laki', '0', 'VFdwQmQwMUVXVDA9', NULL, NULL, '081326290023', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 08:40:42', 0, '', NULL);
INSERT INTO `tbl_user` VALUES (285, '20006', 'Sarwo', 3, 'Laki-laki', '0', 'VFdwQmQwMUVXVDA9', NULL, NULL, '085225430965', 'Swasta', 21, '01', '01', 'Y', '2020-12-19 08:41:34', 0, '', NULL);

-- ----------------------------
-- View structure for v_bayar_apk
-- ----------------------------
DROP VIEW IF EXISTS `v_bayar_apk`;
CREATE  VIEW `v_bayar_apk` AS SELECT
	tbl_bayar_apk.id, 
	tbl_user.id_user, 
	tbl_user.no_anggota, 
	tbl_user.nama, 
	tbl_bayar_apk.tgl, 
	tbl_bayar_apk.nominal, 
	tbl_bayar_apk.file, 
	tbl_bayar_apk.verif, 
	tbl_bayar_apk.simpanan, 
	tbl_bayar_apk.tgl_verif, 
	tbl_bayar_apk.id_admin, 
	tbl_admin.nama AS nama_admin
FROM
	tbl_bayar_apk
	LEFT JOIN
	tbl_user
	ON 
		tbl_bayar_apk.id_user = tbl_user.id_user
	LEFT JOIN
	tbl_admin
	ON 
		tbl_bayar_apk.id_admin = tbl_admin.id ;

-- ----------------------------
-- View structure for v_belanja_motong_sukarela
-- ----------------------------
DROP VIEW IF EXISTS `v_belanja_motong_sukarela`;
CREATE  VIEW `v_belanja_motong_sukarela` AS select `tbl_transaksi`.`id_user` AS `id_user`,ifnull(sum(`tbl_transaksi`.`harga_total`),0) AS `belanja_sukarela`,ifnull(sum(`tbl_transaksi`.`poin_total`),0) AS `poin_sukarela` from `tbl_transaksi` where `tbl_transaksi`.`id_pembayaran` = '1' and `tbl_transaksi`.`status_trx` <> 'batal' or `tbl_transaksi`.`status_trx` <> 'tmp' group by `tbl_transaksi`.`id_user` ;

-- ----------------------------
-- View structure for v_detail_transaksi
-- ----------------------------
DROP VIEW IF EXISTS `v_detail_transaksi`;
CREATE  VIEW `v_detail_transaksi` AS select `tbl_transaksi`.`id` AS `id`,`tbl_transaksi_detail`.`jumlah` AS `jumlah`,`tbl_transaksi`.`harga_total` AS `harga_total`,`tbl_produk`.`nama` AS `nama`,`tbl_produk`.`diskon` AS `diskon` from ((`tbl_transaksi` join `tbl_transaksi_detail` on(`tbl_transaksi_detail`.`id_transaksi` = `tbl_transaksi`.`id`)) join `tbl_produk` on(`tbl_transaksi_detail`.`id_produk` = `tbl_produk`.`id`)) ;

-- ----------------------------
-- View structure for v_keranjang_detail
-- ----------------------------
DROP VIEW IF EXISTS `v_keranjang_detail`;
CREATE  VIEW `v_keranjang_detail` AS select `tbl_transaksi_detail`.`id` AS `id_detail`,`tbl_user`.`id_user` AS `id_user`,`v_total_simpanan`.`total_sukarela` AS `saldo`,`tbl_transaksi_detail`.`id_transaksi` AS `id_transaksi`,`v_produk`.`nama` AS `nama`,`v_produk`.`stok` AS `stok`,`v_produk`.`diskon` AS `diskon`,`v_produk`.`poin` AS `poin`,`v_produk`.`status` AS `status`,`v_produk`.`id` AS `id`,`tbl_transaksi_detail`.`jumlah` AS `jumlah`,`v_produk`.`harga` AS `harga`,`v_produk`.`harga` * `tbl_transaksi_detail`.`jumlah` AS `total` from (((`tbl_transaksi_detail` join `tbl_user` on(`tbl_transaksi_detail`.`id_user` = `tbl_user`.`id_user`)) join `v_total_simpanan` on(`tbl_user`.`id_user` = `v_total_simpanan`.`id_user`)) join `v_produk` on(`tbl_transaksi_detail`.`id_produk` = `v_produk`.`id`)) ;

-- ----------------------------
-- View structure for v_pembelian
-- ----------------------------
DROP VIEW IF EXISTS `v_pembelian`;
CREATE  VIEW `v_pembelian` AS select `tbl_pembelian`.`id` AS `id`,`tbl_pembelian`.`kode_pembelian` AS `kode_pembelian`,`tbl_admin`.`id` AS `id_admin`,`tbl_admin`.`nama` AS `nama_admin`,`tbl_pembelian`.`harga_total` AS `harga_total`,`tbl_pembelian`.`status_trx` AS `status_trx`,`tbl_pembelian`.`ongkir` AS `ongkir`,`tbl_pembelian`.`bayar_kredit` AS `bayar_kredit`,`tbl_pembelian`.`bayar_lunas` AS `bayar_lunas`,`tbl_pembelian`.`tgl_transaksi` AS `tgl_transaksi`,`tbl_pembelian`.`tgl_terima` AS `tgl_terima`,`tbl_kontak`.`id` AS `id_supplier`,`tbl_kontak`.`nama` AS `nama_supplier` from ((`tbl_pembelian` left join `tbl_admin` on(`tbl_pembelian`.`id_admin` = `tbl_admin`.`id`)) left join `tbl_kontak` on(`tbl_pembelian`.`id_supplier` = `tbl_kontak`.`id`)) ;

-- ----------------------------
-- View structure for v_pembelian_detail
-- ----------------------------
DROP VIEW IF EXISTS `v_pembelian_detail`;
CREATE  VIEW `v_pembelian_detail` AS select `tbl_pembelian_detail`.`id` AS `id`,`tbl_produk`.`barcode` AS `barcode`,`tbl_pembelian_detail`.`id_pembelian` AS `id_pembelian`,`tbl_pembelian_detail`.`tgl_beli` AS `tgl_beli`,`tbl_pembelian_detail`.`tgl_pelunasan` AS `tgl_pelunasan`,`tbl_pembelian_detail`.`status` AS `status`,`tbl_pembelian_detail`.`pajak` AS `pajak`,`tbl_produk`.`nama` AS `nama_produk`,`tbl_pembelian_detail`.`harga` AS `harga`,`tbl_pembelian_detail`.`qty` AS `qty`,`tbl_pembelian_detail`.`diskon` AS `diskon`,`tbl_pembelian_detail`.`total` AS `total`,`tbl_pembelian_detail`.`id_pajak` AS `id_pajak`,`tbl_pajak`.`kode` AS `kode`,`tbl_pajak`.`nama` AS `nama`,`tbl_produk`.`harga` AS `harga_jual`,`tbl_produk`.`id` AS `id_produk`,`tbl_produk`.`harga_grosir` AS `harga_grosir` from ((`tbl_pembelian_detail` left join `tbl_produk` on(`tbl_pembelian_detail`.`id_produk` = `tbl_produk`.`id`)) left join `tbl_pajak` on(`tbl_pembelian_detail`.`id_pajak` = `tbl_pajak`.`id`)) ;

-- ----------------------------
-- View structure for v_pembelian_diterima
-- ----------------------------
DROP VIEW IF EXISTS `v_pembelian_diterima`;
CREATE  VIEW `v_pembelian_diterima` AS select `tbl_pembelian_diterima`.`id` AS `id`,`tbl_admin`.`id` AS `id_admin`,`tbl_admin`.`nama` AS `nama_admin`,`tbl_pembelian_diterima`.`id_pembelian` AS `id_pembelian`,`tbl_produk`.`id` AS `id_produk`,`tbl_produk`.`barcode` AS `barcode`,`tbl_produk`.`nama` AS `nama_produk`,`tbl_produk`.`id_kategori` AS `id_kategori`,`tbl_produk`.`jenis` AS `jenis`,`tbl_produk`.`foto` AS `foto`,`tbl_produk`.`harga` AS `harga`,`tbl_produk`.`id_outlet` AS `id_outlet`,`tbl_pembelian_diterima`.`qty` AS `qty`,`tbl_pembelian_diterima`.`tgl` AS `tgl`,`tbl_pembelian_diterima`.`catatan` AS `catatan`,`tbl_pembelian_diterima`.`harga_beli` AS `harga_beli` from ((`tbl_pembelian_diterima` left join `tbl_admin` on(`tbl_pembelian_diterima`.`id_admin` = `tbl_admin`.`id`)) left join `tbl_produk` on(`tbl_pembelian_diterima`.`id_produk` = `tbl_produk`.`id`)) ;

-- ----------------------------
-- View structure for v_pokok
-- ----------------------------
DROP VIEW IF EXISTS `v_pokok`;
CREATE  VIEW `v_pokok` AS select `tbl_sim_pokok`.`id_simpanan` AS `id_simpanan`,`tbl_sim_pokok`.`id_user` AS `id_user`,`tbl_user`.`no_anggota` AS `no_anggota`,`tbl_user`.`nama` AS `nama_anggota`,`tbl_sim_pokok`.`id_admin` AS `id_admin`,`tbl_admin`.`nama` AS `nama_admin`,`tbl_sim_pokok`.`nominal` AS `nominal`,`tbl_sim_pokok`.`tanggal` AS `tanggal`,cast(`tbl_sim_pokok`.`tanggal` as date) AS `tgl`,`tbl_kelurahan`.`id_kelurahan` AS `id_kelurahan`,`tbl_kelurahan`.`kelurahan` AS `kelurahan`,`tbl_user`.`rt` AS `rt`,`tbl_user`.`rw` AS `rw` from (((`tbl_sim_pokok` left join `tbl_user` on(`tbl_sim_pokok`.`id_user` = `tbl_user`.`id_user`)) left join `tbl_admin` on(`tbl_sim_pokok`.`id_admin` = `tbl_admin`.`id`)) left join `tbl_kelurahan` on(`tbl_user`.`id_kelurahan` = `tbl_kelurahan`.`id_kelurahan`)) ;

-- ----------------------------
-- View structure for v_produk
-- ----------------------------
DROP VIEW IF EXISTS `v_produk`;
CREATE  VIEW `v_produk` AS select `tbl_produk`.`id` AS `id`,`tbl_produk`.`barcode` AS `barcode`,`tbl_produk`.`nama` AS `nama`,`tbl_kategori`.`id` AS `id_kategori`,`tbl_kategori`.`nama` AS `nama_kategori`,`tbl_produk`.`jenis` AS `jenis`,ifnull(`tbl_produk`.`foto`,'no-image.png') AS `foto`,`tbl_produk`.`harga` AS `harga`,`tbl_produk`.`harga_grosir` AS `harga_grosir`,`tbl_produk`.`keterangan` AS `keterangan`,`tbl_produk`.`deskripsi` AS `deskripsi`,`tbl_produk`.`status` AS `status`,`tbl_produk`.`stok` AS `stok`,`tbl_produk`.`diskon` AS `diskon`,`tbl_produk`.`tgl_input` AS `tgl_input`,`tbl_produk`.`poin` AS `poin`,`tbl_admin`.`id` AS `id_admin`,`tbl_admin`.`nama` AS `nama_admin`,`tbl_produk`.`harga_beli` AS `harga_beli` from ((`tbl_produk` left join `tbl_kategori` on(`tbl_produk`.`id_kategori` = `tbl_kategori`.`id`)) left join `tbl_admin` on(`tbl_produk`.`id_admin` = `tbl_admin`.`id`)) ;

-- ----------------------------
-- View structure for v_produk_i
-- ----------------------------
DROP VIEW IF EXISTS `v_produk_i`;
CREATE  VIEW `v_produk_i` AS select `tbl_produk`.`id` AS `id_produk`,`tbl_produk`.`nama` AS `nama`,`tbl_produk`.`jenis` AS `jenis`,`tbl_produk`.`foto` AS `foto`,`tbl_produk`.`harga` AS `harga`,`tbl_produk`.`keterangan` AS `keterangan`,`tbl_produk`.`status` AS `status`,`tbl_produk`.`diskon` AS `diskon`,`tbl_produk`.`tgl_input` AS `tgl_input`,`tbl_produk`.`poin` AS `poin`,`tbl_produk`.`id_admin` AS `id_admin`,`tbl_kategori`.`nama` AS `kategori` from (`tbl_kategori` join `tbl_produk` on(`tbl_produk`.`id_kategori` = `tbl_kategori`.`id`)) where `tbl_produk`.`status` = 'Y' ;

-- ----------------------------
-- View structure for v_promo_detail
-- ----------------------------
DROP VIEW IF EXISTS `v_promo_detail`;
CREATE  VIEW `v_promo_detail` AS SELECT
	tbl_promo_detail.id AS id, 
	tbl_promo_detail.id_promo AS id_promo, 
	tbl_promo_detail.id_produk AS id_produk, 
	tbl_produk.barcode AS barcode, 
	tbl_produk.nama AS nama, 
	tbl_produk.id_kategori AS id_kategori, 
	tbl_kategori.nama AS nama_kategori, 
	tbl_produk.jenis AS jenis, 
	tbl_produk.foto AS foto, 
	tbl_promo_detail.harga_promo AS harga_promo, 
	tbl_promo_detail.jumlah AS jumlah, 
	tbl_promo.kd_promo, 
	tbl_promo.nama AS nama_promo, 
	tbl_promo.foto AS foto_promo, 
	tbl_produk.harga_beli, 
	tbl_produk.poin, 
	tbl_produk.harga_grosir, 
	tbl_produk.deskripsi, 
	tbl_produk.keterangan
FROM
	(
		(
			tbl_promo_detail
			LEFT JOIN
			tbl_produk
			ON 
				(
					tbl_promo_detail.id_produk = tbl_produk.id
				)
		)
		LEFT JOIN
		tbl_kategori
		ON 
			(
				tbl_produk.id_kategori = tbl_kategori.id
			)
	)
	LEFT JOIN
	tbl_promo
	ON 
		tbl_promo_detail.id_promo = tbl_promo.id ;

-- ----------------------------
-- View structure for v_retur
-- ----------------------------
DROP VIEW IF EXISTS `v_retur`;
CREATE  VIEW `v_retur` AS select `tbl_retur`.`id` AS `id`,`tbl_retur`.`kode_faktur` AS `kode_faktur`,`tbl_admin`.`id` AS `id_admin`,`tbl_admin`.`nama` AS `nama_admin`,`tbl_retur`.`tgl_transaksi` AS `tgl_transaksi`,`tbl_kontak`.`id` AS `id_supplier`,`tbl_kontak`.`nama` AS `nama_supplier`,`tbl_kontak`.`alamat` AS `alamat`,`tbl_kontak`.`kode_pos` AS `kode_pos`,`tbl_kontak`.`kode` AS `kode`,`tbl_kontak`.`telp` AS `telp`,`tbl_kontak`.`email` AS `email` from ((`tbl_retur` left join `tbl_admin` on(`tbl_retur`.`id_admin` = `tbl_admin`.`id`)) left join `tbl_kontak` on(`tbl_retur`.`id_supplier` = `tbl_kontak`.`id`)) ;

-- ----------------------------
-- View structure for v_retur_detail
-- ----------------------------
DROP VIEW IF EXISTS `v_retur_detail`;
CREATE  VIEW `v_retur_detail` AS select `tbl_retur_detail`.`id` AS `id`,`tbl_retur_detail`.`id_retur` AS `id_retur`,`tbl_retur_detail`.`tgl_retur` AS `tgl_retur`,`tbl_produk`.`id` AS `id_produk`,`tbl_produk`.`barcode` AS `barcode`,`tbl_produk`.`nama` AS `nama`,sum(`tbl_retur_detail`.`qty`) AS `qty`,`tbl_retur`.`kode_faktur` AS `kode_faktur` from ((`tbl_retur_detail` left join `tbl_produk` on(`tbl_retur_detail`.`id_produk` = `tbl_produk`.`id`)) left join `tbl_retur` on(`tbl_retur_detail`.`id_retur` = `tbl_retur`.`id`)) group by `tbl_retur_detail`.`id_retur`,`tbl_retur_detail`.`tgl_retur`,`tbl_produk`.`id` ;

-- ----------------------------
-- View structure for v_shu
-- ----------------------------
DROP VIEW IF EXISTS `v_shu`;
CREATE  VIEW `v_shu` AS SELECT
	tbl_shu.id, 
	tbl_user.id_user, 
	tbl_user.no_anggota, 
	tbl_user.nama, 
	tbl_user.jenis_kelamin, 
	tbl_user.ktp, 
	tbl_user.pekerjaan, 
	tbl_user.no_hp, 
	tbl_kelurahan.id_kelurahan, 
	tbl_kelurahan.kelurahan, 
	tbl_kecamatan.id_kecamatan, 
	tbl_kecamatan.kecamatan, 
	tbl_kabupaten.id_kabupaten, 
	tbl_kabupaten.kabupaten, 
	tbl_shu.tanggal, 
	tbl_shu.periode, 
	tbl_shu.nominal_shu, 
	tbl_shu.total_simpanan_anggota, 
	tbl_shu.total_akumulasi_simpanan, 
	tbl_shu.perolehan_shu
FROM
	tbl_shu
	LEFT JOIN
	tbl_user
	ON 
		tbl_shu.id_user = tbl_user.id_user
	LEFT JOIN
	tbl_kelurahan
	ON 
		tbl_user.id_kelurahan = tbl_kelurahan.id_kelurahan
	LEFT JOIN
	tbl_kecamatan
	ON 
		tbl_kelurahan.id_kecamatan = tbl_kecamatan.id_kecamatan
	LEFT JOIN
	tbl_kabupaten
	ON 
		tbl_kecamatan.id_kabupaten = tbl_kabupaten.id_kabupaten
ORDER BY
	tbl_shu.id_user ASC, 
	tbl_user.id_kelurahan ASC, 
	tbl_shu.periode DESC ;

-- ----------------------------
-- View structure for v_sim_wajib_i
-- ----------------------------
DROP VIEW IF EXISTS `v_sim_wajib_i`;
CREATE  VIEW `v_sim_wajib_i` AS select `tbl_sim_wajib`.`id_user` AS `id_user`,if(`tbl_sim_wajib`.`tanggal` is not null,timestampdiff(MONTH,`tbl_sim_wajib`.`tanggal`,current_timestamp()) * `tbl_sim`.`wajib`,timestampdiff(MONTH,`tbl_user`.`tgl_registrasi`,current_timestamp()) * `tbl_sim`.`wajib`) AS `sim_wajib`,`tbl_sim_wajib`.`tanggal` AS `tanggal` from ((`tbl_sim_wajib` left join `tbl_user` on(`tbl_sim_wajib`.`id_user` = `tbl_user`.`id_user`)) join `tbl_sim`) where `tbl_sim_wajib`.`verif` = 'Y' order by `tbl_sim_wajib`.`tanggal` desc ;

-- ----------------------------
-- View structure for v_stok_opname
-- ----------------------------
DROP VIEW IF EXISTS `v_stok_opname`;
CREATE  VIEW `v_stok_opname` AS select `tbl_stok_opname`.`id` AS `id`,`tbl_stok_opname`.`id_admin` AS `id_admin`,`tbl_admin`.`nama` AS `nama_admin`,`tbl_stok_opname`.`id_produk` AS `id_produk`,`tbl_produk`.`barcode` AS `barcode`,`tbl_produk`.`nama` AS `nama_produk`,`tbl_stok_opname`.`harga` AS `harga`,`tbl_stok_opname`.`stok_awal` AS `stok_awal`,`tbl_stok_opname`.`stok_lapangan` AS `stok_lapangan`,`tbl_stok_opname`.`selisih` AS `selisih`,`tbl_stok_opname`.`harga` * `tbl_stok_opname`.`selisih` AS `nominal_selisih`,`tbl_stok_opname`.`tanggal` AS `tanggal` from ((`tbl_stok_opname` left join `tbl_admin` on(`tbl_stok_opname`.`id_admin` = `tbl_admin`.`id`)) left join `tbl_produk` on(`tbl_produk`.`id_admin` = `tbl_admin`.`id` and `tbl_stok_opname`.`id_produk` = `tbl_produk`.`id`)) ;

-- ----------------------------
-- View structure for v_stok_produk_akhir
-- ----------------------------
DROP VIEW IF EXISTS `v_stok_produk_akhir`;
CREATE  VIEW `v_stok_produk_akhir` AS select `tbl_produk`.`id` AS `id_produk`,`tbl_produk`.`nama` AS `nama`,`tbl_produk`.`harga` AS `harga`,`tbl_transaksi_detail`.`harga` AS `harga_detail`,sum(if(`tbl_transaksi_detail`.`status` = 'aktif',`tbl_transaksi_detail`.`jumlah`,0)) AS `jumlah`,`tbl_produk`.`stok` AS `stok_awal`,`tbl_produk`.`stok` - sum(if(`tbl_transaksi_detail`.`status` = 'aktif',`tbl_transaksi_detail`.`jumlah`,0)) AS `stok_akhir`,`tbl_produk`.`diskon` AS `diskon`,`tbl_produk`.`poin` AS `poin`,`tbl_produk`.`jenis` AS `jenis`,`tbl_produk`.`foto` AS `foto`,`tbl_produk`.`keterangan` AS `keterangan`,`tbl_produk`.`status` AS `status`,`tbl_kategori`.`nama` AS `kategori`,`tbl_produk`.`id_kategori` AS `id_kategori`,`tbl_produk`.`tgl_input` AS `tgl_input`,`tbl_produk`.`id_admin` AS `id_admin`,`tbl_transaksi`.`status_trx` AS `status_trx` from (((`tbl_produk` left join `tbl_transaksi_detail` on(`tbl_transaksi_detail`.`id_produk` = `tbl_produk`.`id`)) left join `tbl_kategori` on(`tbl_produk`.`id_kategori` = `tbl_kategori`.`id`)) left join `tbl_transaksi` on(`tbl_transaksi_detail`.`id_transaksi` = `tbl_transaksi`.`id`)) group by `tbl_produk`.`id` ;

-- ----------------------------
-- View structure for v_subtotal_sukarela
-- ----------------------------
DROP VIEW IF EXISTS `v_subtotal_sukarela`;
CREATE  VIEW `v_subtotal_sukarela` AS select `tbl_user`.`id_user` AS `id_user`,`tbl_user`.`no_anggota` AS `no_anggota`,`tbl_user`.`nama` AS `nama`,`tbl_user`.`jenis_kelamin` AS `jenis_kelamin`,`tbl_kelurahan`.`id_kelurahan` AS `id_kelurahan`,`tbl_kelurahan`.`kelurahan` AS `kelurahan`,`tbl_kecamatan`.`id_kecamatan` AS `id_kecamatan`,`tbl_kecamatan`.`kecamatan` AS `kecamatan`,`tbl_kabupaten`.`id_kabupaten` AS `id_kabupaten`,`tbl_kabupaten`.`kabupaten` AS `kabupaten`,ifnull(sum(`tbl_sim_sukarela`.`nominal`),0) AS `total_sukarela`,`tbl_user`.`rt` AS `rt`,`tbl_user`.`rw` AS `rw` from ((((`tbl_user` left join `tbl_sim_sukarela` on(`tbl_sim_sukarela`.`id_user` = `tbl_user`.`id_user`)) left join `tbl_kelurahan` on(`tbl_user`.`id_kelurahan` = `tbl_kelurahan`.`id_kelurahan`)) left join `tbl_kecamatan` on(`tbl_kelurahan`.`id_kecamatan` = `tbl_kecamatan`.`id_kecamatan`)) left join `tbl_kabupaten` on(`tbl_kecamatan`.`id_kabupaten` = `tbl_kabupaten`.`id_kabupaten`)) group by `tbl_user`.`id_user` order by `tbl_user`.`id_user` ;

-- ----------------------------
-- View structure for v_sukarela
-- ----------------------------
DROP VIEW IF EXISTS `v_sukarela`;
CREATE  VIEW `v_sukarela` AS select `tbl_sim_sukarela`.`id_simpanan` AS `id_simpanan`,`tbl_sim_sukarela`.`id_user` AS `id_user`,`tbl_user`.`no_anggota` AS `no_anggota`,`tbl_user`.`nama` AS `nama_anggota`,`tbl_sim_sukarela`.`id_admin` AS `id_admin`,`tbl_admin`.`nama` AS `nama_admin`,`tbl_sim_sukarela`.`nominal` AS `nominal`,`tbl_sim_sukarela`.`tanggal` AS `tanggal`,cast(`tbl_sim_sukarela`.`tanggal` as date) AS `tgl`,`tbl_sim_sukarela`.`metode` AS `metode`,`tbl_sim_sukarela`.`periode` AS `periode`,`tbl_kelurahan`.`id_kelurahan` AS `id_kelurahan`,`tbl_kelurahan`.`kelurahan` AS `kelurahan`,`tbl_user`.`rt` AS `rt`,`tbl_user`.`rw` AS `rw` from (((`tbl_sim_sukarela` left join `tbl_user` on(`tbl_sim_sukarela`.`id_user` = `tbl_user`.`id_user`)) left join `tbl_admin` on(`tbl_sim_sukarela`.`id_admin` = `tbl_admin`.`id`)) left join `tbl_kelurahan` on(`tbl_user`.`id_kelurahan` = `tbl_kelurahan`.`id_kelurahan`)) ;

-- ----------------------------
-- View structure for v_total_pengambilan
-- ----------------------------
DROP VIEW IF EXISTS `v_total_pengambilan`;
CREATE  VIEW `v_total_pengambilan` AS select `tbl_pengambilan_sukarela`.`id_pengambilan` AS `id_pengambilan`,`tbl_pengambilan_sukarela`.`id_admin` AS `id_admin`,`tbl_pengambilan_sukarela`.`id_user` AS `id_user`,sum(`tbl_pengambilan_sukarela`.`nominal`) AS `total_pengambilan` from `tbl_pengambilan_sukarela` where `tbl_pengambilan_sukarela`.`status` = 'N' group by `tbl_pengambilan_sukarela`.`id_user` ;

-- ----------------------------
-- View structure for v_total_pokok
-- ----------------------------
DROP VIEW IF EXISTS `v_total_pokok`;
CREATE  VIEW `v_total_pokok` AS select `tbl_user`.`id_user` AS `id_user`,`tbl_sim_pokok`.`id_admin` AS `id_admin`,`tbl_user`.`no_anggota` AS `no_anggota`,`tbl_user`.`nama` AS `nama`,`tbl_user`.`jenis_kelamin` AS `jenis_kelamin`,`tbl_kelurahan`.`id_kelurahan` AS `id_kelurahan`,`tbl_kelurahan`.`kelurahan` AS `kelurahan`,`tbl_kecamatan`.`id_kecamatan` AS `id_kecamatan`,`tbl_kecamatan`.`kecamatan` AS `kecamatan`,`tbl_kabupaten`.`id_kabupaten` AS `id_kabupaten`,`tbl_kabupaten`.`kabupaten` AS `kabupaten`,sum(`tbl_sim_pokok`.`nominal`) AS `total_pokok`,`tbl_user`.`rt` AS `rt`,`tbl_user`.`rw` AS `rw` from ((((`tbl_sim_pokok` left join `tbl_user` on(`tbl_sim_pokok`.`id_user` = `tbl_user`.`id_user`)) left join `tbl_kelurahan` on(`tbl_user`.`id_kelurahan` = `tbl_kelurahan`.`id_kelurahan`)) left join `tbl_kecamatan` on(`tbl_kelurahan`.`id_kecamatan` = `tbl_kecamatan`.`id_kecamatan`)) left join `tbl_kabupaten` on(`tbl_kecamatan`.`id_kabupaten` = `tbl_kabupaten`.`id_kabupaten`)) group by `tbl_sim_pokok`.`id_user` order by `tbl_sim_pokok`.`id_user` ;

-- ----------------------------
-- View structure for v_total_simpanan
-- ----------------------------
DROP VIEW IF EXISTS `v_total_simpanan`;
CREATE  VIEW `v_total_simpanan` AS select `tbl_user`.`id_user` AS `id_user`,`tbl_user`.`no_anggota` AS `no_anggota`,`tbl_user`.`nama` AS `nama`,`tbl_user`.`jenis_kelamin` AS `jenis_kelamin`,`tbl_kelurahan`.`id_kelurahan` AS `id_kelurahan`,`tbl_kelurahan`.`kelurahan` AS `kelurahan`,`tbl_user`.`rt` AS `rt`,`tbl_user`.`rw` AS `rw`,`tbl_kecamatan`.`id_kecamatan` AS `id_kecamatan`,`tbl_kecamatan`.`kecamatan` AS `kecamatan`,`tbl_kabupaten`.`id_kabupaten` AS `id_kabupaten`,`tbl_kabupaten`.`kabupaten` AS `kabupaten`,`tbl_kabupaten`.`id_provinsi` AS `id_provinsi`,sum(ifnull(`v_total_pokok`.`total_pokok`,0)) AS `total_pokok`,sum(ifnull(`v_total_wajib`.`total_wajib`,0)) AS `total_wajib`,sum(ifnull(`v_total_sukarela`.`total_sukarela`,0)) AS `total_sukarela` from ((((((`tbl_user` left join `tbl_kelurahan` on(`tbl_user`.`id_kelurahan` = `tbl_kelurahan`.`id_kelurahan`)) left join `tbl_kecamatan` on(`tbl_kelurahan`.`id_kecamatan` = `tbl_kecamatan`.`id_kecamatan`)) left join `tbl_kabupaten` on(`tbl_kecamatan`.`id_kabupaten` = `tbl_kabupaten`.`id_kabupaten`)) left join `v_total_pokok` on(`tbl_user`.`id_user` = `v_total_pokok`.`id_user`)) left join `v_total_wajib` on(`tbl_user`.`id_user` = `v_total_wajib`.`id_user`)) left join `v_total_sukarela` on(`tbl_user`.`id_user` = `v_total_sukarela`.`id_user`)) group by `tbl_user`.`id_user` order by `tbl_user`.`id_user` ;

-- ----------------------------
-- View structure for v_total_simpanan_all
-- ----------------------------
DROP VIEW IF EXISTS `v_total_simpanan_all`;
CREATE  VIEW `v_total_simpanan_all` AS select sum(`v_total_simpanan`.`total_pokok`) AS `total_pokok`,sum(`v_total_simpanan`.`total_wajib`) AS `total_wajib`,sum(`v_total_simpanan`.`total_sukarela`) AS `total_sukarela` from `v_total_simpanan` ;

-- ----------------------------
-- View structure for v_total_sukarela
-- ----------------------------
DROP VIEW IF EXISTS `v_total_sukarela`;
CREATE  VIEW `v_total_sukarela` AS select `v_subtotal_sukarela`.`id_user` AS `id_user`,`v_subtotal_sukarela`.`no_anggota` AS `no_anggota`,`v_subtotal_sukarela`.`nama` AS `nama`,`v_subtotal_sukarela`.`jenis_kelamin` AS `jenis_kelamin`,`v_subtotal_sukarela`.`id_kelurahan` AS `id_kelurahan`,`v_subtotal_sukarela`.`kelurahan` AS `kelurahan`,`v_subtotal_sukarela`.`id_kecamatan` AS `id_kecamatan`,`v_subtotal_sukarela`.`kecamatan` AS `kecamatan`,`v_subtotal_sukarela`.`id_kabupaten` AS `id_kabupaten`,`v_subtotal_sukarela`.`kabupaten` AS `kabupaten`,`v_subtotal_sukarela`.`rt` AS `rt`,`v_subtotal_sukarela`.`rw` AS `rw`,`v_subtotal_sukarela`.`total_sukarela` AS `subtotal_sukarela`,ifnull(`v_total_pengambilan`.`total_pengambilan`,0) AS `total_pengambilan`,ifnull(sum(`v_wajib_motong_sukarela`.`nominal_wajib`),0) AS `nominal_wajib`,ifnull(sum(`v_belanja_motong_sukarela`.`belanja_sukarela`),0) AS `nominal_belanja`,`v_subtotal_sukarela`.`total_sukarela` - ifnull(`v_total_pengambilan`.`total_pengambilan`,0) - ifnull(sum(`v_wajib_motong_sukarela`.`nominal_wajib`),0) - ifnull(sum(`v_belanja_motong_sukarela`.`belanja_sukarela`),0) AS `total_sukarela` from (((`v_subtotal_sukarela` left join `v_total_pengambilan` on(`v_subtotal_sukarela`.`id_user` = `v_total_pengambilan`.`id_user`)) left join `v_wajib_motong_sukarela` on(`v_subtotal_sukarela`.`id_user` = `v_wajib_motong_sukarela`.`id_user`)) left join `v_belanja_motong_sukarela` on(`v_subtotal_sukarela`.`id_user` = `v_belanja_motong_sukarela`.`id_user`)) group by `v_subtotal_sukarela`.`id_user` order by `v_subtotal_sukarela`.`id_user` ;

-- ----------------------------
-- View structure for v_total_wajib
-- ----------------------------
DROP VIEW IF EXISTS `v_total_wajib`;
CREATE  VIEW `v_total_wajib` AS select `tbl_user`.`id_user` AS `id_user`,`tbl_user`.`no_anggota` AS `no_anggota`,`tbl_user`.`nama` AS `nama`,`tbl_user`.`jenis_kelamin` AS `jenis_kelamin`,`tbl_kelurahan`.`id_kelurahan` AS `id_kelurahan`,`tbl_kelurahan`.`kelurahan` AS `kelurahan`,`tbl_user`.`rt` AS `rt`,`tbl_user`.`rw` AS `rw`,`tbl_kecamatan`.`id_kecamatan` AS `id_kecamatan`,`tbl_kecamatan`.`kecamatan` AS `kecamatan`,`tbl_kabupaten`.`id_kabupaten` AS `id_kabupaten`,`tbl_kabupaten`.`kabupaten` AS `kabupaten`,sum(`tbl_sim_wajib`.`nominal`) AS `total_wajib` from ((((`tbl_sim_wajib` left join `tbl_user` on(`tbl_sim_wajib`.`id_user` = `tbl_user`.`id_user`)) left join `tbl_kelurahan` on(`tbl_user`.`id_kelurahan` = `tbl_kelurahan`.`id_kelurahan`)) left join `tbl_kecamatan` on(`tbl_kelurahan`.`id_kecamatan` = `tbl_kecamatan`.`id_kecamatan`)) left join `tbl_kabupaten` on(`tbl_kecamatan`.`id_kabupaten` = `tbl_kabupaten`.`id_kabupaten`)) group by `tbl_user`.`id_user` order by `tbl_user`.`id_user` ;

-- ----------------------------
-- View structure for v_tot_hrg_beli_trx_detail
-- ----------------------------
DROP VIEW IF EXISTS `v_tot_hrg_beli_trx_detail`;
CREATE  VIEW `v_tot_hrg_beli_trx_detail` AS select `tbl_transaksi_detail`.`harga` AS `harga`,sum(`tbl_transaksi_detail`.`jumlah`) AS `jumlah`,sum(`tbl_transaksi_detail`.`jumlah`) * `tbl_transaksi_detail`.`harga` AS `harga_beli`,substr(`tbl_transaksi`.`tgl_transaksi`,1,10) AS `tanggal`,`tbl_transaksi`.`status_trx` AS `status_trx`,`tbl_produk`.`nama` AS `nama` from ((`tbl_transaksi_detail` join `tbl_transaksi` on(`tbl_transaksi`.`id` = `tbl_transaksi_detail`.`id_transaksi`)) join `tbl_produk` on(`tbl_transaksi_detail`.`id_produk` = `tbl_produk`.`id`)) where `tbl_transaksi`.`status_trx` = 'selesai' group by `tbl_transaksi_detail`.`id_produk`,substr(`tbl_transaksi`.`tgl_transaksi`,1,10) order by `tbl_transaksi_detail`.`tanggal` ;

-- ----------------------------
-- View structure for v_transaksi
-- ----------------------------
DROP VIEW IF EXISTS `v_transaksi`;
CREATE  VIEW `v_transaksi` AS select `tbl_transaksi`.`id` AS `id`,`tbl_admin`.`id` AS `id_petugas`,`tbl_admin`.`nama` AS `nama_admin`,`tbl_user`.`id_user` AS `id_user`,`tbl_user`.`no_anggota` AS `no_anggota`,`tbl_user`.`nama` AS `nama`,`tbl_user`.`jenis_kelamin` AS `jenis_kelamin`,`tbl_kelurahan`.`id_kelurahan` AS `id_kelurahan`,`tbl_kelurahan`.`kelurahan` AS `kelurahan`,`tbl_kecamatan`.`id_kecamatan` AS `id_kecamatan`,`tbl_kecamatan`.`kecamatan` AS `kecamatan`,`tbl_kabupaten`.`id_kabupaten` AS `id_kabupaten`,`tbl_kabupaten`.`kabupaten` AS `kabupaten`,`tbl_kabupaten`.`id_provinsi` AS `id_provinsi`,`tbl_transaksi`.`harga_total` AS `harga_total`,`tbl_transaksi`.`status_trx` AS `status_trx`,`tbl_transaksi`.`ongkir` AS `ongkir`,`tbl_transaksi`.`poin_total` AS `poin_total`,`tbl_transaksi`.`alamat_kirim` AS `alamat_kirim`,`tbl_transaksi`.`no_hp` AS `no_hp`,`tbl_transaksi`.`uang_kembali` AS `uang_kembali`,`tbl_transaksi`.`uang_masuk` AS `uang_masuk`,`tbl_transaksi`.`tgl_transaksi` AS `tgl_transaksi`,`tbl_pembayaran`.`id` AS `id_pembayaran`,`tbl_pembayaran`.`nama` AS `nama_pembayaran`,`tbl_pembayaran`.`foto` AS `foto`,`tbl_pembayaran`.`keterangan` AS `keterangan`,`tbl_transaksi`.`kodeunik` AS `kodeunik`,`tbl_user`.`rt` AS `rt`,`tbl_user`.`rw` AS `rw` from ((((((`tbl_transaksi` left join `tbl_admin` on(`tbl_transaksi`.`id_admin` = `tbl_admin`.`id`)) left join `tbl_user` on(`tbl_transaksi`.`id_user` = `tbl_user`.`id_user`)) left join `tbl_kelurahan` on(`tbl_user`.`id_kelurahan` = `tbl_kelurahan`.`id_kelurahan`)) left join `tbl_kecamatan` on(`tbl_kelurahan`.`id_kecamatan` = `tbl_kecamatan`.`id_kecamatan`)) left join `tbl_kabupaten` on(`tbl_kecamatan`.`id_kabupaten` = `tbl_kabupaten`.`id_kabupaten`)) left join `tbl_pembayaran` on(`tbl_transaksi`.`id_pembayaran` = `tbl_pembayaran`.`id`)) ;

-- ----------------------------
-- View structure for v_transaksi_detail
-- ----------------------------
DROP VIEW IF EXISTS `v_transaksi_detail`;
CREATE  VIEW `v_transaksi_detail` AS select `tbl_transaksi_detail`.`id` AS `id`,`tbl_transaksi_detail`.`id_transaksi` AS `id_transaksi`,`tbl_produk`.`barcode` AS `barcode`,`tbl_produk`.`id` AS `id_produk`,`tbl_produk`.`nama` AS `nama_produk`,`tbl_produk`.`foto` AS `foto`,`tbl_produk`.`jenis` AS `jenis`,`tbl_kategori`.`id` AS `id_kategori`,`tbl_kategori`.`nama` AS `kategori`,sum(`tbl_transaksi_detail`.`jumlah`) AS `jumlah`,`tbl_transaksi_detail`.`tanggal` AS `tanggal`,`tbl_transaksi_detail`.`id_user` AS `id_user`,`tbl_transaksi_detail`.`harga` AS `harga`,`tbl_produk`.`harga` AS `harga_produk`,`tbl_produk`.`diskon` AS `diskon`,ifnull(ifnull(`tbl_transaksi_detail`.`hrg_beli_pritem`,`tbl_produk`.`harga_beli`),`tbl_transaksi_detail`.`harga`) AS `hrg_beli_pritem` from ((`tbl_transaksi_detail` left join `tbl_produk` on(`tbl_transaksi_detail`.`id_produk` = `tbl_produk`.`id`)) left join `tbl_kategori` on(`tbl_produk`.`id_kategori` = `tbl_kategori`.`id`)) group by `tbl_transaksi_detail`.`id_transaksi`,`tbl_transaksi_detail`.`id_produk` ;

-- ----------------------------
-- View structure for v_user
-- ----------------------------
DROP VIEW IF EXISTS `v_user`;
CREATE  VIEW `v_user` AS select `tbl_user`.`id_user` AS `id_user`,`tbl_user`.`no_anggota` AS `no_anggota`,`tbl_user`.`nama` AS `nama`,`tbl_user`.`level` AS `level`,`tbl_user`.`jenis_kelamin` AS `jenis_kelamin`,`tbl_user`.`ktp` AS `ktp`,`tbl_user`.`password` AS `password`,`tbl_user`.`foto` AS `foto`,`tbl_user`.`versi` AS `versi`,`tbl_user`.`no_hp` AS `no_hp`,`tbl_user`.`pekerjaan` AS `pekerjaan`,`tbl_user`.`id_kelurahan` AS `id_kelurahan`,`tbl_kelurahan`.`kelurahan` AS `kelurahan`,`tbl_kelurahan`.`id_kecamatan` AS `id_kecamatan`,`tbl_kecamatan`.`kecamatan` AS `kecamatan`,`tbl_kecamatan`.`id_kabupaten` AS `id_kabupaten`,`tbl_kabupaten`.`kabupaten` AS `kabupaten`,`tbl_kabupaten`.`id_provinsi` AS `id_provinsi`,`tbl_provinsi`.`provinsi` AS `provinsi`,`tbl_user`.`status` AS `status`,`tbl_user`.`tgl_registrasi` AS `tgl_registrasi`,`tbl_user`.`poin` AS `poin`,`tbl_user`.`rt` AS `rt`,`tbl_user`.`rw` AS `rw`,`tbl_user`.`email` AS `email`,`tbl_user`.`id_firebase` AS `id_firebase` from ((((`tbl_user` left join `tbl_kelurahan` on(`tbl_user`.`id_kelurahan` = `tbl_kelurahan`.`id_kelurahan`)) left join `tbl_kecamatan` on(`tbl_kelurahan`.`id_kecamatan` = `tbl_kecamatan`.`id_kecamatan`)) left join `tbl_kabupaten` on(`tbl_kecamatan`.`id_kabupaten` = `tbl_kabupaten`.`id_kabupaten`)) left join `tbl_provinsi` on(`tbl_kabupaten`.`id_provinsi` = `tbl_provinsi`.`id_provinsi`)) ;

-- ----------------------------
-- View structure for v_wajib
-- ----------------------------
DROP VIEW IF EXISTS `v_wajib`;
CREATE  VIEW `v_wajib` AS select `tbl_sim_wajib`.`id_simpanan` AS `id_simpanan`,`tbl_sim_wajib`.`id_user` AS `id_user`,`tbl_user`.`no_anggota` AS `no_anggota`,`tbl_user`.`nama` AS `nama_anggota`,`tbl_sim_wajib`.`id_admin` AS `id_admin`,`tbl_admin`.`nama` AS `nama_admin`,`tbl_sim_wajib`.`nominal` AS `nominal`,`tbl_sim_wajib`.`tanggal` AS `tanggal`,cast(`tbl_sim_wajib`.`tanggal` as date) AS `tgl`,`tbl_sim_wajib`.`metode` AS `metode`,year(`tbl_sim_wajib`.`periode`) AS `periode`,`tbl_kelurahan`.`id_kelurahan` AS `id_kelurahan`,`tbl_kelurahan`.`kelurahan` AS `kelurahan`,`tbl_user`.`rt` AS `rt`,`tbl_user`.`rw` AS `rw` from (((`tbl_sim_wajib` left join `tbl_user` on(`tbl_sim_wajib`.`id_user` = `tbl_user`.`id_user`)) left join `tbl_admin` on(`tbl_sim_wajib`.`id_admin` = `tbl_admin`.`id`)) left join `tbl_kelurahan` on(`tbl_user`.`id_kelurahan` = `tbl_kelurahan`.`id_kelurahan`)) ;

-- ----------------------------
-- View structure for v_wajib_motong_sukarela
-- ----------------------------
DROP VIEW IF EXISTS `v_wajib_motong_sukarela`;
CREATE  VIEW `v_wajib_motong_sukarela` AS select `tbl_sim_wajib`.`id_user` AS `id_user`,`tbl_sim_wajib`.`id_admin` AS `id_admin`,ifnull(sum(`tbl_sim_wajib`.`nominal`),0) AS `nominal_wajib`,`tbl_sim_wajib`.`metode` AS `metode` from `tbl_sim_wajib` where `tbl_sim_wajib`.`metode` = 'simpanan' group by `tbl_sim_wajib`.`id_user` ;

-- ----------------------------
-- Triggers structure for table tbl_pembelian_diterima
-- ----------------------------
DROP TRIGGER IF EXISTS `tambah_stok001`;
delimiter ;;
CREATE TRIGGER `tambah_stok001` AFTER INSERT ON `tbl_pembelian_diterima` FOR EACH ROW BEGIN
	UPDATE tbl_produk SET stok=stok+NEW.qty WHERE id=NEW.id_produk;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table tbl_pembelian_diterima
-- ----------------------------
DROP TRIGGER IF EXISTS `kurangi_stok001`;
delimiter ;;
CREATE TRIGGER `kurangi_stok001` BEFORE UPDATE ON `tbl_pembelian_diterima` FOR EACH ROW BEGIN
	UPDATE tbl_produk SET stok=stok-OLD.qty+NEW.qty WHERE id=NEW.id_produk;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table tbl_pembelian_diterima
-- ----------------------------
DROP TRIGGER IF EXISTS `kurangi_stok003`;
delimiter ;;
CREATE TRIGGER `kurangi_stok003` BEFORE DELETE ON `tbl_pembelian_diterima` FOR EACH ROW BEGIN
	UPDATE tbl_produk SET stok=stok-OLD.qty WHERE id=OLD.id_produk;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table tbl_retur_detail
-- ----------------------------
DROP TRIGGER IF EXISTS `kurangi_stok002`;
delimiter ;;
CREATE TRIGGER `kurangi_stok002` AFTER INSERT ON `tbl_retur_detail` FOR EACH ROW BEGIN
	UPDATE tbl_produk SET stok=stok-NEW.qty WHERE id=NEW.id_produk;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table tbl_retur_detail
-- ----------------------------
DROP TRIGGER IF EXISTS `update_stok002`;
delimiter ;;
CREATE TRIGGER `update_stok002` BEFORE UPDATE ON `tbl_retur_detail` FOR EACH ROW BEGIN
	UPDATE tbl_produk SET stok=stok+OLD.qty-NEW.qty WHERE id=NEW.id_produk;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table tbl_transaksi_detail
-- ----------------------------
DROP TRIGGER IF EXISTS `update_stok_produk1`;
delimiter ;;
CREATE TRIGGER `update_stok_produk1` AFTER INSERT ON `tbl_transaksi_detail` FOR EACH ROW BEGIN
	IF NEW.status_trx = 'selesai' THEN
		UPDATE tbl_produk SET stok=stok-NEW.jumlah WHERE id=NEW.id_produk;
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table tbl_transaksi_detail
-- ----------------------------
DROP TRIGGER IF EXISTS `update_stok_produk123`;
delimiter ;;
CREATE TRIGGER `update_stok_produk123` BEFORE UPDATE ON `tbl_transaksi_detail` FOR EACH ROW BEGIN   

      IF (NEW.status = 'selesai' ) THEN
	 UPDATE tbl_produk SET stok=stok -NEW.jumlah WHERE id=NEW.id_produk ;  
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table tbl_transaksi_detail
-- ----------------------------
DROP TRIGGER IF EXISTS `tambah_stok_produk1`;
delimiter ;;
CREATE TRIGGER `tambah_stok_produk1` BEFORE DELETE ON `tbl_transaksi_detail` FOR EACH ROW BEGIN  
IF (OLD.status = 'selesai') THEN
   UPDATE tbl_produk SET stok=stok+OLD.jumlah WHERE id=OLD.id_produk;
END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
