-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th4 24, 2025 lúc 06:18 AM
-- Phiên bản máy phục vụ: 8.0.31
-- Phiên bản PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ban_nuoc_hoa`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietdonhang`
--

DROP TABLE IF EXISTS `chitietdonhang`;
CREATE TABLE IF NOT EXISTS `chitietdonhang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `don_hang_id` int DEFAULT NULL,
  `san_pham_id` int DEFAULT NULL,
  `so_luong` int DEFAULT NULL,
  `gia_tai_thoi_diem` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `don_hang_id` (`don_hang_id`),
  KEY `san_pham_id` (`san_pham_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietdonhang`
--

INSERT INTO `chitietdonhang` (`id`, `don_hang_id`, `san_pham_id`, `so_luong`, `gia_tai_thoi_diem`) VALUES
(1, 1, 1, 1, '2200000.00'),
(2, 1, 2, 1, '3300000.00'),
(3, 2, 3, 2, '5500000.00'),
(4, 3, 4, 1, '12000000.00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhgia`
--

DROP TABLE IF EXISTS `danhgia`;
CREATE TABLE IF NOT EXISTS `danhgia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `khach_hang_id` int DEFAULT NULL,
  `san_pham_id` int DEFAULT NULL,
  `so_sao` int DEFAULT NULL,
  `noi_dung` text,
  `ngay_danh_gia` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `khach_hang_id` (`khach_hang_id`),
  KEY `san_pham_id` (`san_pham_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `danhgia`
--

INSERT INTO `danhgia` (`id`, `khach_hang_id`, `san_pham_id`, `so_sao`, `noi_dung`, `ngay_danh_gia`) VALUES
(1, 1, 1, 5, 'Mùi rất thơm và giữ mùi lâu.', '2025-04-23'),
(2, 2, 3, 4, 'Hương thơm rất dễ chịu, phù hợp với nhiều hoàn cảnh.', '2025-04-24'),
(3, 3, 4, 5, 'Mùi hương tuyệt vời, giữ lâu và rất sang trọng.', '2025-04-22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

DROP TABLE IF EXISTS `danhmuc`;
CREATE TABLE IF NOT EXISTS `danhmuc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_danh_muc` varchar(100) DEFAULT NULL,
  `mo_ta` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmuc`
--

INSERT INTO `danhmuc` (`id`, `ten_danh_muc`, `mo_ta`) VALUES
(1, 'Nước hoa nam', 'Dòng nước hoa dành cho nam giới'),
(2, 'Nước hoa nữ', 'Dòng nước hoa dành cho nữ giới'),
(3, 'Nước hoa unisex', 'Dòng nước hoa dành cho cả nam và nữ'),
(4, 'Nước hoa cao cấp', 'Nước hoa chất lượng cao, dành cho những người yêu thích sự sang trọng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang`
--

DROP TABLE IF EXISTS `donhang`;
CREATE TABLE IF NOT EXISTS `donhang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `khach_hang_id` int DEFAULT NULL,
  `ngay_dat` datetime DEFAULT NULL,
  `tong_tien` decimal(10,2) DEFAULT NULL,
  `trang_thai` varchar(50) DEFAULT NULL,
  `ma_giam_gia_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `khach_hang_id` (`khach_hang_id`),
  KEY `ma_giam_gia_id` (`ma_giam_gia_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `donhang`
--

INSERT INTO `donhang` (`id`, `khach_hang_id`, `ngay_dat`, `tong_tien`, `trang_thai`, `ma_giam_gia_id`) VALUES
(1, 1, '2025-04-24 12:59:47', '3960000.00', 'Đã thanh toán', 1),
(2, 2, '2025-04-24 12:59:47', '6600000.00', 'Chờ xử lý', 2),
(3, 3, '2025-04-24 12:59:47', '3200000.00', 'Đang giao', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giaohang`
--

DROP TABLE IF EXISTS `giaohang`;
CREATE TABLE IF NOT EXISTS `giaohang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `don_hang_id` int DEFAULT NULL,
  `dia_chi_giao` text,
  `trang_thai_giao` varchar(50) DEFAULT NULL,
  `ngay_giao` date DEFAULT NULL,
  `ngay_nhan` date DEFAULT NULL,
  `ma_van_don` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `don_hang_id` (`don_hang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `giaohang`
--

INSERT INTO `giaohang` (`id`, `don_hang_id`, `dia_chi_giao`, `trang_thai_giao`, `ngay_giao`, `ngay_nhan`, `ma_van_don`) VALUES
(1, 1, '123 Le Loi, Q1', 'Đang giao', '2025-04-24', NULL, 'GHN123456789'),
(2, 2, '789 Tran Hung Dao, Q3', 'Đang giao', '2025-04-25', NULL, 'GHN987654321'),
(3, 3, '101 Ba Thang Hai, Q10', 'Đã giao', '2025-04-23', '2025-04-23', 'GHN123987654');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giohang`
--

DROP TABLE IF EXISTS `giohang`;
CREATE TABLE IF NOT EXISTS `giohang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `khach_hang_id` int DEFAULT NULL,
  `san_pham_id` int DEFAULT NULL,
  `so_luong` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `khach_hang_id` (`khach_hang_id`),
  KEY `san_pham_id` (`san_pham_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `giohang`
--

INSERT INTO `giohang` (`id`, `khach_hang_id`, `san_pham_id`, `so_luong`) VALUES
(1, 2, 1, 2),
(2, 3, 3, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
CREATE TABLE IF NOT EXISTS `khachhang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ho_ten` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mat_khau` varchar(255) DEFAULT NULL,
  `so_dien_thoai` varchar(15) DEFAULT NULL,
  `dia_chi` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`id`, `ho_ten`, `email`, `mat_khau`, `so_dien_thoai`, `dia_chi`) VALUES
(1, 'Nguyen Van A', 'vana@gmail.com', 'matkhau123', '0901234567', '123 Le Loi, Q1'),
(2, 'Tran Thi B', 'thib@gmail.com', 'matkhau456', '0932345678', '456 Nguyen Trai, Q5'),
(3, 'Le Thi C', 'thic@gmail.com', 'matkhau789', '0943456789', '789 Tran Hung Dao, Q3'),
(4, 'Pham Minh D', 'minhd@gmail.com', 'matkhau101', '0912345678', '101 Ba Thang Hai, Q10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `magiamgia`
--

DROP TABLE IF EXISTS `magiamgia`;
CREATE TABLE IF NOT EXISTS `magiamgia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ma` varchar(50) DEFAULT NULL,
  `phan_tram_giam` int DEFAULT NULL,
  `ngay_bat_dau` date DEFAULT NULL,
  `ngay_ket_thuc` date DEFAULT NULL,
  `dieu_kien_ap_dung` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `magiamgia`
--

INSERT INTO `magiamgia` (`id`, `ma`, `phan_tram_giam`, `ngay_bat_dau`, `ngay_ket_thuc`, `dieu_kien_ap_dung`) VALUES
(1, 'SALE20', 20, '2025-04-01', '2025-04-30', 'Đơn hàng từ 500k'),
(2, 'SALE10', 10, '2025-04-05', '2025-04-10', 'Đơn hàng từ 1 triệu'),
(3, 'BLACKFRIDAY', 50, '2025-11-01', '2025-11-30', 'Giảm giá vào ngày Black Friday');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
CREATE TABLE IF NOT EXISTS `sanpham` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_san_pham` varchar(255) DEFAULT NULL,
  `thuong_hieu` varchar(100) DEFAULT NULL,
  `mo_ta` text,
  `gia` decimal(10,2) DEFAULT NULL,
  `so_luong_ton` int DEFAULT NULL,
  `hinh_anh` varchar(255) DEFAULT NULL,
  `danh_muc_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `danh_muc_id` (`danh_muc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`id`, `ten_san_pham`, `thuong_hieu`, `mo_ta`, `gia`, `so_luong_ton`, `hinh_anh`, `danh_muc_id`) VALUES
(1, 'Dior Sauvage', 'Dior', 'Hương thơm nam tính mạnh mẽ', '2200000.00', 10, 'dior_sauvage.jpg', 1),
(2, 'Chanel No.5', 'Chanel', 'Hương cổ điển sang trọng cho nữ', '3300000.00', 5, 'chanel_no5.jpg', 2),
(3, 'Tom Ford Oud Wood', 'Tom Ford', 'Hương gỗ quý hiếm, sang trọng', '5500000.00', 7, 'tom_ford_oud_wood.jpg', 3),
(4, 'Creed Aventus', 'Creed', 'Hương thơm nam tính, mạnh mẽ, đầy tự tin', '12000000.00', 3, 'creed_aventus.jpg', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thanhtoan`
--

DROP TABLE IF EXISTS `thanhtoan`;
CREATE TABLE IF NOT EXISTS `thanhtoan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `don_hang_id` int DEFAULT NULL,
  `phuong_thuc` varchar(50) DEFAULT NULL,
  `trang_thai_thanh_toan` varchar(50) DEFAULT NULL,
  `ngay_thanh_toan` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `don_hang_id` (`don_hang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `thanhtoan`
--

INSERT INTO `thanhtoan` (`id`, `don_hang_id`, `phuong_thuc`, `trang_thai_thanh_toan`, `ngay_thanh_toan`) VALUES
(1, 1, 'Chuyển khoản', 'Đã thanh toán', '2025-04-24 12:59:47'),
(2, 2, 'Thẻ tín dụng', 'Chưa thanh toán', '2025-04-24 12:59:47'),
(3, 3, 'Tiền mặt', 'Đã thanh toán', '2025-04-24 12:59:47');

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD CONSTRAINT `chitietdonhang_ibfk_1` FOREIGN KEY (`don_hang_id`) REFERENCES `donhang` (`id`),
  ADD CONSTRAINT `chitietdonhang_ibfk_2` FOREIGN KEY (`san_pham_id`) REFERENCES `sanpham` (`id`);

--
-- Các ràng buộc cho bảng `danhgia`
--
ALTER TABLE `danhgia`
  ADD CONSTRAINT `danhgia_ibfk_1` FOREIGN KEY (`khach_hang_id`) REFERENCES `khachhang` (`id`),
  ADD CONSTRAINT `danhgia_ibfk_2` FOREIGN KEY (`san_pham_id`) REFERENCES `sanpham` (`id`);

--
-- Các ràng buộc cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD CONSTRAINT `donhang_ibfk_1` FOREIGN KEY (`khach_hang_id`) REFERENCES `khachhang` (`id`),
  ADD CONSTRAINT `donhang_ibfk_2` FOREIGN KEY (`ma_giam_gia_id`) REFERENCES `magiamgia` (`id`);

--
-- Các ràng buộc cho bảng `giaohang`
--
ALTER TABLE `giaohang`
  ADD CONSTRAINT `giaohang_ibfk_1` FOREIGN KEY (`don_hang_id`) REFERENCES `donhang` (`id`);

--
-- Các ràng buộc cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD CONSTRAINT `giohang_ibfk_1` FOREIGN KEY (`khach_hang_id`) REFERENCES `khachhang` (`id`),
  ADD CONSTRAINT `giohang_ibfk_2` FOREIGN KEY (`san_pham_id`) REFERENCES `sanpham` (`id`);

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `sanpham_ibfk_1` FOREIGN KEY (`danh_muc_id`) REFERENCES `danhmuc` (`id`);

--
-- Các ràng buộc cho bảng `thanhtoan`
--
ALTER TABLE `thanhtoan`
  ADD CONSTRAINT `thanhtoan_ibfk_1` FOREIGN KEY (`don_hang_id`) REFERENCES `donhang` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
