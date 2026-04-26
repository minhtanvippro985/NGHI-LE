CREATE DATABASE lmaoo;
USE lmaoo;
CREATE TABLE KhachHang (
    MaKH INT PRIMARY KEY,
    HoTen NVARCHAR(100),
    DiaChi NVARCHAR(255),
    SoDienThoai VARCHAR(15)
);

CREATE TABLE SanPham (
    MaSP INT PRIMARY KEY,
    TenSP NVARCHAR(100),
    DanhMuc NVARCHAR(50),
    GiaBan DECIMAL(18, 2),
    SoLuongKho INT
);

CREATE TABLE DonHang (
    MaDon INT PRIMARY KEY,
    MaKH INT,
    NgayMua DATE,
    TrangThai NVARCHAR(50),
    FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
);

CREATE TABLE ChiTietDonHang (
    MaDon INT,
    MaSP INT,
    SoLuong INT,
    DonGia DECIMAL(18, 2),
    PRIMARY KEY (MaDon, MaSP),
    FOREIGN KEY (MaDon) REFERENCES DonHang(MaDon),
    FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
);

INSERT INTO KhachHang VALUES 
(1, N'Nguyễn Văn An', N'Hà Nội', '0912345678'),
(2, N'Trần Thị Bình', N'TP.HCM', '0987654321'),
(3, N'Lê Hoàng Nam', N'Hà Nội', '0905556667'),
(4, N'Nguyễn Thu Thủy', N'Đà Nẵng', '0933445566'),
(5, N'Phạm Minh Đức', N'Hải Phòng', '0944001122');

INSERT INTO SanPham VALUES 
(101, N'Trà Xanh Không Độ', N'Nước giải khát', 12000, 50),
(102, N'Coca Cola 1.5L', N'Nước giải khát', 20000, 100),
(103, N'Nước Khoáng Lavie', N'Nước giải khát', 5000, 200),
(104, N'Bia Tiger', N'Nước giải khát', 18000, 0), -- Hết hàng
(105, N'Bánh Quy Bơ', N'Bánh kẹo', 45000, 30);

INSERT INTO DonHang VALUES 
(501, 1, '2026-04-20', N'Đã giao'),
(502, 2, '2026-04-25', N'Đang xử lý'),
(503, 1, '2026-04-26', N'Đang giao');

INSERT INTO ChiTietDonHang VALUES 
(501, 101, 2, 12000),
(501, 102, 1, 20000),
(502, 105, 1, 45000);



SELECT*FROM SanPham
WHERE DanhMuc = 'Nước giải khát' AND GiaBan BETWEEN 10000 AND 50000;


SELECT*FROM KhachHang
WHERE HoTen LIKE 'Nguyễn%' OR DiaChi = 'Hà Nội';

SELECT* FROM DonHang
ORDER BY  NgayMua DESC;


SELECT * FROM KhachHang 
WHERE MaKH NOT IN (SELECT MaKH FROM DonHang);






