USE [master]
GO
/****** Object:  Database [BookShop]    Script Date: 3/2/2019 7:38:26 PM ******/
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
/****** Object:  Table [dbo].[Book]    Script Date: 3/2/2019 7:38:26 PM ******/
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
/****** Object:  Table [dbo].[Cart]    Script Date: 3/2/2019 7:38:26 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 3/2/2019 7:38:26 PM ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 3/2/2019 7:38:26 PM ******/
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
/****** Object:  Table [dbo].[DonDatHang]    Script Date: 3/2/2019 7:38:26 PM ******/
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
/****** Object:  Table [dbo].[Payment]    Script Date: 3/2/2019 7:38:26 PM ******/
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

INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (14, N'Ký Hiệu Và Liên Ký Hiệu', N'Nguyễn Trãi', N'Kim Đồng', CAST(N'2019-10-19T00:00:00.000' AS DateTime), 100000, 0, N'KYHieuVaLienKiHieu.jpg', N'Ký hiệu tồn tại như một sự tổng hòa các mối quan hệ văn hóa. Không thể có bất cứ một ký hiệu nào nằm ngoài văn hóa. Theo đó, ký hiệu không hề và không thể tồn tại như một thực thể độc lập tuyệt đối, mang một nghĩa tự trị đơn nhất. Ngay từ lúc ra đời, ký hiệu luôn được tri nhận trong các mối quan hệ văn hóa nhất định. Một ký hiệu, vì thế đã trở thành một tổ hợp ký hiệu trước và sau nó. Vậy nên, nó luôn là một liên ký hiệu.

Từ phát hiện này, chúng tôi tiếp cận ký hiệu ngôn từ ở chiều sâu của liên ký hiệu, đúng hơn là từ ký hiệu học hậu hiện đại. Khác với lẽ thường, thay vì lập mô hình để khu biệt và nhận dạng nghĩa của ký hiệu theo các cách nhà cấu trúc luận, chúng tôi đi giải cấu trúc ký hiệu để tìm bản chất của ký hiệu ngôn từ, tìm nội hàm của nó trong triết học, trong cổ mẫu, trong vô thức, trong quan niệm trò chơi hành dụng,… tóm lại là từ các mối liên kết nghĩa đa tầng bậc của chúng.

Sách này sử dụng lại, có sửa chữa cơ bản, một số chương đã in trong cuốn Ký hiệu học văn học, nhưng được sắp xếp để làm nổi bật lên tính liên ký hiệu - một đóng góp mang tính cá biệt của chúng tôi cho ngành ký hiệu học, vốn đã được khảo sát và ứng dụng rộng trên toàn thế giới.

Nghiên cứu ký hiệu đến nay đã đạt được những thành tựu đáng kể. Những tên tuổi như Charles Sanders Peirce, Ferdinand de  Saussure,  Roland  Barthes,  Jacques  Derrida,…  đã  quá quen thuộc với giới học thuật Việt Nam. Hướng nghiên cứu này trên thế giới ắt hẳn đã có cả triệu công trình lớn nhỏ. Có thể kể các cuốn tiêu biểu: Claude Lévi–Strauss với Nhân học cấu trúc (Structural Anthropology, 1968); Jacques Lacan với Ngôn ngữ của cái tôi: chức năng của ngôn ngữ trong Phân tâm học (The Language of the Self: The Function of Language in Psychoanalysis, 1968); Terence Hawkes với Chủ nghĩa cấu trúc và ký hiệu học (Structuralism and Semiotics, 1977); Jonathan Culler với Truy tìm ký hiệu (The Pursuit of Signs, 1981); Robert Scholes với Ký hiệu học và diễn giải (Semiotics and Interpretation, 1982); Thomas A. Sebeok (chủ biên), Ký hiệu chuyện kể: một khảo sát ký hiệu học (The Tell– Tale Sign: A Survey of Semiotics, 1975); Robert E. Innis (chủ biên), Ký hiệu học: Hợp tuyển nhập môn (Semiotics: An Introductory Anthology, 1985)…', 1, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (15, N'Phiêu Lưu Chữ', N'Lương Thế Vinh', N'Tuổi Trẻ', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 200000, 31, N'PhieuLuuChu.jpg', N'Ký hiệu tồn tại như một sự tổng hòa các mối quan hệ văn hóa. Không thể có bất cứ một ký hiệu nào nằm ngoài văn hóa. Theo đó, ký hiệu không hề và không thể tồn tại như một thực thể độc lập tuyệt đối, mang một nghĩa tự trị đơn nhất. Ngay từ lúc ra đời, ký hiệu luôn được tri nhận trong các mối quan hệ văn hóa nhất định. Một ký hiệu, vì thế đã trở thành một tổ hợp ký hiệu trước và sau nó. Vậy nên, nó luôn là một liên ký hiệu.

Từ phát hiện này, chúng tôi tiếp cận ký hiệu ngôn từ ở chiều sâu của liên ký hiệu, đúng hơn là từ ký hiệu học hậu hiện đại. Khác với lẽ thường, thay vì lập mô hình để khu biệt và nhận dạng nghĩa của ký hiệu theo các cách nhà cấu trúc luận, chúng tôi đi giải cấu trúc ký hiệu để tìm bản chất của ký hiệu ngôn từ, tìm nội hàm của nó trong triết học, trong cổ mẫu, trong vô thức, trong quan niệm trò chơi hành dụng,… tóm lại là từ các mối liên kết nghĩa đa tầng bậc của chúng.

Sách này sử dụng lại, có sửa chữa cơ bản, một số chương đã in trong cuốn Ký hiệu học văn học, nhưng được sắp xếp để làm nổi bật lên tính liên ký hiệu - một đóng góp mang tính cá biệt của chúng tôi cho ngành ký hiệu học, vốn đã được khảo sát và ứng dụng rộng trên toàn thế giới.

Nghiên cứu ký hiệu đến nay đã đạt được những thành tựu đáng kể. Những tên tuổi như Charles Sanders Peirce, Ferdinand de  Saussure,  Roland  Barthes,  Jacques  Derrida,…  đã  quá quen thuộc với giới học thuật Việt Nam. Hướng nghiên cứu này trên thế giới ắt hẳn đã có cả triệu công trình lớn nhỏ. Có thể kể các cuốn tiêu biểu: Claude Lévi–Strauss với Nhân học cấu trúc (Structural Anthropology, 1968); Jacques Lacan với Ngôn ngữ của cái tôi: chức năng của ngôn ngữ trong Phân tâm học (The Language of the Self: The Function of Language in Psychoanalysis, 1968); Terence Hawkes với Chủ nghĩa cấu trúc và ký hiệu học (Structuralism and Semiotics, 1977); Jonathan Culler với Truy tìm ký hiệu (The Pursuit of Signs, 1981); Robert Scholes với Ký hiệu học và diễn giải (Semiotics and Interpretation, 1982); Thomas A. Sebeok (chủ biên), Ký hiệu chuyện kể: một khảo sát ký hiệu học (The Tell– Tale Sign: A Survey of Semiotics, 1975); Robert E. Innis (chủ biên), Ký hiệu học: Hợp tuyển nhập môn (Semiotics: An Introductory Anthology, 1985)…', 1, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (16, N'Song hành Và Đối THoại', N'Nguyễn Du', N'Phương Nam', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 320000, 23, N'SongHanhVaDoiThoai.jpg', N'Ký hiệu tồn tại như một sự tổng hòa các mối quan hệ văn hóa. Không thể có bất cứ một ký hiệu nào nằm ngoài văn hóa. Theo đó, ký hiệu không hề và không thể tồn tại như một thực thể độc lập tuyệt đối, mang một nghĩa tự trị đơn nhất. Ngay từ lúc ra đời, ký hiệu luôn được tri nhận trong các mối quan hệ văn hóa nhất định. Một ký hiệu, vì thế đã trở thành một tổ hợp ký hiệu trước và sau nó. Vậy nên, nó luôn là một liên ký hiệu.

Từ phát hiện này, chúng tôi tiếp cận ký hiệu ngôn từ ở chiều sâu của liên ký hiệu, đúng hơn là từ ký hiệu học hậu hiện đại. Khác với lẽ thường, thay vì lập mô hình để khu biệt và nhận dạng nghĩa của ký hiệu theo các cách nhà cấu trúc luận, chúng tôi đi giải cấu trúc ký hiệu để tìm bản chất của ký hiệu ngôn từ, tìm nội hàm của nó trong triết học, trong cổ mẫu, trong vô thức, trong quan niệm trò chơi hành dụng,… tóm lại là từ các mối liên kết nghĩa đa tầng bậc của chúng.

Sách này sử dụng lại, có sửa chữa cơ bản, một số chương đã in trong cuốn Ký hiệu học văn học, nhưng được sắp xếp để làm nổi bật lên tính liên ký hiệu - một đóng góp mang tính cá biệt của chúng tôi cho ngành ký hiệu học, vốn đã được khảo sát và ứng dụng rộng trên toàn thế giới.

Nghiên cứu ký hiệu đến nay đã đạt được những thành tựu đáng kể. Những tên tuổi như Charles Sanders Peirce, Ferdinand de  Saussure,  Roland  Barthes,  Jacques  Derrida,…  đã  quá quen thuộc với giới học thuật Việt Nam. Hướng nghiên cứu này trên thế giới ắt hẳn đã có cả triệu công trình lớn nhỏ. Có thể kể các cuốn tiêu biểu: Claude Lévi–Strauss với Nhân học cấu trúc (Structural Anthropology, 1968); Jacques Lacan với Ngôn ngữ của cái tôi: chức năng của ngôn ngữ trong Phân tâm học (The Language of the Self: The Function of Language in Psychoanalysis, 1968); Terence Hawkes với Chủ nghĩa cấu trúc và ký hiệu học (Structuralism and Semiotics, 1977); Jonathan Culler với Truy tìm ký hiệu (The Pursuit of Signs, 1981); Robert Scholes với Ký hiệu học và diễn giải (Semiotics and Interpretation, 1982); Thomas A. Sebeok (chủ biên), Ký hiệu chuyện kể: một khảo sát ký hiệu học (The Tell– Tale Sign: A Survey of Semiotics, 1975); Robert E. Innis (chủ biên), Ký hiệu học: Hợp tuyển nhập môn (Semiotics: An Introductory Anthology, 1985)…', 1, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (17, N'Sống Trong Thời Viễn Tưởng', N'Phan Bội Châu', N'Giáo Dục', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 390000, 43, N'SongTrongThoiVienTuong.jpg', N'Ký hiệu tồn tại như một sự tổng hòa các mối quan hệ văn hóa. Không thể có bất cứ một ký hiệu nào nằm ngoài văn hóa. Theo đó, ký hiệu không hề và không thể tồn tại như một thực thể độc lập tuyệt đối, mang một nghĩa tự trị đơn nhất. Ngay từ lúc ra đời, ký hiệu luôn được tri nhận trong các mối quan hệ văn hóa nhất định. Một ký hiệu, vì thế đã trở thành một tổ hợp ký hiệu trước và sau nó. Vậy nên, nó luôn là một liên ký hiệu.

Từ phát hiện này, chúng tôi tiếp cận ký hiệu ngôn từ ở chiều sâu của liên ký hiệu, đúng hơn là từ ký hiệu học hậu hiện đại. Khác với lẽ thường, thay vì lập mô hình để khu biệt và nhận dạng nghĩa của ký hiệu theo các cách nhà cấu trúc luận, chúng tôi đi giải cấu trúc ký hiệu để tìm bản chất của ký hiệu ngôn từ, tìm nội hàm của nó trong triết học, trong cổ mẫu, trong vô thức, trong quan niệm trò chơi hành dụng,… tóm lại là từ các mối liên kết nghĩa đa tầng bậc của chúng.

Sách này sử dụng lại, có sửa chữa cơ bản, một số chương đã in trong cuốn Ký hiệu học văn học, nhưng được sắp xếp để làm nổi bật lên tính liên ký hiệu - một đóng góp mang tính cá biệt của chúng tôi cho ngành ký hiệu học, vốn đã được khảo sát và ứng dụng rộng trên toàn thế giới.

Nghiên cứu ký hiệu đến nay đã đạt được những thành tựu đáng kể. Những tên tuổi như Charles Sanders Peirce, Ferdinand de  Saussure,  Roland  Barthes,  Jacques  Derrida,…  đã  quá quen thuộc với giới học thuật Việt Nam. Hướng nghiên cứu này trên thế giới ắt hẳn đã có cả triệu công trình lớn nhỏ. Có thể kể các cuốn tiêu biểu: Claude Lévi–Strauss với Nhân học cấu trúc (Structural Anthropology, 1968); Jacques Lacan với Ngôn ngữ của cái tôi: chức năng của ngôn ngữ trong Phân tâm học (The Language of the Self: The Function of Language in Psychoanalysis, 1968); Terence Hawkes với Chủ nghĩa cấu trúc và ký hiệu học (Structuralism and Semiotics, 1977); Jonathan Culler với Truy tìm ký hiệu (The Pursuit of Signs, 1981); Robert Scholes với Ký hiệu học và diễn giải (Semiotics and Interpretation, 1982); Thomas A. Sebeok (chủ biên), Ký hiệu chuyện kể: một khảo sát ký hiệu học (The Tell– Tale Sign: A Survey of Semiotics, 1975); Robert E. Innis (chủ biên), Ký hiệu học: Hợp tuyển nhập môn (Semiotics: An Introductory Anthology, 1985)…', 1, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (18, N'Thế Kỷ XXI Nhìn Về Trương Vĩnh Ký', N'Trương Vĩnh Kí', N'Tuổi Trẻ', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 45000, 34, N'TheKiXXINhinVeTruongVinhKy.jpg', N'Ký hiệu tồn tại như một sự tổng hòa các mối quan hệ văn hóa. Không thể có bất cứ một ký hiệu nào nằm ngoài văn hóa. Theo đó, ký hiệu không hề và không thể tồn tại như một thực thể độc lập tuyệt đối, mang một nghĩa tự trị đơn nhất. Ngay từ lúc ra đời, ký hiệu luôn được tri nhận trong các mối quan hệ văn hóa nhất định. Một ký hiệu, vì thế đã trở thành một tổ hợp ký hiệu trước và sau nó. Vậy nên, nó luôn là một liên ký hiệu.

Từ phát hiện này, chúng tôi tiếp cận ký hiệu ngôn từ ở chiều sâu của liên ký hiệu, đúng hơn là từ ký hiệu học hậu hiện đại. Khác với lẽ thường, thay vì lập mô hình để khu biệt và nhận dạng nghĩa của ký hiệu theo các cách nhà cấu trúc luận, chúng tôi đi giải cấu trúc ký hiệu để tìm bản chất của ký hiệu ngôn từ, tìm nội hàm của nó trong triết học, trong cổ mẫu, trong vô thức, trong quan niệm trò chơi hành dụng,… tóm lại là từ các mối liên kết nghĩa đa tầng bậc của chúng.

Sách này sử dụng lại, có sửa chữa cơ bản, một số chương đã in trong cuốn Ký hiệu học văn học, nhưng được sắp xếp để làm nổi bật lên tính liên ký hiệu - một đóng góp mang tính cá biệt của chúng tôi cho ngành ký hiệu học, vốn đã được khảo sát và ứng dụng rộng trên toàn thế giới.

Nghiên cứu ký hiệu đến nay đã đạt được những thành tựu đáng kể. Những tên tuổi như Charles Sanders Peirce, Ferdinand de  Saussure,  Roland  Barthes,  Jacques  Derrida,…  đã  quá quen thuộc với giới học thuật Việt Nam. Hướng nghiên cứu này trên thế giới ắt hẳn đã có cả triệu công trình lớn nhỏ. Có thể kể các cuốn tiêu biểu: Claude Lévi–Strauss với Nhân học cấu trúc (Structural Anthropology, 1968); Jacques Lacan với Ngôn ngữ của cái tôi: chức năng của ngôn ngữ trong Phân tâm học (The Language of the Self: The Function of Language in Psychoanalysis, 1968); Terence Hawkes với Chủ nghĩa cấu trúc và ký hiệu học (Structuralism and Semiotics, 1977); Jonathan Culler với Truy tìm ký hiệu (The Pursuit of Signs, 1981); Robert Scholes với Ký hiệu học và diễn giải (Semiotics and Interpretation, 1982); Thomas A. Sebeok (chủ biên), Ký hiệu chuyện kể: một khảo sát ký hiệu học (The Tell– Tale Sign: A Survey of Semiotics, 1975); Robert E. Innis (chủ biên), Ký hiệu học: Hợp tuyển nhập môn (Semiotics: An Introductory Anthology, 1985)…', 1, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (19, N'Đại Số 10', N'Cao Bá Quát', N'Phương Đông', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 34500, 45, N'DaiSo10.jpg', N'Ký hiệu tồn tại như một sự tổng hòa các mối quan hệ văn hóa. Không thể có bất cứ một ký hiệu nào nằm ngoài văn hóa. Theo đó, ký hiệu không hề và không thể tồn tại như một thực thể độc lập tuyệt đối, mang một nghĩa tự trị đơn nhất. Ngay từ lúc ra đời, ký hiệu luôn được tri nhận trong các mối quan hệ văn hóa nhất định. Một ký hiệu, vì thế đã trở thành một tổ hợp ký hiệu trước và sau nó. Vậy nên, nó luôn là một liên ký hiệu.

Từ phát hiện này, chúng tôi tiếp cận ký hiệu ngôn từ ở chiều sâu của liên ký hiệu, đúng hơn là từ ký hiệu học hậu hiện đại. Khác với lẽ thường, thay vì lập mô hình để khu biệt và nhận dạng nghĩa của ký hiệu theo các cách nhà cấu trúc luận, chúng tôi đi giải cấu trúc ký hiệu để tìm bản chất của ký hiệu ngôn từ, tìm nội hàm của nó trong triết học, trong cổ mẫu, trong vô thức, trong quan niệm trò chơi hành dụng,… tóm lại là từ các mối liên kết nghĩa đa tầng bậc của chúng.

Sách này sử dụng lại, có sửa chữa cơ bản, một số chương đã in trong cuốn Ký hiệu học văn học, nhưng được sắp xếp để làm nổi bật lên tính liên ký hiệu - một đóng góp mang tính cá biệt của chúng tôi cho ngành ký hiệu học, vốn đã được khảo sát và ứng dụng rộng trên toàn thế giới.

Nghiên cứu ký hiệu đến nay đã đạt được những thành tựu đáng kể. Những tên tuổi như Charles Sanders Peirce, Ferdinand de  Saussure,  Roland  Barthes,  Jacques  Derrida,…  đã  quá quen thuộc với giới học thuật Việt Nam. Hướng nghiên cứu này trên thế giới ắt hẳn đã có cả triệu công trình lớn nhỏ. Có thể kể các cuốn tiêu biểu: Claude Lévi–Strauss với Nhân học cấu trúc (Structural Anthropology, 1968); Jacques Lacan với Ngôn ngữ của cái tôi: chức năng của ngôn ngữ trong Phân tâm học (The Language of the Self: The Function of Language in Psychoanalysis, 1968); Terence Hawkes với Chủ nghĩa cấu trúc và ký hiệu học (Structuralism and Semiotics, 1977); Jonathan Culler với Truy tìm ký hiệu (The Pursuit of Signs, 1981); Robert Scholes với Ký hiệu học và diễn giải (Semiotics and Interpretation, 1982); Thomas A. Sebeok (chủ biên), Ký hiệu chuyện kể: một khảo sát ký hiệu học (The Tell– Tale Sign: A Survey of Semiotics, 1975); Robert E. Innis (chủ biên), Ký hiệu học: Hợp tuyển nhập môn (Semiotics: An Introductory Anthology, 1985)…', 14, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (20, N'Hóa Học 12', N'Tô Hoài', N'Tuổi Trẻ', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 470000, 31, N'hoaHoc12.jpg', N'Ký hiệu tồn tại như một sự tổng hòa các mối quan hệ văn hóa. Không thể có bất cứ một ký hiệu nào nằm ngoài văn hóa. Theo đó, ký hiệu không hề và không thể tồn tại như một thực thể độc lập tuyệt đối, mang một nghĩa tự trị đơn nhất. Ngay từ lúc ra đời, ký hiệu luôn được tri nhận trong các mối quan hệ văn hóa nhất định. Một ký hiệu, vì thế đã trở thành một tổ hợp ký hiệu trước và sau nó. Vậy nên, nó luôn là một liên ký hiệu.

Từ phát hiện này, chúng tôi tiếp cận ký hiệu ngôn từ ở chiều sâu của liên ký hiệu, đúng hơn là từ ký hiệu học hậu hiện đại. Khác với lẽ thường, thay vì lập mô hình để khu biệt và nhận dạng nghĩa của ký hiệu theo các cách nhà cấu trúc luận, chúng tôi đi giải cấu trúc ký hiệu để tìm bản chất của ký hiệu ngôn từ, tìm nội hàm của nó trong triết học, trong cổ mẫu, trong vô thức, trong quan niệm trò chơi hành dụng,… tóm lại là từ các mối liên kết nghĩa đa tầng bậc của chúng.

Sách này sử dụng lại, có sửa chữa cơ bản, một số chương đã in trong cuốn Ký hiệu học văn học, nhưng được sắp xếp để làm nổi bật lên tính liên ký hiệu - một đóng góp mang tính cá biệt của chúng tôi cho ngành ký hiệu học, vốn đã được khảo sát và ứng dụng rộng trên toàn thế giới.

Nghiên cứu ký hiệu đến nay đã đạt được những thành tựu đáng kể. Những tên tuổi như Charles Sanders Peirce, Ferdinand de  Saussure,  Roland  Barthes,  Jacques  Derrida,…  đã  quá quen thuộc với giới học thuật Việt Nam. Hướng nghiên cứu này trên thế giới ắt hẳn đã có cả triệu công trình lớn nhỏ. Có thể kể các cuốn tiêu biểu: Claude Lévi–Strauss với Nhân học cấu trúc (Structural Anthropology, 1968); Jacques Lacan với Ngôn ngữ của cái tôi: chức năng của ngôn ngữ trong Phân tâm học (The Language of the Self: The Function of Language in Psychoanalysis, 1968); Terence Hawkes với Chủ nghĩa cấu trúc và ký hiệu học (Structuralism and Semiotics, 1977); Jonathan Culler với Truy tìm ký hiệu (The Pursuit of Signs, 1981); Robert Scholes với Ký hiệu học và diễn giải (Semiotics and Interpretation, 1982); Thomas A. Sebeok (chủ biên), Ký hiệu chuyện kể: một khảo sát ký hiệu học (The Tell– Tale Sign: A Survey of Semiotics, 1975); Robert E. Innis (chủ biên), Ký hiệu học: Hợp tuyển nhập môn (Semiotics: An Introductory Anthology, 1985)…', 14, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (21, N'Tiếng Việt 1', N'Trằn Đăng Khoa', N'Á Đông', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 54000, 36, N'tiengViet1.jpg', N'Ký hiệu tồn tại như một sự tổng hòa các mối quan hệ văn hóa. Không thể có bất cứ một ký hiệu nào nằm ngoài văn hóa. Theo đó, ký hiệu không hề và không thể tồn tại như một thực thể độc lập tuyệt đối, mang một nghĩa tự trị đơn nhất. Ngay từ lúc ra đời, ký hiệu luôn được tri nhận trong các mối quan hệ văn hóa nhất định. Một ký hiệu, vì thế đã trở thành một tổ hợp ký hiệu trước và sau nó. Vậy nên, nó luôn là một liên ký hiệu.

Từ phát hiện này, chúng tôi tiếp cận ký hiệu ngôn từ ở chiều sâu của liên ký hiệu, đúng hơn là từ ký hiệu học hậu hiện đại. Khác với lẽ thường, thay vì lập mô hình để khu biệt và nhận dạng nghĩa của ký hiệu theo các cách nhà cấu trúc luận, chúng tôi đi giải cấu trúc ký hiệu để tìm bản chất của ký hiệu ngôn từ, tìm nội hàm của nó trong triết học, trong cổ mẫu, trong vô thức, trong quan niệm trò chơi hành dụng,… tóm lại là từ các mối liên kết nghĩa đa tầng bậc của chúng.

Sách này sử dụng lại, có sửa chữa cơ bản, một số chương đã in trong cuốn Ký hiệu học văn học, nhưng được sắp xếp để làm nổi bật lên tính liên ký hiệu - một đóng góp mang tính cá biệt của chúng tôi cho ngành ký hiệu học, vốn đã được khảo sát và ứng dụng rộng trên toàn thế giới.

Nghiên cứu ký hiệu đến nay đã đạt được những thành tựu đáng kể. Những tên tuổi như Charles Sanders Peirce, Ferdinand de  Saussure,  Roland  Barthes,  Jacques  Derrida,…  đã  quá quen thuộc với giới học thuật Việt Nam. Hướng nghiên cứu này trên thế giới ắt hẳn đã có cả triệu công trình lớn nhỏ. Có thể kể các cuốn tiêu biểu: Claude Lévi–Strauss với Nhân học cấu trúc (Structural Anthropology, 1968); Jacques Lacan với Ngôn ngữ của cái tôi: chức năng của ngôn ngữ trong Phân tâm học (The Language of the Self: The Function of Language in Psychoanalysis, 1968); Terence Hawkes với Chủ nghĩa cấu trúc và ký hiệu học (Structuralism and Semiotics, 1977); Jonathan Culler với Truy tìm ký hiệu (The Pursuit of Signs, 1981); Robert Scholes với Ký hiệu học và diễn giải (Semiotics and Interpretation, 1982); Thomas A. Sebeok (chủ biên), Ký hiệu chuyện kể: một khảo sát ký hiệu học (The Tell– Tale Sign: A Survey of Semiotics, 1975); Robert E. Innis (chủ biên), Ký hiệu học: Hợp tuyển nhập môn (Semiotics: An Introductory Anthology, 1985)…', 14, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (22, N'Toán Lớp 1', N'Ma Văn Kháng', N'Giáo Dục', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 67000, 76, N'toan1.jpg', N'Ký hiệu tồn tại như một sự tổng hòa các mối quan hệ văn hóa. Không thể có bất cứ một ký hiệu nào nằm ngoài văn hóa. Theo đó, ký hiệu không hề và không thể tồn tại như một thực thể độc lập tuyệt đối, mang một nghĩa tự trị đơn nhất. Ngay từ lúc ra đời, ký hiệu luôn được tri nhận trong các mối quan hệ văn hóa nhất định. Một ký hiệu, vì thế đã trở thành một tổ hợp ký hiệu trước và sau nó. Vậy nên, nó luôn là một liên ký hiệu.

Từ phát hiện này, chúng tôi tiếp cận ký hiệu ngôn từ ở chiều sâu của liên ký hiệu, đúng hơn là từ ký hiệu học hậu hiện đại. Khác với lẽ thường, thay vì lập mô hình để khu biệt và nhận dạng nghĩa của ký hiệu theo các cách nhà cấu trúc luận, chúng tôi đi giải cấu trúc ký hiệu để tìm bản chất của ký hiệu ngôn từ, tìm nội hàm của nó trong triết học, trong cổ mẫu, trong vô thức, trong quan niệm trò chơi hành dụng,… tóm lại là từ các mối liên kết nghĩa đa tầng bậc của chúng.

Sách này sử dụng lại, có sửa chữa cơ bản, một số chương đã in trong cuốn Ký hiệu học văn học, nhưng được sắp xếp để làm nổi bật lên tính liên ký hiệu - một đóng góp mang tính cá biệt của chúng tôi cho ngành ký hiệu học, vốn đã được khảo sát và ứng dụng rộng trên toàn thế giới.

Nghiên cứu ký hiệu đến nay đã đạt được những thành tựu đáng kể. Những tên tuổi như Charles Sanders Peirce, Ferdinand de  Saussure,  Roland  Barthes,  Jacques  Derrida,…  đã  quá quen thuộc với giới học thuật Việt Nam. Hướng nghiên cứu này trên thế giới ắt hẳn đã có cả triệu công trình lớn nhỏ. Có thể kể các cuốn tiêu biểu: Claude Lévi–Strauss với Nhân học cấu trúc (Structural Anthropology, 1968); Jacques Lacan với Ngôn ngữ của cái tôi: chức năng của ngôn ngữ trong Phân tâm học (The Language of the Self: The Function of Language in Psychoanalysis, 1968); Terence Hawkes với Chủ nghĩa cấu trúc và ký hiệu học (Structuralism and Semiotics, 1977); Jonathan Culler với Truy tìm ký hiệu (The Pursuit of Signs, 1981); Robert Scholes với Ký hiệu học và diễn giải (Semiotics and Interpretation, 1982); Thomas A. Sebeok (chủ biên), Ký hiệu chuyện kể: một khảo sát ký hiệu học (The Tell– Tale Sign: A Survey of Semiotics, 1975); Robert E. Innis (chủ biên), Ký hiệu học: Hợp tuyển nhập môn (Semiotics: An Introductory Anthology, 1985)…', 14, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (23, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (24, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (25, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (26, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (27, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (28, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (29, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (30, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (31, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (32, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (33, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (34, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (35, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (36, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (37, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (38, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (39, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (40, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (41, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (42, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (43, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (44, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (45, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (46, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (47, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (48, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (49, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (50, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (51, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (52, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (53, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (54, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (55, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (56, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (57, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (58, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (59, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (60, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (61, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (62, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (64, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (65, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
INSERT [dbo].[Book] ([BookID], [BookName], [Author], [Publisher], [PublishDate], [Price], [Quantity], [Image], [Description], [CategoryId], [isDelete]) VALUES (66, N'Origin', N'a', N'a', CAST(N'1997-10-06T00:00:00.000' AS DateTime), 213, 213123, N'img/favicon.png', N'sadddddd', 15, 0)
SET IDENTITY_INSERT [dbo].[Book] OFF
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([CartID], [BookID], [BookName], [Quantity], [Price], [DDH_ID]) VALUES (1, 15, N'Phiêu Lưu Chữ', 2, 200000, 1)
INSERT [dbo].[Cart] ([CartID], [BookID], [BookName], [Quantity], [Price], [DDH_ID]) VALUES (2, 16, N'Song hành Và Đối THoại', 3, 320000, 1)
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
