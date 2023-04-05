CREATE DATABASE covid19

USE covid19

Create table [KHACHHANG] (
	[MAKH] Integer Identity(1,1) NOT NULL,
	[TENKH] Nvarchar(40) NULL,
	[SDT] Char(10) NULL,
	[CMND] Char(12) NULL,
	[DIACHI] Nvarchar(100) NULL,
	[EMAIL] Nvarchar(50) NOT NULL,
	[ANHDAIDIEN] Nvarchar(255) NULL,
	[NGAYSINH] Datetime NULL,
	[TK] Nvarchar(20) NULL,
	[MK] Nvarchar(32) NULL,
	[GIOITINH] Nvarchar(5) NULL,
	[MAQT] Integer NOT NULL,
	[MADT] Integer NOT NULL,
Primary Key  ([MAKH])
) 
go

Create table [SANPHAM] (
	[MASP] Integer Identity(1,1) NOT NULL,
	[MADM] Integer NOT NULL,
	[TENSP] Nvarchar(50) NULL,
	[SOLUONG] Smallint NULL,
	[DONGIA] Integer NULL,
	[IMG] Nvarchar(255) NULL,
	[THONGTIN] Nvarchar(1000) NULL,
Primary Key  ([MASP])
) 
go

Create table [HOADON] (
	[MDHD] Integer Identity(1,1) NOT NULL,
	[MAKH] Integer NOT NULL,
	[NGAYLAP] Datetime NULL,
	[TONGTIEN] Money NULL,
	[TINHTRANGGIAOHANG] [bit] NULL,
	[TINHTRANGTHANHTOAN] [bit] NULL,
	[NGUOINHAN] Nvarchar(40) NULL,
	[DIACHINHAN] Nvarchar(100) NULL,
	[SDTNHAN] Char(10) NULL,
Primary Key  ([MDHD])
) 
go

Create table [DANHMUC] (
	[MADM] Integer Identity(1,1) NOT NULL,
	[TENDM] Nvarchar(50) NULL,
Primary Key  ([MADM])
) 
go

Create table [HOSO] (
	[MAHS] Integer Identity(1,1) NOT NULL,
	[NGAYLAP] Datetime NULL,
	[KHUVUC] Nvarchar(100) NULL,
	[TINHTRANG] Smallint NULL,
	[MAKH] Integer NOT NULL,
Primary Key  ([MAHS])
) 
go

Create table [TOKHAI] (
	[MATOKHAI] Integer Identity(1,1) NOT NULL,
	[DINHUNGDAU] Nvarchar(100) NULL,
	[TRIEUCHUNG] Nvarchar(100) NULL,
	[TXNGUOIBENH] Bit NULL,
	[TXNGUOINUOCBENH] Bit NULL,
	[NGUOICOBIEUHIEN] Bit NULL,
	[MAKH] Integer NOT NULL,
Primary Key  ([MATOKHAI])
) 
go

Create table [QUOCTICH] (
	[MAQT] Integer Identity(1,1) NOT NULL,
	[TENQT] Nvarchar(50) NULL,
Primary Key  ([MAQT])
) 
go

Create table [CT_HOADON] (
	[MASP] Integer NOT NULL,
	[MDHD] Integer NOT NULL,
	[DONGIA] Integer NULL,
	[SOLUONG] Smallint NULL,
Primary Key  ([MASP],[MDHD])
) 
go

Create table [DANTOC] (
	[MADT] Integer Identity(1,1) NOT NULL,
	[TENDT] Nvarchar(30) NULL,
Primary Key  ([MADT])
) 
go

Create table [GOPY] (
	[MAGY] Integer Identity(1,1) NOT NULL,
	[NOIDUNG] NvarChar(100) NULL,
	[TINHTRANG] bit NULL,
	[MAKH] Integer NOT NULL,
Primary Key  ([MAGY])
) 
go

Create table [LIENHE] (
	[MALH] Integer Identity(1,1) NOT NULL,
	[DIACHI] Nvarchar(100) NULL,
	[SDT] Char(10) NULL,
	[EMAIL] Nvarchar(50) NULL,
	[FACEBOOK] Nvarchar(255) NULL,
Primary Key  ([MALH])
) 
go

Create table [TKADMIN] (
	[TK] NVarchar(25) NOT NULL,
	[MK] NVarchar(32) NOT NULL,
	[HOTEN] Nvarchar(40) NULL,
	[EMAIL] Nvarchar(50) NOT NULL,
Primary Key  ([TK])
) 
go

Create table [BLOG] (
	[MABLOG] Integer Identity(1,1) NOT NULL,
	[TK] NVarchar(25) NOT NULL,
	[TIEUDE] Nvarchar(100) NULL,
	[NOIDUNG] Nvarchar(2000) NULL,
	[NGAYDANG] Smalldatetime NULL,
	[ANH] Nvarchar(255) NULL,
Primary Key  ([MABLOG])
) 
go


Alter table [HOSO] add  foreign key([MAKH]) references [KHACHHANG] ([MAKH]) 
go
Alter table [TOKHAI] add  foreign key([MAKH]) references [KHACHHANG] ([MAKH]) 
go
Alter table [HOADON] add  foreign key([MAKH]) references [KHACHHANG] ([MAKH]) 
go
Alter table [GOPY] add  foreign key([MAKH]) references [KHACHHANG] ([MAKH]) 
go
Alter table [CT_HOADON] add  foreign key([MASP]) references [SANPHAM] ([MASP]) 
go
Alter table [CT_HOADON] add  foreign key([MDHD]) references [HOADON] ([MDHD]) 
go
Alter table [SANPHAM] add  foreign key([MADM]) references [DANHMUC] ([MADM]) 
go
Alter table [KHACHHANG] add  foreign key([MAQT]) references [QUOCTICH] ([MAQT]) 
go
Alter table [KHACHHANG] add  foreign key([MADT]) references [DANTOC] ([MADT]) 
go
Alter table [BLOG] add  foreign key([TK]) references [TKADMIN] ([TK]) 
go

INSERT [dbo].[DANHMUC] VALUES (N'Khẩu trang')
INSERT [dbo].[DANHMUC] VALUES (N'kit test')
INSERT [dbo].[DANHMUC] VALUES (N'Đồ bảo hộ')
INSERT [dbo].[DANHMUC] VALUES (N'Găng tay')
INSERT [dbo].[DANHMUC] VALUES (N'Thuốc')
INSERT [dbo].[DANHMUC] VALUES (N'Cồn')
INSERT [dbo].[DANHMUC] VALUES (N'Dung dịch rửa tay')

INSERT [dbo].[DANTOC] VALUES (N'Kinh')
INSERT [dbo].[DANTOC] VALUES (N'Mường')
INSERT [dbo].[DANTOC] VALUES (N'Thái')
INSERT [dbo].[DANTOC] VALUES (N'Tày')
INSERT [dbo].[DANTOC] VALUES (N'Mèo')

INSERT [dbo].[QUOCTICH] VALUES (N'Việt Nam')
INSERT [dbo].[QUOCTICH] VALUES (N'Thái Lan')
INSERT [dbo].[QUOCTICH] VALUES (N'Trung Quốc')
INSERT [dbo].[QUOCTICH] VALUES (N'Hoa Kỳ')
INSERT [dbo].[QUOCTICH] VALUES (N'Lào')

INSERT [dbo].[LIENHE] VALUES (N'SAI GON', N'0367616666', N'LMTHUY37@GMAIL.COM', N'kha18cm')

INSERT [dbo].[KHACHHANG] VALUES (N'Đỗ Minh Kha', N'0938291842', N'312312340421', N'Quận 1 TP HCM', 'dmd122@gmail.com',NULL, CAST(N'2001-08-05T11:11:00.000' AS DateTime), 'dmd', 'dmd123', N'Nam', 1, 3)
INSERT [dbo].[KHACHHANG] VALUES (N'Đặng Minh Đức', N'0938291842', N'3123123     ', N'Quận 10 TP HCM','kha222@gmail.com', NULL, CAST(N'2022-06-09T20:12:00.000' AS DateTime), N'kha123', N'dsadasd', N'Nam', 3, 3)

INSERT [dbo].[GOPY] VALUES (N'Web hong', N'false', 1)

INSERT [dbo].[SANPHAM] VALUES (1, N'Khẩu trang biomeq', 200, 59000, N'assets/images/product/khautrang1.png', N'Khẩu trang y tế 4 lớp BIOMEQ MASK giúp ngăn ngừa vi khuẩn, bụi bẩn và các bệnh lây qua đường hô hấp đạt chuẩn

* Nguyên liệu cao cấp chuẩn y tế. Đạt chuẩn ISO 13845:20')
INSERT [dbo].[SANPHAM] VALUES (1, N'Khẩu trang y tế 4 lớp cao cấp', 100, 78000, N'assets/images/product/khautrang2.png', N'Khẩu Trang Y Tế Cao Cấp Anyguard Loại Lớn Dành Cho Nam Nữ 50 Cái/ Hộp
Khẩu trang loại cho người lớn, dùng phù hợp cho cả nam và nữ. Kích thước 175mmx95mm.')
INSERT [dbo].[SANPHAM] VALUES (6, N'Cồn 70 Độ Vĩnh Phúc Có Vòi Xịt 500Ml', 150, 40000, N'assets/images/product/con1.png', N' Bình xịt cồn khử khuẩn 70 Độ Vĩnh Phúc Có Vòi Xịt 500Ml tiện lợi, dùng để diệt khuẩn, nấm sau thời gian tiếp xúc 2 phút. Đồng thời, diệt khuẩn dụng cụ y tế, bề mặt trong y tế.')
INSERT [dbo].[SANPHAM] VALUES (3, N'Đồ bảo hộ', 100, 50000, N'assets/images/product/dobaoho.jpg', N'Bộ đồ chống dịch 4 món
Hàng sản xuất tại Việt Nam')
INSERT [dbo].[SANPHAM] VALUES (7, N'gel rửa tay', 250, 30000, N'assets/images/product/dungdichruatay.jpg', N'Với sứ mệnh bảo vệ toàn diện sức khỏe của người Việt, Lifebuoy - Nhãn hiệu sạch khuẩn SỐ 1 thế giới đã cho ra mắt Gel Diệt Khuẩn Tay Total 10 với công thức vượt trôi, chuẩn chất lượng y tế - diệt sạch 99,99% vi khuẩn, thích hợp sử dụng trong các trường hợp không có xà phòng hoặc nước.')
INSERT [dbo].[SANPHAM] VALUES (1, N'khẩu trang trẻ em', 250, 49000, N'assets/images/product/khautrangtreem.png', N'Khẩu Trang Y Tế Trẻ Em 4 Lớp Kháng Khuẩn')
INSERT [dbo].[SANPHAM] VALUES (2, N'KIT AG HOME TEST', 100, 89000, N'assets/images/product/kit1.png', N'- Thiết bị được thiết kế để phát hiện định tính kháng nguyên SARS-CoV-2 qua mẫu dịch ngoáy mũi ở người nghi ngờ nhiễm COVID-19
- Kháng thể đơn dòng kháng SARS-CoV-2 Nucleocapsid
- Kháng thể đơn dòng đặc hiệu với RBD Spike Protein của SARS-CoV-2 
- Kháng thể dê kháng IgG chuột')
INSERT [dbo].[SANPHAM] VALUES (2, N'Que test nhanh Biomerica', 100, 59000, N'assets/images/product/Que-test-nhanh-Biomerica.jpg', N'BIOCREDIT là một xét nghiệm sắc ký miễn dịch dòng chảy bên áp dụng hệ thống màu kép. Thử nghiệm chứa đệm liên hợp vàng dạng keo và một dải màng được phủ sẵn các kháng thể đặc hiệu với kháng nguyên SARS-CoV-2 trên các đường thử nghiệm (T). Nếu kháng nguyên SARS-CoV-2 có mặt trong mẫu bệnh phẩm, một dải màu đen có thể nhìn thất sẽ hiện trên vạch xét nghiệm (T) dưới dạng phức hợp vàng kháng thể-kháng nguyên-kháng thể. ')
INSERT [dbo].[SANPHAM] VALUES (2, N'kitaport', 150, 50000, N'assets/images/product/kitaport.jpg', N'Test nhanh Covid Abbott Panbio Covid-19 Ag Rapid Test Device (Nasal) – sinh phẩm chuẩn đoán được WHO phê duyệt trong danh mục xét nghiệm Covid-19 do hãng Abbott Diagnostics Inc sản xuất. Sản phẩm sử dụng dịch mũi cho cảm giác nhẹ nhàng hơn so với các bộ xét nghiệm dùng dịch tỵ hầu.')
INSERT [dbo].[SANPHAM] VALUES (1, N'Khẩu trang y tế 4 lớp cao cấp', 300, 59000, N'assets/images/product/Sugentech-1.jpg', N'khẩu trang t tế 4 lớp cao cấp hỗ trợ kháng khuẩn, kháng dịch')
INSERT [dbo].[SANPHAM] VALUES (4, N'găng tay y tế', 400, 40000, N'assets/images/product/khautrangtenamy.jpg', N'găng tay t tế hỗ trợ kháng khuẩn chống dịch covid19')
INSERT [dbo].[SANPHAM] VALUES (5, N'Paracetamol stada', 500, 48000, N'assets/images/product/thuoc1.png', N'- Để viên sủi tan hoàn toàn trong nước rồi mới uống
- Đọc kỹ hướng dẫn sử dụng trước khi dùng')
INSERT [dbo].[SANPHAM] VALUES (5, N'vitamin c', 500, 29000, N'assets/images/product/thuoc2.png', N'Viên sủi Vitamin C Mivolis giúp duy trì hệ miễn dịch tự nhiên. Hương vị cam, không chứa đường, không có lactose, thuần chay giúp bổ sung chế độ ăn uống không cân bằng.')
INSERT [dbo].[SANPHAM] VALUES (5, N'vitaminc kabi500', 500, 20000, N'assets/images/product/thuoc3.png', N'
Thuốc Vitamin C Kabi 500mg/5ml có tác dụng ngăn ngừa và điều chỉnh các bệnh do thiếu hụt vitamin C. Trong bài viết này, Trung Tâm Thuốc Central Pharmacy xin gửi đến bạn đọc cách sử dụng và các lưu ý khi dùng thuốc Vitamin C Kabi 500mg/5ml.')
INSERT [dbo].[SANPHAM] VALUES (5, N'Molnupiravir Stella', 500, 20000, N'assets/images/product/thuoc4.png', N'Thuốc Molnupiravir 400mg là sản phẩm của Công ty TNHH Liên doanh Stellapharm có thành phần hoạt chất chính là Molnupiravir. Thuốc dùng chỉ định điều trị Covid-19 mức độ nhẹ đến trung bình ở người trưởng thành dương tính với xét nghiệm chẩn đoán SARS-CoV-2 và có ít nhất một yếu tố nguy cơ làm tiến triển bệnh nặng.')
INSERT [dbo].[SANPHAM] VALUES (5, N'Molravir 400', 400, 40000, N'assets/images/product/thuoc4.png', N'Thuốc Molravir 400mg là sản phẩm của Công ty Cổ phần Dược phẩm Boston Việt Nam được Bộ Y tế cấp phép khẩn cấp là thuốc chứa hoạt chất Molnupiravir, chỉ định điều trị Covid-19 nhẹ đến trung bình ở người trưởng thành dương tính với xét nghiệm chẩn đoán SARS-CoV-2')
INSERT [dbo].[SANPHAM] VALUES (6, N'cồn 70 độ pink', 200, 25000, N'assets/images/product/con2.png', N'cồn 70độ không được uống. dùng để sát khuẩn')
INSERT [dbo].[SANPHAM] VALUES (6, N'cồn 70 độ vp ', 200, 50000, N'assets/images/product/con3.png', N'cồn 70 độ 1000ml ...')

INSERT [dbo].[TKADMIN] VALUES (N'dnnd123', N'Duc123@', N'Đào Nguyễn Ngọc Đức', N'duc123@gmail.com')
INSERT [dbo].[TKADMIN] VALUES (N'kha123', N'123', N'Minh Kha  ', N'minhmapgc22@gmail.com')

INSERT [dbo].[TOKHAI] VALUES (N'hcm', N'ho nhieu', 1, 1, 1, 1)

INSERT [dbo].[BLOG] VALUES (N'dnnd123', N'covid 19 đã gây ra thiệt hại ntn ', N'dsjafkafjkadjf', CAST(N'2022-06-26T00:00:00' AS SmallDateTime), N'assets/images/product/khautrang1.png')
INSERT [dbo].[BLOG] VALUES (N'dnnd123', N'Tôi có nên dùng thuốc kháng vi-rút nếu nhận được COVID-19 không? Đây là những điều cần biết', N'Thuốc kháng vi-rút COVID-19 giúp cơ thể bạn chống lại sự lây nhiễm bằng cách ngăn vi-rút tạo ra các bản sao của chính nó. Điều này giúp giảm các triệu chứng và rút ngắn thời gian bị bệnh.

Paxlovid là sự kết hợp của hai loại thuốc kháng vi-rút: nirmatrelvir và ritonavir. Denise Erickson, giám đốc cấp cao của Banner Pharmacy Services, cho biết: “Nirmatrelvir ngăn không cho COVID-19 nhân lên để virus không thể tạo ra các bản sao của chính nó. “Sau đó, ritonavir giúp làm chậm quá trình phân hủy nirmatrelvir, cho phép thuốc ở trong cơ thể bạn ở mức cao hơn lâu hơn.”

Lagevrio cũng ngăn COVID-19 tự sao chép. Nó làm như vậy bằng cách lừa vi-rút chèn Lagevrio vào vật liệu di truyền của nó khiến vi-rút khó tạo bản sao.', CAST(N'2022-05-24T00:00:00' AS SmallDateTime), N'assets/images/product/khautrang1.png')
INSERT [dbo].[BLOG] VALUES (N'dnnd123', N'covid 19 đã gây ra thiệt hại ntn ', N'Thuốc kháng vi-rút COVID-19 giúp cơ thể bạn chống lại sự lây nhiễm bằng cách ngăn vi-rút tạo ra các bản sao của chính nó. Điều này giúp giảm các triệu chứng và rút ngắn thời gian bị bệnh.

Paxlovid là sự kết hợp của hai loại thuốc kháng vi-rút: nirmatrelvir và ritonavir. Denise Erickson, giám đốc cấp cao của Banner Pharmacy Services, cho biết: “Nirmatrelvir ngăn không cho COVID-19 nhân lên để virus không thể tạo ra các bản sao của chính nó. “Sau đó, ritonavir giúp làm chậm quá trình phân hủy nirmatrelvir, cho phép thuốc ở trong cơ thể bạn ở mức cao hơn lâu hơn.”

Lagevrio cũng ngăn COVID-19 tự sao chép. Nó làm như vậy bằng cách lừa vi-rút chèn Lagevrio vào vật liệu di truyền của nó khiến vi-rút khó tạo bản sao.', CAST(N'2022-05-24T00:00:00' AS SmallDateTime), N'assets/images/product/khautrang1.png')



	