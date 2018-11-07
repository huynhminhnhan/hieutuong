-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 06, 2018 lúc 04:49 PM
-- Phiên bản máy phục vụ: 10.1.34-MariaDB
-- Phiên bản PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `realife`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `album`
--

CREATE TABLE `album` (
  `ma-alb` int(10) NOT NULL,
  `ten-alb` varchar(255) NOT NULL,
  `ma-dv` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binh-luan`
--

CREATE TABLE `binh-luan` (
  `ma-bl` int(10) NOT NULL,
  `noi-dung` varchar(500) NOT NULL,
  `ma-kh` int(11) NOT NULL,
  `ngay-bl` date NOT NULL,
  `luot-tuong-tac` int(11) NOT NULL,
  `diem-tich-luy` int(20) NOT NULL,
  `ma-dv` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blog`
--

CREATE TABLE `blog` (
  `ma-blog` int(10) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `noidung` varchar(5000) COLLATE utf8_unicode_ci NOT NULL,
  `hinh` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ma-bl` int(10) NOT NULL,
  `maloai-blog` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dich-vu`
--

CREATE TABLE `dich-vu` (
  `ma-dv` int(10) NOT NULL,
  `ten-dv` varchar(255) NOT NULL,
  `don-gia` double NOT NULL,
  `giam-gia` double NOT NULL,
  `hinh` varchar(255) NOT NULL,
  `mo-ta` varchar(20000) NOT NULL,
  `dac-biet` bit(1) NOT NULL,
  `so-luot-xem` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hinh`
--

CREATE TABLE `hinh` (
  `ma-hinh` int(10) NOT NULL COMMENT 'mã hình',
  `ma-kh` int(11) NOT NULL,
  `ma-alb` int(10) NOT NULL,
  `hinh` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khach-hang`
--

CREATE TABLE `khach-hang` (
  `ma-kh` int(11) NOT NULL,
  `ho-ten` varchar(300) NOT NULL,
  `mat-khau` varchar(20) NOT NULL,
  `kich-hoat` bit(1) NOT NULL,
  `hinh` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loai-blog`
--

CREATE TABLE `loai-blog` (
  `maloai-blog` int(10) NOT NULL,
  `tenloai-blog` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `img-loai-blog` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`ma-alb`),
  ADD KEY `Fk_album_dich-vu` (`ma-dv`);

--
-- Chỉ mục cho bảng `binh-luan`
--
ALTER TABLE `binh-luan`
  ADD PRIMARY KEY (`ma-bl`),
  ADD KEY `Fk_binh-luan_khach-hang` (`ma-kh`),
  ADD KEY `Fk_binh-luan_dich-vu` (`ma-dv`);

--
-- Chỉ mục cho bảng `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`ma-blog`),
  ADD KEY `maloai-blog` (`maloai-blog`),
  ADD KEY `FK_ma_bl` (`ma-bl`);

--
-- Chỉ mục cho bảng `dich-vu`
--
ALTER TABLE `dich-vu`
  ADD PRIMARY KEY (`ma-dv`);

--
-- Chỉ mục cho bảng `hinh`
--
ALTER TABLE `hinh`
  ADD PRIMARY KEY (`ma-hinh`),
  ADD KEY `ma-kh` (`ma-kh`,`ma-alb`),
  ADD KEY `ma-alb` (`ma-alb`);

--
-- Chỉ mục cho bảng `khach-hang`
--
ALTER TABLE `khach-hang`
  ADD PRIMARY KEY (`ma-kh`);

--
-- Chỉ mục cho bảng `loai-blog`
--
ALTER TABLE `loai-blog`
  ADD PRIMARY KEY (`maloai-blog`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `album`
--
ALTER TABLE `album`
  MODIFY `ma-alb` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `binh-luan`
--
ALTER TABLE `binh-luan`
  MODIFY `ma-bl` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `blog`
--
ALTER TABLE `blog`
  MODIFY `ma-blog` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `dich-vu`
--
ALTER TABLE `dich-vu`
  MODIFY `ma-dv` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `hinh`
--
ALTER TABLE `hinh`
  MODIFY `ma-hinh` int(10) NOT NULL AUTO_INCREMENT COMMENT 'mã hình';

--
-- AUTO_INCREMENT cho bảng `khach-hang`
--
ALTER TABLE `khach-hang`
  MODIFY `ma-kh` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `loai-blog`
--
ALTER TABLE `loai-blog`
  MODIFY `maloai-blog` int(10) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `Fk_album_dich-vu` FOREIGN KEY (`ma-dv`) REFERENCES `dich-vu` (`ma-dv`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `binh-luan`
--
ALTER TABLE `binh-luan`
  ADD CONSTRAINT `Fk_binh-luan_dich-vu` FOREIGN KEY (`ma-dv`) REFERENCES `dich-vu` (`ma-dv`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_binh-luan_khach-hang` FOREIGN KEY (`ma-kh`) REFERENCES `khach-hang` (`ma-kh`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `FK_ma_bl` FOREIGN KEY (`ma-bl`) REFERENCES `binh-luan` (`ma-bl`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_maloai-blog` FOREIGN KEY (`maloai-blog`) REFERENCES `loai-blog` (`maloai-blog`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `hinh`
--
ALTER TABLE `hinh`
  ADD CONSTRAINT `hinh_ibfk_1` FOREIGN KEY (`ma-alb`) REFERENCES `album` (`ma-alb`),
  ADD CONSTRAINT `hinh_ibfk_2` FOREIGN KEY (`ma-kh`) REFERENCES `khach-hang` (`ma-kh`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
