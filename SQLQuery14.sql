USE master
GO
if exists (select * from sysdatabases where name='Banggurus')
		drop database [Banggurus]
GO
CREATE DATABASE [Banggurus]
GO
USE [Banggurus];
GO
-- 1. Tạo bảng chuỗi nhà hàng
CREATE TABLE [gurusRestaurants](
	[Id] INT IDENTITY(1, 1) PRIMARY KEY, 
	[Name] NVARCHAR (50) NOT NULL ,
	[Address] NVARCHAR (50) NOT NULL,
	[Phone] VARCHAR (20),
	[Detail] NTEXT,
	[shopImages] NTEXT,
	[TableQuality] INT,
	[MenuList] NVARCHAR (50),
	[OpenTime] TIME,
	[CloseTime] TIME,
	[Status] INT DEFAULT 1
);

GO
-- Bản ghi guruRestaurants
INSERT INTO [gurusRestaurants] ([Name], [Address], [Phone], [Detail], [shopImages], [TableQuality], [OpenTime],[CloseTime])
VALUES      ( 'Hải Phòng Banguru', '8A Tôn Thất Thuyết', '096667788',
	        N'Chuỗi Cửa hàng Ban Guru niềm hạnhh phúc trong tiếng Nhật, Sushi Kei gợi liên tưởng về cảm giác vui tươi, hào hứng và mong muốn tạo sự hài lòng cao nhất cho thực khách khi được thưởng thức các món ăn Nhật Bản tươi ngon, chọn lọc tại nhà hàng.',
			'http://sushikei.vn/wp-content/uploads/2015/01/5_310x174.jpg, ','25', '8:00', '22:00'),
			( 'Hải Dương Banguru', '09 Trần Duy Hưng', '09884568',
			N'Chuỗi Cửa hàng Ban Guru  niềm hạnh phúc trong tiếng Nhật, Sushi Kei gợi liên tưởng về cảm giác vui tươi, hào hứng và mong muốn tạo sự hài lòng cao nhất cho thực khách khi được thưởng thức các món ăn Nhật Bản tươi ngon, chọn lọc tại nhà hàng.', 
            'http://sushikei.vn/wp-content/uploads/2015/01/DSCF3227_310x174.jpg', '15', '8:00', '22:00'),
			( 'Hà Nội Banguru', '11 Pham Van Dong', '091234569',
			N'Chuỗi Cửa hàng Ban Guru  niềm hạnh phúc trong tiếng Nhật, Sushi Kei gợi liên tưởng về cảm giác vui tươi, hào hứng và mong muốn tạo sự hài lòng cao nhất cho thực khách khi được thưởng thức các món ăn Nhật Bản tươi ngon, chọn lọc tại nhà hàng.', 
			'http://sushikei.vn/wp-content/uploads/2015/01/DSCF3227_310x174.jpg', '30', '8:00', '22:00'),
			( 'Kiên Giang Banguru', 'Kim Chung', '086969980',
			N'Chuỗi Cửa hàng Ban Guru  niềm hành phúc trong tiếng Nhật, Sushi Kei gợi liên tưởng về cảm giác vui tươi, hào hứng và mong muốn tạo sự hài lòng cao nhất cho thực khách khi được thưởng thức các món ăn Nhật Bản tươi ngon, chọn lọc tại nhà hàng.', 
			'http://sushikei.vn/wp-content/uploads/2015/01/DSCF3227_310x174.jpg', '16', '8:00', '22:00'),
			( 'Hồ Chí Minh Banguru', 'Hoang Quoc Viet', '0934426566',
			N'Chuỗi Cửa hàng Ban Guru niềm hạnh phúc trong tiếng Nhật, Sushi Kei gợi liên tưởng về cảm giác vui tươi, hào hứng và mong muốn tạo sự hài lòng cao nhất cho thực khách khi được thưởng thức các món ăn Nhật Bản tươi ngon, chọn lọc tại nhà hàng.', 
			'http://sushikei.vn/wp-content/uploads/2015/01/DSCF3227_310x174.jpg', '20', '8:00', '22:00');
			
GO
--2.Tạo bảng các món ăn.
CREATE TABLE [Foods](
	[Id] INT IDENTITY(1, 1) PRIMARY KEY,
	[Name] NVARCHAR (50) NOT NULL,
	[Detail] TEXT NOT NULL,
	[Images] NTEXT,
	[UnitPrice] INT DEFAULT 0,
	[CreatedAt] DATETIME DEFAULT GETDATE(),
	[UpdatedAt] DATETIME DEFAULT GETDATE(),
	[Status] INT DEFAULT 1
);
-- Bản ghi các món ăn
INSERT INTO [Foods] ([Name], [Detail], [UnitPrice], [Images], [CreatedAt], [UpdatedAt], [Status]) 
VALUES ('Món Sushi', 'Sushi thường được cắt theo khoanh, dùng ngay sau khi vừa được dọn ra, và ăn kèm với nước tương, wasabi và gừng ngâm chua. ', '250000', 
	   'http://sushikei.vn/wp-content/uploads/2016/03/ssk6-1024x683.jpg', '2017-01-15', '2017-01-15', 1),
	  ('Món Bò xông khói', 'là một món lẩu nhưng nguyên liệu chính là thịt bò.', '350000',
	  'http://www.tournhatban.net.vn/images/shabu.jpg', '2017-01-02', '2017-01-02', 1),
	  ('Món Hotdog', 'Sukiyaki là món ăn “thống trị Nhật Bản” với thành phần chính là thịt bò Rib eye', '650000', 
	  'http://www.tournhatban.net.vn/images/lausukiyaki.jpg', '2017-03-10', '2017-03-10', 1),
	  ('Mì Spagety ', 'Udon được làm từ bột mì, muối và nước, có thể ăn nóng hoặc lạnh nhưng ăn nóng vẫn là hấp dẫn hơn cả', '200000',
	  'http://www.tournhatban.net.vn/images/mi-udon-nhat-ban.jpg', '2017-01-10', '2017-01-10', 1),
	  ('Món Bánh Xèo', 'Tempura là một món ẩm thực của Nhật Bản gồm các loại hải sản, rau, củ tẩm bột mì rán ngập trong dầu', '380000', 
	  'http://www.tournhatban.net.vn/images/tempura.jpg', '2017-03-10', '2017-03-10', 1);
GO
-- Tạo bảng trung gian giữa food và BanguruRestaurants
CREATE TABLE [gurusRestaurantFood](
	[RestaurantId] INT FOREIGN KEY REFERENCES [gurusRestaurants](Id),
	[FoodId] INT FOREIGN KEY REFERENCES [Foods](Id),
	[Detail] NTEXT,
	CONSTRAINT PrimaryKey_RestaurantFood PRIMARY KEY ([FoodId], [RestaurantId])
);
GO
--2.Tạo bảng danh mục các món ăn.
CREATE TABLE [Categories](
	[Id] INT IDENTITY (1,1) PRIMARY KEY,
	[Name] NVARCHAR (50) NOT NULL,
	[Detail] TEXT NOT NULL,
	[CreatedAt] DATETIME DEFAULT GETDATE(),
	[UpdatedAt] DATETIME DEFAULT GETDATE(),
	[Status] INT DEFAULT 1
);

GO
-- Bản ghi danh mục 
INSERT INTO [Categories] ([Name], [Detail])
VALUES ('Món Nhật', 'Chi tiet các món mì'),
		('Món Hàn', 'Chi tiết các món sushi'),
		('Món Ý', 'Chi tiết loại nước uống'),
		('Món Mĩ', 'Chi tiết Yaki'),
		('Món Việt', 'Chi tiết hotpot');
GO
--Bảng trung gian giữa bảng món ăn và danh mục.
CREATE TABLE [FoodCategories](
	[FoodId] INT FOREIGN KEY REFERENCES [Foods] (Id),
	[CategoryId] INT FOREIGN KEY REFERENCES [Categories] (Id),
	CONSTRAINT PrimaryKey PRIMARY KEY ([FoodId], [CategoryId])
);
INSERT INTO [FoodCategories]([FoodId],[CategoryId])
VALUES (1,1),
(2,4),(3,3),(4,3),(5,5)
GO
GO
-- Tạo bảng thông tin khách hàng.
CREATE TABLE [Customers](
	[Id] INT IDENTITY(1, 1) PRIMARY KEY,
	[FullName] NVARCHAR (25),
	[Phone] VARCHAR (20) UNIQUE,
	[Email] VARCHAR (200) UNIQUE,
	[BirthDay] DATE,
	[Gender] INT DEFAULT 0 CHECK(Gender<=2),
	[Adrress] NVARCHAR (50),
	[Avatar] varchar(1000),
	[CreatedUser] DATETIME DEFAULT GETDATE(),
	[UpdateUser] DATETIME DEFAULT GETDATE(),
	[Status] INT DEFAULT 1
);
GO
--Bản ghi Customers
INSERT INTO [Customers] ([FullName], [Phone], [Email], [BirthDay], [Adrress], [Avatar])
     VALUES ('Đặng Tiểu Bình', '0987654321', 'binh2000@gmail.com', '2000-04-23', 'Vĩnh Phúc', 'https://cdn.dribbble.com/users/199982/screenshots/4044699/furkan-avatar-dribbble.png'),
			('Nguyễn Văn Đạt', '0987654322', 'dat2001@gmail.com', '1990-03-11','Hải Dương', 'https://cdn.dribbble.com/users/199982/screenshots/4044699/furkan-avatar-dribbble.png'),
			('Vũ Thị Hoài Anh', '0987654323', 'hoaianh2002@gmail.com', '2002-10-23', 'Hà Nội', 'https://cdn.dribbble.com/users/199982/screenshots/4044699/furkan-avatar-dribbble.png'),
			('Phan Hoài Nam', '0987654324', 'xaonam2003@gmail.com', '2003-05-13','Lào Cai', 'https://cdn.dribbble.com/users/199982/screenshots/4044699/furkan-avatar-dribbble.png'),
			('Hoàng Tất Thành', '0987654325', 'tatthanh2004@gmail.com', '2004-12-11','Yên Bái', 'https://cdn.dribbble.com/users/199982/screenshots/4044699/furkan-avatar-dribbble.png')

--Tạo bảng Orders
CREATE TABLE [Orders](

	[OrderId] INTEGER IDENTITY(1, 1) PRIMARY KEY,
	[FoodsId] INTEGER FOREIGN KEY REFERENCES [Foods](Id),
	[CustumerId] INTEGER FOREIGN KEY REFERENCES [Customers](Id),
	[RestaurantId] INTEGER FOREIGN KEY REFERENCES [gurusRestaurants](Id),
	[UnitPrice] INT,
	[CreatedAt] DATETIME DEFAULT GETDATE(),
	[UpdatedAt] DATETIME DEFAULT GETDATE(),
	[DeleteAt] DATETIME,
	[Status] INTEGER DEFAULT 1  --Status: 1: đang chờ; 2: đã hoàn thành; 0: đã xóa
);
-- bản ghi orders
INSERT INTO [Orders] ([CustumerId],[FoodsId], [RestaurantId],[UnitPrice] ,[Status])
VALUES (1,2,2, '500000',1),
	   (2,1,4, '250000',2),
	   (3,4,2, '200000',1),
	   (4,2,1, '350000',2),
	   (5,3,5, '650000',1),
       (1,1,1, '250000',1),
       (2,3,2, '650000',2),
       (3,4,4, '200000',1),
       (4,5,3, '380000',1),
       (5,2,3, '350000',1);
GO

--Bảng OrderDetails
CREATE TABLE [OrderDetails]( 
	[OrderId] INTEGER FOREIGN KEY REFERENCES [Orders]([OrderId]),
	[FoodId] INTEGER FOREIGN KEY REFERENCES [Foods](Id),
	[TotalPrice] INTEGER,
	[Quantity] INTEGER,
	[CreatedAt] DATE,
	[UpdatedAt] DATETIME DEFAULT GETDATE(),
	[DeletedAt] DATETIME DEFAULT GETDATE(),
	[Status] INT DEFAULT 1 
); 
-- bản ghi ordersDetails
INSERT INTO [OrderDetails] ([OrderId], [FoodId], [Quantity],[TotalPrice] ,[CreatedAt])
VALUES (1,2,3,'1050000','2018-10-14'),
       (1,3,4,'2600000','2018-11-13'),
       (2,5,1,'380000','2018-10-14'),
       (2,4,2,'400000','2018-05-14'),
       (3,2,5,'1750000','2018-11-21'),
       (3,1,10,'2500000','2018-12-22'),
       (4,2,15,'9750000','2018-11-11'),
       (4,5,3,'1900000','2018-06-13'),
       (5,1,8,'2000000','2018-10-12'),
       (5,2,3,'1050000','2018-10-14'),
       (6,1,7,'1750000','2018-10-14'),
       (6,4,20,'4000000','2018-10-14'),
       (7,5,25,'9500000','2018-10-14'),
       (7,1,12,'3000000','2018-10-14'),
       (8,2,4,'1400000','2018-10-14'),
       (8,3,9,'5850000','2018-10-10'),
       (9,3,2,'1300000','2018-10-14'),
       (9,4,6,'1200000','2018-10-14'),
       (10,1,4,'1000000','2018-10-14'),
       (10,2,5,'2100000','2018-10-14');

GO


CREATE INDEX idx_pname
ON [Foods] ([Name], [UnitPrice]);
GO
CREATE VIEW  TodaySaleProduct AS
SELECT o.[FoodId], SUM(o.[Quantity])as [SumQuantity], SUM(o.[TotalPrice])as [SumUnitPrice]
	FROM [OrderDetails]as o
	WHERE CreatedAt = '2018-10-14'
	GROUP BY o.[FoodId]
GO

CREATE PROCEDURE Revenue_by_day2 @startDate DATETIME, @endDate DATETIME
AS 
SELECT Sum([TotalPrice]) as [DoanhThu] FROM [OrderDetails] WHERE [CreatedAt] BETWEEN @startDate AND @endDate ;

--EXEC Revenue_by_day2 @startDate = '2018-10-14 00:00:00.000', @endDate = '2018-12-22 00:00:00.000';

--select CreatedAt from Orders  order by CreatedAt Desc
--SELECT [Name],[UnitPrice] AS VND FROM Foods WHERE [UnitPrice]>300
--select * from TodaySaleProduct