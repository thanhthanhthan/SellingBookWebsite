USE [master]
GO
/****** Object:  Database [BookShop]    Script Date: 3/6/2019 9:08:21 PM ******/
CREATE DATABASE [BookShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.THANHNGOSQL\MSSQL\DATA\BookShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.THANHNGOSQL\MSSQL\DATA\BookShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BookShop] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookShop] SET  MULTI_USER 
GO
ALTER DATABASE [BookShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BookShop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookShop', N'ON'
GO
ALTER DATABASE [BookShop] SET QUERY_STORE = OFF
GO
USE [BookShop]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 3/6/2019 9:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[BookName] [nvarchar](50) NULL,
	[Author] [nvarchar](50) NULL,
	[Publisher] [nvarchar](50) NULL,
	[PublishDate] [datetime] NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
	[Image] [nvarchar](500) NULL,
	[Description] [nvarchar](max) NULL,
	[CategoryId] [int] NOT NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 3/6/2019 9:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[BookID] [int] NULL,
	[BookName] [nvarchar](50) NOT NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
	[DDH_ID] [int] NULL,
 CONSTRAINT [PK_Cart_1] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/6/2019 9:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/6/2019 9:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CusUserName] [nvarchar](50) NOT NULL,
	[CusPass] [nvarchar](50) NULL,
	[CusName] [nvarchar](50) NULL,
	[DateOfBirth] [datetime] NULL,
	[Phone] [nvarchar](10) NULL,
	[Address] [nvarchar](50) NULL,
	[Role] [nvarchar](50) NULL,
	[Gender] [bit] NULL,
	[Image] [nvarchar](500) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CusUserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonDatHang]    Script Date: 3/6/2019 9:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[DDH_ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NULL,
	[isDelivered] [bit] NULL,
	[DeliverDate] [datetime] NULL,
	[isPaid] [bit] NULL,
	[CusUsername] [nvarchar](50) NULL,
	[isCanceled] [bit] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_DonDatHang] PRIMARY KEY CLUSTERED 
(
	[DDH_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 3/6/2019 9:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (14, N'Ký Hiệu Và Liên Ký Hiệu', N'Nguyễn Trãi', N'Kim Đồng', CAST(N'2019-10-19T00:00:00.000' AS DateTime), 100000, 20, N'KYHieuVaLienKiHieu.jpg', N'Ký hiệu tồn tại như một sự tổng hòa các mối quan hệ văn hóa. Không thể có bất cứ một ký hiệu nào nằm ngoài văn hóa. Theo đó, ký hiệu không hề và không thể tồn tại như một thực thể độc lập tuyệt đối, mang một nghĩa tự trị đơn nhất. Ngay từ lúc ra đời, ký hiệu luôn được tri nhận trong các mối quan hệ văn hóa nhất định. Một ký hiệu, vì thế đã trở thành một tổ hợp ký hiệu trước và sau nó. Vậy nên, nó luôn là một liên ký hiệu.

Từ phát hiện này, chúng tôi tiếp cận ký hiệu ngôn từ ở chiều sâu của liên ký hiệu, đúng hơn là từ ký hiệu học hậu hiện đại. Khác với lẽ thường, thay vì lập mô hình để khu biệt và nhận dạng nghĩa của ký hiệu theo các cách nhà cấu trúc luận, chúng tôi đi giải cấu trúc ký hiệu để tìm bản chất của ký hiệu ngôn từ, tìm nội hàm của nó trong triết học, trong cổ mẫu, trong vô thức, trong quan niệm trò chơi hành dụng,… tóm lại là từ các mối liên kết nghĩa đa tầng bậc của chúng.

Sách này sử dụng lại, có sửa chữa cơ bản, một số chương đã in trong cuốn Ký hiệu học văn học, nhưng được sắp xếp để làm nổi bật lên tính liên ký hiệu - một đóng góp mang tính cá biệt của chúng tôi cho ngành ký hiệu học, vốn đã được khảo sát và ứng dụng rộng trên toàn thế giới.

Nghiên cứu ký hiệu đến nay đã đạt được những thành tựu đáng kể. Những tên tuổi như Charles Sanders Peirce, Ferdinand de  Saussure,  Roland  Barthes,  Jacques  Derrida,…  đã  quá quen thuộc với giới học thuật Việt Nam. Hướng nghiên cứu này trên thế giới ắt hẳn đã có cả triệu công trình lớn nhỏ. Có thể kể các cuốn tiêu biểu: Claude Lévi–Strauss với Nhân học cấu trúc (Structural Anthropology, 1968); Jacques Lacan với Ngôn ngữ của cái tôi: chức năng của ngôn ngữ trong Phân tâm học (The Language of the Self: The Function of Language in Psychoanalysis, 1968); Terence Hawkes với Chủ nghĩa cấu trúc và ký hiệu học (Structuralism and Semiotics, 1977); Jonathan Culler với Truy tìm ký hiệu (The Pursuit of Signs, 1981); Robert Scholes với Ký hiệu học và diễn giải (Semiotics and Interpretation, 1982); Thomas A. Sebeok (chủ biên), Ký hiệu chuyện kể: một khảo sát ký hiệu học (The Tell– Tale Sign: A Survey of Semiotics, 1975); Robert E. Innis (chủ biên), Ký hiệu học: Hợp tuyển nhập môn (Semiotics: An Introductory Anthology, 1985)…', 1, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (15, N'Phiêu Lưu Chữ', N'Lương Thế Vinh', N'Tuổi Trẻ', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 200000, 20, N'PhieuLuuChu.jpg', N'Ký hiệu tồn tại như một sự tổng hòa các mối quan hệ văn hóa. Không thể có bất cứ một ký hiệu nào nằm ngoài văn hóa. Theo đó, ký hiệu không hề và không thể tồn tại như một thực thể độc lập tuyệt đối, mang một nghĩa tự trị đơn nhất. Ngay từ lúc ra đời, ký hiệu luôn được tri nhận trong các mối quan hệ văn hóa nhất định. Một ký hiệu, vì thế đã trở thành một tổ hợp ký hiệu trước và sau nó. Vậy nên, nó luôn là một liên ký hiệu.

Từ phát hiện này, chúng tôi tiếp cận ký hiệu ngôn từ ở chiều sâu của liên ký hiệu, đúng hơn là từ ký hiệu học hậu hiện đại. Khác với lẽ thường, thay vì lập mô hình để khu biệt và nhận dạng nghĩa của ký hiệu theo các cách nhà cấu trúc luận, chúng tôi đi giải cấu trúc ký hiệu để tìm bản chất của ký hiệu ngôn từ, tìm nội hàm của nó trong triết học, trong cổ mẫu, trong vô thức, trong quan niệm trò chơi hành dụng,… tóm lại là từ các mối liên kết nghĩa đa tầng bậc của chúng.

Sách này sử dụng lại, có sửa chữa cơ bản, một số chương đã in trong cuốn Ký hiệu học văn học, nhưng được sắp xếp để làm nổi bật lên tính liên ký hiệu - một đóng góp mang tính cá biệt của chúng tôi cho ngành ký hiệu học, vốn đã được khảo sát và ứng dụng rộng trên toàn thế giới.

Nghiên cứu ký hiệu đến nay đã đạt được những thành tựu đáng kể. Những tên tuổi như Charles Sanders Peirce, Ferdinand de  Saussure,  Roland  Barthes,  Jacques  Derrida,…  đã  quá quen thuộc với giới học thuật Việt Nam. Hướng nghiên cứu này trên thế giới ắt hẳn đã có cả triệu công trình lớn nhỏ. Có thể kể các cuốn tiêu biểu: Claude Lévi–Strauss với Nhân học cấu trúc (Structural Anthropology, 1968); Jacques Lacan với Ngôn ngữ của cái tôi: chức năng của ngôn ngữ trong Phân tâm học (The Language of the Self: The Function of Language in Psychoanalysis, 1968); Terence Hawkes với Chủ nghĩa cấu trúc và ký hiệu học (Structuralism and Semiotics, 1977); Jonathan Culler với Truy tìm ký hiệu (The Pursuit of Signs, 1981); Robert Scholes với Ký hiệu học và diễn giải (Semiotics and Interpretation, 1982); Thomas A. Sebeok (chủ biên), Ký hiệu chuyện kể: một khảo sát ký hiệu học (The Tell– Tale Sign: A Survey of Semiotics, 1975); Robert E. Innis (chủ biên), Ký hiệu học: Hợp tuyển nhập môn (Semiotics: An Introductory Anthology, 1985)…', 1, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (16, N'Song hành Và Đối THoại', N'Nguyễn Du', N'Phương Nam', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 320000, 20, N'SongHanhVaDoiThoai.jpg', N'Ký hiệu tồn tại như một sự tổng hòa các mối quan hệ văn hóa. Không thể có bất cứ một ký hiệu nào nằm ngoài văn hóa. Theo đó, ký hiệu không hề và không thể tồn tại như một thực thể độc lập tuyệt đối, mang một nghĩa tự trị đơn nhất. Ngay từ lúc ra đời, ký hiệu luôn được tri nhận trong các mối quan hệ văn hóa nhất định. Một ký hiệu, vì thế đã trở thành một tổ hợp ký hiệu trước và sau nó. Vậy nên, nó luôn là một liên ký hiệu.

Từ phát hiện này, chúng tôi tiếp cận ký hiệu ngôn từ ở chiều sâu của liên ký hiệu, đúng hơn là từ ký hiệu học hậu hiện đại. Khác với lẽ thường, thay vì lập mô hình để khu biệt và nhận dạng nghĩa của ký hiệu theo các cách nhà cấu trúc luận, chúng tôi đi giải cấu trúc ký hiệu để tìm bản chất của ký hiệu ngôn từ, tìm nội hàm của nó trong triết học, trong cổ mẫu, trong vô thức, trong quan niệm trò chơi hành dụng,… tóm lại là từ các mối liên kết nghĩa đa tầng bậc của chúng.

Sách này sử dụng lại, có sửa chữa cơ bản, một số chương đã in trong cuốn Ký hiệu học văn học, nhưng được sắp xếp để làm nổi bật lên tính liên ký hiệu - một đóng góp mang tính cá biệt của chúng tôi cho ngành ký hiệu học, vốn đã được khảo sát và ứng dụng rộng trên toàn thế giới.

Nghiên cứu ký hiệu đến nay đã đạt được những thành tựu đáng kể. Những tên tuổi như Charles Sanders Peirce, Ferdinand de  Saussure,  Roland  Barthes,  Jacques  Derrida,…  đã  quá quen thuộc với giới học thuật Việt Nam. Hướng nghiên cứu này trên thế giới ắt hẳn đã có cả triệu công trình lớn nhỏ. Có thể kể các cuốn tiêu biểu: Claude Lévi–Strauss với Nhân học cấu trúc (Structural Anthropology, 1968); Jacques Lacan với Ngôn ngữ của cái tôi: chức năng của ngôn ngữ trong Phân tâm học (The Language of the Self: The Function of Language in Psychoanalysis, 1968); Terence Hawkes với Chủ nghĩa cấu trúc và ký hiệu học (Structuralism and Semiotics, 1977); Jonathan Culler với Truy tìm ký hiệu (The Pursuit of Signs, 1981); Robert Scholes với Ký hiệu học và diễn giải (Semiotics and Interpretation, 1982); Thomas A. Sebeok (chủ biên), Ký hiệu chuyện kể: một khảo sát ký hiệu học (The Tell– Tale Sign: A Survey of Semiotics, 1975); Robert E. Innis (chủ biên), Ký hiệu học: Hợp tuyển nhập môn (Semiotics: An Introductory Anthology, 1985)…', 1, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (17, N'Sống Trong Thời Viễn Tưởng', N'Phan Bội Châu', N'Giáo Dục', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 390000, 20, N'SongTrongThoiVienTuong.jpg', N'Ký hiệu tồn tại như một sự tổng hòa các mối quan hệ văn hóa. Không thể có bất cứ một ký hiệu nào nằm ngoài văn hóa. Theo đó, ký hiệu không hề và không thể tồn tại như một thực thể độc lập tuyệt đối, mang một nghĩa tự trị đơn nhất. Ngay từ lúc ra đời, ký hiệu luôn được tri nhận trong các mối quan hệ văn hóa nhất định. Một ký hiệu, vì thế đã trở thành một tổ hợp ký hiệu trước và sau nó. Vậy nên, nó luôn là một liên ký hiệu.

Từ phát hiện này, chúng tôi tiếp cận ký hiệu ngôn từ ở chiều sâu của liên ký hiệu, đúng hơn là từ ký hiệu học hậu hiện đại. Khác với lẽ thường, thay vì lập mô hình để khu biệt và nhận dạng nghĩa của ký hiệu theo các cách nhà cấu trúc luận, chúng tôi đi giải cấu trúc ký hiệu để tìm bản chất của ký hiệu ngôn từ, tìm nội hàm của nó trong triết học, trong cổ mẫu, trong vô thức, trong quan niệm trò chơi hành dụng,… tóm lại là từ các mối liên kết nghĩa đa tầng bậc của chúng.

Sách này sử dụng lại, có sửa chữa cơ bản, một số chương đã in trong cuốn Ký hiệu học văn học, nhưng được sắp xếp để làm nổi bật lên tính liên ký hiệu - một đóng góp mang tính cá biệt của chúng tôi cho ngành ký hiệu học, vốn đã được khảo sát và ứng dụng rộng trên toàn thế giới.

Nghiên cứu ký hiệu đến nay đã đạt được những thành tựu đáng kể. Những tên tuổi như Charles Sanders Peirce, Ferdinand de  Saussure,  Roland  Barthes,  Jacques  Derrida,…  đã  quá quen thuộc với giới học thuật Việt Nam. Hướng nghiên cứu này trên thế giới ắt hẳn đã có cả triệu công trình lớn nhỏ. Có thể kể các cuốn tiêu biểu: Claude Lévi–Strauss với Nhân học cấu trúc (Structural Anthropology, 1968); Jacques Lacan với Ngôn ngữ của cái tôi: chức năng của ngôn ngữ trong Phân tâm học (The Language of the Self: The Function of Language in Psychoanalysis, 1968); Terence Hawkes với Chủ nghĩa cấu trúc và ký hiệu học (Structuralism and Semiotics, 1977); Jonathan Culler với Truy tìm ký hiệu (The Pursuit of Signs, 1981); Robert Scholes với Ký hiệu học và diễn giải (Semiotics and Interpretation, 1982); Thomas A. Sebeok (chủ biên), Ký hiệu chuyện kể: một khảo sát ký hiệu học (The Tell– Tale Sign: A Survey of Semiotics, 1975); Robert E. Innis (chủ biên), Ký hiệu học: Hợp tuyển nhập môn (Semiotics: An Introductory Anthology, 1985)…', 1, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (18, N'Thế Kỷ XXI Nhìn Về Trương Vĩnh Ký', N'Trương Vĩnh Kí', N'Tuổi Trẻ', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 45000, 20, N'TheKiXXINhinVeTruongVinhKy.jpg', N'Ký hiệu tồn tại như một sự tổng hòa các mối quan hệ văn hóa. Không thể có bất cứ một ký hiệu nào nằm ngoài văn hóa. Theo đó, ký hiệu không hề và không thể tồn tại như một thực thể độc lập tuyệt đối, mang một nghĩa tự trị đơn nhất. Ngay từ lúc ra đời, ký hiệu luôn được tri nhận trong các mối quan hệ văn hóa nhất định. Một ký hiệu, vì thế đã trở thành một tổ hợp ký hiệu trước và sau nó. Vậy nên, nó luôn là một liên ký hiệu.

Từ phát hiện này, chúng tôi tiếp cận ký hiệu ngôn từ ở chiều sâu của liên ký hiệu, đúng hơn là từ ký hiệu học hậu hiện đại. Khác với lẽ thường, thay vì lập mô hình để khu biệt và nhận dạng nghĩa của ký hiệu theo các cách nhà cấu trúc luận, chúng tôi đi giải cấu trúc ký hiệu để tìm bản chất của ký hiệu ngôn từ, tìm nội hàm của nó trong triết học, trong cổ mẫu, trong vô thức, trong quan niệm trò chơi hành dụng,… tóm lại là từ các mối liên kết nghĩa đa tầng bậc của chúng.

Sách này sử dụng lại, có sửa chữa cơ bản, một số chương đã in trong cuốn Ký hiệu học văn học, nhưng được sắp xếp để làm nổi bật lên tính liên ký hiệu - một đóng góp mang tính cá biệt của chúng tôi cho ngành ký hiệu học, vốn đã được khảo sát và ứng dụng rộng trên toàn thế giới.

Nghiên cứu ký hiệu đến nay đã đạt được những thành tựu đáng kể. Những tên tuổi như Charles Sanders Peirce, Ferdinand de  Saussure,  Roland  Barthes,  Jacques  Derrida,…  đã  quá quen thuộc với giới học thuật Việt Nam. Hướng nghiên cứu này trên thế giới ắt hẳn đã có cả triệu công trình lớn nhỏ. Có thể kể các cuốn tiêu biểu: Claude Lévi–Strauss với Nhân học cấu trúc (Structural Anthropology, 1968); Jacques Lacan với Ngôn ngữ của cái tôi: chức năng của ngôn ngữ trong Phân tâm học (The Language of the Self: The Function of Language in Psychoanalysis, 1968); Terence Hawkes với Chủ nghĩa cấu trúc và ký hiệu học (Structuralism and Semiotics, 1977); Jonathan Culler với Truy tìm ký hiệu (The Pursuit of Signs, 1981); Robert Scholes với Ký hiệu học và diễn giải (Semiotics and Interpretation, 1982); Thomas A. Sebeok (chủ biên), Ký hiệu chuyện kể: một khảo sát ký hiệu học (The Tell– Tale Sign: A Survey of Semiotics, 1975); Robert E. Innis (chủ biên), Ký hiệu học: Hợp tuyển nhập môn (Semiotics: An Introductory Anthology, 1985)…', 1, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (19, N'Đại Số 10', N'Cao Bá Quát', N'Phương Đông', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 34500, 20, N'DaiSo10.jpg', N'Ký hiệu tồn tại như một sự tổng hòa các mối quan hệ văn hóa. Không thể có bất cứ một ký hiệu nào nằm ngoài văn hóa. Theo đó, ký hiệu không hề và không thể tồn tại như một thực thể độc lập tuyệt đối, mang một nghĩa tự trị đơn nhất. Ngay từ lúc ra đời, ký hiệu luôn được tri nhận trong các mối quan hệ văn hóa nhất định. Một ký hiệu, vì thế đã trở thành một tổ hợp ký hiệu trước và sau nó. Vậy nên, nó luôn là một liên ký hiệu.

Từ phát hiện này, chúng tôi tiếp cận ký hiệu ngôn từ ở chiều sâu của liên ký hiệu, đúng hơn là từ ký hiệu học hậu hiện đại. Khác với lẽ thường, thay vì lập mô hình để khu biệt và nhận dạng nghĩa của ký hiệu theo các cách nhà cấu trúc luận, chúng tôi đi giải cấu trúc ký hiệu để tìm bản chất của ký hiệu ngôn từ, tìm nội hàm của nó trong triết học, trong cổ mẫu, trong vô thức, trong quan niệm trò chơi hành dụng,… tóm lại là từ các mối liên kết nghĩa đa tầng bậc của chúng.

Sách này sử dụng lại, có sửa chữa cơ bản, một số chương đã in trong cuốn Ký hiệu học văn học, nhưng được sắp xếp để làm nổi bật lên tính liên ký hiệu - một đóng góp mang tính cá biệt của chúng tôi cho ngành ký hiệu học, vốn đã được khảo sát và ứng dụng rộng trên toàn thế giới.

Nghiên cứu ký hiệu đến nay đã đạt được những thành tựu đáng kể. Những tên tuổi như Charles Sanders Peirce, Ferdinand de  Saussure,  Roland  Barthes,  Jacques  Derrida,…  đã  quá quen thuộc với giới học thuật Việt Nam. Hướng nghiên cứu này trên thế giới ắt hẳn đã có cả triệu công trình lớn nhỏ. Có thể kể các cuốn tiêu biểu: Claude Lévi–Strauss với Nhân học cấu trúc (Structural Anthropology, 1968); Jacques Lacan với Ngôn ngữ của cái tôi: chức năng của ngôn ngữ trong Phân tâm học (The Language of the Self: The Function of Language in Psychoanalysis, 1968); Terence Hawkes với Chủ nghĩa cấu trúc và ký hiệu học (Structuralism and Semiotics, 1977); Jonathan Culler với Truy tìm ký hiệu (The Pursuit of Signs, 1981); Robert Scholes với Ký hiệu học và diễn giải (Semiotics and Interpretation, 1982); Thomas A. Sebeok (chủ biên), Ký hiệu chuyện kể: một khảo sát ký hiệu học (The Tell– Tale Sign: A Survey of Semiotics, 1975); Robert E. Innis (chủ biên), Ký hiệu học: Hợp tuyển nhập môn (Semiotics: An Introductory Anthology, 1985)…', 14, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (20, N'Hóa Học 12', N'Tô Hoài', N'Tuổi Trẻ', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 470000, 20, N'hoaHoc12.jpg', N'Ký hiệu tồn tại như một sự tổng hòa các mối quan hệ văn hóa. Không thể có bất cứ một ký hiệu nào nằm ngoài văn hóa. Theo đó, ký hiệu không hề và không thể tồn tại như một thực thể độc lập tuyệt đối, mang một nghĩa tự trị đơn nhất. Ngay từ lúc ra đời, ký hiệu luôn được tri nhận trong các mối quan hệ văn hóa nhất định. Một ký hiệu, vì thế đã trở thành một tổ hợp ký hiệu trước và sau nó. Vậy nên, nó luôn là một liên ký hiệu.

Từ phát hiện này, chúng tôi tiếp cận ký hiệu ngôn từ ở chiều sâu của liên ký hiệu, đúng hơn là từ ký hiệu học hậu hiện đại. Khác với lẽ thường, thay vì lập mô hình để khu biệt và nhận dạng nghĩa của ký hiệu theo các cách nhà cấu trúc luận, chúng tôi đi giải cấu trúc ký hiệu để tìm bản chất của ký hiệu ngôn từ, tìm nội hàm của nó trong triết học, trong cổ mẫu, trong vô thức, trong quan niệm trò chơi hành dụng,… tóm lại là từ các mối liên kết nghĩa đa tầng bậc của chúng.

Sách này sử dụng lại, có sửa chữa cơ bản, một số chương đã in trong cuốn Ký hiệu học văn học, nhưng được sắp xếp để làm nổi bật lên tính liên ký hiệu - một đóng góp mang tính cá biệt của chúng tôi cho ngành ký hiệu học, vốn đã được khảo sát và ứng dụng rộng trên toàn thế giới.

Nghiên cứu ký hiệu đến nay đã đạt được những thành tựu đáng kể. Những tên tuổi như Charles Sanders Peirce, Ferdinand de  Saussure,  Roland  Barthes,  Jacques  Derrida,…  đã  quá quen thuộc với giới học thuật Việt Nam. Hướng nghiên cứu này trên thế giới ắt hẳn đã có cả triệu công trình lớn nhỏ. Có thể kể các cuốn tiêu biểu: Claude Lévi–Strauss với Nhân học cấu trúc (Structural Anthropology, 1968); Jacques Lacan với Ngôn ngữ của cái tôi: chức năng của ngôn ngữ trong Phân tâm học (The Language of the Self: The Function of Language in Psychoanalysis, 1968); Terence Hawkes với Chủ nghĩa cấu trúc và ký hiệu học (Structuralism and Semiotics, 1977); Jonathan Culler với Truy tìm ký hiệu (The Pursuit of Signs, 1981); Robert Scholes với Ký hiệu học và diễn giải (Semiotics and Interpretation, 1982); Thomas A. Sebeok (chủ biên), Ký hiệu chuyện kể: một khảo sát ký hiệu học (The Tell– Tale Sign: A Survey of Semiotics, 1975); Robert E. Innis (chủ biên), Ký hiệu học: Hợp tuyển nhập môn (Semiotics: An Introductory Anthology, 1985)…', 14, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (21, N'Tiếng Việt 1', N'Trằn Đăng Khoa', N'Á Đông', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 54000, 20, N'tiengViet1.jpg', N'Ký hiệu tồn tại như một sự tổng hòa các mối quan hệ văn hóa. Không thể có bất cứ một ký hiệu nào nằm ngoài văn hóa. Theo đó, ký hiệu không hề và không thể tồn tại như một thực thể độc lập tuyệt đối, mang một nghĩa tự trị đơn nhất. Ngay từ lúc ra đời, ký hiệu luôn được tri nhận trong các mối quan hệ văn hóa nhất định. Một ký hiệu, vì thế đã trở thành một tổ hợp ký hiệu trước và sau nó. Vậy nên, nó luôn là một liên ký hiệu.

Từ phát hiện này, chúng tôi tiếp cận ký hiệu ngôn từ ở chiều sâu của liên ký hiệu, đúng hơn là từ ký hiệu học hậu hiện đại. Khác với lẽ thường, thay vì lập mô hình để khu biệt và nhận dạng nghĩa của ký hiệu theo các cách nhà cấu trúc luận, chúng tôi đi giải cấu trúc ký hiệu để tìm bản chất của ký hiệu ngôn từ, tìm nội hàm của nó trong triết học, trong cổ mẫu, trong vô thức, trong quan niệm trò chơi hành dụng,… tóm lại là từ các mối liên kết nghĩa đa tầng bậc của chúng.

Sách này sử dụng lại, có sửa chữa cơ bản, một số chương đã in trong cuốn Ký hiệu học văn học, nhưng được sắp xếp để làm nổi bật lên tính liên ký hiệu - một đóng góp mang tính cá biệt của chúng tôi cho ngành ký hiệu học, vốn đã được khảo sát và ứng dụng rộng trên toàn thế giới.

Nghiên cứu ký hiệu đến nay đã đạt được những thành tựu đáng kể. Những tên tuổi như Charles Sanders Peirce, Ferdinand de  Saussure,  Roland  Barthes,  Jacques  Derrida,…  đã  quá quen thuộc với giới học thuật Việt Nam. Hướng nghiên cứu này trên thế giới ắt hẳn đã có cả triệu công trình lớn nhỏ. Có thể kể các cuốn tiêu biểu: Claude Lévi–Strauss với Nhân học cấu trúc (Structural Anthropology, 1968); Jacques Lacan với Ngôn ngữ của cái tôi: chức năng của ngôn ngữ trong Phân tâm học (The Language of the Self: The Function of Language in Psychoanalysis, 1968); Terence Hawkes với Chủ nghĩa cấu trúc và ký hiệu học (Structuralism and Semiotics, 1977); Jonathan Culler với Truy tìm ký hiệu (The Pursuit of Signs, 1981); Robert Scholes với Ký hiệu học và diễn giải (Semiotics and Interpretation, 1982); Thomas A. Sebeok (chủ biên), Ký hiệu chuyện kể: một khảo sát ký hiệu học (The Tell– Tale Sign: A Survey of Semiotics, 1975); Robert E. Innis (chủ biên), Ký hiệu học: Hợp tuyển nhập môn (Semiotics: An Introductory Anthology, 1985)…', 14, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (22, N'Toán Lớp 1', N'Ma Văn Kháng', N'Giáo Dục', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 67000, 20, N'toan1.jpg', N'Ký hiệu tồn tại như một sự tổng hòa các mối quan hệ văn hóa. Không thể có bất cứ một ký hiệu nào nằm ngoài văn hóa. Theo đó, ký hiệu không hề và không thể tồn tại như một thực thể độc lập tuyệt đối, mang một nghĩa tự trị đơn nhất. Ngay từ lúc ra đời, ký hiệu luôn được tri nhận trong các mối quan hệ văn hóa nhất định. Một ký hiệu, vì thế đã trở thành một tổ hợp ký hiệu trước và sau nó. Vậy nên, nó luôn là một liên ký hiệu.

Từ phát hiện này, chúng tôi tiếp cận ký hiệu ngôn từ ở chiều sâu của liên ký hiệu, đúng hơn là từ ký hiệu học hậu hiện đại. Khác với lẽ thường, thay vì lập mô hình để khu biệt và nhận dạng nghĩa của ký hiệu theo các cách nhà cấu trúc luận, chúng tôi đi giải cấu trúc ký hiệu để tìm bản chất của ký hiệu ngôn từ, tìm nội hàm của nó trong triết học, trong cổ mẫu, trong vô thức, trong quan niệm trò chơi hành dụng,… tóm lại là từ các mối liên kết nghĩa đa tầng bậc của chúng.

Sách này sử dụng lại, có sửa chữa cơ bản, một số chương đã in trong cuốn Ký hiệu học văn học, nhưng được sắp xếp để làm nổi bật lên tính liên ký hiệu - một đóng góp mang tính cá biệt của chúng tôi cho ngành ký hiệu học, vốn đã được khảo sát và ứng dụng rộng trên toàn thế giới.

Nghiên cứu ký hiệu đến nay đã đạt được những thành tựu đáng kể. Những tên tuổi như Charles Sanders Peirce, Ferdinand de  Saussure,  Roland  Barthes,  Jacques  Derrida,…  đã  quá quen thuộc với giới học thuật Việt Nam. Hướng nghiên cứu này trên thế giới ắt hẳn đã có cả triệu công trình lớn nhỏ. Có thể kể các cuốn tiêu biểu: Claude Lévi–Strauss với Nhân học cấu trúc (Structural Anthropology, 1968); Jacques Lacan với Ngôn ngữ của cái tôi: chức năng của ngôn ngữ trong Phân tâm học (The Language of the Self: The Function of Language in Psychoanalysis, 1968); Terence Hawkes với Chủ nghĩa cấu trúc và ký hiệu học (Structuralism and Semiotics, 1977); Jonathan Culler với Truy tìm ký hiệu (The Pursuit of Signs, 1981); Robert Scholes với Ký hiệu học và diễn giải (Semiotics and Interpretation, 1982); Thomas A. Sebeok (chủ biên), Ký hiệu chuyện kể: một khảo sát ký hiệu học (The Tell– Tale Sign: A Survey of Semiotics, 1975); Robert E. Innis (chủ biên), Ký hiệu học: Hợp tuyển nhập môn (Semiotics: An Introductory Anthology, 1985)…', 14, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (67, N'Ban Công Nhà Nọ Có Hạnh Phúc Vừa Rơi ', N'Minh Anh', N'Kim Đồng', CAST(N'1992-02-02T00:00:00.000' AS DateTime), 120000, 20, N'banCongNhaNoCoHpVuaRoi.jpg', N'Ký hiệu tồn tại như một sự tổng hòa các mối quan hệ văn hóa. Không thể có bất cứ một ký hiệu nào nằm ngoài văn hóa. Theo đó, ký hiệu không hề và không thể tồn tại như một thực thể độc lập tuyệt đối, mang một nghĩa tự trị đơn nhất. Ngay từ lúc ra đời, ký hiệu luôn được tri nhận trong các mối quan hệ văn hóa nhất định. Một ký hiệu, vì thế đã trở thành một tổ hợp ký hiệu trước và sau nó. Vậy nên, nó luôn là một liên ký hiệu.

Từ phát hiện này, chúng tôi tiếp cận ký hiệu ngôn từ ở chiều sâu của liên ký hiệu, đúng hơn là từ ký hiệu học hậu hiện đại. Khác với lẽ thường, thay vì lập mô hình để khu biệt và nhận dạng nghĩa của ký hiệu theo các cách nhà cấu trúc luận, chúng tôi đi giải cấu trúc ký hiệu để tìm bản chất của ký hiệu ngôn từ, tìm nội hàm của nó trong triết học, trong cổ mẫu, trong vô thức, trong quan niệm trò chơi hành dụng,… tóm lại là từ các mối liên kết nghĩa đa tầng bậc của chúng.

Sách này sử dụng lại, có sửa chữa cơ bản, một số chương đã in trong cuốn Ký hiệu học văn học, nhưng được sắp xếp để làm nổi bật lên tính liên ký hiệu - một đóng góp mang tính cá biệt của chúng tôi cho ngành ký hiệu học, vốn đã được khảo sát và ứng dụng rộng trên toàn thế giới.

Nghiên cứu ký hiệu đến nay đã đạt được những thành tựu đáng kể. Những tên tuổi như Charles Sanders Peirce, Ferdinand de  Saussure,  Roland  Barthes,  Jacques  Derrida,…  đã  quá quen thuộc với giới học thuật Việt Nam. Hướng nghiên cứu này trên thế giới ắt hẳn đã có cả triệu công trình lớn nhỏ. Có thể kể các cuốn tiêu biểu: Claude Lévi–Strauss với Nhân học cấu trúc (Structural Anthropology, 1968); Jacques Lacan với Ngôn ngữ của cái tôi: chức năng của ngôn ngữ trong Phân tâm học (The Language of the Self: The Function of Language in Psychoanalysis, 1968); Terence Hawkes với Chủ nghĩa cấu trúc và ký hiệu học (Structuralism and Semiotics, 1977); Jonathan Culler với Truy tìm ký hiệu (The Pursuit of Signs, 1981); Robert Scholes với Ký hiệu học và diễn giải (Semiotics and Interpretation, 1982); Thomas A. Sebeok (chủ biên), Ký hiệu chuyện kể: một khảo sát ký hiệu học (The Tell– Tale Sign: A Survey of Semiotics, 1975); Robert E. Innis (chủ biên), Ký hiệu học: Hợp tuyển nhập môn (Semiotics: An Introductory Anthology, 1985)…', 1, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (68, N'Chuyện Đàn Bà ', N'Minh ANh', N'Kim Đồng', CAST(N'2000-02-02T00:00:00.000' AS DateTime), 12000, 20, N'chuyenDanBa.jpg', N'Ký hiệu tồn tại như một sự tổng hòa các mối quan hệ văn hóa. Không thể có bất cứ một ký hiệu nào nằm ngoài văn hóa. Theo đó, ký hiệu không hề và không thể tồn tại như một thực thể độc lập tuyệt đối, mang một nghĩa tự trị đơn nhất. Ngay từ lúc ra đời, ký hiệu luôn được tri nhận trong các mối quan hệ văn hóa nhất định. Một ký hiệu, vì thế đã trở thành một tổ hợp ký hiệu trước và sau nó. Vậy nên, nó luôn là một liên ký hiệu.

Từ phát hiện này, chúng tôi tiếp cận ký hiệu ngôn từ ở chiều sâu của liên ký hiệu, đúng hơn là từ ký hiệu học hậu hiện đại. Khác với lẽ thường, thay vì lập mô hình để khu biệt và nhận dạng nghĩa của ký hiệu theo các cách nhà cấu trúc luận, chúng tôi đi giải cấu trúc ký hiệu để tìm bản chất của ký hiệu ngôn từ, tìm nội hàm của nó trong triết học, trong cổ mẫu, trong vô thức, trong quan niệm trò chơi hành dụng,… tóm lại là từ các mối liên kết nghĩa đa tầng bậc của chúng.

Sách này sử dụng lại, có sửa chữa cơ bản, một số chương đã in trong cuốn Ký hiệu học văn học, nhưng được sắp xếp để làm nổi bật lên tính liên ký hiệu - một đóng góp mang tính cá biệt của chúng tôi cho ngành ký hiệu học, vốn đã được khảo sát và ứng dụng rộng trên toàn thế giới.

Nghiên cứu ký hiệu đến nay đã đạt được những thành tựu đáng kể. Những tên tuổi như Charles Sanders Peirce, Ferdinand de  Saussure,  Roland  Barthes,  Jacques  Derrida,…  đã  quá quen thuộc với giới học thuật Việt Nam. Hướng nghiên cứu này trên thế giới ắt hẳn đã có cả triệu công trình lớn nhỏ. Có thể kể các cuốn tiêu biểu: Claude Lévi–Strauss với Nhân học cấu trúc (Structural Anthropology, 1968); Jacques Lacan với Ngôn ngữ của cái tôi: chức năng của ngôn ngữ trong Phân tâm học (The Language of the Self: The Function of Language in Psychoanalysis, 1968); Terence Hawkes với Chủ nghĩa cấu trúc và ký hiệu học (Structuralism and Semiotics, 1977); Jonathan Culler với Truy tìm ký hiệu (The Pursuit of Signs, 1981); Robert Scholes với Ký hiệu học và diễn giải (Semiotics and Interpretation, 1982); Thomas A. Sebeok (chủ biên), Ký hiệu chuyện kể: một khảo sát ký hiệu học (The Tell– Tale Sign: A Survey of Semiotics, 1975); Robert E. Innis (chủ biên), Ký hiệu học: Hợp tuyển nhập môn (Semiotics: An Introductory Anthology, 1985)…', 1, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (70, N'Không Khóc Ở Seoul', N'Vinh DK', N'Tuổi Trẻ', CAST(N'2011-02-01T00:00:00.000' AS DateTime), 32000, 20, N'KhongKhocOSeoul.jpg', N'Ký hiệu tồn tại như một sự tổng hòa các mối quan hệ văn hóa. Không thể có bất cứ một ký hiệu nào nằm ngoài văn hóa. Theo đó, ký hiệu không hề và không thể tồn tại như một thực thể độc lập tuyệt đối, mang một nghĩa tự trị đơn nhất. Ngay từ lúc ra đời, ký hiệu luôn được tri nhận trong các mối quan hệ văn hóa nhất định. Một ký hiệu, vì thế đã trở thành một tổ hợp ký hiệu trước và sau nó. Vậy nên, nó luôn là một liên ký hiệu.

Từ phát hiện này, chúng tôi tiếp cận ký hiệu ngôn từ ở chiều sâu của liên ký hiệu, đúng hơn là từ ký hiệu học hậu hiện đại. Khác với lẽ thường, thay vì lập mô hình để khu biệt và nhận dạng nghĩa của ký hiệu theo các cách nhà cấu trúc luận, chúng tôi đi giải cấu trúc ký hiệu để tìm bản chất của ký hiệu ngôn từ, tìm nội hàm của nó trong triết học, trong cổ mẫu, trong vô thức, trong quan niệm trò chơi hành dụng,… tóm lại là từ các mối liên kết nghĩa đa tầng bậc của chúng.

Sách này sử dụng lại, có sửa chữa cơ bản, một số chương đã in trong cuốn Ký hiệu học văn học, nhưng được sắp xếp để làm nổi bật lên tính liên ký hiệu - một đóng góp mang tính cá biệt của chúng tôi cho ngành ký hiệu học, vốn đã được khảo sát và ứng dụng rộng trên toàn thế giới.

Nghiên cứu ký hiệu đến nay đã đạt được những thành tựu đáng kể. Những tên tuổi như Charles Sanders Peirce, Ferdinand de  Saussure,  Roland  Barthes,  Jacques  Derrida,…  đã  quá quen thuộc với giới học thuật Việt Nam. Hướng nghiên cứu này trên thế giới ắt hẳn đã có cả triệu công trình lớn nhỏ. Có thể kể các cuốn tiêu biểu: Claude Lévi–Strauss với Nhân học cấu trúc (Structural Anthropology, 1968); Jacques Lacan với Ngôn ngữ của cái tôi: chức năng của ngôn ngữ trong Phân tâm học (The Language of the Self: The Function of Language in Psychoanalysis, 1968); Terence Hawkes với Chủ nghĩa cấu trúc và ký hiệu học (Structuralism and Semiotics, 1977); Jonathan Culler với Truy tìm ký hiệu (The Pursuit of Signs, 1981); Robert Scholes với Ký hiệu học và diễn giải (Semiotics and Interpretation, 1982); Thomas A. Sebeok (chủ biên), Ký hiệu chuyện kể: một khảo sát ký hiệu học (The Tell– Tale Sign: A Survey of Semiotics, 1975); Robert E. Innis (chủ biên), Ký hiệu học: Hợp tuyển nhập môn (Semiotics: An Introductory Anthology, 1985)…', 1, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (71, N'Chuyện Người Tây Ở Xứ Ta', N'Vinh Manh', N'Thiếu Nhi', CAST(N'2019-02-03T00:00:00.000' AS DateTime), 450000, 20, N'chuyenNguoiTayOXuTa.jpg', N'Ký hiệu tồn tại như một sự tổng hòa các mối quan hệ văn hóa. Không thể có bất cứ một ký hiệu nào nằm ngoài văn hóa. Theo đó, ký hiệu không hề và không thể tồn tại như một thực thể độc lập tuyệt đối, mang một nghĩa tự trị đơn nhất. Ngay từ lúc ra đời, ký hiệu luôn được tri nhận trong các mối quan hệ văn hóa nhất định. Một ký hiệu, vì thế đã trở thành một tổ hợp ký hiệu trước và sau nó. Vậy nên, nó luôn là một liên ký hiệu.

Từ phát hiện này, chúng tôi tiếp cận ký hiệu ngôn từ ở chiều sâu của liên ký hiệu, đúng hơn là từ ký hiệu học hậu hiện đại. Khác với lẽ thường, thay vì lập mô hình để khu biệt và nhận dạng nghĩa của ký hiệu theo các cách nhà cấu trúc luận, chúng tôi đi giải cấu trúc ký hiệu để tìm bản chất của ký hiệu ngôn từ, tìm nội hàm của nó trong triết học, trong cổ mẫu, trong vô thức, trong quan niệm trò chơi hành dụng,… tóm lại là từ các mối liên kết nghĩa đa tầng bậc của chúng.

Sách này sử dụng lại, có sửa chữa cơ bản, một số chương đã in trong cuốn Ký hiệu học văn học, nhưng được sắp xếp để làm nổi bật lên tính liên ký hiệu - một đóng góp mang tính cá biệt của chúng tôi cho ngành ký hiệu học, vốn đã được khảo sát và ứng dụng rộng trên toàn thế giới.

Nghiên cứu ký hiệu đến nay đã đạt được những thành tựu đáng kể. Những tên tuổi như Charles Sanders Peirce, Ferdinand de  Saussure,  Roland  Barthes,  Jacques  Derrida,…  đã  quá quen thuộc với giới học thuật Việt Nam. Hướng nghiên cứu này trên thế giới ắt hẳn đã có cả triệu công trình lớn nhỏ. Có thể kể các cuốn tiêu biểu: Claude Lévi–Strauss với Nhân học cấu trúc (Structural Anthropology, 1968); Jacques Lacan với Ngôn ngữ của cái tôi: chức năng của ngôn ngữ trong Phân tâm học (The Language of the Self: The Function of Language in Psychoanalysis, 1968); Terence Hawkes với Chủ nghĩa cấu trúc và ký hiệu học (Structuralism and Semiotics, 1977); Jonathan Culler với Truy tìm ký hiệu (The Pursuit of Signs, 1981); Robert Scholes với Ký hiệu học và diễn giải (Semiotics and Interpretation, 1982); Thomas A. Sebeok (chủ biên), Ký hiệu chuyện kể: một khảo sát ký hiệu học (The Tell– Tale Sign: A Survey of Semiotics, 1975); Robert E. Innis (chủ biên), Ký hiệu học: Hợp tuyển nhập môn (Semiotics: An Introductory Anthology, 1985)…', 1, 0)
SET IDENTITY_INSERT [dbo].[Book] OFF
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([CartID], [BookID], [BookName], [Quantity], [Price], [DDH_ID]) VALUES (33, 15, N'Phiêu Lưu Chữ', 2, 200000, 27)
INSERT [dbo].[Cart] ([CartID], [BookID], [BookName], [Quantity], [Price], [DDH_ID]) VALUES (34, 16, N'Song hành Và Đối THoại', 10, 320000, 27)
INSERT [dbo].[Cart] ([CartID], [BookID], [BookName], [Quantity], [Price], [DDH_ID]) VALUES (35, 17, N'Sống Trong Thời Viễn Tưởng', 1, 390000, 27)
INSERT [dbo].[Cart] ([CartID], [BookID], [BookName], [Quantity], [Price], [DDH_ID]) VALUES (36, 15, N'Phiêu Lưu Chữ', 18, 200000, 28)
SET IDENTITY_INSERT [dbo].[Cart] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'Văn Học Trong Nước')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'Sinh Học')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'Lịch Sử')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (4, N'Địa Lý')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (5, N'Toán')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (6, N'Tình Yêu')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (7, N'Tiểu thuyết')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (8, N'Văn Học Nước Ngoài')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (9, N'Kinh Tế')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (10, N'Thường Thức Đời Sống')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (11, N'Thiếu Nhi')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (12, N'Tin Học - Ngoại Ngữ')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (13, N'Chuyên Ngành')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (14, N'Giáo Khoa Giáo Trình')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (15, N'Ngoại Văn')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (16, N'Mới Phát Hành')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (17, N'Phát Triển Bản Thân')
SET IDENTITY_INSERT [dbo].[Category] OFF
INSERT [dbo].[Customer] ([CusUserName], [CusPass], [CusName], [DateOfBirth], [Phone], [Address], [Role], [Gender], [Image]) VALUES (N'e', N'e', N'e', CAST(N'1998-10-02T00:00:00.000' AS DateTime), N'45676543', N'tt', N's', 1, N'c')
INSERT [dbo].[Customer] ([CusUserName], [CusPass], [CusName], [DateOfBirth], [Phone], [Address], [Role], [Gender], [Image]) VALUES (N'Thanh', N'1', N'Ngô Thị Thanh', CAST(N'1998-10-02T00:00:00.000' AS DateTime), N'0123456789', N'Huế', N'Admin', 0, N'none')
SET IDENTITY_INSERT [dbo].[DonDatHang] ON 

INSERT [dbo].[DonDatHang] ([DDH_ID], [OrderDate], [isDelivered], [DeliverDate], [isPaid], [CusUsername], [isCanceled], [isDeleted]) VALUES (1, CAST(N'2019-03-02T18:32:45.860' AS DateTime), 0, NULL, 0, NULL, 0, 0)
INSERT [dbo].[DonDatHang] ([DDH_ID], [OrderDate], [isDelivered], [DeliverDate], [isPaid], [CusUsername], [isCanceled], [isDeleted]) VALUES (2, CAST(N'2019-03-05T19:15:32.653' AS DateTime), 0, NULL, 0, NULL, 0, 0)
INSERT [dbo].[DonDatHang] ([DDH_ID], [OrderDate], [isDelivered], [DeliverDate], [isPaid], [CusUsername], [isCanceled], [isDeleted]) VALUES (3, CAST(N'2019-03-05T19:18:56.553' AS DateTime), 0, NULL, 0, NULL, 0, 0)
INSERT [dbo].[DonDatHang] ([DDH_ID], [OrderDate], [isDelivered], [DeliverDate], [isPaid], [CusUsername], [isCanceled], [isDeleted]) VALUES (4, CAST(N'2019-03-05T19:22:17.140' AS DateTime), 0, NULL, 0, NULL, 0, 0)
INSERT [dbo].[DonDatHang] ([DDH_ID], [OrderDate], [isDelivered], [DeliverDate], [isPaid], [CusUsername], [isCanceled], [isDeleted]) VALUES (5, CAST(N'2019-03-05T19:36:01.417' AS DateTime), 0, NULL, 0, NULL, 0, 0)
INSERT [dbo].[DonDatHang] ([DDH_ID], [OrderDate], [isDelivered], [DeliverDate], [isPaid], [CusUsername], [isCanceled], [isDeleted]) VALUES (6, CAST(N'2019-03-05T19:44:51.433' AS DateTime), 0, NULL, 0, NULL, 0, 0)
INSERT [dbo].[DonDatHang] ([DDH_ID], [OrderDate], [isDelivered], [DeliverDate], [isPaid], [CusUsername], [isCanceled], [isDeleted]) VALUES (7, CAST(N'2019-03-05T19:47:19.337' AS DateTime), 0, NULL, 0, NULL, 0, 0)
INSERT [dbo].[DonDatHang] ([DDH_ID], [OrderDate], [isDelivered], [DeliverDate], [isPaid], [CusUsername], [isCanceled], [isDeleted]) VALUES (8, CAST(N'2019-03-05T19:49:21.593' AS DateTime), 0, NULL, 0, NULL, 0, 0)
INSERT [dbo].[DonDatHang] ([DDH_ID], [OrderDate], [isDelivered], [DeliverDate], [isPaid], [CusUsername], [isCanceled], [isDeleted]) VALUES (9, CAST(N'2019-03-05T19:49:57.877' AS DateTime), 0, NULL, 0, NULL, 0, 0)
INSERT [dbo].[DonDatHang] ([DDH_ID], [OrderDate], [isDelivered], [DeliverDate], [isPaid], [CusUsername], [isCanceled], [isDeleted]) VALUES (10, CAST(N'2019-03-05T19:51:50.467' AS DateTime), 0, NULL, 0, NULL, 0, 0)
INSERT [dbo].[DonDatHang] ([DDH_ID], [OrderDate], [isDelivered], [DeliverDate], [isPaid], [CusUsername], [isCanceled], [isDeleted]) VALUES (11, CAST(N'2019-03-05T19:53:37.093' AS DateTime), 0, NULL, 0, NULL, 0, 0)
INSERT [dbo].[DonDatHang] ([DDH_ID], [OrderDate], [isDelivered], [DeliverDate], [isPaid], [CusUsername], [isCanceled], [isDeleted]) VALUES (12, CAST(N'2019-03-05T19:54:42.170' AS DateTime), 0, NULL, 0, NULL, 0, 0)
INSERT [dbo].[DonDatHang] ([DDH_ID], [OrderDate], [isDelivered], [DeliverDate], [isPaid], [CusUsername], [isCanceled], [isDeleted]) VALUES (13, CAST(N'2019-03-05T19:55:56.827' AS DateTime), 0, NULL, 0, NULL, 0, 0)
INSERT [dbo].[DonDatHang] ([DDH_ID], [OrderDate], [isDelivered], [DeliverDate], [isPaid], [CusUsername], [isCanceled], [isDeleted]) VALUES (14, CAST(N'2019-03-05T19:57:24.670' AS DateTime), 0, NULL, 0, NULL, 0, 0)
INSERT [dbo].[DonDatHang] ([DDH_ID], [OrderDate], [isDelivered], [DeliverDate], [isPaid], [CusUsername], [isCanceled], [isDeleted]) VALUES (15, CAST(N'2019-03-05T19:58:18.757' AS DateTime), 0, NULL, 0, NULL, 0, 0)
INSERT [dbo].[DonDatHang] ([DDH_ID], [OrderDate], [isDelivered], [DeliverDate], [isPaid], [CusUsername], [isCanceled], [isDeleted]) VALUES (16, CAST(N'2019-03-05T20:10:00.463' AS DateTime), 0, NULL, 0, NULL, 0, 0)
INSERT [dbo].[DonDatHang] ([DDH_ID], [OrderDate], [isDelivered], [DeliverDate], [isPaid], [CusUsername], [isCanceled], [isDeleted]) VALUES (17, CAST(N'2019-03-05T20:13:22.507' AS DateTime), 0, NULL, 0, NULL, 0, 0)
INSERT [dbo].[DonDatHang] ([DDH_ID], [OrderDate], [isDelivered], [DeliverDate], [isPaid], [CusUsername], [isCanceled], [isDeleted]) VALUES (18, CAST(N'2019-03-05T20:16:31.187' AS DateTime), 0, NULL, 0, NULL, 0, 0)
INSERT [dbo].[DonDatHang] ([DDH_ID], [OrderDate], [isDelivered], [DeliverDate], [isPaid], [CusUsername], [isCanceled], [isDeleted]) VALUES (19, CAST(N'2019-03-05T20:18:43.297' AS DateTime), 0, NULL, 0, NULL, 0, 0)
INSERT [dbo].[DonDatHang] ([DDH_ID], [OrderDate], [isDelivered], [DeliverDate], [isPaid], [CusUsername], [isCanceled], [isDeleted]) VALUES (20, CAST(N'2019-03-05T20:22:33.087' AS DateTime), 0, NULL, 0, NULL, 0, 0)
INSERT [dbo].[DonDatHang] ([DDH_ID], [OrderDate], [isDelivered], [DeliverDate], [isPaid], [CusUsername], [isCanceled], [isDeleted]) VALUES (21, CAST(N'2019-03-05T20:25:16.500' AS DateTime), 0, NULL, 0, NULL, 0, 0)
INSERT [dbo].[DonDatHang] ([DDH_ID], [OrderDate], [isDelivered], [DeliverDate], [isPaid], [CusUsername], [isCanceled], [isDeleted]) VALUES (22, CAST(N'2019-03-05T20:27:39.583' AS DateTime), 0, NULL, 0, NULL, 0, 0)
INSERT [dbo].[DonDatHang] ([DDH_ID], [OrderDate], [isDelivered], [DeliverDate], [isPaid], [CusUsername], [isCanceled], [isDeleted]) VALUES (23, CAST(N'2019-03-05T20:32:34.633' AS DateTime), 0, NULL, 0, NULL, 0, 0)
INSERT [dbo].[DonDatHang] ([DDH_ID], [OrderDate], [isDelivered], [DeliverDate], [isPaid], [CusUsername], [isCanceled], [isDeleted]) VALUES (24, CAST(N'2019-03-05T20:33:36.967' AS DateTime), 0, NULL, 0, NULL, 0, 0)
INSERT [dbo].[DonDatHang] ([DDH_ID], [OrderDate], [isDelivered], [DeliverDate], [isPaid], [CusUsername], [isCanceled], [isDeleted]) VALUES (25, CAST(N'2019-03-05T20:35:12.367' AS DateTime), 0, NULL, 0, NULL, 0, 0)
INSERT [dbo].[DonDatHang] ([DDH_ID], [OrderDate], [isDelivered], [DeliverDate], [isPaid], [CusUsername], [isCanceled], [isDeleted]) VALUES (26, CAST(N'2019-03-05T20:36:06.423' AS DateTime), 0, NULL, 0, NULL, 0, 0)
INSERT [dbo].[DonDatHang] ([DDH_ID], [OrderDate], [isDelivered], [DeliverDate], [isPaid], [CusUsername], [isCanceled], [isDeleted]) VALUES (27, CAST(N'2019-03-05T21:36:40.497' AS DateTime), 0, NULL, 0, NULL, 0, 0)
INSERT [dbo].[DonDatHang] ([DDH_ID], [OrderDate], [isDelivered], [DeliverDate], [isPaid], [CusUsername], [isCanceled], [isDeleted]) VALUES (28, CAST(N'2019-03-05T21:45:02.450' AS DateTime), 0, NULL, 0, NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[DonDatHang] OFF
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([PaymentID], [PaymentType]) VALUES (1, N'Thẻ ATM')
INSERT [dbo].[Payment] ([PaymentID], [PaymentType]) VALUES (2, N'Tiền Mặt')
SET IDENTITY_INSERT [dbo].[Payment] OFF
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Category]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Book]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_DonDatHang] FOREIGN KEY([DDH_ID])
REFERENCES [dbo].[DonDatHang] ([DDH_ID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_DonDatHang]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_DonDatHang_Customer] FOREIGN KEY([CusUsername])
REFERENCES [dbo].[Customer] ([CusUserName])
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK_DonDatHang_Customer]
GO
USE [master]
GO
ALTER DATABASE [BookShop] SET  READ_WRITE 
GO
