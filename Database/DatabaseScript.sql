USE [QTBStore]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 9/11/2020 2:35:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[AdminId] [int] IDENTITY(1,1) NOT NULL,
	[AdminEmail] [varchar](250) NOT NULL,
	[AdminPassword] [varchar](128) NOT NULL,
	[AdminFullName] [nvarchar](250) NOT NULL,
	[AdminBirthday] [date] NOT NULL,
	[AdminIdCard] [varchar](20) NOT NULL,
	[AdminGender] [int] NOT NULL,
	[AdminAddress] [ntext] NOT NULL,
	[AdminHomeLand] [ntext] NOT NULL,
	[AdminPhone] [varchar](20) NOT NULL,
	[AdminAvatar] [varchar](250) NOT NULL,
	[AdminStatus] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banners]    Script Date: 9/11/2020 2:35:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banners](
	[BannerId] [int] IDENTITY(1,1) NOT NULL,
	[BannerPiority] [int] NOT NULL,
	[BannerImage] [varchar](250) NOT NULL,
	[BannerDescription] [nvarchar](250) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[BannerStatus] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BannerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 9/11/2020 2:35:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](250) NOT NULL,
	[BrandPiority] [int] NOT NULL,
	[BrandLogo] [varchar](250) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[BrandStatus] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalogs]    Script Date: 9/11/2020 2:35:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogs](
	[CatalogId] [int] IDENTITY(1,1) NOT NULL,
	[CatalogName] [nvarchar](250) NOT NULL,
	[CatalogPiority] [int] NOT NULL,
	[ParentId] [int] NOT NULL,
	[ParentName] [nvarchar](250) NOT NULL,
	[AdminId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[CatalogStatus] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CatalogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9/11/2020 2:35:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](250) NOT NULL,
	[CategoryPiority] [int] NOT NULL,
	[ParentId] [int] NOT NULL,
	[ParentName] [nvarchar](250) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[CategoryStatus] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 9/11/2020 2:35:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerFullName] [nvarchar](250) NOT NULL,
	[CustomerEmail] [varchar](250) NOT NULL,
	[CustomerPhone] [varchar](20) NULL,
	[CustomerPassword] [varchar](128) NOT NULL,
	[CustomerAvatar] [varchar](250) NOT NULL,
	[CustomerGender] [int] NOT NULL,
	[CustomerBirthday] [date] NOT NULL,
	[CustomerAddress] [ntext] NOT NULL,
	[CustomerCheckCode] [varchar](20) NULL,
	[CustomerStatus] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedbackCatalogs]    Script Date: 9/11/2020 2:35:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedbackCatalogs](
	[FeedbackCatalogId] [int] IDENTITY(1,1) NOT NULL,
	[FeedbackCatalogName] [nvarchar](250) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[FeedbackCatalogStatus] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FeedbackCatalogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 9/11/2020 2:35:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedbacks](
	[FeedbackId] [int] IDENTITY(1,1) NOT NULL,
	[FeedbackCatalogId] [int] NOT NULL,
	[FeedbackFullname] [nvarchar](250) NULL,
	[FeedbackPhone] [varchar](20) NULL,
	[FeedbackEmail] [varchar](250) NULL,
	[FeedbackAddress] [ntext] NULL,
	[FeedbackContent] [ntext] NOT NULL,
	[FeedbacksTime] [datetime] NOT NULL,
	[FeedbackStatus] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FeedbackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Introductions]    Script Date: 9/11/2020 2:35:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Introductions](
	[IntroductionId] [int] IDENTITY(1,1) NOT NULL,
	[IntroductionContent] [ntext] NOT NULL,
	[AdminId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[IntroductionStatus] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IntroductionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logoes]    Script Date: 9/11/2020 2:35:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logoes](
	[LogoId] [int] IDENTITY(1,1) NOT NULL,
	[LogoImage] [varchar](250) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[LogoStatus] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LogoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 9/11/2020 2:35:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewId] [int] IDENTITY(1,1) NOT NULL,
	[CatalogId] [int] NOT NULL,
	[NewTitle] [nvarchar](250) NOT NULL,
	[NewImage] [varchar](250) NOT NULL,
	[NewDescription] [nvarchar](250) NOT NULL,
	[NewContent] [ntext] NOT NULL,
	[NewLike] [int] NOT NULL,
	[NewViewed] [int] NOT NULL,
	[AdminId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[NewStatus] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 9/11/2020 2:35:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NULL,
	[OrderDetailQuantity] [int] NOT NULL,
	[OrderDetailPrice] [float] NOT NULL,
	[OrderDetailSale] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[OrderDetailStatus] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 9/11/2020 2:35:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[OrderTotalAmount] [float] NOT NULL,
	[TransportName] [nvarchar](250) NOT NULL,
	[PaymentMethodName] [nvarchar](250) NOT NULL,
	[OrderNote] [ntext] NULL,
	[OrderAddress] [ntext] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[OrderStatus] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductComments]    Script Date: 9/11/2020 2:35:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductComments](
	[ProductCommentId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[ProductCommentRate] [int] NOT NULL,
	[ProductCommentContent] [nvarchar](500) NULL,
	[ProductCommentTime] [datetime] NOT NULL,
	[ProductCommentStatus] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductCommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 9/11/2020 2:35:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[ProductImageId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ProductImage] [nvarchar](1000) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[ProductImageStatus] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 9/11/2020 2:35:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](250) NOT NULL,
	[ProductCode] [varchar](50) NOT NULL,
	[ProductStarAvg] [float] NOT NULL,
	[ProductFeatureImage] [ntext] NOT NULL,
	[ProductPrice] [float] NOT NULL,
	[ProductSale] [int] NOT NULL,
	[ProductWarranty] [int] NOT NULL,
	[ProductSaleQuantity] [int] NOT NULL,
	[ProductDescription] [ntext] NOT NULL,
	[SpecificationName] [nvarchar](1000) NOT NULL,
	[SpecificationValue] [ntext] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[BrandId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[ProductStatus] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wishlists]    Script Date: 9/11/2020 2:35:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlists](
	[WishlistId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[WishlistStatus] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[WishlistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([BrandId], [BrandName], [BrandPiority], [BrandLogo], [CreatedDate], [UpdatedDate], [BrandStatus]) VALUES (1, N'Asus', 1, N'brandLogo1561759231754.png', CAST(N'2020-09-04T00:32:46.800' AS DateTime), CAST(N'2019-06-29T04:43:00.033' AS DateTime), 1)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [BrandPiority], [BrandLogo], [CreatedDate], [UpdatedDate], [BrandStatus]) VALUES (2, N'AMD', 26, N'brandLogo1562239820578.png', CAST(N'2020-09-04T00:32:46.947' AS DateTime), CAST(N'2019-07-04T18:30:20.580' AS DateTime), 1)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [BrandPiority], [BrandLogo], [CreatedDate], [UpdatedDate], [BrandStatus]) VALUES (3, N'Intel', 24, N'brandLogo1562239880211.png', CAST(N'2020-09-04T00:32:47.070' AS DateTime), CAST(N'2019-07-04T18:31:20.213' AS DateTime), 1)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [BrandPiority], [BrandLogo], [CreatedDate], [UpdatedDate], [BrandStatus]) VALUES (4, N'MSI', 13, N'brandLogo1562239949370.jpg', CAST(N'2020-09-04T00:32:47.193' AS DateTime), CAST(N'2019-07-04T18:32:29.373' AS DateTime), 1)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [BrandPiority], [BrandLogo], [CreatedDate], [UpdatedDate], [BrandStatus]) VALUES (5, N'Dell', 11, N'brandLogo1562240766849.png', CAST(N'2020-09-04T00:32:47.307' AS DateTime), CAST(N'2019-07-04T18:46:06.850' AS DateTime), 1)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [BrandPiority], [BrandLogo], [CreatedDate], [UpdatedDate], [BrandStatus]) VALUES (6, N'Acer', 27, N'brandLogo1562240777512.jpg', CAST(N'2020-09-04T00:32:47.420' AS DateTime), CAST(N'2019-07-04T18:46:17.513' AS DateTime), 1)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [BrandPiority], [BrandLogo], [CreatedDate], [UpdatedDate], [BrandStatus]) VALUES (7, N'Hp', 7, N'brandLogo1562240791404.png', CAST(N'2020-09-04T00:32:47.513' AS DateTime), CAST(N'2019-07-04T18:46:31.407' AS DateTime), 1)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [BrandPiority], [BrandLogo], [CreatedDate], [UpdatedDate], [BrandStatus]) VALUES (8, N'Lenovo', 8, N'brandLogo1562240802236.png', CAST(N'2020-09-04T00:32:47.590' AS DateTime), CAST(N'2019-07-04T18:46:42.237' AS DateTime), 1)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [BrandPiority], [BrandLogo], [CreatedDate], [UpdatedDate], [BrandStatus]) VALUES (9, N'Microsoft', 9, N'brandLogo1562240816233.png', CAST(N'2020-09-04T00:32:47.667' AS DateTime), CAST(N'2019-07-04T18:46:56.237' AS DateTime), 1)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [BrandPiority], [BrandLogo], [CreatedDate], [UpdatedDate], [BrandStatus]) VALUES (10, N'Sony', 10, N'brandLogo1562240827181.png', CAST(N'2020-09-04T00:32:47.743' AS DateTime), CAST(N'2019-07-04T18:47:07.183' AS DateTime), 1)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [BrandPiority], [BrandLogo], [CreatedDate], [UpdatedDate], [BrandStatus]) VALUES (11, N'Gigabyte', 5, N'brandLogo1562240840806.png', CAST(N'2020-09-04T00:32:47.820' AS DateTime), CAST(N'2019-07-04T18:47:20.807' AS DateTime), 1)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [BrandPiority], [BrandLogo], [CreatedDate], [UpdatedDate], [BrandStatus]) VALUES (12, N'Asrock', 12, N'brandLogo1562240857028.png', CAST(N'2020-09-04T00:32:47.890' AS DateTime), CAST(N'2019-07-04T18:47:37.030' AS DateTime), 1)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [BrandPiority], [BrandLogo], [CreatedDate], [UpdatedDate], [BrandStatus]) VALUES (13, N'Corsair', 4, N'brandLogo1562240888627.png', CAST(N'2020-09-04T00:32:47.967' AS DateTime), CAST(N'2019-07-04T18:48:08.630' AS DateTime), 1)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [BrandPiority], [BrandLogo], [CreatedDate], [UpdatedDate], [BrandStatus]) VALUES (14, N'Avexir', 14, N'brandLogo1562240908241.jpg', CAST(N'2020-09-04T00:32:48.040' AS DateTime), CAST(N'2019-07-04T18:48:28.243' AS DateTime), 1)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [BrandPiority], [BrandLogo], [CreatedDate], [UpdatedDate], [BrandStatus]) VALUES (15, N'Kingston', 15, N'brandLogo1562240934743.jpg', CAST(N'2020-09-04T00:32:48.110' AS DateTime), CAST(N'2019-07-04T18:48:54.743' AS DateTime), 1)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [BrandPiority], [BrandLogo], [CreatedDate], [UpdatedDate], [BrandStatus]) VALUES (16, N'Kingmax', 16, N'brandLogo1562240949413.png', CAST(N'2020-09-04T00:32:48.187' AS DateTime), CAST(N'2019-07-04T18:49:09.417' AS DateTime), 1)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [BrandPiority], [BrandLogo], [CreatedDate], [UpdatedDate], [BrandStatus]) VALUES (17, N'Toshiba', 17, N'brandLogo1562240969986.png', CAST(N'2020-09-04T00:32:48.263' AS DateTime), CAST(N'2019-07-04T18:49:29.987' AS DateTime), 1)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [BrandPiority], [BrandLogo], [CreatedDate], [UpdatedDate], [BrandStatus]) VALUES (18, N'Seagate', 18, N'brandLogo1562240982959.png', CAST(N'2020-09-04T00:32:48.337' AS DateTime), CAST(N'2019-07-04T18:49:42.960' AS DateTime), 1)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [BrandPiority], [BrandLogo], [CreatedDate], [UpdatedDate], [BrandStatus]) VALUES (19, N'Western Digital', 19, N'brandLogo1562241032911.png', CAST(N'2020-09-04T00:32:48.410' AS DateTime), CAST(N'2019-07-04T18:50:32.913' AS DateTime), 1)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [BrandPiority], [BrandLogo], [CreatedDate], [UpdatedDate], [BrandStatus]) VALUES (20, N'Adata', 20, N'brandLogo1562241051908.png', CAST(N'2020-09-04T00:32:48.483' AS DateTime), CAST(N'2019-07-04T18:50:51.910' AS DateTime), 1)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [BrandPiority], [BrandLogo], [CreatedDate], [UpdatedDate], [BrandStatus]) VALUES (21, N'Plextor', 21, N'brandLogo1562241070098.png', CAST(N'2020-09-04T00:32:48.560' AS DateTime), CAST(N'2019-07-04T18:51:10.100' AS DateTime), 1)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [BrandPiority], [BrandLogo], [CreatedDate], [UpdatedDate], [BrandStatus]) VALUES (22, N'Samsung', 22, N'brandLogo1562241089068.png', CAST(N'2020-09-04T00:32:48.630' AS DateTime), CAST(N'2019-07-04T18:51:29.070' AS DateTime), 1)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [BrandPiority], [BrandLogo], [CreatedDate], [UpdatedDate], [BrandStatus]) VALUES (23, N'NZXT', 23, N'brandLogo1562241108354.png', CAST(N'2020-09-04T00:32:48.703' AS DateTime), CAST(N'2019-07-04T18:51:48.360' AS DateTime), 1)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [BrandPiority], [BrandLogo], [CreatedDate], [UpdatedDate], [BrandStatus]) VALUES (24, N'Cooler Master', 3, N'brandLogo1562241128697.png', CAST(N'2020-09-04T00:32:48.780' AS DateTime), CAST(N'2019-07-04T18:52:08.700' AS DateTime), 1)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [BrandPiority], [BrandLogo], [CreatedDate], [UpdatedDate], [BrandStatus]) VALUES (25, N'Creative', 25, N'brandLogo1562241144740.png', CAST(N'2020-09-04T00:32:48.853' AS DateTime), CAST(N'2019-07-04T18:52:24.743' AS DateTime), 1)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [BrandPiority], [BrandLogo], [CreatedDate], [UpdatedDate], [BrandStatus]) VALUES (26, N'Razer', 2, N'brandLogo1562241158032.png', CAST(N'2020-09-04T00:32:48.923' AS DateTime), CAST(N'2019-07-04T18:52:38.033' AS DateTime), 1)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [BrandPiority], [BrandLogo], [CreatedDate], [UpdatedDate], [BrandStatus]) VALUES (27, N'Steeleries', 6, N'brandLogo1562241194166.png', CAST(N'2020-09-04T00:32:49.000' AS DateTime), CAST(N'2019-07-04T18:53:14.167' AS DateTime), 1)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [BrandPiority], [BrandLogo], [CreatedDate], [UpdatedDate], [BrandStatus]) VALUES (28, N'Logitech', 28, N'brandLogo1562241206771.png', CAST(N'2020-09-04T00:32:49.077' AS DateTime), CAST(N'2019-07-04T18:53:26.773' AS DateTime), 1)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [BrandPiority], [BrandLogo], [CreatedDate], [UpdatedDate], [BrandStatus]) VALUES (29, N'Akracing', 29, N'brandLogo1562241222666.jpg', CAST(N'2020-09-04T00:32:49.143' AS DateTime), CAST(N'2019-07-04T18:53:42.667' AS DateTime), 1)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [BrandPiority], [BrandLogo], [CreatedDate], [UpdatedDate], [BrandStatus]) VALUES (30, N'DXRACER', 30, N'brandLogo1562241253457.png', CAST(N'2020-09-04T00:32:49.220' AS DateTime), CAST(N'2019-07-04T18:54:13.460' AS DateTime), 1)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [BrandPiority], [BrandLogo], [CreatedDate], [UpdatedDate], [BrandStatus]) VALUES (31, N'Microlab', 31, N'brandLogo1562241299880.png', CAST(N'2020-09-04T00:32:49.290' AS DateTime), CAST(N'2019-07-04T18:54:59.880' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPiority], [ParentId], [ParentName], [CreatedDate], [UpdatedDate], [CategoryStatus]) VALUES (1, N'Laptop & phụ kiện', 1, 0, N'Không có', CAST(N'2019-01-09T04:53:08.617' AS DateTime), CAST(N'2020-09-09T16:11:14.937' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPiority], [ParentId], [ParentName], [CreatedDate], [UpdatedDate], [CategoryStatus]) VALUES (2, N'Máy đồng bộ', 2, 0, N'Không có', CAST(N'2019-01-09T04:53:24.143' AS DateTime), CAST(N'2019-01-09T04:53:24.143' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPiority], [ParentId], [ParentName], [CreatedDate], [UpdatedDate], [CategoryStatus]) VALUES (3, N'Máy chơi game', 3, 0, N'Không có', CAST(N'2019-01-09T04:53:39.547' AS DateTime), CAST(N'2019-01-09T04:53:39.547' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPiority], [ParentId], [ParentName], [CreatedDate], [UpdatedDate], [CategoryStatus]) VALUES (4, N'Linh kiện máy tính', 4, 0, N'Không có', CAST(N'2019-01-09T04:53:57.827' AS DateTime), CAST(N'2020-09-09T16:00:11.833' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPiority], [ParentId], [ParentName], [CreatedDate], [UpdatedDate], [CategoryStatus]) VALUES (5, N'Máy chủ & Máy trạm', 5, 0, N'Không có', CAST(N'2019-01-09T04:54:12.317' AS DateTime), CAST(N'2019-01-09T04:54:12.317' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPiority], [ParentId], [ParentName], [CreatedDate], [UpdatedDate], [CategoryStatus]) VALUES (6, N'Gaming Gear & Console', 6, 0, N'Không có', CAST(N'2019-01-09T04:54:34.090' AS DateTime), CAST(N'2020-09-09T16:11:43.740' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPiority], [ParentId], [ParentName], [CreatedDate], [UpdatedDate], [CategoryStatus]) VALUES (7, N'Giải pháp tản nhiệt', 7, 0, N'Không có', CAST(N'2019-01-09T04:54:49.517' AS DateTime), CAST(N'2019-01-09T04:54:49.517' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPiority], [ParentId], [ParentName], [CreatedDate], [UpdatedDate], [CategoryStatus]) VALUES (8, N'CPU', 8, 4, N'Linh kiện máy tính', CAST(N'2019-01-09T04:55:05.880' AS DateTime), CAST(N'2020-09-09T16:00:11.940' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPiority], [ParentId], [ParentName], [CreatedDate], [UpdatedDate], [CategoryStatus]) VALUES (9, N'Mainboard', 9, 4, N'Linh kiện máy tính', CAST(N'2019-01-09T04:55:24.727' AS DateTime), CAST(N'2020-09-09T16:00:11.940' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPiority], [ParentId], [ParentName], [CreatedDate], [UpdatedDate], [CategoryStatus]) VALUES (10, N'RAM - Bộ nhớ trong', 10, 4, N'Linh kiện máy tính', CAST(N'2019-01-09T04:55:38.910' AS DateTime), CAST(N'2020-09-09T16:00:11.940' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPiority], [ParentId], [ParentName], [CreatedDate], [UpdatedDate], [CategoryStatus]) VALUES (11, N'Ổ cứng HDD', 11, 4, N'Linh kiện máy tính', CAST(N'2019-01-09T04:55:59.447' AS DateTime), CAST(N'2020-09-09T16:00:11.940' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPiority], [ParentId], [ParentName], [CreatedDate], [UpdatedDate], [CategoryStatus]) VALUES (12, N'Ổ cứng SSD', 12, 4, N'Linh kiện máy tính', CAST(N'2019-01-09T04:56:10.750' AS DateTime), CAST(N'2020-09-09T16:00:11.940' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPiority], [ParentId], [ParentName], [CreatedDate], [UpdatedDate], [CategoryStatus]) VALUES (13, N'VGA - Card màn hình', 13, 4, N'Linh kiện máy tính', CAST(N'2019-01-09T04:56:34.320' AS DateTime), CAST(N'2020-09-09T16:00:11.940' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPiority], [ParentId], [ParentName], [CreatedDate], [UpdatedDate], [CategoryStatus]) VALUES (14, N'Monitor - Màn hình', 14, 4, N'Linh kiện máy tính', CAST(N'2019-01-09T04:56:49.763' AS DateTime), CAST(N'2020-09-09T16:00:11.940' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPiority], [ParentId], [ParentName], [CreatedDate], [UpdatedDate], [CategoryStatus]) VALUES (15, N'Case - vỏ máy tính', 15, 4, N'Linh kiện máy tính', CAST(N'2019-01-09T04:57:04.973' AS DateTime), CAST(N'2020-09-09T16:00:11.940' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPiority], [ParentId], [ParentName], [CreatedDate], [UpdatedDate], [CategoryStatus]) VALUES (16, N'PSU - Nguồn', 16, 4, N'Linh kiện máy tính', CAST(N'2019-01-09T04:57:18.240' AS DateTime), CAST(N'2020-09-09T16:00:11.940' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPiority], [ParentId], [ParentName], [CreatedDate], [UpdatedDate], [CategoryStatus]) VALUES (17, N'Sound Card', 17, 4, N'Linh kiện máy tính', CAST(N'2019-01-09T04:57:42.127' AS DateTime), CAST(N'2020-09-09T16:00:11.940' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPiority], [ParentId], [ParentName], [CreatedDate], [UpdatedDate], [CategoryStatus]) VALUES (18, N'ODD - Ổ đĩa quang', 18, 4, N'Linh kiện máy tính', CAST(N'2019-01-09T04:58:08.457' AS DateTime), CAST(N'2020-09-09T16:00:11.940' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPiority], [ParentId], [ParentName], [CreatedDate], [UpdatedDate], [CategoryStatus]) VALUES (19, N'Bàn phím chơi game', 19, 6, N'Gaming Gear & Console', CAST(N'2019-01-09T04:58:24.593' AS DateTime), CAST(N'2020-09-09T16:11:43.773' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPiority], [ParentId], [ParentName], [CreatedDate], [UpdatedDate], [CategoryStatus]) VALUES (20, N'Chuột chơi game', 20, 6, N'Gaming Gear & Console', CAST(N'2019-01-09T04:58:33.113' AS DateTime), CAST(N'2020-09-09T16:11:43.773' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPiority], [ParentId], [ParentName], [CreatedDate], [UpdatedDate], [CategoryStatus]) VALUES (21, N'Ghế chơi game', 21, 6, N'Gaming Gear & Console', CAST(N'2019-01-09T04:58:41.360' AS DateTime), CAST(N'2020-09-09T16:11:43.773' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPiority], [ParentId], [ParentName], [CreatedDate], [UpdatedDate], [CategoryStatus]) VALUES (22, N'Bàn gaming', 22, 6, N'Gaming Gear & Console', CAST(N'2019-01-09T04:58:51.853' AS DateTime), CAST(N'2020-09-09T16:11:43.773' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPiority], [ParentId], [ParentName], [CreatedDate], [UpdatedDate], [CategoryStatus]) VALUES (23, N'Tai nghe chơi game', 23, 6, N'Gaming Gear & Console', CAST(N'2019-01-09T04:59:06.170' AS DateTime), CAST(N'2020-09-09T16:11:43.773' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPiority], [ParentId], [ParentName], [CreatedDate], [UpdatedDate], [CategoryStatus]) VALUES (24, N'Tay cầm game', 24, 6, N'Gaming Gear & Console', CAST(N'2019-01-09T04:59:18.953' AS DateTime), CAST(N'2020-09-09T16:11:43.773' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPiority], [ParentId], [ParentName], [CreatedDate], [UpdatedDate], [CategoryStatus]) VALUES (25, N'Bàn di chuột', 25, 6, N'Gaming Gear & Console', CAST(N'2019-01-09T04:59:46.850' AS DateTime), CAST(N'2020-09-09T16:11:43.773' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPiority], [ParentId], [ParentName], [CreatedDate], [UpdatedDate], [CategoryStatus]) VALUES (26, N'Máy chơi game console', 26, 6, N'Gaming Gear & Console', CAST(N'2019-01-09T05:00:03.980' AS DateTime), CAST(N'2020-09-09T16:11:43.773' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPiority], [ParentId], [ParentName], [CreatedDate], [UpdatedDate], [CategoryStatus]) VALUES (27, N'Kính thực tế ảo', 27, 6, N'Gaming Gear & Console', CAST(N'2019-01-09T05:00:31.337' AS DateTime), CAST(N'2020-09-09T16:11:43.773' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPiority], [ParentId], [ParentName], [CreatedDate], [UpdatedDate], [CategoryStatus]) VALUES (28, N'Game bản quyền', 28, 6, N'Gaming Gear & Console', CAST(N'2019-01-09T05:00:40.757' AS DateTime), CAST(N'2020-09-09T16:11:43.773' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPiority], [ParentId], [ParentName], [CreatedDate], [UpdatedDate], [CategoryStatus]) VALUES (29, N'Loa', 29, 6, N'Gaming Gear & Console', CAST(N'2019-03-23T03:16:59.507' AS DateTime), CAST(N'2020-09-09T16:11:43.773' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPiority], [ParentId], [ParentName], [CreatedDate], [UpdatedDate], [CategoryStatus]) VALUES (30, N'Ghế gaming', 30, 0, N'Không có', CAST(N'2020-09-09T16:14:12.560' AS DateTime), CAST(N'2020-09-09T16:14:12.560' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPiority], [ParentId], [ParentName], [CreatedDate], [UpdatedDate], [CategoryStatus]) VALUES (31, N'Thiết bị lưu trữ, usb', 31, 0, N'Không có', CAST(N'2020-09-09T16:15:59.663' AS DateTime), CAST(N'2020-09-09T16:22:42.483' AS DateTime), 0)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPiority], [ParentId], [ParentName], [CreatedDate], [UpdatedDate], [CategoryStatus]) VALUES (32, N'Thiết bị mạng', 32, 0, N'Không có', CAST(N'2020-09-09T16:17:39.573' AS DateTime), CAST(N'2020-09-09T16:22:38.883' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerId], [CustomerFullName], [CustomerEmail], [CustomerPhone], [CustomerPassword], [CustomerAvatar], [CustomerGender], [CustomerBirthday], [CustomerAddress], [CustomerCheckCode], [CustomerStatus]) VALUES (1, N'Trần Mạnh Quốc', N'quoc@gmail.com', N'0988855563', N'123456', N'Hà N?i', 1, CAST(N'1999-11-13' AS Date), N'Hà Nội', NULL, 1)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImages] ON 

INSERT [dbo].[ProductImages] ([ProductImageId], [ProductId], [ProductImage], [CreatedDate], [UpdatedDate], [ProductImageStatus]) VALUES (5, 2, N'AN515-54-59WX03.png', CAST(N'2020-09-09T10:12:10.530' AS DateTime), CAST(N'2020-09-09T10:12:10.813' AS DateTime), 1)
INSERT [dbo].[ProductImages] ([ProductImageId], [ProductId], [ProductImage], [CreatedDate], [UpdatedDate], [ProductImageStatus]) VALUES (6, 2, N'AN515-54-59WX04.png', CAST(N'2020-09-09T10:12:58.497' AS DateTime), CAST(N'2020-09-09T10:12:58.497' AS DateTime), 1)
INSERT [dbo].[ProductImages] ([ProductImageId], [ProductId], [ProductImage], [CreatedDate], [UpdatedDate], [ProductImageStatus]) VALUES (7, 2, N'AN515-54-59WX06.png', CAST(N'2020-09-09T10:13:11.493' AS DateTime), CAST(N'2020-09-09T10:13:11.493' AS DateTime), 1)
INSERT [dbo].[ProductImages] ([ProductImageId], [ProductId], [ProductImage], [CreatedDate], [UpdatedDate], [ProductImageStatus]) VALUES (8, 2, N'AN515-54-59WX05.png', CAST(N'2020-09-09T10:13:43.380' AS DateTime), CAST(N'2020-09-09T10:13:43.380' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[ProductImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductCode], [ProductStarAvg], [ProductFeatureImage], [ProductPrice], [ProductSale], [ProductWarranty], [ProductSaleQuantity], [ProductDescription], [SpecificationName], [SpecificationValue], [CategoryId], [BrandId], [CreatedDate], [UpdatedDate], [ProductStatus]) VALUES (1, N'laptop', N'23', 5, N'ps4-slim-gearvn_d87a3ded0eb24056bee1b92bf7771d50.jpg', 2000000, 30, 12, 2, N'<p>ấdf</p>
', N'adsf', N'<p>adsf</p>
', 1, 6, CAST(N'2020-09-06T23:51:45.067' AS DateTime), CAST(N'2020-09-11T01:28:33.570' AS DateTime), 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductCode], [ProductStarAvg], [ProductFeatureImage], [ProductPrice], [ProductSale], [ProductWarranty], [ProductSaleQuantity], [ProductDescription], [SpecificationName], [SpecificationValue], [CategoryId], [BrandId], [CreatedDate], [UpdatedDate], [ProductStatus]) VALUES (2, N'Laptop Acer Gaming Nitro 5', N'AN515-54-76RK NH.Q59', 5, N'AN515-54-59WX01.png', 20000000, 10, 0, 0, N'<h2>Đ&aacute;nh gi&aacute; sản phẩm Laptop Acer Gaming Nitro 5 (AN515-54-76RK NH.Q59SV.023) (i7 9750H/8GB RAM/512GB SSD/15.6 inch FHD/GTX 1650 4GB/Win 10)</h2>

<p>Tận hưởng cảm gi&aacute;c của kẻ dẫn đầu với si&ecirc;u&nbsp;<strong><em>Laptop Acer Gaming Nitro 5 (AN515-54-76RK NH.Q59SV.023)</em></strong>. Những &ldquo;vũ kh&iacute;&rdquo; của bạn sẽ l&agrave; bộ vi xử l&yacute; Intel Core i7 thế hệ thứ 9 mạnh mẽ, card đồ họa GTX 1650 đẳng cấp, sẵn s&agrave;ng c&ugrave;ng bạn trong những trận &ldquo;chiến game&rdquo; căng thẳng.</p>

<table>
	<tbody>
		<tr>
			<td><img alt="" src="https://hanoicomputercdn.com/media/lib/49511_LaptopAcerGamingNitro5AN515-54-76RKNH.Q59SV.023i7den10.jpg" /></td>
		</tr>
	</tbody>
</table>

<h3><strong>Mạnh mẽ v&agrave; tinh tế</strong></h3>

<p>Nh&igrave;n&nbsp;<strong><em>Laptop Acer Gaming Nitro 5 (AN515-54-76RK NH.Q59SV.023)</em></strong>, ch&uacute;ng ta nhận ra ngay đ&acirc;y l&agrave; một chiếc laptop gaming với những đường n&eacute;t mạnh mẽ v&agrave; t&ocirc;ng m&agrave;u đen &ndash; đỏ chủ đạo. B&ecirc;n cạnh việc kiểu d&aacute;ng &ldquo;ngầu&rdquo; đẹp mắt, Nitro 5 2019 cũng đi theo ng&ocirc;n ngữ thiết kế hiện đại, kh&ocirc;ng qu&aacute; &ldquo;hầm hố&rdquo; như nhiều laptop gaming kh&aacute;c. Vẻ đẹp của Nitro 5 2019 đến từ sự tinh tế, th&acirc;m trầm nhiều hơn.</p>

<table>
	<tbody>
		<tr>
			<td><img alt="" src="https://hanoicomputercdn.com/media/lib/49511_LaptopAcerGamingNitro5AN515-54-76RKNH.Q59SV.023i7den16.jpg" /></td>
		</tr>
	</tbody>
</table>

<h3><strong>Trải nghiệm m&atilde;n nh&atilde;n trong từng tựa game</strong></h3>

<p>So với thế hệ trước đ&acirc;y,&nbsp;Acer Nitro 5 2019 đ&atilde; c&oacute; bước &ldquo;lột x&aacute;c&rdquo; về viền m&agrave;n h&igrave;nh. M&agrave;n h&igrave;nh Full HD IPS 15,6 inch của Laptop Acer Gaming Nitro 5 (AN515-54-76RK NH.Q59SV.023) giờ đ&acirc;y kh&ocirc;ng chỉ c&oacute; chất lượng xuất sắc m&agrave; c&ograve;n sở hữu viền m&agrave;n h&igrave;nh si&ecirc;u mỏng 7,18mm. Điều n&agrave;y gi&uacute;p cho tỉ lệ diện t&iacute;ch m&agrave;n h&igrave;nh tr&ecirc;n th&acirc;n m&aacute;y l&ecirc;n tới 80%, khiến ngoại h&igrave;nh laptop gọn g&agrave;ng đi đ&aacute;ng kể. Tất nhi&ecirc;n trải nghiệm m&agrave;n h&igrave;nh viền mỏng cũng m&atilde;n nh&atilde;n hơn rất nhiều, đặc biệt trong c&aacute;c tựa game &ldquo;ho&agrave;nh tr&aacute;ng&rdquo; đồ họa đẹp.</p>

<table>
	<tbody>
		<tr>
			<td><img alt="" src="https://hanoicomputercdn.com/media/lib/49511_LaptopAcerGamingNitro5AN515-54-76RKNH.Q59SV.023i7den11.jpg" /></td>
		</tr>
	</tbody>
</table>

<h3><strong>&Acirc;m thanh sống động, tăng cường trải nghiệm</strong></h3>

<p>Chất lượng &acirc;m thanh tr&ecirc;n&nbsp;Laptop Acer Gaming Nitro 5 (AN515-54-76RK NH.Q59SV.023) được xử l&yacute; bằng phần mềm Waves MaxxAudio v&agrave; Acer TrueHarmony, đảm bảo đưa chất lượng &acirc;m thanh ph&ograve;ng thu cao cấp, sống động đến với những tr&ograve; chơi y&ecirc;u th&iacute;ch. C&aacute;c game thủ sẽ được đắm ch&igrave;m trong kh&ocirc;ng gian ch&acirc;n thực ở c&aacute;c tựa game đầy kịch t&iacute;nh.</p>

<table>
	<tbody>
		<tr>
			<td><img alt="" src="https://hanoicomputercdn.com/media/lib/49511_LaptopAcerGamingNitro5AN515-54-76RKNH.Q59SV.023i7den12.jpg" /></td>
		</tr>
	</tbody>
</table>

<h3><strong>Cấu h&igrave;nh đ&aacute;ng mơ ước</strong></h3>

<p>Laptop Acer&nbsp;Gaming Nitro 5 (AN515-54-76RK NH.Q59SV.023) mang tr&ecirc;n m&igrave;nh những th&ocirc;ng số ấn tượng m&agrave; c&aacute;c game thủ đang chờ đợi. Bạn sẽ c&oacute; bộ vi xử l&yacute; Intel Core i7 9750H si&ecirc;u mạnh với 6 l&otilde;i 12 luồng, xung nhịp 2.60 &ndash; 4.50GHz. B&ecirc;n cạnh đ&oacute; l&agrave; card đồ họa rời NVIDIA GeForce GTX 1650, l&yacute; tưởng để chiến mọi tựa game hiện nay. C&ugrave;ng tận hưởng những tựa game mạnh mẽ, cấu h&igrave;nh cao tr&ecirc;n Acer Nitro AN515-54-76RK một c&aacute;ch mượt m&agrave; nhất.</p>

<table>
	<tbody>
		<tr>
			<td><img alt="" src="https://hanoicomputercdn.com/media/lib/49511_LaptopAcerGamingNitro5AN515-54-76RKNH.Q59SV.023i7den13.jpg" /></td>
		</tr>
	</tbody>
</table>

<h3><strong>Nhiệt độ kh&ocirc;ng c&ograve;n l&agrave; vấn đề</strong></h3>

<p>Series Nitro 5 mới bổ sung ph&iacute;m tắt Nitro Sense, gi&uacute;p game thủ truy cập v&agrave;o phần mềm kiểm so&aacute;t nhiệt độ Nitro Sense nhanh ch&oacute;ng, chỉ sau một n&uacute;t chạm. Trải nghiệm Gaming của bạn sẽ trở n&ecirc;n ho&agrave;n hảo v&agrave; trực quan hơn khi nhiệt độ được kiểm so&aacute;t, tản nhiệt bất cứ l&uacute;c n&agrave;o. Trong phần mềm Nitro Sense c&oacute; sẵn t&iacute;nh năng CoolBoost với 3 chế độ tăng tốc quạt v&agrave; gi&uacute;p m&aacute;y giảm nhiệt độ ngay lập tức. Bạn sẽ kh&ocirc;ng bị n&oacute;ng m&aacute;y dẫn đến hiệu năng suy giảm, tụt fps hay những kh&oacute; chịu khi chơi game nữa.</p>

<table>
	<tbody>
		<tr>
			<td><img alt="" src="https://hanoicomputercdn.com/media/lib/49511_LaptopAcerGamingNitro5AN515-54-76RKNH.Q59SV.023i7den14.jpg" /></td>
		</tr>
	</tbody>
</table>

<h3><strong>Kết nối Killer si&ecirc;u tốc</strong></h3>

<p>Mạng nhanh v&agrave; ổn định l&agrave; ưu thế lớn khi bạn chơi game. Laptop Acer Gaming Nitro 5 (AN515-54-76RK NH.Q59SV.023) trang bị Killer Ethernet c&oacute; tốc độ l&ecirc;n tới 1Gbps. Chuẩn Wi-Fi Gigabit Wi-Fi 5with 2x2 MU-MIMO Technology Intel 802.11ac Wave 2 mới nhất cho tốc độ truyền dữ liệu l&ecirc;n tới 1.7Gbps. Lu&ocirc;n đảm bảo tốc độ đường truyền để bạn tập trung ho&agrave;n to&agrave;n v&agrave;o những trận &ldquo;chiến&rdquo; game hấp dẫn.</p>

<table>
	<tbody>
		<tr>
			<td><img alt="" src="https://hanoicomputercdn.com/media/lib/49511_LaptopAcerGamingNitro5AN515-54-76RKNH.Q59SV.023i7den15.jpg" /></td>
		</tr>
	</tbody>
</table>

<p><a href="javascript:void(0)">Thu gọn&nbsp;</a></p>
', N'Thông số kỹ thuật chi tiết Laptop Acer Gaming Nitro 5 (AN515-54-76RK NH.Q59SV.023) (i7 9750H/8GB RAM/512GB SSD/15.6 inch FHD/GTX 1650 4GB/Win 10)
', N'<table border="1" cellpadding="1" cellspacing="1" style="width:500px">
	<tbody>
		<tr>
			<td>
			<p>H&atilde;ng sản xuất</p>
			</td>
			<td>
			<p>Acer</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Chủng loại</p>
			</td>
			<td>
			<p>Nitro 5 AN515-54-76RK (2019)</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Part Number</p>
			</td>
			<td>
			<p>NH.Q59SV.023</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Mầu sắc</p>
			</td>
			<td>
			<p>Đen</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Bộ vi xử l&yacute;</p>
			</td>
			<td>
			<p>Intel&reg; Core&trade; i7-9750H</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Chipset</p>
			</td>
			<td>
			<p>Intel</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Bộ nhớ trong</p>
			</td>
			<td>
			<p>8GB DDR4 2666 Mhz</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Số khe cắm</p>
			</td>
			<td>
			<p>2</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Dung lượng tối đa</p>
			</td>
			<td>
			<p>32GB</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>VGA</p>
			</td>
			<td>
			<p>NVIDIA Geforce GTX1650 4GB GDDR5</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Ổ cứng</p>
			</td>
			<td>
			<p>512GB SSD PCIe</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Ổ quang</p>
			</td>
			<td>
			<p>None</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Card Reader</p>
			</td>
			<td>
			<p>SD&trade; Card reader</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Bảo mật</p>
			</td>
			<td>
			<p>No</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;n h&igrave;nh</p>
			</td>
			<td>
			<p>15.6&rsquo;&rsquo; FHD IPS (1920 x 1080) Anti-glare</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Webcam</p>
			</td>
			<td>
			<p>HD</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Audio</p>
			</td>
			<td>
			<p>Realtek High Definition Audio</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Giao tiếp mạng</p>
			</td>
			<td>
			<p>Gigabit</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Giao tiếp kh&ocirc;ng d&acirc;y</p>
			</td>
			<td>
			<p>&nbsp;802.11 AC +Bluetooth 5.0</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Cổng giao tiếp</p>
			</td>
			<td>
			<p>1 x USB 2.0; 1 x USB 3.0 Type C; 2 x USB 3.1; 1 x HDMI;1 x RJ45; 1 x Headphone/ Microphone Combo Port</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Pin</p>
			</td>
			<td>
			<p>4 Cell , 55Wh</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>K&iacute;ch thước (rộng x d&agrave;i x cao)</p>
			</td>
			<td>
			<p>363.4 (W) x 255 (D) x 25.9 (H) mm</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>C&acirc;n nặng</p>
			</td>
			<td>
			<p>2.3 kg&nbsp;</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Hệ điều h&agrave;nh</p>
			</td>
			<td>
			<p>Win 10 Home SL 64</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Phụ kiện đi k&egrave;m</p>
			</td>
			<td>
			<p>Adapter</p>
			</td>
		</tr>
	</tbody>
</table>
', 1, 6, CAST(N'2020-09-07T00:04:27.763' AS DateTime), CAST(N'2020-09-11T01:28:38.930' AS DateTime), 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductCode], [ProductStarAvg], [ProductFeatureImage], [ProductPrice], [ProductSale], [ProductWarranty], [ProductSaleQuantity], [ProductDescription], [SpecificationName], [SpecificationValue], [CategoryId], [BrandId], [CreatedDate], [UpdatedDate], [ProductStatus]) VALUES (1002, N'PC HNC SPECIAL EDITION No1', N'No1', 5, N'P122.png', 2000000, 0, 24, 4, N'<h2>ĐẶC ĐIỂM NỔI BẬT</h2>

<p><img alt="" src="https://i.imgur.com/YPpWh7V.jpg" /></p>

<table border="0" cellspacing="0">
	<tbody>
		<tr>
			<td>&nbsp;<img alt="" src="https://i.imgur.com/hixoeBu.jpg" /></td>
			<td>
			<p><strong>Thỏa m&atilde;n cơn kh&aacute;t hiệu năng</strong><br />
			<br />
			Sẵn s&agrave;ng chạy tất cả những g&igrave; bạn y&ecirc;u cầu ở mức thiết lập cao nhất kể cả tr&ecirc;n những m&agrave;n h&igrave;nh c&oacute; độ ph&acirc;n giải 4K, c&aacute;c bộ m&aacute;y nằm trong series Special Edition ch&iacute;nh l&agrave; lựa chọn ho&agrave;n hảo nếu bạn đang c&oacute; &yacute; định trở th&agrave;nh một game thủ ki&ecirc;m streamer chuy&ecirc;n nghiệp.&nbsp;</p>

			<p>&nbsp;</p>
			</td>
		</tr>
		<tr>
			<td><strong>Tản nhiệt nước t&ugrave;y biến mạnh mẽ nhất&nbsp;</strong><br />
			<br />
			Trong thế giới Water Cooling, EKWB l&agrave; t&ecirc;n tuổi đứng top đầu bởi chất lượng ho&agrave;n thiện, độ bền, sự linh hoạt v&agrave; dải sản phẩm phong ph&uacute; kh&ocirc;ng thể b&agrave;n c&atilde;i. Khi quyết định mua PC HNC phi&ecirc;n bản đặc biệt, bạn sẽ được to&agrave;n quyền t&ugrave;y biến bộ m&aacute;y của m&igrave;nh. H&atilde;y sẵn s&agrave;ng ngắm nh&igrave;n tuyệt t&aacute;c d&agrave;nh cho ri&ecirc;ng bạn dần dần hiện hữu dưới b&agrave;n tay ma thuật của những kỹ thuật vi&ecirc;n l&agrave;nh nghề nhất.</td>
			<td>&nbsp;<img alt="" src="https://i.imgur.com/JDlhoHn.jpg" /></td>
		</tr>
		<tr>
			<td>&nbsp;<img alt="" src="https://i.imgur.com/j09qHIA.jpg" /></td>
			<td><strong>D&agrave;nh cho những kẻ chinh phục</strong><br />
			<br />
			Chẳng c&oacute; g&igrave; sai khi muốn vượt l&ecirc;n tr&ecirc;n tất cả, những cỗ m&aacute;y cao cấp nhất của HANOICOMPUTER ch&iacute;nh l&agrave; trợ thủ đắc lực để bạn tự tin khẳng định vị thế của m&igrave;nh cả trong game lẫn ngo&agrave;i đời.</td>
		</tr>
		<tr>
			<td><strong>Gi&aacute; trị tinh thần kh&ocirc;ng thể đong đếm</strong><br />
			<br />
			Như những chiếc si&ecirc;u xe, d&ugrave; cho nhiều năm tr&ocirc;i qua hay thời thế đổi thay, những chiến m&atilde; m&agrave; bạn đang thấy vẫn sẽ l&agrave; biểu tượng cho một thời v&agrave;ng son của l&agrave;ng c&ocirc;ng nghệ thế giới. Kh&ocirc;ng ai c&oacute; thể phủ nhận hay l&agrave;m giảm gi&aacute; trị về mặt tinh thần của ch&uacute;ng.</td>
			<td>&nbsp;<img alt="" src="https://i.imgur.com/hOlQr5F.jpg" /></td>
		</tr>
	</tbody>
</table>
', N'PC HNC SPECIAL EDITION No1', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<td>
			<p><strong>T&ecirc;n gọi</strong></p>
			</td>
			<td>
			<p><strong>PC HNC SPECIAL EDITION No1 I9 7900X/32G/GTX 1080Ti SLI</strong></p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>CPU</strong></p>
			</td>
			<td>
			<p>CPU Intel Core i9 - 7900X 3.3 GHz Turbo 4.3 Up to 4.5 GHz / 13.75 MB / 10 Cores, 20 Threads / socket 2066.</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Bo mạch chủ</strong></p>
			</td>
			<td>
			<p>Gigabyte X299 DESIGNARE - EX</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>RAM</strong></p>
			</td>
			<td>
			<p>Gskill 16GB (2x8GB) DDR4 Bus 3000Mhz - F4-3000C16D-16GTZR (x2)</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>SSD</strong></p>
			</td>
			<td>
			<p>PCIe Samsung 970 EVO 500GB PCIe NVMe 3.0x4</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>HDD</strong></p>
			</td>
			<td>
			<p>Seagate Barracuda Pro 4TB/7200 Sata 128MB 3.5&quot;</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Card đồ họa</strong></p>
			</td>
			<td>
			<p>Gigabyte N108TAORUS-11GD&nbsp;(x2)</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Nguồn</strong></p>
			</td>
			<td>
			<p>Seasonic 1000W Prime 1000GD 80 Plus Gold.</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Case</strong></p>
			</td>
			<td>
			<p>Cooler Master COSMOS C700P&nbsp;</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Tản nhiệt</strong></p>
			</td>
			<td>
			<p>Combo EKWB Water Cooling</p>
			</td>
		</tr>
	</tbody>
</table>
', 3, 8, CAST(N'2020-09-07T21:37:12.093' AS DateTime), CAST(N'2020-09-11T01:28:44.397' AS DateTime), 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductCode], [ProductStarAvg], [ProductFeatureImage], [ProductPrice], [ProductSale], [ProductWarranty], [ProductSaleQuantity], [ProductDescription], [SpecificationName], [SpecificationValue], [CategoryId], [BrandId], [CreatedDate], [UpdatedDate], [ProductStatus]) VALUES (1003, N'Bang BKAP', N'ha', 5, N'ps4-slim-gearvn_d87a3ded0eb24056bee1b92bf7771d50.jpg', 2000, 5, 24, 0, N'<p>sad</p>
', N'ád', N'<p>&aacute;d</p>
', 1, 2, CAST(N'2020-09-07T22:22:08.387' AS DateTime), CAST(N'2020-09-09T16:53:03.853' AS DateTime), 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductCode], [ProductStarAvg], [ProductFeatureImage], [ProductPrice], [ProductSale], [ProductWarranty], [ProductSaleQuantity], [ProductDescription], [SpecificationName], [SpecificationValue], [CategoryId], [BrandId], [CreatedDate], [UpdatedDate], [ProductStatus]) VALUES (1006, N'oko', N'AN515-54-76RK NH.Q59', 5, N'AN515-54-59WX01.png', 200000, 12, 12, 0, N'<p>dsa</p>
', N'ads', N'<p>&aacute;d</p>
', 1, 3, CAST(N'2020-09-07T23:41:10.690' AS DateTime), CAST(N'2020-09-11T01:28:59.503' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Admins__3FFAEA493CAEC50A]    Script Date: 9/11/2020 2:35:42 AM ******/
ALTER TABLE [dbo].[Admins] ADD UNIQUE NONCLUSTERED 
(
	[AdminPhone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Admins__70330E49E0E515EF]    Script Date: 9/11/2020 2:35:42 AM ******/
ALTER TABLE [dbo].[Admins] ADD UNIQUE NONCLUSTERED 
(
	[AdminAvatar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Admins__731F9929061A8271]    Script Date: 9/11/2020 2:35:42 AM ******/
ALTER TABLE [dbo].[Admins] ADD UNIQUE NONCLUSTERED 
(
	[AdminIdCard] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Admins__F2AA7AD93276CB2D]    Script Date: 9/11/2020 2:35:42 AM ******/
ALTER TABLE [dbo].[Admins] ADD UNIQUE NONCLUSTERED 
(
	[AdminEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Banners__D71CE4AA07C0AD15]    Script Date: 9/11/2020 2:35:42 AM ******/
ALTER TABLE [dbo].[Banners] ADD UNIQUE NONCLUSTERED 
(
	[BannerImage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Brands__2206CE9BD83238C7]    Script Date: 9/11/2020 2:35:42 AM ******/
ALTER TABLE [dbo].[Brands] ADD UNIQUE NONCLUSTERED 
(
	[BrandName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Brands__C8A38C550354B2B2]    Script Date: 9/11/2020 2:35:42 AM ******/
ALTER TABLE [dbo].[Brands] ADD UNIQUE NONCLUSTERED 
(
	[BrandLogo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Catalogs__19D9FA473FCF0541]    Script Date: 9/11/2020 2:35:42 AM ******/
ALTER TABLE [dbo].[Catalogs] ADD UNIQUE NONCLUSTERED 
(
	[CatalogName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Categori__8517B2E0BA75DCAC]    Script Date: 9/11/2020 2:35:42 AM ******/
ALTER TABLE [dbo].[Categories] ADD UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__390618B3BD909F31]    Script Date: 9/11/2020 2:35:42 AM ******/
ALTER TABLE [dbo].[Customers] ADD UNIQUE NONCLUSTERED 
(
	[CustomerPhone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__3A0CE74C637D3705]    Script Date: 9/11/2020 2:35:42 AM ******/
ALTER TABLE [dbo].[Customers] ADD UNIQUE NONCLUSTERED 
(
	[CustomerEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Feedback__636EBB38B5344F1F]    Script Date: 9/11/2020 2:35:42 AM ******/
ALTER TABLE [dbo].[FeedbackCatalogs] ADD UNIQUE NONCLUSTERED 
(
	[FeedbackCatalogName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Logoes__D591C761CE3D04D5]    Script Date: 9/11/2020 2:35:42 AM ******/
ALTER TABLE [dbo].[Logoes] ADD UNIQUE NONCLUSTERED 
(
	[LogoImage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__News__82BCD9E148D700EE]    Script Date: 9/11/2020 2:35:42 AM ******/
ALTER TABLE [dbo].[News] ADD UNIQUE NONCLUSTERED 
(
	[NewTitle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__News__B1EFF9BD71108D22]    Script Date: 9/11/2020 2:35:42 AM ******/
ALTER TABLE [dbo].[News] ADD UNIQUE NONCLUSTERED 
(
	[NewImage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ProductI__465B783CF191A503]    Script Date: 9/11/2020 2:35:42 AM ******/
ALTER TABLE [dbo].[ProductImages] ADD UNIQUE NONCLUSTERED 
(
	[ProductImage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Products__DD5A978A8856102D]    Script Date: 9/11/2020 2:35:42 AM ******/
ALTER TABLE [dbo].[Products] ADD UNIQUE NONCLUSTERED 
(
	[ProductName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Admins] ADD  DEFAULT (getdate()) FOR [AdminBirthday]
GO
ALTER TABLE [dbo].[Admins] ADD  DEFAULT ((1)) FOR [AdminGender]
GO
ALTER TABLE [dbo].[Admins] ADD  DEFAULT ((1)) FOR [AdminStatus]
GO
ALTER TABLE [dbo].[Banners] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Banners] ADD  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[Banners] ADD  DEFAULT ((1)) FOR [BannerStatus]
GO
ALTER TABLE [dbo].[Brands] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Brands] ADD  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[Brands] ADD  DEFAULT ((1)) FOR [BrandStatus]
GO
ALTER TABLE [dbo].[Catalogs] ADD  DEFAULT ((0)) FOR [ParentId]
GO
ALTER TABLE [dbo].[Catalogs] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Catalogs] ADD  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[Catalogs] ADD  DEFAULT ((1)) FOR [CatalogStatus]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT ((0)) FOR [ParentId]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT ((1)) FOR [CategoryStatus]
GO
ALTER TABLE [dbo].[Customers] ADD  DEFAULT ((1)) FOR [CustomerGender]
GO
ALTER TABLE [dbo].[Customers] ADD  DEFAULT (getdate()) FOR [CustomerBirthday]
GO
ALTER TABLE [dbo].[Customers] ADD  DEFAULT ((1)) FOR [CustomerStatus]
GO
ALTER TABLE [dbo].[FeedbackCatalogs] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[FeedbackCatalogs] ADD  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[FeedbackCatalogs] ADD  DEFAULT ((1)) FOR [FeedbackCatalogStatus]
GO
ALTER TABLE [dbo].[Feedbacks] ADD  DEFAULT (getdate()) FOR [FeedbacksTime]
GO
ALTER TABLE [dbo].[Feedbacks] ADD  DEFAULT ((1)) FOR [FeedbackStatus]
GO
ALTER TABLE [dbo].[Introductions] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Introductions] ADD  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[Introductions] ADD  DEFAULT ((1)) FOR [IntroductionStatus]
GO
ALTER TABLE [dbo].[Logoes] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Logoes] ADD  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[Logoes] ADD  DEFAULT ((1)) FOR [LogoStatus]
GO
ALTER TABLE [dbo].[News] ADD  DEFAULT ((0)) FOR [NewLike]
GO
ALTER TABLE [dbo].[News] ADD  DEFAULT ((0)) FOR [NewViewed]
GO
ALTER TABLE [dbo].[News] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[News] ADD  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[News] ADD  DEFAULT ((1)) FOR [NewStatus]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  DEFAULT ((1)) FOR [OrderDetailQuantity]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  DEFAULT ((0)) FOR [OrderDetailPrice]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  DEFAULT ((0)) FOR [OrderDetailSale]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  DEFAULT ((1)) FOR [OrderDetailStatus]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [OrderTotalAmount]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((1)) FOR [OrderStatus]
GO
ALTER TABLE [dbo].[ProductComments] ADD  DEFAULT ((5)) FOR [ProductCommentRate]
GO
ALTER TABLE [dbo].[ProductComments] ADD  DEFAULT (getdate()) FOR [ProductCommentTime]
GO
ALTER TABLE [dbo].[ProductComments] ADD  DEFAULT ((1)) FOR [ProductCommentStatus]
GO
ALTER TABLE [dbo].[ProductImages] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ProductImages] ADD  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[ProductImages] ADD  DEFAULT ((1)) FOR [ProductImageStatus]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((5)) FOR [ProductStarAvg]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [ProductPrice]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [ProductSale]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [ProductWarranty]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [ProductSaleQuantity]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (N'Đang cập nhật') FOR [ProductDescription]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((1)) FOR [ProductStatus]
GO
ALTER TABLE [dbo].[Wishlists] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Wishlists] ADD  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[Wishlists] ADD  DEFAULT ((1)) FOR [WishlistStatus]
GO
ALTER TABLE [dbo].[Catalogs]  WITH CHECK ADD FOREIGN KEY([AdminId])
REFERENCES [dbo].[Admins] ([AdminId])
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD FOREIGN KEY([FeedbackCatalogId])
REFERENCES [dbo].[FeedbackCatalogs] ([FeedbackCatalogId])
GO
ALTER TABLE [dbo].[Introductions]  WITH CHECK ADD FOREIGN KEY([AdminId])
REFERENCES [dbo].[Admins] ([AdminId])
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD FOREIGN KEY([AdminId])
REFERENCES [dbo].[Admins] ([AdminId])
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD FOREIGN KEY([CatalogId])
REFERENCES [dbo].[Catalogs] ([CatalogId])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[ProductComments]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[ProductComments]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([BrandId])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Wishlists]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[Wishlists]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
