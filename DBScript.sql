USE [master]
GO
/****** Object:  Database [EShopDB]    Script Date: 18.07.2022 4:21:10 ******/
CREATE DATABASE [EShopDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EShopDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EShopDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EShopDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EShopDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EShopDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EShopDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EShopDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EShopDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EShopDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EShopDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EShopDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EShopDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EShopDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EShopDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EShopDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EShopDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EShopDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EShopDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EShopDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EShopDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EShopDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EShopDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EShopDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EShopDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EShopDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EShopDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EShopDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EShopDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EShopDB] SET RECOVERY FULL 
GO
ALTER DATABASE [EShopDB] SET  MULTI_USER 
GO
ALTER DATABASE [EShopDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EShopDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EShopDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EShopDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EShopDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EShopDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'EShopDB', N'ON'
GO
ALTER DATABASE [EShopDB] SET QUERY_STORE = OFF
GO
USE [EShopDB]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 18.07.2022 4:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[ID] [int] NOT NULL,
	[Path] [nvarchar](260) NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 18.07.2022 4:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Article] [int] NOT NULL,
	[Cost] [float] NOT NULL,
	[Count] [int] NOT NULL,
	[Image] [int] NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 18.07.2022 4:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] NOT NULL,
	[Login] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Role] [tinyint] NOT NULL,
	[Image] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Images] ([ID], [Path]) VALUES (1, N'apple-imac-ipad-workplace-38568.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (2, N'pexels-photo-1029757.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (3, N'pexels-photo-1036808.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (4, N'pexels-photo-1049764.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (5, N'pexels-photo-1109543.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (6, N'pexels-photo-129208.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (7, N'pexels-photo-1438081.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (8, N'pexels-photo-1554188 (1).jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (9, N'pexels-photo-1554188 (2).jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (10, N'pexels-photo-1554188 (3).jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (11, N'pexels-photo-1554188.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (12, N'pexels-photo-1714205.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (13, N'pexels-photo-1714208.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (14, N'pexels-photo-1779487.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (15, N'pexels-photo-209151.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (16, N'pexels-photo-2102415.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (17, N'pexels-photo-2102416.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (18, N'pexels-photo-2115217.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (19, N'pexels-photo-2182969.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (20, N'pexels-photo-220357.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (21, N'pexels-photo-2237797.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (22, N'pexels-photo-2265482.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (23, N'pexels-photo-2265488.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (24, N'pexels-photo-2312369.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (25, N'pexels-photo-2399840.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (26, N'pexels-photo-2422286.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (27, N'pexels-photo-2422293.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (28, N'pexels-photo-2506947.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (29, N'pexels-photo-2528118.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (30, N'pexels-photo-2569997.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (31, N'pexels-photo-2582937.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (32, N'pexels-photo-265087.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (33, N'pexels-photo-265631.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (34, N'pexels-photo-2657669.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (35, N'pexels-photo-3184454.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (36, N'pexels-photo-331684.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (37, N'pexels-photo-3521937 (1).jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (38, N'pexels-photo-3521937 (2).jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (39, N'pexels-photo-3521937 (3).jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (40, N'pexels-photo-3521937.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (41, N'pexels-photo-392018.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (42, N'pexels-photo-434337.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (43, N'pexels-photo-450035.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (44, N'pexels-photo-459653.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (45, N'pexels-photo-463684.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (46, N'pexels-photo-572056.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (47, N'pexels-photo-735911.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (48, N'pexels-photo-777001.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (49, N'pexels-photo-792199.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (50, N'pexels-photo-840996.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (51, N'pexels-photo-916335 (1).jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (52, N'pexels-photo-916335 (2).jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (53, N'pexels-photo-916335 (3).jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (54, N'pexels-photo-916335.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (55, N'pexels-photo-920381.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (56, N'pexels-photo-930530.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (57, N'pexels-photo-968631.jpeg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (58, N'istockphoto-1182241805-612x612.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (59, N'istockphoto-1183337149-612x612.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (60, N'istockphoto-1222160402-612x612.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (61, N'istockphoto-1267044898-612x612.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (62, N'keyboard-computer-keys-white.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (63, N'pexels-adrienne-andersen-2237797.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (64, N'pexels-andrea-piacquadio-840996.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (65, N'pexels-andrea-piacquadio-920381.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (66, N'pexels-andrew-neel-2312369.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (67, N'pexels-athena-2582937.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (68, N'pexels-buro-millennial-1438081.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (69, N'pexels-designecologist-1779487.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (70, N'pexels-djordje-petrovic-2102415.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (71, N'pexels-djordje-petrovic-2102416.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (72, N'pexels-dominika-roseclay-1036808.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (73, N'pexels-drew-williams-2657669.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (74, N'pexels-dzenina-lukac-930530.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (75, N'pexels-eduardo-dutra-2115217.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (76, N'pexels-eduardo-rosas-968631.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (77, N'pexels-elvis-2528118.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (78, N'pexels-fauxels-3184454.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (79, N'pexels-format-1029757.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (80, N'pexels-hitarth-jadhav-220357.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (81, N'pexels-jopwell-2422286.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (82, N'pexels-jopwell-2422293.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (83, N'pexels-josh-sorenson-1714205.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (84, N'pexels-josh-sorenson-1714208.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (85, N'pexels-karsten-madsen-18105.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (86, N'pexels-lenin-estrada-2569997.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (87, N'pexels-lex-photography-1109543.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (88, N'pexels-life-of-pix-7974.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (89, N'pexels-linkedin-sales-navigator-2182969.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (90, N'pexels-marek-levak-2265482.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (91, N'pexels-marek-levak-2265488.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (92, N'pexels-mateusz-dach-450035.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (93, N'pexels-math-331684.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (94, N'pexels-nao-triponez-129208.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (95, N'pexels-nao-triponez-792199.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (96, N'pexels-nikolaos-dimou-2506947.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (97, N'pexels-oussama-bergaoui-463684.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (98, N'pexels-photo (1).jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (99, N'pexels-photo.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (100, N'pexels-pixabay-209151.jpg')
GO
INSERT [dbo].[Images] ([ID], [Path]) VALUES (101, N'pexels-pixabay-265087.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (102, N'pexels-pixabay-265631.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (103, N'pexels-pixabay-34490.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (104, N'pexels-pixabay-38568.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (105, N'pexels-pixabay-434337.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (106, N'pexels-pixabay-459653.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (107, N'pexels-ruca-souza-1049764.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (108, N'pexels-serpstat-572056.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (109, N'pexels-soumil-kumar-735911.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (110, N'pexels-vojtech-okenka-392018.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (111, N'pexels-xxss-is-back-777001.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (112, N'pexels-??-?-2399840.jpg')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (113, N'purple.png')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (114, N'soumil-kumar-699.png')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (115, N'18.07.2022 0_01_40image.png')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (116, N'18.07.2022 0_02_52image.png')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (117, N'18.07.2022 0_05_30image.png')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (118, N'18.07.2022 0_08_14image.png')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (119, N'18.07.2022 0_14_13image.png')
INSERT [dbo].[Images] ([ID], [Path]) VALUES (120, N'18.07.2022 0_16_06image.png')
GO
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (1, N'Ноутбук Dell Inspiron 15 7577 [7577-5199]', 1267610, 56202.3, 9, 1, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (2, N'Ноутбук Dell Inspiron 15 7577 [7577-5199]', 1267610, 56202.3, 10, 2, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (3, N'Ноутбук Dell Inspiron 15 7577 [7577-5212]', 1267734, 58817, 9, 120, N'54456та*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (4, N'Ноутбук Dell Inspiron 15 7577 [7577-5212]', 1267734, 58817, 8, 4, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (5, N'Ноутбук Dell Inspiron 15 7577 [7577-9553]', 1307781, 58685, 4, 5, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (6, N'Ноутбук Dell Inspiron 15 7577 [7577-9553]', 1307781, 58685, 3, 6, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (7, N'Ноутбук Dell Inspiron 15 7577 [7577-9560]', 1307779, 59878.5, 14, 7, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (8, N'Ноутбук Dell Inspiron 15 7577 [7577-9560]', 1307779, 59878.5, 15, 8, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (9, N'Ноутбук Dell Inspiron 15 7577 [7577-9584]', 1285239, 70609, 10, 9, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (10, N'Ноутбук Dell Inspiron 15 7577 [7577-9584]', 1285239, 70609, 15, 10, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (11, N'Ноутбук Dell Inspiron 15 7577 [7577-5236]', 1267738, 72667.1, 4, 11, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (12, N'Ноутбук Dell Inspiron 15 7577 [7577-5236]', 1267738, 72667.1, 10, 12, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (13, N'Ноутбук Dell Inspiron 15 7577 [7577-9591]', 1307784, 74462.3, 2, 13, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (14, N'Ноутбук Dell Inspiron 15 7577 [7577-9591]', 1307784, 74462.3, 13, 14, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (15, N'Ноутбук Dell Inspiron 15 7577 [7577-5457]', 1285236, 69340.7, 9, 15, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (16, N'Ноутбук Dell Inspiron 15 7577 [7577-5457]', 1285236, 69340.7, 3, 16, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (17, N'Ноутбук Dell Inspiron 15 7577 [7577-5440]', 1285234, 66517, 5, 17, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (18, N'Ноутбук Dell Inspiron 15 7577 [7577-5440]', 1285234, 66517, 2, 18, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (19, N'Ноутбук Dell Inspiron 15 7577 [7577-5990]', 1267771, 77737, 7, 19, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (20, N'Ноутбук Dell Inspiron 15 7577 [7577-5990]', 1267771, 77737, 10, 20, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (21, N'Ноутбук Dell Inspiron 15 7577 [7577-9621]', 1285237, 78346.4, 4, 21, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (22, N'Ноутбук Dell Inspiron 15 7577 [7577-9621]', 1285237, 78346.4, 7, 22, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (23, N'Ноутбук Dell Inspiron 15 7577 [7577-5983]', 1267747, 75581, 3, 23, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (24, N'Ноутбук Dell Inspiron 15 7577 [7577-5983]', 1267747, 75581, 2, 24, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (25, N'Ноутбук Dell Inspiron 15 7577 [7577-9638]', 1307793, 76161.8, 13, 25, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (26, N'Ноутбук Dell Inspiron 15 7577 [7577-9638]', 1307793, 76161.8, 13, 26, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (27, N'Ноутбук Dell Inspiron 15 7577 [7577-5464]', 1307790, 87085.9, 2, 27, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (28, N'Ноутбук Dell Inspiron 15 7577 [7577-5464]', 1307790, 87085.9, 5, 28, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (29, N'Ноутбук Dell Inspiron 15 7577 [7577-5250]', 1267760, 95114.8, 6, 29, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (30, N'Ноутбук Dell Inspiron 15 7577 [7577-5250]', 1267760, 95114.8, 6, 30, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (31, N'Ноутбук Lenovo Ideapad 320 15 [320-15ISK 80XH01DJRK]', 1216264, 19322.6, 13, 31, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (32, N'Ноутбук Lenovo Ideapad 320 15 [320-15ISK 80XH01DJRK]', 1216264, 19322.6, 10, 32, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (33, N'Ноутбук Lenovo Ideapad 320 15 [320-15ISK 80XH01EHRK]', 1216266, 28589, 15, 33, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (34, N'Ноутбук Lenovo Ideapad 320 15 [320-15ISK 80XH01EHRK]', 1216266, 28589, 15, 34, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (35, N'Ноутбук Lenovo Ideapad 320 15 [320-15ISK 80XH00EHRK]', 1206223, 32414.8, 9, 35, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (36, N'Ноутбук Lenovo Ideapad 320 15 [320-15ISK 80XH00EHRK]', 1206223, 32414.8, 9, 36, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (37, N'Ноутбук Lenovo Ideapad 320 15 [320-15ISK 80XH00KTRK]', 1157531, 30253.3, 4, 37, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (38, N'Ноутбук Lenovo Ideapad 320 15 [320-15ISK 80XH00KTRK]', 1157531, 30253.3, 6, 38, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (39, N'Ноутбук Lenovo Ideapad 320 15 [320-15ISK 80XH01N7RK]', 1260968, 33915.2, 14, 39, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (40, N'Ноутбук Lenovo Ideapad 320 15 [320-15ISK 80XH01N7RK]', 1260968, 33915.2, 3, 40, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (41, N'Ноутбук Lenovo Ideapad 320 15 [320-15ISK 80XH01U3RU]', 1304022, 35105.4, 13, 41, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (42, N'Ноутбук Lenovo Ideapad 320 15 [320-15ISK 80XH01U3RU]', 1304022, 35105.4, 8, 42, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (43, N'Ноутбук Lenovo Ideapad 320 15 [320-15ISK 80XH01EGRK]', 1216265, 35189, 4, 43, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (44, N'Ноутбук Lenovo Ideapad 320 15 [320-15ISK 80XH01EGRK]', 1216265, 35189, 13, 44, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (45, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBN 80XL02UERK]', 1233808, 32450, 4, 45, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (46, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBN 80XL02UERK]', 1233808, 32450, 3, 46, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (47, N'Ноутбук Lenovo Ideapad 320 15 [320-15ISK 80XH01UBRU]', 1304024, 26666.2, 11, 47, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (48, N'Ноутбук Lenovo Ideapad 320 15 [320-15ISK 80XH01UBRU]', 1304024, 26666.2, 5, 48, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (49, N'Ноутбук Lenovo Ideapad 320 15 [320-15ISK 80XH01DHRK]', 1216263, 25850, 14, 49, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (50, N'Ноутбук Lenovo Ideapad 320 15 [320-15ISK 80XH01DHRK]', 1216263, 25850, 3, 50, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (51, N'Ноутбук Lenovo Ideapad 320 15 [320-15ISK 80XH01TWRU]', 1304017, 27495.6, 13, 51, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (52, N'Ноутбук Lenovo Ideapad 320 15 [320-15ISK 80XH01TWRU]', 1304017, 27495.6, 8, 52, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (53, N'Ноутбук Lenovo Ideapad 320 15 [320-15ISK 80XH01CPRK]', 1233762, 30641.6, 14, 53, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (54, N'Ноутбук Lenovo Ideapad 320 15 [320-15ISK 80XH01CPRK]', 1233762, 30641.6, 12, 54, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (55, N'Ноутбук Lenovo Ideapad 320 15 [320-15ISK 80XH01U0RU]', 1304019, 33613.8, 15, 55, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (56, N'Ноутбук Lenovo Ideapad 320 15 [320-15ISK 80XH01U0RU]', 1304019, 33613.8, 4, 56, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (57, N'Ноутбук Lenovo Ideapad 320 15 [320-15ISK 80XH01MSRK]', 1321352, 36289, 8, 57, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (58, N'Ноутбук Lenovo Ideapad 320 15 [320-15ISK 80XH01MSRK]', 1321352, 36289, 9, 58, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (59, N'Ноутбук Lenovo Ideapad 320 15 [320-15ISK 80XH01MPRK]', 1304015, 36630, 11, 59, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (60, N'Ноутбук Lenovo Ideapad 320 15 [320-15ISK 80XH01MPRK]', 1304015, 36630, 7, 60, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (61, N'Ноутбук Lenovo Ideapad 320 15 [320-15ISK 80XH01MQRK]', 1260999, 37010.6, 3, 61, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (62, N'Ноутбук Lenovo Ideapad 320 15 [320-15ISK 80XH01MQRK]', 1260999, 37010.6, 10, 62, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (63, N'Ноутбук Lenovo Ideapad 320 15 [320-15ISK 80XH01U5RU]', 1304023, 41596.5, 10, 63, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (64, N'Ноутбук Lenovo Ideapad 320 15 [320-15ISK 80XH01U5RU]', 1304023, 41596.5, 6, 64, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (65, N'Ноутбук Lenovo Ideapad 320 15 [320-15ISK 80XH01P0RK]', 1260988, 31889, 4, 65, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (66, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKB 80XL01GFRK]', 1174037, 19322.6, 10, 66, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (67, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKB 80XL01GFRK]', 1174037, 19322.6, 11, 67, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (68, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBN 80XL01GVRK]', 1215845, 35289.1, 3, 68, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (69, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBN 80XL01GVRK]', 1215845, 35289.1, 6, 69, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (70, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBN 80XL03MYRK]', 1289365, 39149, 2, 70, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (71, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBN 80XL03MYRK]', 1289365, 39149, 14, 71, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (72, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKB 80XL03T3RU]', 1321364, 28195.2, 15, 72, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (73, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKB 80XL03T3RU]', 1321364, 28195.2, 3, 73, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (74, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBA 80YE0003RK]', 1321380, 32602.9, 6, 74, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (75, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBA 80YE0003RK]', 1321380, 32602.9, 13, 75, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (76, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBN 80XL03K6RK]', 1260919, 39490, 12, 76, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (77, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBN 80XL03K6RK]', 1260919, 39490, 4, 77, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (78, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKB 80XL003CRK]', 1157476, 40689, 5, 78, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (79, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKB 80XL003CRK]', 1157476, 40689, 13, 79, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (80, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBA 80YE00AXRK]', 1321354, 36268.1, 12, 80, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (81, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBA 80YE00AXRK]', 1321354, 36268.1, 3, 81, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (82, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBN 80XL03MXRK]', 1260931, 42889, 12, 82, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (83, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBN 80XL03MXRK]', 1260931, 42889, 7, 83, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (84, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBN 80XL02UGRK]', 1289363, 38714.5, 5, 84, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (85, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBN 80XL02UGRK]', 1289363, 38714.5, 8, 85, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (86, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBN 80XL03K7RK]', 1260935, 38500, 6, 86, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (87, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBN 80XL03K7RK]', 1260935, 38500, 11, 87, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (88, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBN 80XL02XDRK]', 1233819, 45089, 4, 88, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (89, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBN 80XL02XDRK]', 1233819, 45089, 15, 89, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (90, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKB 80XL03W6RA]', 1292537, 908688, 6, 90, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (91, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKB 80XL03W3RA]', 1293811, 980034, 2, 91, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (92, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKB 80XL03W4RA]', 1293812, 980034, 11, 92, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (93, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKB 80XL03WFRA]', 1293813, 980034, 11, 93, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (94, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBN 80XL0053RK]', 1157506, 42009, 8, 94, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (95, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBN 80XL0053RK]', 1157506, 42009, 2, 95, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (96, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBN 80XL01GPRK]', 1233781, 38489, 4, 96, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (97, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBN 80XL01GPRK]', 1233781, 38489, 14, 97, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (98, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBN 80XL024HRK]', 1289338, 38489, 14, 98, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (99, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBN 80XL024HRK]', 1289338, 38489, 11, 99, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (100, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBN 80XL03KGRK]', 1304025, 42870.3, 10, 100, N'*некое описание продукта*')
GO
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (101, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBN 80XL03KGRK]', 1304025, 42870.3, 8, 101, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (102, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBN 80XL0054RK]', 1174025, 43065, 10, 102, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (103, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBN 80XL0054RK]', 1174025, 43065, 15, 103, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (104, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKB 80YE009ERK]', 1174029, 35860, 13, 104, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (105, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKB 80YE009ERK]', 1174029, 35860, 4, 105, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (106, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKB 80YE009WRK]', 1215816, 35901.8, 14, 106, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (107, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKB 80YE009WRK]', 1215816, 35901.8, 6, 107, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (108, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBA 80YE0005RK]', 1321402, 38159, 10, 108, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (109, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBA 80YE0005RK]', 1321402, 38159, 15, 109, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (110, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBN 80XL03PSRK]', 1303989, 46079, 5, 110, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (111, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBN 80XL03PSRK]', 1303989, 46079, 15, 111, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (112, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBN 80XL03PRRK]', 1289327, 42449, 5, 112, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (113, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKBN 80XL03PRRK]', 1289327, 42449, 11, 113, N'*некое описание продукта*')
INSERT [dbo].[Products] ([ID], [Name], [Article], [Cost], [Count], [Image], [Description]) VALUES (114, N'Ноутбук Lenovo Ideapad 320 15 [320-15IKB 80YE007HRK]', 1321366, 45199, 15, 114, N'*некое описание продукта*')
GO
INSERT [dbo].[Users] ([ID], [Login], [Password], [Role], [Image]) VALUES (1, N'Login', N'Password', 1, 1)
INSERT [dbo].[Users] ([ID], [Login], [Password], [Role], [Image]) VALUES (2, N'admin', N'admin', 2, 2)
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Description]  DEFAULT ('no_image.png') FOR [Description]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Images] FOREIGN KEY([Image])
REFERENCES [dbo].[Images] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Images]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Images] FOREIGN KEY([Image])
REFERENCES [dbo].[Images] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Images]
GO
USE [master]
GO
ALTER DATABASE [EShopDB] SET  READ_WRITE 
GO
