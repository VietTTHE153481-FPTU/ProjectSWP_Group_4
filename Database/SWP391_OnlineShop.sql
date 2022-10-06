USE master
DROP DATABASE IF EXISTS SWP391_OnlineShop
CREATE DATABASE SWP391_OnlineShop;
GO
USE [SWP391_OnlineShop]
GO
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE UserStatus (
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	StatusName nvarchar(1000)
) ON [PRIMARY]
GO
INSERT INTO UserStatus VALUES (N'Active');
INSERT INTO UserStatus VALUES (N'Locked');
INSERT INTO UserStatus VALUES (N'Gmail Login');
INSERT INTO UserStatus VALUES (N'Unverified');
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Create table [Role](
	[RoleID] int IDENTITY(1, 1) primary key,
	[RoleName] nvarchar (20),
);
GO
INSERT INTO [Role] VALUES (N'Admin');
INSERT INTO [Role] VALUES (N'Seller');
INSERT INTO [Role] VALUES (N'Customer');
INSERT INTO [Role] VALUES (N'Shipper');
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE [Users] (
	UserID int PRIMARY KEY identity(1,1),
	[username] nvarchar(500),
	[password] varchar(1000),
	[fullname] [nvarchar] (500),
	[phone] [nvarchar](20),
	[gender] [bit],
	email nvarchar(1000),
	[RoleID] int,
	StatusID int,
	constraint Status_ID_in_Status FOREIGN KEY(StatusID) REFERENCES UserStatus(ID),
	constraint role_in_Role FOREIGN KEY(RoleID) REFERENCES [Role]([RoleID])
);
GO
INSERT INTO Users VALUES(N'admin','123456','Admin','0123445566',0,'admin@fpt.edu.vn',1,1);
INSERT INTO Users VALUES(N'hieu','hieu',N'Hiếu','0123456789',0,'hieuNTHE160326@fpt.edu.vn',1,1);
INSERT INTO Users VALUES(N'vha','vha',N'Hoàng Anh','0987654321',0,'anhvhhe163109@fpt.edu.vn',1,1);
INSERT INTO Users VALUES(N'minh','minh',N'Minh','0147258369',0,'minhtche161354@fpt.edu.vn',2,1);
INSERT INTO Users VALUES(N'thai','thai',N'Thái','0963852741',0,'thailshe160614@fpt.edu.vn',2,1);
INSERT INTO Users VALUES(N'viet','viet',N'Việt','0142753896',0,'viettthe153481@fpt.edu.vn',2,1);
INSERT INTO Users VALUES(N'mkt','mkt',N'Seller','0369147852',1,'mkt@fpt.edu.vn',2,1);
INSERT INTO Users VALUES(N'shipper','12345',N'Shipper','0789123654',0,'shipper@fpt.edu.vn',4,1);
INSERT INTO Users VALUES('cus1','cus1',N'Customer1','0112233445',1,'customer1@gmail.com', 3, 1);
INSERT INTO Users VALUES('cus2','cus2',N'Customer2','0123456777',1,'customer2@gmail.com', 3, 1);
INSERT INTO Users VALUES('cus3','cus3',N'Customer3','0123456888',0,'customer3@gmail.com', 3, 1);
INSERT INTO Users VALUES('cus4','cus4',N'Customer4','0123456999',1,'customer4@gmail.com', 3, 1);
INSERT INTO Users VALUES('cus5','cus5',N'Customer5','0111123456',1,'customer5@gmail.com', 3, 1);
INSERT INTO Users VALUES('cus6','cus6',N'Customer6','0122223456',1,'customer6@gmail.com', 3, 1);
INSERT INTO Users VALUES('cus7','cus7',N'Customer7','0123333456',1,'customer7@gmail.com', 3, 1);
INSERT INTO Users VALUES('cus8','cus8',N'Customer8','0123444456',0,'customer8@gmail.com', 3, 1);
INSERT INTO Users VALUES('cus9','cus9',N'Customer9','0123455556',1,'customer9@gmail.com', 3, 1);
INSERT INTO Users VALUES('abc','123',N'Shipper','0946312458',1,'abc456@gmail.com', 4, 1);
INSERT INTO Users VALUES('xyz','456',N'Shipper','0145326849',0,'xyz123@gmail.com', 4, 1);
INSERT INTO Users VALUES('html','789',N'Shipper','0222356777',0,'html5@gmail.com', 4, 1);
INSERT INTO Users VALUES('css','2222',N'Khách VIP','0155234789',1,'khachvip01@gmail.com', 3, 1);
INSERT INTO Users VALUES('java','4444',N'Shipper','0196478532',0,'java8@gmail.com', 4, 1);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Ship (
	id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	CityName nvarchar(1000) ,
	ShipPrice int
) ON [PRIMARY]
GO
INSERT INTO Ship VALUES (N'An Giang', 30000);
INSERT INTO Ship VALUES (N'Bà Rịa-Vũng Tàu', 30000);
INSERT INTO Ship VALUES (N'Bạc Liêu', 30000);
INSERT INTO Ship VALUES (N'Bắc Kạn', 30000);
INSERT INTO Ship VALUES (N'Bắc Giang', 30000);
INSERT INTO Ship VALUES (N'Bắc Ninh', 30000);
INSERT INTO Ship VALUES (N'Bến Tre', 30000);
INSERT INTO Ship VALUES (N'Bình Dương', 30000);
INSERT INTO Ship VALUES (N'Bình Định', 30000);
INSERT INTO Ship VALUES (N'Bình Phước', 30000);
INSERT INTO Ship VALUES (N'Bình Thuận', 30000);
INSERT INTO Ship VALUES (N'Cà Mau', 30000);
INSERT INTO Ship VALUES (N'Cao Bằng', 30000);
INSERT INTO Ship VALUES (N'Cần Thơ', 30000);
INSERT INTO Ship VALUES (N'Đà Nẵng', 30000);
INSERT INTO Ship VALUES (N'Đắk Lắk', 30000);
INSERT INTO Ship VALUES (N'Đắk Nông', 30000);
INSERT INTO Ship VALUES (N'Điện Biên', 30000);
INSERT INTO Ship VALUES (N'Đồng Nai', 30000);
INSERT INTO Ship VALUES (N'Đồng Tháp', 30000);
INSERT INTO Ship VALUES (N'Gia Lai', 30000);
INSERT INTO Ship VALUES (N'Hà Giang', 30000);
INSERT INTO Ship VALUES (N'Hà Nam', 30000);
INSERT INTO Ship VALUES (N'Hà Nội', 20000);
INSERT INTO Ship VALUES (N'Hà Tĩnh', 30000);
INSERT INTO Ship VALUES (N'Hải Dương', 30000);
INSERT INTO Ship VALUES (N'Hải Phòng', 30000);
INSERT INTO Ship VALUES (N'Hòa Bình', 30000);
INSERT INTO Ship VALUES (N'Hồ Chí Minh', 30000);
INSERT INTO Ship VALUES (N'Hậu Giang', 30000);
INSERT INTO Ship VALUES (N'Hưng Yên', 30000);
INSERT INTO Ship VALUES (N'Khánh Hòa', 30000);
INSERT INTO Ship VALUES (N'Kiên Giang', 30000);
INSERT INTO Ship VALUES (N'Kon Tum', 30000);
INSERT INTO Ship VALUES (N'Lai Châu', 30000);
INSERT INTO Ship VALUES (N'Lào Cai', 30000);
INSERT INTO Ship VALUES (N'Lạng Sơn', 30000);
INSERT INTO Ship VALUES (N'Lâm Đồng', 30000);
INSERT INTO Ship VALUES (N'Long An', 30000);
INSERT INTO Ship VALUES (N'Nam Định', 30000);
INSERT INTO Ship VALUES (N'Nghệ An', 30000);
INSERT INTO Ship VALUES (N'Ninh Bình', 30000);
INSERT INTO Ship VALUES (N'Ninh Thuận', 30000);
INSERT INTO Ship VALUES (N'Phú Thọ', 30000);
INSERT INTO Ship VALUES (N'Phú Yên', 30000);
INSERT INTO Ship VALUES (N'Quảng Bình', 30000);
INSERT INTO Ship VALUES (N'Quảng Nam', 30000);
INSERT INTO Ship VALUES (N'Quảng Ngãi', 30000);
INSERT INTO Ship VALUES (N'Quảng Ninh', 30000);
INSERT INTO Ship VALUES (N'Quảng Trị', 30000);
INSERT INTO Ship VALUES (N'Sóc Trăng', 30000);
INSERT INTO Ship VALUES (N'Sơn La', 30000);
INSERT INTO Ship VALUES (N'Tây Ninh', 30000);
INSERT INTO Ship VALUES (N'Thái Bình', 30000);
INSERT INTO Ship VALUES (N'Thái Nguyên', 30000);
INSERT INTO Ship VALUES (N'Thanh Hóa', 30000);
INSERT INTO Ship VALUES (N'Thừa Thiên - Huế', 30000);
INSERT INTO Ship VALUES (N'Tiền Giang', 30000);
INSERT INTO Ship VALUES (N'Trà Vinh', 30000);
INSERT INTO Ship VALUES (N'Tuyên Quang', 30000);
INSERT INTO Ship VALUES (N'Vĩnh Long', 30000);
INSERT INTO Ship VALUES (N'Vĩnh Phúc', 30000);
INSERT INTO Ship VALUES (N'Yên Bái', 30000);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE UserAddress (
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	UserID int,
	ShipName nvarchar(500),
	ShipAddress nvarchar(1000),
	ShipCityID int,
	PhoneNum nvarchar(20),
	constraint userID_in_user_address FOREIGN KEY(UserID) REFERENCES Users(UserID),
	constraint ship_city_in_ship_address FOREIGN KEY(ShipCityID) REFERENCES Ship(id)
) ON [PRIMARY]
GO
INSERT INTO dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID],[PhoneNum]) values (1, N'Trần Trung Việt', N'Đại Học FPT', 36,'0142753896');
INSERT INTO dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (2, 'Shellysheldon', '80 Homewood Pass', 45);
INSERT INTO dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (3, 'Joletta', '180 Evergreen Circle', 61);
INSERT INTO dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (4, 'Tammi', '920 Melby Trail', 1);
INSERT INTO dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID],[PhoneNum]) values (5, N'Bạch Ngọc Minh Châu', N'Đại Học FPT', 24,'0123456789');
INSERT INTO dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (6, 'Eba', '0 Dovetail Park', 38);
INSERT INTO dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (7, 'Farica', '39269 Calypso Place', 20);
INSERT INTO dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (8, 'Vevay', '730 Walton Crossing', 6);
INSERT INTO dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (9, 'Caitrin', '61811 Oak Trail', 54);
INSERT INTO dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (10, 'Hamlin', '48603 Cordelia Pass', 7);
INSERT INTO dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (11, 'Hortense', '443 Eastwood Drive', 30);
INSERT INTO dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (12, 'Ilario', '87 Luster Drive', 9);
INSERT INTO dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (13, 'Rici', '13953 Gateway Trail', 43);
INSERT INTO dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (14, 'Nola', '79435 Pawling Center', 49);
INSERT INTO dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (15, 'Sax', '7501 Doe Crossing Place', 40);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Category (
	CategoryID int PRIMARY KEY identity(1,1),
	CategoryName nvarchar(1000),
	CategoryImgURL varchar(225)
) ON [PRIMARY]
GO
INSERT INTO dbo.Category(CategoryName,CategoryImgURL)VALUES(N'Men Clothes','men_clothes.png');
INSERT INTO dbo.Category(CategoryName,CategoryImgURL)VALUES(N'Women Clothes','women_clothes.png');
INSERT INTO dbo.Category(CategoryName,CategoryImgURL)VALUES(N'Men Shoes','men_shoes.png');
INSERT INTO dbo.Category(CategoryName,CategoryImgURL)VALUES(N'Women Shoes','women_shoes.png');
INSERT INTO dbo.Category(CategoryName,CategoryImgURL)VALUES(N'Fashion Accessories','accessories.png');
INSERT INTO dbo.Category(CategoryName,CategoryImgURL)VALUES(N'Men Bags','bags.png');
INSERT INTO dbo.Category(CategoryName,CategoryImgURL)VALUES(N'Women Bags','women_bags.png');
INSERT INTO dbo.Category(CategoryName,CategoryImgURL)VALUES(N'Watches','watches.png');
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[SubCategory](
	[SubCategoryID] [int] PRIMARY KEY  IDENTITY(1,1) ,
	[SubCategoryName] nvarchar(255),
	[CategoryID] [int] ,
	constraint CategoryID FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
	)
GO
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES(N'Jackets & Coats',1);
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES(N'Jean',1);
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES(N'Shorts',1);
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES(N'Hoodies & Sweatshirts',1);
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES(N'Dresses',2);
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES(N'Skirt',2);
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES(N'Bikini',2);
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES (N'Sneakers',3);
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES (N'Loafers',3);
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES (N'Leather Shoes',3);
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES (N'High heel',4);
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES (N'Boots',4);
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES (N'Sneakers',4);
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES (N'Rings',5);
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES (N'Earrings',5);
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES (N'Hats & Caps',5);
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES (N'Necklaces',5);
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES (N'Backpacks',6);
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES (N'Wallets',6);
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES (N'Crossbody & Shoulder',6);
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES (N'Handbag',7);
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES (N'Tote Bags',7);
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES (N'Cosmetic Bags',7);
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES (N'Set & Couple Watches',8);
INSERT INTO dbo.SubCategory(SubCategoryName,CategoryID)VALUES (N'Fashion Watches',8);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE ProductStatus (
	StatusID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	StatusName nvarchar(1000)
) ON [PRIMARY]
GO
INSERT INTO ProductStatus VALUES ( N'Available');
INSERT INTO ProductStatus VALUES ( N'StopBusiness');
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
--https://www.stylight.com/Brands/
CREATE TABLE Brand (
	BrandID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	BrandName nvarchar(1000)
) ON [PRIMARY]
GO
INSERT INTO dbo.Brand(BrandName)VALUES(N'Borsalino');
INSERT INTO dbo.Brand(BrandName)VALUES(N'Bailey');
INSERT INTO dbo.Brand(BrandName)VALUES(N'Mayser');
INSERT INTO dbo.Brand(BrandName)VALUES(N'Tokyo Life');
INSERT INTO dbo.Brand(BrandName)VALUES(N'Zombie');
INSERT INTO dbo.Brand(BrandName)VALUES(N'FREAKERS');
INSERT INTO dbo.Brand(BrandName)VALUES(N'Karihada');
INSERT INTO dbo.Brand(BrandName)VALUES(N'Icon Denim');
INSERT INTO dbo.Brand(BrandName)VALUES(N'Hyperdenim VN');
INSERT INTO dbo.Brand(BrandName)VALUES(N'Davies');
INSERT INTO dbo.Brand(BrandName)VALUES(N'EnvyLook');
INSERT INTO dbo.Brand(BrandName)VALUES(N'Nike');
INSERT INTO dbo.Brand(BrandName)VALUES(N'Vans');
INSERT INTO dbo.Brand(BrandName)VALUES(N'Adidas');
INSERT INTO dbo.Brand(BrandName)VALUES(N'Flaans');
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Product (
	ProductID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	ProductName nvarchar(1000),
	[Description] nvarchar(2000),
	OriginalPrice [money], 
	SellPrice [money],	
	SalePercent int CHECK (SalePercent>=0 AND SalePercent<=100),
	SubCategoryID int,
	SellerID int,
	Amount int,
	StatusID int,
	BrandID int,
	constraint product_in_subCategory FOREIGN KEY(SubCategoryID) REFERENCES SubCategory(SubCategoryID),
	constraint SellerID_in_Users FOREIGN KEY(SellerID) REFERENCES Users(UserID),
	constraint StatusID_in_Status FOREIGN KEY(StatusID) REFERENCES ProductStatus(StatusID),
	constraint BrandID_in_Brand FOREIGN KEY(BrandID) REFERENCES Brand(BrandID)
) ON [PRIMARY]
GO
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Product VALUES (N'KAKI bomber jackets - FUNK Unisex baseball shirt',N'The fabric of the shirt is a genuine khaki material with a prominent border pattern, with a thick inner lining.',300000,165000,45,1,2,100,1,1);
INSERT INTO Product VALUES (N'Latest fashion KAKI jacket 2019 KKN01',N'KAKI jacket is suitable for dynamic, youthful and masculine style. With raw KAKI fabric, thick, warm, durable, delicate design, solemn color.',250000,102000,59,1,2,100,1,1);
INSERT INTO Product VALUES (N'KAKI unisex jacket Ulzzang style',N'The shirt is manufactured from KAKI fabric type 1, does not ruffle, does not fade, does not cause skin irritation. Standard form, comfortable, moderate color, flattering shape, suitable for all ages.',350000,350000,0,1,2,100,1,2);
INSERT INTO Product VALUES (N'Baseball bomber jackets',N'Does not cause discomfort if worn in the hot season when traveling on the street, the ability to sweat to absorb sweat and leave no odor if worn for a long time, can be used well in the rainy season.',178000,178000,0,1,2,100,1,2);
INSERT INTO Product VALUES (N'Unisex Bomber Jacket - Ulzzang Baseball Jacket',N'High quality KAKI material with outstanding border motifs. Extremely warm double-layer khaki suitable for winter wear.',270000,179000,34,1,2,100,1,2);
INSERT INTO Product VALUES (N'Paisley Unisex N7 Basic Jeans oversize',N'High quality jean material, high quality ink does not peel off, the print is sharp, does not fade, does not harm the skin of the hands. Modern design, youthful, dynamic, easy to coordinate.',400000,400000,0,2,2,100,1,3);
INSERT INTO Product VALUES (N'Men stretch black jeans',N'Jeans with a new design is more fashionable, bringing maximum confidence to the wearer in front of the people around. Made of high quality denim fabric, so soft and comfortable to wear.',400000,380000,5,2,2,100,1,3);
INSERT INTO Product VALUES (N'Men smokey gray 4-way stretch jeans HD02',N'Nice seams, sturdy, slightly stretchy. The standard colors are carefully dyed, although the pants are slightly faded after a few washes, they still give a more dusty and personality jean color. 98% cotton 2% spandex, Slim fit shape.',498000,449000,10,2,2,100,1,3);
INSERT INTO Product VALUES (N'Light gray men jeans',N'Non-fading, Fit (Slimfit), Stretch Jean Material.',280000,280000,0,2,2,100,1,2);
INSERT INTO Product VALUES (N'High quality men jeans',N'There are two front pockets and two back pockets. Men jeans material is durable, sturdy, does not fade, does not shrink when washed, suitable for all ages, body shapes, not out of fashion.',145000,145000,0,2,2,100,1,2);
INSERT INTO Product VALUES (N'KAKi Soft VICERO',N'Male T-Shirt I7TSH545I',190000,133000,30,3,2,100,1, 4);
INSERT INTO Product VALUES (N'Men body pants with stretchy black and white',N'Male T-Shirt I7TSH535I',250000,250000,0,3,2,100,1,4);
INSERT INTO Product VALUES (N'Men jeans shorts MD Q414 silver blue',N'Female T-Shirt I9TSH553I',250000,250000,0,3,2,100,1,4);
INSERT INTO Product VALUES (N'Men shorts Q32 MD blue and white scratched',N'Female T-Shirt I9TSH569I',190000,190000,0,3,2,100,1,4);
INSERT INTO Product VALUES (N'SHORT Pants for Men Summer',N'Female T-Shirt I9TSH545I',190000,57000,70,3,2,100,1,4);
INSERT INTO Product VALUES (N'Hoodie Oversize Odin Acid',N'Hooded hood, thick winter fabric, dark gray',350000,350000,0,4,2,100,1,5);
INSERT INTO Product VALUES (N'JBAGY JL0102',N'Long white turtleneck sweater, stretch fabric material, very warm in winter',350000,350000,0,4,2,100,1,5);
INSERT INTO Product VALUES (N'Local Brand Multi Color Jacket',N'Hoodie Logo Dragon free size, thin fabric suitable for autumn and winter wear',450000,450000,0,4,2,100,1,6);
INSERT INTO Product VALUES (N'UNISEX DURHAM sweatshirt hoodie',N'UNISEX Durham fall and winter long sleeve shirt in black',450000,450000,0,4,2,100,1,6);
INSERT INTO Product VALUES (N'UNISEX Plain Sweater (Multicolor)',N'Gray UNISEX Durham fall hooded hoodie',390000,312000,20,4,2,100,1,7);
INSERT INTO Product VALUES (N'Dress two-shoulder chiffon dress',N'Silk chiffon dress with 2 layers free size',130000,130000,0,5,2,100,1,8);
INSERT INTO Product VALUES (N'Off Shoulder Body Hugging Dress',N'This is a fabric with very high color fastness, stretch resistance, and drift resistance, but its ability to resist wrinkles and absorb sweat is very poor because it contains a lot of cotton',200000,200000,0,5,2,100,1,8);
INSERT INTO Product VALUES (N'Korean style flared dress',N'Free size 80cm. Elasticities',150000,150000,0,5,2,100,1,8);
INSERT INTO Product VALUES (N'Split A-line skirt',N'Design: Short A-line skirt with front thigh split',120000,120000,0,6,2,100,1,9);
INSERT INTO Product VALUES (N'Short A-line Jean Skirt Women High Loose',N'Women high-waisted jeans skirt with a simple design with a V7 inside, thick khaki / jean material, light stretch, extremely comfortable',131000,131000,0,6,2,100,1,9);
INSERT INTO Product VALUES (N'[Premium] Seamless bikini, luxurious V-neck',N'Fabric from Polyester Spandex. The fabric is stretchy, well adapted to sea water and sunlight',350000,245000,30,7,2,100,1,10);
INSERT INTO Product VALUES (N'Bikini 1 piece cross shoulder BK1',N'Bikini one-piece swimsuit discreet horizontal strap BK01, Korean style swimsuit is a good quality swimsuit product, with a youthful and feminine design',259000,168000,35,7,2,100,1,10);
INSERT INTO Product VALUES (N'Swimwear - Sexy purple blue bikini',N'Fabric quality from Polyester + Spandex, good elasticity, adapts to water and sunlight, highly aesthetic',300000,185000,38,7,2,100,1,11);
INSERT INTO Product VALUES (N'Korean Croptop bikini',N'Korean croptop bikinis with high-end cold t-shirts, no need to wear bras inside',190000,190000,0,7,2,100,1,11);
INSERT INTO Product VALUES (N'ENVYLOOK Linen-Belt Skirt',N'ENVYLOOK Linen-Belt Skirt',570000,299000,47,7,2,100,1,11);
INSERT INTO Product VALUES (N'Nike Air Zoom Winflo 7 CJ0291-005',N'Nike Air Zoom Winflo 7 CJ0291-005',2929000,2196750,25,7,2,100,1 ,12);
INSERT INTO Product VALUES (N'Nike Benassi Slip Shoe 882410-010',N'Nike Benassi Slip Shoe 882410-010',1923000,961500,50,7,2,100,1,12);
INSERT INTO Product VALUES (N'Nike Benassi Slp 882410-008',N'Nike Benassi Slp 882410-008',1569000,784500,50,7,2,100,1,12);
INSERT INTO Product VALUES (N'Vans Slip-On Label Mix',N'Vans Slip-On Label Mix',145000,145000,0,7,2,100,1,13);
INSERT INTO Product VALUES (N'Vans Sk8-Hi',N'Vans Sk8-Hi',185000,185000,0,7,2,100,1,13);
INSERT INTO Product VALUES (N'Male Sock Pack 3 I7SOK201H',N'Male Sock Pack 3 I7SOK201H',50000,50000,0,8,2,100 ,1 ,4);
INSERT INTO Product VALUES (N'Male Sock I7SOK213E',N'Male Sock I7SOK213E',150000,150000,0,8,2,100,1,4);
INSERT INTO Product VALUES (N'Male Sock I7SOK217E',N'Male Sock I7SOK217E',150000,150000,0,8,2,100,1,4);
INSERT INTO Product VALUES (N'Female Sock I9SOK015E',N'Female Sock I9SOK015E',150000,150000,0,8,2,100,1,4);
INSERT INTO Product VALUES (N'Female Sock I9SOK222E',N'Female Sock I9SOK222E',150000,150000,0,8,2,100,1,4);
INSERT INTO Product VALUES (N'Backpack V8BPK302I',N'Backpack V8BPK302I',690000,690000,0,9,2,100,1,4);
INSERT INTO Product VALUES (N'Backpack V8BPK300I',N'Backpack V8BPK300I',590000,590000,0,9,2,100,1,4);
INSERT INTO Product VALUES (N'Waterproof Backpack I7BPK003I',N'Waterproof Backpack I7BPK003I',399000,399000,0,9,2,100,1,4);
INSERT INTO Product VALUES (N'Unisex Adidas 4Athlts Id Bp FJ3924',N'Unisex Adidas 4Athlts Id Bp FJ3924',1200000,780000,35,9,2,100,1,14);
INSERT INTO Product VALUES (N'Unisex Adidas Clas Bp Fabric GL0890',N'Unisex Adidas Clas Bp Fabric GL0890',700000,700000,0,9,2,100,1,14);
INSERT INTO Product VALUES (N'FLAANS 925 SharpStar N',N'FLAANS 925 SharpStar N',356000,356000,0,10,2,100,1,15);
INSERT INTO Product VALUES (N'FLAANS Bauli R',N'FLAANS Bauli R',156000,156000,0,10,2,100,1,15);
INSERT INTO Product VALUES (N'FLAANS Vin Bold R',N'FLAANS Vin Bold R',156000,156000,0,10,2,100,1,15);
INSERT INTO Product VALUES (N'FLAANS ChainBZ_N',N'FLAANS ChainBZ_N',516000,516000,0,10,2,100,1,15);
INSERT INTO Product VALUES (N'FLAANS 925 NewMoon N',N'FLAANS 925 NewMoon N',356000,356000,0,10,2,100,1,15);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[ProductImg](
	[ProductID] [int]  ,
	[ProductImgURL] [varchar](255) ,
	constraint ProductImg_ID FOREIGN KEY(ProductID) REFERENCES Product(ProductID)
) ON [PRIMARY]
GO
INSERT INTO dbo.ProductImg VALUES (1,'KAKI-bomber-jackets.png');
INSERT INTO dbo.ProductImg VALUES (2,'KAKI-jacket-2019-KKN01.png');
INSERT INTO dbo.ProductImg VALUES (3,'KAKI-unisex-jacket.png');
INSERT INTO dbo.ProductImg VALUES (4,'Baseball-bomber-jacket.png');
INSERT INTO dbo.ProductImg VALUES (5,'Unisex-Bomber-Jacket-Ulzzang.png');
INSERT INTO dbo.ProductImg VALUES (6,'Paisley-Unisex-N7-Basic-Jeans.png');
INSERT INTO dbo.ProductImg VALUES (7,'Men-stretch-black-jeans.png');
INSERT INTO dbo.ProductImg VALUES (8,'Men-smokey-gray-4-way-stretch-jeans-HD02.png');
INSERT INTO dbo.ProductImg VALUES (9,'Light-gray-men-jeans.png');
INSERT INTO dbo.ProductImg VALUES (10,'High-quality-men-jeans.png');
INSERT INTO dbo.ProductImg VALUES (11,'KAKI-Shorts-Soft-VICERO.png');
INSERT INTO dbo.ProductImg VALUES (12,'Men-body-pants.png');
INSERT INTO dbo.ProductImg VALUES (13,'Men-jeans-shorts-MD-Q414.png');
INSERT INTO dbo.ProductImg VALUES (14,'Men-shorts-Q32-MD.png');
INSERT INTO dbo.ProductImg VALUES (15,'SHORT-Pants-for-Men-Summer.png');
INSERT INTO dbo.ProductImg VALUES (16,'Hoodie-Oversize-Odin-Acid.png');
INSERT INTO dbo.ProductImg VALUES (17,'JBAGY-JL0102.png');
INSERT INTO dbo.ProductImg VALUES (18,'Local-Brand-Multi-Color-Jacket.png');
INSERT INTO dbo.ProductImg VALUES (19,'UNISEX-DURHAM-sweatshirt-hoodie.png');
INSERT INTO dbo.ProductImg VALUES (20,'UNISEX-Plain-Sweater.png');
INSERT INTO dbo.ProductImg VALUES (21,'Dress-two-shoulder-chiffon-dress.png');
INSERT INTO dbo.ProductImg VALUES (22,'Off-shoulderbody-huggingdress.png');
INSERT INTO dbo.ProductImg VALUES (23,'Korean-style-flared-dress.png');
INSERT INTO dbo.ProductImg VALUES (24,'Split-A-line-skirt.png');
INSERT INTO dbo.ProductImg VALUES (25,'High-waisted-A-line-short-jean-skirt.png');
INSERT INTO dbo.ProductImg VALUES (26,'Luxurious-V-neck_A20208.png');
INSERT INTO dbo.ProductImg VALUES (27,'Bikini-1-piece-cross-shoulder-BK1.png');
INSERT INTO dbo.ProductImg VALUES (28,'Swimwear-Sexy-purple-blue-bikini_2392.png');
INSERT INTO dbo.ProductImg VALUES (29,'Korean-Croptop-bikini.png');
INSERT INTO dbo.ProductImg VALUES (30,'dosiin-karihada-oops-i-did-it-again-115992115992.jpg');
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Cart (
	UserID int,
	ProductID int,
	Amount int
	constraint userID_in_cart FOREIGN KEY(UserID) REFERENCES Users(UserID),
	constraint productID_in_cart FOREIGN KEY(ProductID) REFERENCES Product(ProductID),
) ON [PRIMARY]
GO
INSERT INTO Cart VALUES (4,1,1);
INSERT INTO Cart VALUES (4,3,1);
INSERT INTO Cart VALUES (5,1,1);
INSERT INTO Cart VALUES (5,2,1);
INSERT INTO Cart VALUES (6,2,2);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[Order_Status](
	[ID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Name] [nvarchar](50) NOT NULL,
 ) ON [PRIMARY]
GO
INSERT [dbo].[Order_Status] ([Name]) VALUES (N'Waiting for Confirmation')
INSERT [dbo].[Order_Status] ([Name]) VALUES (N'Packaging')
INSERT [dbo].[Order_Status] ([Name]) VALUES (N'Delivering')
INSERT [dbo].[Order_Status] ([Name]) VALUES (N'Canceled')
INSERT [dbo].[Order_Status] ([Name]) VALUES (N'Completed')
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[UserID] [int] NULL,
	[TotalPrice] [money] NULL,
	[Note] [nvarchar](2000) NULL,
	[Status] [int] NULL,
	[Date] [DATETIME] NULL ,
	constraint userID_in_order_status FOREIGN KEY(UserID) REFERENCES Users(UserID),
	constraint statusID_in_order_status FOREIGN KEY(Status) REFERENCES Order_Status(ID)
) ON [PRIMARY]
GO
INSERT INTO Orders VALUES (4, 270000, null, 3, '2022/09/06 04:17');
INSERT INTO Orders VALUES (5, 90000, null, 3, '2022/09/16 12:36');
INSERT INTO Orders VALUES (5, 1270000, null, 3, '2022/09/12 10:18');
INSERT INTO Orders VALUES (6, 1270000, null, 1, '2022/09/11 01:30');
INSERT INTO Orders VALUES (6, 143000, null, 5, '2022/09/11 01:30');
INSERT INTO Orders VALUES (7, 2580000, null, 1, '2022/09/02 02:30');
INSERT INTO Orders VALUES (8, 4560000, null, 1, '2022/09/05 04:30');
INSERT INTO Orders VALUES (9, 900000, null, 1, '2022/09/05 05:30');
INSERT INTO Orders VALUES (9, 1240000, null, 1, '2022/09/09 09:30');
INSERT INTO Orders VALUES (10, 1230000, null, 1, '2022/09/11 11:30');
INSERT INTO Orders VALUES (11,1470000, null, 1, '2022/09/10 03:30');
INSERT INTO Orders VALUES (12,1470000, null, 1, '2022/09/12 00:00');
INSERT INTO Orders VALUES (15,1470000, null, 1, '2022/09/17 00:00');
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[Order_Detail](
	ID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Order_ID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](1000) NOT NULL,
	[ProductPrice] [money] NOT NULL,	
	[Quantity] [int] NOT NULL,
	constraint orderID_in_order_detail FOREIGN KEY(Order_ID) REFERENCES Orders(ID),
	constraint productID_in_order_detail FOREIGN KEY(ProductID) REFERENCES Product(ProductID)	
) ON [PRIMARY]
GO
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (1,1,N'Borsalino Bogart Fur Felt Fedora',15,1);
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (1,2,N'Borsalino Seta Bicolore Fedora',2,3);
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (2,3,N'Bailey Tate Braided Fedora',5,2);
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (3,4,N'Bailey Archer Braid Fedora',6,3);
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (4,5,N'Bailey Craig Braided Fedora',150,1);
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (5,6,N'Mayser Calas Panama Straw Hat',270000,1);
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (6,7,N'Mayser Piero Panama Straw Hat',90000,2);
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (7,8,N'Mayser Nizza Panama Straw Hat',1270000,1);
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (8,9,N'Bailey Rockett Endura Telescope Crown Hat',163000,2);
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (9,10,N'Bailey Hanson Shantung Hat',163000,1);

-- This month
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (12,11,N'Male T-Shirt I7TSH545I',15,5);
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (12,50,N'FLAANS 925 NewMoon N',2,1);
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (12,49,N'FLAANS ChainBZ_N',5,1);
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (12,25,N'Black Gao Zipper Jean',6,3);
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (12,35,N'Vans Sk8-Hi',150,1);
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (12,15,N'Female T-Shirt I9TSH545I',270000,4);
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (12,40,N'Female Sock I9SOK222E',90000,3);
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (12,8,N'Mayser Nizza Panama Straw Hat',1270000,1);
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (12,16,N'BLUE STRIPES SWEATER - WHITE',163000,2);
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (12,10,N'Bailey Hanson Shantung Hat',163000,1);
-- Last month
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (13,1,N'Borsalino Bogart Fur Felt Fedora',15,1);
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (13,10,N'Bailey Hanson Shantung Hat',163000,1);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE ShipInfo (
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	Order_ID int,
	CustomerName nvarchar(1000), --Real name of the Customer
	ShippingAddress nvarchar(1000), 
	ShipCityID int,
	PhoneNum varchar(20),
	Note nvarchar(2000),
	constraint order_id_in_ship_info FOREIGN KEY(Order_ID) REFERENCES Orders(ID),
	constraint ship_city_in_ship_info FOREIGN KEY(ShipCityID) REFERENCES Ship(id)
) ON [PRIMARY]
GO
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Notifications(
	ID int PRIMARY KEY identity (1,1),
	UserID int,
	OrderID int,
	Content nvarchar(1000),
	[status] int,
	[time] datetime,
	constraint UserID_in_Users FOREIGN KEY(UserID) REFERENCES Users(userId),
	constraint OrderID_in_Orders FOREIGN KEY(OrderID) REFERENCES Orders(ID)
);
GO
INSERT INTO Notifications VALUES (5,1,N'Test Checked',1,GETDATE())
INSERT INTO Notifications VALUES (5,1,N'Test Unchecked',0,GETDATE())
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Feedback (
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	UserID int,
	ProductID int,
	OrderID int,
	Star int, --min 1- max 5
	FeedbackDetail nvarchar(2000),
	constraint userID_in_user_3 FOREIGN KEY(UserID) REFERENCES Users(UserID),
	constraint orderID_in_orders_6 FOREIGN KEY(OrderID) REFERENCES Orders(ID),
	constraint productID_in_feedback FOREIGN KEY(ProductID) REFERENCES Product(ProductID),
	constraint valid_star CHECK (Star < 6 AND Star > 0)
) ON [PRIMARY]
GO
INSERT INTO Feedback VALUES (4,1,1,5, N'Very good');
INSERT INTO Feedback VALUES (5,2,2,4, N'Good');
INSERT INTO Feedback VALUES (5,1,3,5, N'Sản phẩm rất tốt');
INSERT INTO Feedback VALUES (6,1,4,1, N'Gửi sai sản phẩm');
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Feedback_Replies (
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	FeedbackID int,
	UserID int,
	RepliesText nvarchar(2000),
	constraint userID_in_user_4 FOREIGN KEY(UserID) REFERENCES Users(UserID),
	constraint feedbackID_in_feedback FOREIGN KEY(FeedbackID) REFERENCES Feedback(ID),
) ON [PRIMARY]
GO
INSERT INTO Feedback_Replies VALUES (1, 5, N'Xin Cám Ơn!');
INSERT INTO Feedback_Replies VALUES (2, 4, N'Xin Cám Ơn!');
INSERT INTO Feedback_Replies VALUES (3, 6, N'Xin Cám Ơn!');
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Create TABLE Blog(
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	Author nvarchar(100),
	[Day] int,
	[Month] nvarchar(20),
	[Year] int,
	BlogTitle nvarchar(2500),
	BlogContent nvarchar(2500),
	imageLink nvarchar(1000),
)ON [PRIMARY]
GO
INSERT INTO dbo.Blog(Author,[Day], [Month], [Year],BlogTitle,BlogContent,imageLink)VALUES(N'maintn','11',N'Sep','2022',N'Áo phông xám nữ, item mix đồ thời thượng',N'Áo phông xám là một item được nhiều bạn trẻ yêu thích. Khi xu hướng thời trang thế giới đang hướng đến những thứ đơn giản, tinh tế thì gam màu xám được đánh giá rất hiện đại, trẻ trung và là một trong những gam màu hot trend thời gian gần đây.
Với áo phông xám, chị em có thể biến tấu linh hoạt trong cách phối đồ, lên đồ ấn tượng mà không lo nhạt nhòa, kém nổi bật. ',N'1.jpg')
INSERT INTO dbo.Blog(Author,[Day], [Month], [Year],BlogTitle,BlogContent,imageLink)VALUES(N'ngoc12','15',N'Sep','2022', N'Áo thun oversize chuẩn phong cách, ấn tượng',N'Áo phông oversize đang là một hot item dẫn đầu xu hướng thời trang giới trẻ hiện nay. Ngày càng nhiều các bạn trẻ yêu thích, ưa chuộng và đánh giá cao kiểu áo này. 
Một item đầy mới mẻ, phá cách và tính ứng dụng thực tiễn cao như áo phông oversize quả thực sẽ thu hút sự quan tâm của rất nhiều bạn trẻ. ',N'2.jpg')
INSERT INTO dbo.Blog(Author,[Day], [Month], [Year],BlogTitle,BlogContent,imageLink)VALUES(N'minh123','17',N'Sep','2022', N'Blazzer, xu thế thời trang 2022',N'Với sự thay đổi liên tục, xu hướng thời trang luôn được cập nhật mới mẻ hơn, độc đáo, hiện đại và thu hút hơn. Những phong cách mới, xu thế thời trang hot luôn được mọi người quan tâm, đặc biệt là giới trẻ. Không thể phủ nhận ngành công nghiệp thời trang đang phát triển rất mạnh mẽ. Không chỉ đơn giản là cách ăn mặc, cách mix&match đồ hay diện đồ theo phong cách yêu thích, thời trang còn là sự đổi mới, phá cách và tràn đầy sức sáng tạo ấn tượng. Vậy bạn đã có ý tưởng gì cho mình chưa? Cùng Shope khám phá ngay nhé.',N'3.jpg')
INSERT INTO dbo.Blog(Author,[Day], [Month], [Year],BlogTitle,BlogContent,imageLink)VALUES(N'author_1','01',N'Sep','2022', N'Mix đồ cho nàng ngày hè',N'Bạn có thể chọn những gam màu sáng như trắng, cam, be,.. để tạo sự trẻ trung, tươi mới hoặc những gam màu trầm tối như đen, nâu, xanh rêu,... vừa đem đến sự tinh tế vừa phong cách, thời trang.',N'4.jpg')
INSERT INTO dbo.Blog(Author,[Day], [Month], [Year],BlogTitle,BlogContent,imageLink)VALUES(N'author_2','24',N'Sep','2022', N'Áo sơ mi cho nàng cực trẻ trung và cá tính',N'Áo sơ mi vốn là một item must-have trong tủ đồ của phái nữ bởi sự đơn giản, tinh tế; dễ phối đồ và có thể mặc trong hầu hết mọi tình huống như đi học, đi làm,đi chơi, đi phỏng vấn,...Thông dụng - dễ phối - chưa bao giờ lỗi mốt là những từ có thể dùng để miêu tả về áo sơ mi trắng. Là một item quốc dân luôn có sẵn trong tủ đồ của tất cả mọi người, những chiếc áo sơ mi trắng luôn khiến người mặc ngây ngất bởi hiệu quả thời trang mà nó mang lại: sự trẻ trung, lịch thiệp và phong cách. ',N'5.jpg')
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Create Table BlogDetail (
	BlogDetailID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	Title nvarchar(2500),
	Content nvarchar(2500),
	imgBlogDetail nvarchar(1000),
	BlogID int,
	constraint BlogID FOREIGN KEY(BlogID) REFERENCES Blog(ID),
)ON [PRIMARY]
GO
INSERT INTO dbo.BlogDetail(Title, Content, imgBlogDetail, BlogID) VALUES(N'Áo phông xám phù hợp với ai?', N'Không phải tất cả màu sắc đều phù hợp với tất cả mọi người. Tuy nhiên, gam màu xám lại là một trong những ngoại lệ bên cạnh gam màu hot trend đen, trắng.
Là những gam màu trung tính, tinh tế và hiện đại, không khó để những gam màu này là gam màu được ưa chuộng nhất hiện nay. Xu hướng thời trang hiện nay đang đề cao những gam màu đơn giản, trung tính nhưng có hiệu quả thời trang cao', N'aophongxam1.jpg',1)
INSERT INTO dbo.BlogDetail(Title, Content, imgBlogDetail, BlogID) VALUES(N'Áo phông xám phối với quần màu đen', N'Cặp đôi xám-đen chắc chắn là sự kết hợp an toàn mà phong cách “được lòng” nhiều bạn trẻ. Đều là gam màu trung tính nên độ ăn ý, 
phối áo phông xám với quần màu đen mang đến cho bạn vẻ ngoài hiện đại, tinh tế, pha chút hồi cổ nhưng vẫn rất trẻ trung, tươi mới.', N'aophongxam.jpg',1)
INSERT INTO dbo.BlogDetail(Title, Content, imgBlogDetail, BlogID) VALUES(N'Áo phông Oversize là gì?', N'Oversize Tee ( Áo quá khổ ) là loại áo có kích thước khá lớn, được phóng to vừa phải làm sao cho cân xứng ở phần ngực áo, ống tay áo và phần eo của người sử dụng.
Mục đích của việc tạo ra những kiểu áo thế nào giúp cho một số người che đi các khuyết điểm trên cơ thể và làm cho họ tự tin hơn khi ra ngoài.', N'aophongoversize.jpg',2)
INSERT INTO dbo.BlogDetail(Title, Content, imgBlogDetail, BlogID) VALUES(N'Các loại vải sử dụng để may áo oversize tay lỡ', N'Chắc bạn cũng đã biết đến một số loại vải phổ biến như 100% Cotton, vải CVC 65/35. Vải Tici hay là vải Kate.
Mỗi doanh nghiệp sản xuất đều dựa trên đối tượng khách hàng của mình để tạo ra những mẫu áo với chất liệu phù hợp nhất.', N'aophongoversize1.jpg',2)
INSERT INTO dbo.BlogDetail(Title, Content, imgBlogDetail, BlogID) VALUES(N'Blazer là gì và cách phối CỰC ĐẸP cho nam và nữ chuẩn phong cách Hàn Quốc', N'Áo Blazer là một loại áo khoác dáng dài, nó giống với áo khoác vest nhất nhưng đường cắt may tạo kiểu ngẫu nhiên hơn.
Được thiết kế dựa trên khoác suit có thể mặc phối với nhiều mẫu quần áo và trong nhiều hoàn cảnh khác nhau. Nếu chọn mua cho mình một chiếc áo Blazer thì nam hay nữ đều rất chuộng áo Blazer đen, Blazer màu be và áo Blazer nữ caro nhất.', N'blazer1.png',3)
INSERT INTO dbo.BlogDetail(Title, Content, imgBlogDetail, BlogID) VALUES(N'Lịch sử ra đời của áo Blazer', N'Blazer ra đời và thịnh hành từ những năm giữa thế kỷ 20. Những chiếc Blazer đầu tiên được thiết kế gần giống chiếc áo gió hiện đại.', N'blazer2.png',3)
INSERT INTO dbo.BlogDetail(Title, Content, imgBlogDetail, BlogID) VALUES(N'Các chất liệu thường thấy của áo Blazer', N'Không những đa dạng trong thiết kế mà chất liệu để may áo cũng hết sức phong phú. Có đến 7 loại chất liệu có thể được sử dụng trong thiết kế áo blazer:
Len hỗn hợp, vải flannel, vải dệt fresco, len cashmere, vải lanh, vải sẹc và vải thô', N'blazer3.png',3)
INSERT INTO dbo.BlogDetail(Title, Content, imgBlogDetail, BlogID) VALUES(N'Xu hướng áo Blazer nữ hiện nay', N'Hiện nay có rất nhiều loại áo blazer nữ thời thượng và sang chảnh, vừa thể hiện được sự cá tính, mạnh mẽ và phong cách hiện đại. Không chỉ mang lại cho phái nữ một vẻ đẹp quyến rũ
mà còn đôn lên dáng vẻ thanh lịch cho người mặc.', N'blazer4.png',3)
INSERT INTO dbo.BlogDetail(Title, Content, imgBlogDetail, BlogID) VALUES(N'Các cách phối đồ đi chơi mùa hè cho nữ cực chất', N'Hè đến cũng là quãng thời gian đầy năng động với rất nhiều những hoạt động ngoài trời. Những cô nàng trót yêu sự cá tính và phong cách hãy cùng dành chút thời gian
đọc những góp ý dưới đây để có những cách mĩ match đẹp “thần sầu” cho mùa hè bốc lửa', N'mixdomuahe.jpg',4)
INSERT INTO dbo.BlogDetail(Title, Content, imgBlogDetail, BlogID) VALUES(N'Combo mix 1 chiếc váy ngắn cộng với đôi Sneaker', N'Combo hoàn hảo nhất cho mùa hè trẻ trung, xinh xắn và năng động có lẽ là chân váy ngắn cùng giày sneaker. Dù bạn muốn phối đồ đi chơi mùa hè cho nữ hay phối đồ mùa hè đi học.
Set đồ này cũng sẽ không khiến bạn thất vọng. Chân váy ngắn rất đa dạng như chân váy hoa nhí, chân váy chữ A, chân váy xếp ly ngắn, chân váy ôm,… Và bạn có thể thoải mái mix chân váy ngắn cùng áo thun, áo kiểu, áo sơ mi, áo trễ vai, áo hai dây tùy bạn thích.', N'vayngansneaker.jpg',4)
INSERT INTO dbo.BlogDetail(Title, Content, imgBlogDetail, BlogID) VALUES(N'Combo Áo thun với 1 chiếc quần short hoặc quần jean', N'Một công thức phối đồ đi chơi mùa hè cho nữ cơ bản đến không thể cơ bản hơn. Và thật may là set đồ này phù hợp với hầu hết mọi vóc dáng.
Những chiếc áo phông được may từ chất liệu thấm hút mồ hôi sẽ giúp nàng thật thoải mái suốt ngày dài năng động.', N'aothunvoiquanjean.jpg',4)
INSERT INTO dbo.BlogDetail(Title, Content, imgBlogDetail, BlogID) VALUES(N'Combo Áo trễ vai với chiếc quần jean baggy', N'Trong khi baggy jean là chiêc quần “hack” dáng thần thánh và che khuyết điểm đôi chân tuyệt vời. Chiếc áo trễ vai lại khéo léo tôn lên bờ vai mảnh khảnh cùng xương quai xanh quyến rũ của bạn.',
N'aotrevai.jpg',4)
INSERT INTO dbo.BlogDetail(Title, Content, imgBlogDetail, BlogID) VALUES(N'Những chiếc áo sơ mi có màu nổi', N'Trong trường hợp chị em không để ý, thì áo sơ mi màu nổi chính là xu hướng của mùa hè năm nay. Không khó để bắt gặp hội sành điệu xúng xính mẫu áo rực rỡ này.
Các gam màu thật nổi không chỉ giúp vẻ ngoài của người diện trở thành tâm điểm giữa đám đông, mà còn hack tuổi cực siêu.',N'aosomi.jpg',5)
INSERT INTO dbo.BlogDetail(Title, Content, imgBlogDetail, BlogID) VALUES(N'Áo sơ mi kẻ sọc', N'Không phải là một kiểu sơ mi quá mới, tuy nhiên sức hút của áo sơ mi kẻ vẫn chưa bao giờ thuyên giảm. Điểm đáng chú ý của áo sơ mi kẻ là món thời trang này rất thanh lịch, trang nhã và vẫn có sự nổi bật nhất định.',N'aosomi1.jpg',5)
INSERT INTO dbo.BlogDetail(Title, Content, imgBlogDetail, BlogID) VALUES(N'Áo sơ mi cộc tay', N'Hot hơn cả áo sơ mi màu nổi chính là sơ mi cộc tay. Món thời trang này phảng phất nét retro, nhưng cũng rất trẻ trung, ngọt ngào.',N'aosomi2.jpg',5)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Create table PostCategory(
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	CategoryName nvarchar(1000)
)
ON [PRIMARY]
GO
SET IDENTITY_INSERT  PostCategory ON
INSERT [dbo].[PostCategory]([ID], [CategoryName]) VALUES(1,N'Public')
INSERT [dbo].[PostCategory]([ID], [CategoryName]) VALUES(2,N'Hide')
SET IDENTITY_INSERT PostCategory OFF
go
Create TABLE Post(
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	[Description] nvarchar(2500),
	UserID int,
	[date] nvarchar(2500),
	CategoryID int,
	PostImgURL varchar(255),
	constraint userID_in_user_5 FOREIGN KEY(UserID) REFERENCES Users(UserID),
	constraint CategoryID_in_PostCategory FOREIGN KEY(CategoryID) REFERENCES PostCategory(ID)
)ON [PRIMARY]
go
SET IDENTITY_INSERT Post ON
INSERT [dbo].[Post] ([ID], [Description], [UserID], [date], [CategoryID], [PostImgURL]) VALUES (1, N' QUẦN JEAN MỚI VỀ ĐẸP KHÔNG THỂ CƯỠNG LẠI ĐƯỢC!” Bạn sẽ có khả năng sở hữu mẫu quần jean siêu đẹp này chỉ với giá 1xxk/ hàng hóa. Chất liệu co dãn, thấm hút mồ hôi, tôn dáng, giúp người mặc trông thon gọn hơn.Đặc biệt khuyến mãi ưu đãi vào những dịp lễ lớn', 1, N'11/03/2021', 1, N'poster1.jpg')
INSERT [dbo].[Post] ([ID], [Description], [UserID], [date], [CategoryID], [PostImgURL]) VALUES (2, N' QUẦN JEAN MỚI VỀ ĐẸP KHÔNG THỂ CƯỠNG LẠI ĐƯỢC!” Bạn sẽ có khả năng sở hữu mẫu quần jean siêu đẹp này chỉ với giá 1xxk/ hàng hóa. Chất liệu co dãn, thấm hút mồ hôi, tôn dáng, giúp người mặc trông thon gọn hơn.Đặc biệt khuyến mãi ưu đãi vào những dịp lễ lớn', 1, N'11/03/2021', 1, N'poster2.jpg')
INSERT [dbo].[Post] ([ID], [Description], [UserID], [date], [CategoryID], [PostImgURL]) VALUES (3, N' QUẦN JEAN MỚI VỀ ĐẸP KHÔNG THỂ CƯỠNG LẠI ĐƯỢC!” Bạn sẽ có khả năng sở hữu mẫu quần jean siêu đẹp này chỉ với giá 1xxk/ hàng hóa. Chất liệu co dãn, thấm hút mồ hôi, tôn dáng, giúp người mặc trông thon gọn hơn.Đặc biệt khuyến mãi ưu đãi vào những dịp lễ lớn', 1, N'11/03/2021', 2, N'Poster3.jpg')
INSERT [dbo].[Post] ([ID], [Description], [UserID], [date], [CategoryID], [PostImgURL]) VALUES (4, N' QUẦN JEAN MỚI VỀ ĐẸP KHÔNG THỂ CƯỠNG LẠI ĐƯỢC!” Bạn sẽ có khả năng sở hữu mẫu quần jean siêu đẹp này chỉ với giá 1xxk/ hàng hóa. Chất liệu co dãn, thấm hút mồ hôi, tôn dáng, giúp người mặc trông thon gọn hơn.Đặc biệt khuyến mãi ưu đãi vào những dịp lễ lớn', 1, N'11/03/2021', 2, N'poster4.jpg')
INSERT [dbo].[Post] ([ID], [Description], [UserID], [date], [CategoryID], [PostImgURL]) VALUES (5, N' QUẦN JEAN MỚI VỀ ĐẸP KHÔNG THỂ CƯỠNG LẠI ĐƯỢC!” Bạn sẽ có khả năng sở hữu mẫu quần jean siêu đẹp này chỉ với giá 1xxk/ hàng hóa. Chất liệu co dãn, thấm hút mồ hôi, tôn dáng, giúp người mặc trông thon gọn hơn.Đặc biệt khuyến mãi ưu đãi vào những dịp lễ lớn', 1, N'11/03/2021', 1, N'poster5.jpg')
INSERT [dbo].[Post] ([ID], [Description], [UserID], [date], [CategoryID], [PostImgURL]) VALUES (6, N' QUẦN JEAN MỚI VỀ ĐẸP KHÔNG THỂ CƯỠNG LẠI ĐƯỢC!” Bạn sẽ có khả năng sở hữu mẫu quần jean siêu đẹp này chỉ với giá 1xxk/ hàng hóa. Chất liệu co dãn, thấm hút mồ hôi, tôn dáng, giúp người mặc trông thon gọn hơn.Đặc biệt khuyến mãi ưu đãi vào những dịp lễ lớn', 1, N'11/03/2021', 1, N'poster6.jpg')
INSERT [dbo].[Post] ([ID], [Description], [UserID], [date], [CategoryID], [PostImgURL]) VALUES (7, N' QUẦN JEAN MỚI VỀ ĐẸP KHÔNG THỂ CƯỠNG LẠI ĐƯỢC!” Bạn sẽ có khả năng sở hữu mẫu quần jean siêu đẹp này chỉ với giá 1xxk/ hàng hóa. Chất liệu co dãn, thấm hút mồ hôi, tôn dáng, giúp người mặc trông thon gọn hơn.Đặc biệt khuyến mãi ưu đãi vào những dịp lễ lớn', 1, N'11/03/2021', 1, N'poster7.jpg')
INSERT [dbo].[Post] ([ID], [Description], [UserID], [date], [CategoryID], [PostImgURL]) VALUES (8, N' QUẦN JEAN MỚI VỀ ĐẸP KHÔNG THỂ CƯỠNG LẠI ĐƯỢC!” Bạn sẽ có khả năng sở hữu mẫu quần jean siêu đẹp này chỉ với giá 1xxk/ hàng hóa. Chất liệu co dãn, thấm hút mồ hôi, tôn dáng, giúp người mặc trông thon gọn hơn.Đặc biệt khuyến mãi ưu đãi vào những dịp lễ lớn', 1, N'11/03/2021', 1, N'poster8.jpg')
INSERT [dbo].[Post] ([ID], [Description], [UserID], [date], [CategoryID], [PostImgURL]) VALUES (9, N' QUẦN JEAN MỚI VỀ ĐẸP KHÔNG THỂ CƯỠNG LẠI ĐƯỢC!” Bạn sẽ có khả năng sở hữu mẫu quần jean siêu đẹp này chỉ với giá 1xxk/ hàng hóa. Chất liệu co dãn, thấm hút mồ hôi, tôn dáng, giúp người mặc trông thon gọn hơn.Đặc biệt khuyến mãi ưu đãi vào những dịp lễ lớn', 1, N'11/03/2021', 1, N'poster9.jpg')
SET IDENTITY_INSERT Post OFF
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE CBanner
(
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	Img VARCHAR(2500),
	Title NVARCHAR(2500),
	[desc] NVARCHAR(2500)
)
INSERT INTO dbo.CBanner(Img,Title,[desc])VALUES('nike.png',  N'NIKE',  N'Just Do It !'  )
INSERT INTO dbo.CBanner(Img,Title,[desc])VALUES('gucci.png',  N'GUCCI',  N'We go beyond just great !'  )
INSERT INTO dbo.CBanner(Img,Title,[desc])VALUES('chanel.jpg',  N'CHANEL',  N'I don’t do fashion. I am fashion'  )
---------------------------------------------------------------------------------------------------------------------------------------------------------
go
CREATE TABLE Delivery(
	ID INT IDENTITY(1,1) NOT NULL,
	ShipInfoID INT,
	UserID INT,
	[Status] INT,
	FOREIGN KEY (ShipInfoID) REFERENCES dbo.ShipInfo(ID),
	FOREIGN KEY (UserID) REFERENCES dbo.Users(UserID),
);
go