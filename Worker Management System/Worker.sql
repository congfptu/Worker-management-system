USE [master]
GO
/****** Object:  Database [ChamCong]    Script Date: 7/10/2021 2:57:28 PM ******/
CREATE DATABASE [ChamCong]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ChamCong', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ChamCong.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ChamCong_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ChamCong_0.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ChamCong] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ChamCong].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ChamCong] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ChamCong] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ChamCong] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ChamCong] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ChamCong] SET ARITHABORT OFF 
GO
ALTER DATABASE [ChamCong] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ChamCong] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ChamCong] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ChamCong] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ChamCong] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ChamCong] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ChamCong] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ChamCong] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ChamCong] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ChamCong] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ChamCong] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ChamCong] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ChamCong] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ChamCong] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ChamCong] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ChamCong] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ChamCong] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ChamCong] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ChamCong] SET  MULTI_USER 
GO
ALTER DATABASE [ChamCong] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ChamCong] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ChamCong] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ChamCong] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ChamCong] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ChamCong] SET QUERY_STORE = OFF
GO
USE [ChamCong]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/10/2021 2:57:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[application]    Script Date: 7/10/2021 2:57:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[application](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[congnhanid] [int] NULL,
	[content] [nvarchar](500) NULL,
	[timeSubmit] [datetime] NULL,
	[timeApproved] [datetime] NULL,
	[note] [nvarchar](500) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChamCong]    Script Date: 7/10/2021 2:57:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChamCong](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[congnhanid] [int] NOT NULL,
	[congtrinhid] [int] NOT NULL,
	[pid] [int] NOT NULL,
	[date] [date] NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[congnhanid] ASC,
	[congtrinhid] ASC,
	[pid] ASC,
	[date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CongNhan]    Script Date: 7/10/2021 2:57:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongNhan](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[gender] [bit] NULL,
	[dob] [date] NULL,
 CONSTRAINT [PK_CongNhan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CongNhan_Account]    Script Date: 7/10/2021 2:57:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongNhan_Account](
	[cid] [int] NOT NULL,
	[username] [varchar](255) NOT NULL,
 CONSTRAINT [PK_CongNhan_Account] PRIMARY KEY CLUSTERED 
(
	[cid] ASC,
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Congnhan_CongTrinh]    Script Date: 7/10/2021 2:57:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Congnhan_CongTrinh](
	[cid] [int] NOT NULL,
	[congnhanid] [int] NOT NULL,
 CONSTRAINT [PK_Congnhan_CongTrinh] PRIMARY KEY CLUSTERED 
(
	[cid] ASC,
	[congnhanid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CongNhan_CongViec]    Script Date: 7/10/2021 2:57:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongNhan_CongViec](
	[cid] [int] NOT NULL,
	[cvid] [int] NOT NULL,
 CONSTRAINT [PK_CongNhan_CongViec] PRIMARY KEY CLUSTERED 
(
	[cid] ASC,
	[cvid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CongTrinh]    Script Date: 7/10/2021 2:57:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongTrinh](
	[id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[address] [varchar](255) NOT NULL,
	[begintime] [date] NOT NULL,
	[endtime] [date] NULL,
	[statusCongtrinh] [bit] NULL,
 CONSTRAINT [PK_CongTrinh] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CongViec]    Script Date: 7/10/2021 2:57:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongViec](
	[id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[salary] [float] NULL,
 CONSTRAINT [PK_CongViec] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 7/10/2021 2:57:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[id] [int] NOT NULL,
	[url] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature_Group]    Script Date: 7/10/2021 2:57:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature_Group](
	[fid] [int] NOT NULL,
	[gid] [int] NOT NULL,
 CONSTRAINT [PK_Feature_Group] PRIMARY KEY CLUSTERED 
(
	[fid] ASC,
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 7/10/2021 2:57:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[gid] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group_Account]    Script Date: 7/10/2021 2:57:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group_Account](
	[gid] [int] NOT NULL,
	[username] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Group_Account] PRIMARY KEY CLUSTERED 
(
	[gid] ASC,
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phien_LV]    Script Date: 7/10/2021 2:57:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phien_LV](
	[pid] [int] NOT NULL,
	[sessionName] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalaryHistory]    Script Date: 7/10/2021 2:57:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalaryHistory](
	[congnhanid] [int] NOT NULL,
	[salary] [float] NULL,
	[timeChange] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[congnhanid] ASC,
	[timeChange] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[statusCongtrinh]    Script Date: 7/10/2021 2:57:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[statusCongtrinh](
	[congtrinhid] [int] NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[congtrinhid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password]) VALUES (N'cong', N'123')
INSERT [dbo].[Account] ([username], [password]) VALUES (N'congbv', N'123456')
INSERT [dbo].[Account] ([username], [password]) VALUES (N'khanb', N'123456')
INSERT [dbo].[Account] ([username], [password]) VALUES (N'manhnv', N'123456')
INSERT [dbo].[Account] ([username], [password]) VALUES (N'sonnt', N'123456')
INSERT [dbo].[Account] ([username], [password]) VALUES (N'trangnb', N'123456')
INSERT [dbo].[Account] ([username], [password]) VALUES (N'tuanvm', N'123456')
GO
SET IDENTITY_INSERT [dbo].[application] ON 

INSERT [dbo].[application] ([id], [congnhanid], [content], [timeSubmit], [timeApproved], [note], [status]) VALUES (2, 1, N'xin nghỉ làm ngày mai 23/3/2021 ! lí do là em phải về quê ăn cưới', CAST(N'2021-03-22T09:12:00.000' AS DateTime), CAST(N'2021-03-22T09:12:00.000' AS DateTime), N' oke em nhé ! chúc em đi chơi vui vẻ ', 1)
INSERT [dbo].[application] ([id], [congnhanid], [content], [timeSubmit], [timeApproved], [note], [status]) VALUES (3, 1, N'đơn xin nghỉ làm , tao đéo thích làm !', CAST(N'2021-03-22T10:38:00.000' AS DateTime), CAST(N'2021-03-22T10:38:00.000' AS DateTime), N' đi làm đi em!', 0)
INSERT [dbo].[application] ([id], [congnhanid], [content], [timeSubmit], [timeApproved], [note], [status]) VALUES (4, 1, N'nghỉ làm ngayhf mai ạ ', CAST(N'2021-03-22T20:58:00.000' AS DateTime), CAST(N'2021-03-23T13:13:00.000' AS DateTime), N' oke em ', 1)
INSERT [dbo].[application] ([id], [congnhanid], [content], [timeSubmit], [timeApproved], [note], [status]) VALUES (5, 1, N'xin nghỉ làm', CAST(N'2021-03-22T20:58:00.000' AS DateTime), CAST(N'2021-03-23T13:13:00.000' AS DateTime), N'tháng này cố gắng đi làm nha', 0)
INSERT [dbo].[application] ([id], [congnhanid], [content], [timeSubmit], [timeApproved], [note], [status]) VALUES (6, 1, N'xin được nghỉ làm vào ngày 23/3', CAST(N'2021-03-22T20:58:00.000' AS DateTime), CAST(N'2021-03-23T13:13:00.000' AS DateTime), N' lí do rõ ràng hơn nhé em ', 1)
INSERT [dbo].[application] ([id], [congnhanid], [content], [timeSubmit], [timeApproved], [note], [status]) VALUES (7, 1, N'nghỉ', CAST(N'2021-03-22T21:04:00.000' AS DateTime), CAST(N'2021-03-23T13:13:00.000' AS DateTime), N'gọi điện cho anh nhé', 1)
INSERT [dbo].[application] ([id], [congnhanid], [content], [timeSubmit], [timeApproved], [note], [status]) VALUES (8, 3, N'nghỉ làm ngày mai', CAST(N'2021-03-22T22:03:00.000' AS DateTime), CAST(N'2021-03-23T13:13:00.000' AS DateTime), N' anh đồng ý!', 1)
INSERT [dbo].[application] ([id], [congnhanid], [content], [timeSubmit], [timeApproved], [note], [status]) VALUES (9, 3, N'xin được nghỉ làm vào ngày mai', CAST(N'2021-03-23T13:13:00.000' AS DateTime), CAST(N'2021-03-23T13:14:00.000' AS DateTime), N' ok', 1)
INSERT [dbo].[application] ([id], [congnhanid], [content], [timeSubmit], [timeApproved], [note], [status]) VALUES (10, 1, N'nghi lam vi me om', CAST(N'2021-03-23T13:16:00.000' AS DateTime), CAST(N'2021-03-23T13:16:00.000' AS DateTime), N' ', 1)
INSERT [dbo].[application] ([id], [congnhanid], [content], [timeSubmit], [timeApproved], [note], [status]) VALUES (11, 1, N'nghỉ làm', CAST(N'2021-03-23T19:06:00.000' AS DateTime), CAST(N'2021-03-23T19:07:00.000' AS DateTime), N' ', 0)
INSERT [dbo].[application] ([id], [congnhanid], [content], [timeSubmit], [timeApproved], [note], [status]) VALUES (12, 1, N'không đi làm đâu', CAST(N'2021-03-23T19:06:00.000' AS DateTime), CAST(N'2021-03-23T19:11:00.000' AS DateTime), N' ôkkkkkk', 1)
INSERT [dbo].[application] ([id], [congnhanid], [content], [timeSubmit], [timeApproved], [note], [status]) VALUES (13, 1, N'test chức năng xin nghỉ', CAST(N'2021-03-23T19:12:00.000' AS DateTime), CAST(N'2021-03-23T19:12:00.000' AS DateTime), N' oke em nhé', 1)
INSERT [dbo].[application] ([id], [congnhanid], [content], [timeSubmit], [timeApproved], [note], [status]) VALUES (14, 1, N'hay lắm', CAST(N'2021-03-23T19:12:00.000' AS DateTime), CAST(N'2021-03-24T00:39:23.000' AS DateTime), N'lần sau đừng có gửi đơn như thế nhé ! ', 1)
INSERT [dbo].[application] ([id], [congnhanid], [content], [timeSubmit], [timeApproved], [note], [status]) VALUES (15, 1, N'anh ơi mai em nghỉ nhé ', CAST(N'2021-03-23T19:20:58.000' AS DateTime), CAST(N'2021-03-23T19:21:10.000' AS DateTime), N' oki em nhaa', 1)
INSERT [dbo].[application] ([id], [congnhanid], [content], [timeSubmit], [timeApproved], [note], [status]) VALUES (16, 1, N'xin nghỉ làm ngày 25/3 lí do là em có việc đột xuất ', CAST(N'2021-03-24T00:41:23.000' AS DateTime), CAST(N'2021-03-30T14:39:17.000' AS DateTime), N' ', 0)
INSERT [dbo].[application] ([id], [congnhanid], [content], [timeSubmit], [timeApproved], [note], [status]) VALUES (17, 1, N'đơn xin nghỉ làm ngày mai ', CAST(N'2021-03-24T00:41:36.000' AS DateTime), CAST(N'2021-03-29T11:34:08.000' AS DateTime), N' Oke em nhé!', 1)
INSERT [dbo].[application] ([id], [congnhanid], [content], [timeSubmit], [timeApproved], [note], [status]) VALUES (18, 1, N'mai nghỉ nhé anh !', CAST(N'2021-03-24T00:41:46.000' AS DateTime), CAST(N'2021-03-29T10:43:37.000' AS DateTime), N' ', 0)
INSERT [dbo].[application] ([id], [congnhanid], [content], [timeSubmit], [timeApproved], [note], [status]) VALUES (19, 1, N'xin phép ạ', CAST(N'2021-03-24T00:41:49.000' AS DateTime), CAST(N'2021-03-28T23:10:32.000' AS DateTime), N' Không được em ! Tháng này em nghỉ đủ buổi rồi !', 1)
INSERT [dbo].[application] ([id], [congnhanid], [content], [timeSubmit], [timeApproved], [note], [status]) VALUES (20, 1, N'xin nghỉ phép ngày mai ! lí do là em bị ốm!', CAST(N'2021-03-30T20:45:57.000' AS DateTime), NULL, NULL, -1)
INSERT [dbo].[application] ([id], [congnhanid], [content], [timeSubmit], [timeApproved], [note], [status]) VALUES (21, 1, N'nghỉ phép ở nhà để đưa mẹ đi khám ! E cảm ơn ạ ! Mong anh duyệt cho em ', CAST(N'2021-03-30T20:50:06.000' AS DateTime), NULL, NULL, -1)
INSERT [dbo].[application] ([id], [congnhanid], [content], [timeSubmit], [timeApproved], [note], [status]) VALUES (22, 1, N'Đơn xin nghỉ học/giấy phép nghỉ học là một văn bản mà phụ huynh học sinh/sinh viên hoặc chính bản thân học sinh/sinh viên đó tự tay viết để xin được nghỉ học một hoặc nhiều ngày. Đơn xin phép nghỉ học có thể được viết tay hoặc soạn thành email để gửi trực tuyến. Người nhận đơn chính là các giáo viên bộ môn, giáo viên chủ nhiệm hoặc Ban giám hiệu của nhà trường nơi học sinh/sinh viên đó đang theo học.', CAST(N'2021-03-30T20:59:21.000' AS DateTime), NULL, NULL, -1)
SET IDENTITY_INSERT [dbo].[application] OFF
GO
SET IDENTITY_INSERT [dbo].[ChamCong] ON 

INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (404, 1, 1, 1, CAST(N'2021-02-28' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (274, 1, 1, 1, CAST(N'2021-03-01' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (27, 1, 1, 1, CAST(N'2021-03-02' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (53, 1, 1, 1, CAST(N'2021-03-03' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (79, 1, 1, 1, CAST(N'2021-03-04' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (105, 1, 1, 1, CAST(N'2021-03-05' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (131, 1, 1, 1, CAST(N'2021-03-06' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (157, 1, 1, 1, CAST(N'2021-03-07' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (183, 1, 1, 1, CAST(N'2021-03-08' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (209, 1, 1, 1, CAST(N'2021-03-09' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (235, 1, 1, 1, CAST(N'2021-03-10' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (261, 1, 1, 1, CAST(N'2021-03-11' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (300, 1, 1, 1, CAST(N'2021-03-12' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (326, 1, 1, 1, CAST(N'2021-03-13' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (352, 1, 1, 1, CAST(N'2021-03-14' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (378, 1, 1, 1, CAST(N'2021-03-15' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (417, 1, 1, 1, CAST(N'2021-03-16' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (443, 1, 1, 1, CAST(N'2021-03-17' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (471, 1, 1, 1, CAST(N'2021-03-18' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (497, 1, 1, 1, CAST(N'2021-03-19' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (536, 1, 1, 1, CAST(N'2021-03-20' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (549, 1, 1, 1, CAST(N'2021-03-21' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (627, 1, 1, 1, CAST(N'2021-03-22' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (640, 1, 1, 1, CAST(N'2021-03-30' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (1002, 1, 1, 1, CAST(N'2021-05-06' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (14, 1, 1, 2, CAST(N'2021-03-01' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (40, 1, 1, 2, CAST(N'2021-03-02' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (66, 1, 1, 2, CAST(N'2021-03-03' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (92, 1, 1, 2, CAST(N'2021-03-04' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (118, 1, 1, 2, CAST(N'2021-03-05' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (144, 1, 1, 2, CAST(N'2021-03-06' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (170, 1, 1, 2, CAST(N'2021-03-07' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (196, 1, 1, 2, CAST(N'2021-03-08' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (222, 1, 1, 2, CAST(N'2021-03-09' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (248, 1, 1, 2, CAST(N'2021-03-10' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (287, 1, 1, 2, CAST(N'2021-03-11' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (313, 1, 1, 2, CAST(N'2021-03-12' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (339, 1, 1, 2, CAST(N'2021-03-13' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (365, 1, 1, 2, CAST(N'2021-03-14' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (391, 1, 1, 2, CAST(N'2021-03-15' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (430, 1, 1, 2, CAST(N'2021-03-16' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (456, 1, 1, 2, CAST(N'2021-03-17' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (484, 1, 1, 2, CAST(N'2021-03-18' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (510, 1, 1, 2, CAST(N'2021-03-19' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (523, 1, 1, 2, CAST(N'2021-03-20' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (562, 1, 1, 2, CAST(N'2021-03-21' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (601, 1, 1, 2, CAST(N'2021-03-22' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (469, 1, 2, 1, CAST(N'2021-03-28' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (405, 2, 1, 1, CAST(N'2021-02-28' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (275, 2, 1, 1, CAST(N'2021-03-01' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (28, 2, 1, 1, CAST(N'2021-03-02' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (54, 2, 1, 1, CAST(N'2021-03-03' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (80, 2, 1, 1, CAST(N'2021-03-04' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (106, 2, 1, 1, CAST(N'2021-03-05' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (132, 2, 1, 1, CAST(N'2021-03-06' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (158, 2, 1, 1, CAST(N'2021-03-07' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (184, 2, 1, 1, CAST(N'2021-03-08' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (210, 2, 1, 1, CAST(N'2021-03-09' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (236, 2, 1, 1, CAST(N'2021-03-10' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (262, 2, 1, 1, CAST(N'2021-03-11' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (301, 2, 1, 1, CAST(N'2021-03-12' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (327, 2, 1, 1, CAST(N'2021-03-13' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (353, 2, 1, 1, CAST(N'2021-03-14' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (379, 2, 1, 1, CAST(N'2021-03-15' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (418, 2, 1, 1, CAST(N'2021-03-16' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (444, 2, 1, 1, CAST(N'2021-03-17' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (472, 2, 1, 1, CAST(N'2021-03-18' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (498, 2, 1, 1, CAST(N'2021-03-19' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (537, 2, 1, 1, CAST(N'2021-03-20' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (550, 2, 1, 1, CAST(N'2021-03-21' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (628, 2, 1, 1, CAST(N'2021-03-22' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (641, 2, 1, 1, CAST(N'2021-03-30' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (1003, 2, 1, 1, CAST(N'2021-05-06' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (15, 2, 1, 2, CAST(N'2021-03-01' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (41, 2, 1, 2, CAST(N'2021-03-02' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (67, 2, 1, 2, CAST(N'2021-03-03' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (93, 2, 1, 2, CAST(N'2021-03-04' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (119, 2, 1, 2, CAST(N'2021-03-05' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (145, 2, 1, 2, CAST(N'2021-03-06' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (171, 2, 1, 2, CAST(N'2021-03-07' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (197, 2, 1, 2, CAST(N'2021-03-08' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (223, 2, 1, 2, CAST(N'2021-03-09' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (249, 2, 1, 2, CAST(N'2021-03-10' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (288, 2, 1, 2, CAST(N'2021-03-11' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (314, 2, 1, 2, CAST(N'2021-03-12' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (340, 2, 1, 2, CAST(N'2021-03-13' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (366, 2, 1, 2, CAST(N'2021-03-14' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (392, 2, 1, 2, CAST(N'2021-03-15' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (431, 2, 1, 2, CAST(N'2021-03-16' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (457, 2, 1, 2, CAST(N'2021-03-17' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (485, 2, 1, 2, CAST(N'2021-03-18' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (511, 2, 1, 2, CAST(N'2021-03-19' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (524, 2, 1, 2, CAST(N'2021-03-20' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (563, 2, 1, 2, CAST(N'2021-03-21' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (602, 2, 1, 2, CAST(N'2021-03-22' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (470, 3, 2, 1, CAST(N'2021-03-28' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (406, 5, 1, 1, CAST(N'2021-02-28' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (276, 5, 1, 1, CAST(N'2021-03-01' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (29, 5, 1, 1, CAST(N'2021-03-02' AS Date), 1)
GO
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (55, 5, 1, 1, CAST(N'2021-03-03' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (81, 5, 1, 1, CAST(N'2021-03-04' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (107, 5, 1, 1, CAST(N'2021-03-05' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (133, 5, 1, 1, CAST(N'2021-03-06' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (159, 5, 1, 1, CAST(N'2021-03-07' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (185, 5, 1, 1, CAST(N'2021-03-08' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (211, 5, 1, 1, CAST(N'2021-03-09' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (237, 5, 1, 1, CAST(N'2021-03-10' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (263, 5, 1, 1, CAST(N'2021-03-11' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (302, 5, 1, 1, CAST(N'2021-03-12' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (328, 5, 1, 1, CAST(N'2021-03-13' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (354, 5, 1, 1, CAST(N'2021-03-14' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (380, 5, 1, 1, CAST(N'2021-03-15' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (419, 5, 1, 1, CAST(N'2021-03-16' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (445, 5, 1, 1, CAST(N'2021-03-17' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (473, 5, 1, 1, CAST(N'2021-03-18' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (499, 5, 1, 1, CAST(N'2021-03-19' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (538, 5, 1, 1, CAST(N'2021-03-20' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (551, 5, 1, 1, CAST(N'2021-03-21' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (629, 5, 1, 1, CAST(N'2021-03-22' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (642, 5, 1, 1, CAST(N'2021-03-30' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (1004, 5, 1, 1, CAST(N'2021-05-06' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (16, 5, 1, 2, CAST(N'2021-03-01' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (42, 5, 1, 2, CAST(N'2021-03-02' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (68, 5, 1, 2, CAST(N'2021-03-03' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (94, 5, 1, 2, CAST(N'2021-03-04' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (120, 5, 1, 2, CAST(N'2021-03-05' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (146, 5, 1, 2, CAST(N'2021-03-06' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (172, 5, 1, 2, CAST(N'2021-03-07' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (198, 5, 1, 2, CAST(N'2021-03-08' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (224, 5, 1, 2, CAST(N'2021-03-09' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (250, 5, 1, 2, CAST(N'2021-03-10' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (289, 5, 1, 2, CAST(N'2021-03-11' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (315, 5, 1, 2, CAST(N'2021-03-12' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (341, 5, 1, 2, CAST(N'2021-03-13' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (367, 5, 1, 2, CAST(N'2021-03-14' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (393, 5, 1, 2, CAST(N'2021-03-15' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (432, 5, 1, 2, CAST(N'2021-03-16' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (458, 5, 1, 2, CAST(N'2021-03-17' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (486, 5, 1, 2, CAST(N'2021-03-18' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (512, 5, 1, 2, CAST(N'2021-03-19' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (525, 5, 1, 2, CAST(N'2021-03-20' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (564, 5, 1, 2, CAST(N'2021-03-21' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (603, 5, 1, 2, CAST(N'2021-03-22' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (407, 6, 1, 1, CAST(N'2021-02-28' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (277, 6, 1, 1, CAST(N'2021-03-01' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (30, 6, 1, 1, CAST(N'2021-03-02' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (56, 6, 1, 1, CAST(N'2021-03-03' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (82, 6, 1, 1, CAST(N'2021-03-04' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (108, 6, 1, 1, CAST(N'2021-03-05' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (134, 6, 1, 1, CAST(N'2021-03-06' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (160, 6, 1, 1, CAST(N'2021-03-07' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (186, 6, 1, 1, CAST(N'2021-03-08' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (212, 6, 1, 1, CAST(N'2021-03-09' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (238, 6, 1, 1, CAST(N'2021-03-10' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (264, 6, 1, 1, CAST(N'2021-03-11' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (303, 6, 1, 1, CAST(N'2021-03-12' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (329, 6, 1, 1, CAST(N'2021-03-13' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (355, 6, 1, 1, CAST(N'2021-03-14' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (381, 6, 1, 1, CAST(N'2021-03-15' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (420, 6, 1, 1, CAST(N'2021-03-16' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (446, 6, 1, 1, CAST(N'2021-03-17' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (474, 6, 1, 1, CAST(N'2021-03-18' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (500, 6, 1, 1, CAST(N'2021-03-19' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (539, 6, 1, 1, CAST(N'2021-03-20' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (552, 6, 1, 1, CAST(N'2021-03-21' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (630, 6, 1, 1, CAST(N'2021-03-22' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (643, 6, 1, 1, CAST(N'2021-03-30' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (1005, 6, 1, 1, CAST(N'2021-05-06' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (17, 6, 1, 2, CAST(N'2021-03-01' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (43, 6, 1, 2, CAST(N'2021-03-02' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (69, 6, 1, 2, CAST(N'2021-03-03' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (95, 6, 1, 2, CAST(N'2021-03-04' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (121, 6, 1, 2, CAST(N'2021-03-05' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (147, 6, 1, 2, CAST(N'2021-03-06' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (173, 6, 1, 2, CAST(N'2021-03-07' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (199, 6, 1, 2, CAST(N'2021-03-08' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (225, 6, 1, 2, CAST(N'2021-03-09' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (251, 6, 1, 2, CAST(N'2021-03-10' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (290, 6, 1, 2, CAST(N'2021-03-11' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (316, 6, 1, 2, CAST(N'2021-03-12' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (342, 6, 1, 2, CAST(N'2021-03-13' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (368, 6, 1, 2, CAST(N'2021-03-14' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (394, 6, 1, 2, CAST(N'2021-03-15' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (433, 6, 1, 2, CAST(N'2021-03-16' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (459, 6, 1, 2, CAST(N'2021-03-17' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (487, 6, 1, 2, CAST(N'2021-03-18' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (513, 6, 1, 2, CAST(N'2021-03-19' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (526, 6, 1, 2, CAST(N'2021-03-20' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (565, 6, 1, 2, CAST(N'2021-03-21' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (604, 6, 1, 2, CAST(N'2021-03-22' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (408, 7, 1, 1, CAST(N'2021-02-28' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (278, 7, 1, 1, CAST(N'2021-03-01' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (31, 7, 1, 1, CAST(N'2021-03-02' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (57, 7, 1, 1, CAST(N'2021-03-03' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (83, 7, 1, 1, CAST(N'2021-03-04' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (109, 7, 1, 1, CAST(N'2021-03-05' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (135, 7, 1, 1, CAST(N'2021-03-06' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (161, 7, 1, 1, CAST(N'2021-03-07' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (187, 7, 1, 1, CAST(N'2021-03-08' AS Date), 1)
GO
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (213, 7, 1, 1, CAST(N'2021-03-09' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (239, 7, 1, 1, CAST(N'2021-03-10' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (265, 7, 1, 1, CAST(N'2021-03-11' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (304, 7, 1, 1, CAST(N'2021-03-12' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (330, 7, 1, 1, CAST(N'2021-03-13' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (356, 7, 1, 1, CAST(N'2021-03-14' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (382, 7, 1, 1, CAST(N'2021-03-15' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (421, 7, 1, 1, CAST(N'2021-03-16' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (447, 7, 1, 1, CAST(N'2021-03-17' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (475, 7, 1, 1, CAST(N'2021-03-18' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (501, 7, 1, 1, CAST(N'2021-03-19' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (540, 7, 1, 1, CAST(N'2021-03-20' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (553, 7, 1, 1, CAST(N'2021-03-21' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (631, 7, 1, 1, CAST(N'2021-03-22' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (644, 7, 1, 1, CAST(N'2021-03-30' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (1006, 7, 1, 1, CAST(N'2021-05-06' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (18, 7, 1, 2, CAST(N'2021-03-01' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (44, 7, 1, 2, CAST(N'2021-03-02' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (70, 7, 1, 2, CAST(N'2021-03-03' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (96, 7, 1, 2, CAST(N'2021-03-04' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (122, 7, 1, 2, CAST(N'2021-03-05' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (148, 7, 1, 2, CAST(N'2021-03-06' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (174, 7, 1, 2, CAST(N'2021-03-07' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (200, 7, 1, 2, CAST(N'2021-03-08' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (226, 7, 1, 2, CAST(N'2021-03-09' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (252, 7, 1, 2, CAST(N'2021-03-10' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (291, 7, 1, 2, CAST(N'2021-03-11' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (317, 7, 1, 2, CAST(N'2021-03-12' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (343, 7, 1, 2, CAST(N'2021-03-13' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (369, 7, 1, 2, CAST(N'2021-03-14' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (395, 7, 1, 2, CAST(N'2021-03-15' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (434, 7, 1, 2, CAST(N'2021-03-16' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (460, 7, 1, 2, CAST(N'2021-03-17' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (488, 7, 1, 2, CAST(N'2021-03-18' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (514, 7, 1, 2, CAST(N'2021-03-19' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (527, 7, 1, 2, CAST(N'2021-03-20' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (566, 7, 1, 2, CAST(N'2021-03-21' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (605, 7, 1, 2, CAST(N'2021-03-22' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (409, 8, 1, 1, CAST(N'2021-02-28' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (279, 8, 1, 1, CAST(N'2021-03-01' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (32, 8, 1, 1, CAST(N'2021-03-02' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (58, 8, 1, 1, CAST(N'2021-03-03' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (84, 8, 1, 1, CAST(N'2021-03-04' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (110, 8, 1, 1, CAST(N'2021-03-05' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (136, 8, 1, 1, CAST(N'2021-03-06' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (162, 8, 1, 1, CAST(N'2021-03-07' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (188, 8, 1, 1, CAST(N'2021-03-08' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (214, 8, 1, 1, CAST(N'2021-03-09' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (240, 8, 1, 1, CAST(N'2021-03-10' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (266, 8, 1, 1, CAST(N'2021-03-11' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (305, 8, 1, 1, CAST(N'2021-03-12' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (331, 8, 1, 1, CAST(N'2021-03-13' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (357, 8, 1, 1, CAST(N'2021-03-14' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (383, 8, 1, 1, CAST(N'2021-03-15' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (422, 8, 1, 1, CAST(N'2021-03-16' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (448, 8, 1, 1, CAST(N'2021-03-17' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (476, 8, 1, 1, CAST(N'2021-03-18' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (502, 8, 1, 1, CAST(N'2021-03-19' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (541, 8, 1, 1, CAST(N'2021-03-20' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (554, 8, 1, 1, CAST(N'2021-03-21' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (632, 8, 1, 1, CAST(N'2021-03-22' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (645, 8, 1, 1, CAST(N'2021-03-30' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (1007, 8, 1, 1, CAST(N'2021-05-06' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (19, 8, 1, 2, CAST(N'2021-03-01' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (45, 8, 1, 2, CAST(N'2021-03-02' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (71, 8, 1, 2, CAST(N'2021-03-03' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (97, 8, 1, 2, CAST(N'2021-03-04' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (123, 8, 1, 2, CAST(N'2021-03-05' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (149, 8, 1, 2, CAST(N'2021-03-06' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (175, 8, 1, 2, CAST(N'2021-03-07' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (201, 8, 1, 2, CAST(N'2021-03-08' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (227, 8, 1, 2, CAST(N'2021-03-09' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (253, 8, 1, 2, CAST(N'2021-03-10' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (292, 8, 1, 2, CAST(N'2021-03-11' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (318, 8, 1, 2, CAST(N'2021-03-12' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (344, 8, 1, 2, CAST(N'2021-03-13' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (370, 8, 1, 2, CAST(N'2021-03-14' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (396, 8, 1, 2, CAST(N'2021-03-15' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (435, 8, 1, 2, CAST(N'2021-03-16' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (461, 8, 1, 2, CAST(N'2021-03-17' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (489, 8, 1, 2, CAST(N'2021-03-18' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (515, 8, 1, 2, CAST(N'2021-03-19' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (528, 8, 1, 2, CAST(N'2021-03-20' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (567, 8, 1, 2, CAST(N'2021-03-21' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (606, 8, 1, 2, CAST(N'2021-03-22' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (410, 9, 1, 1, CAST(N'2021-02-28' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (280, 9, 1, 1, CAST(N'2021-03-01' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (33, 9, 1, 1, CAST(N'2021-03-02' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (59, 9, 1, 1, CAST(N'2021-03-03' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (85, 9, 1, 1, CAST(N'2021-03-04' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (111, 9, 1, 1, CAST(N'2021-03-05' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (137, 9, 1, 1, CAST(N'2021-03-06' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (163, 9, 1, 1, CAST(N'2021-03-07' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (189, 9, 1, 1, CAST(N'2021-03-08' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (215, 9, 1, 1, CAST(N'2021-03-09' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (241, 9, 1, 1, CAST(N'2021-03-10' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (267, 9, 1, 1, CAST(N'2021-03-11' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (306, 9, 1, 1, CAST(N'2021-03-12' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (332, 9, 1, 1, CAST(N'2021-03-13' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (358, 9, 1, 1, CAST(N'2021-03-14' AS Date), 1)
GO
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (384, 9, 1, 1, CAST(N'2021-03-15' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (423, 9, 1, 1, CAST(N'2021-03-16' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (449, 9, 1, 1, CAST(N'2021-03-17' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (477, 9, 1, 1, CAST(N'2021-03-18' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (503, 9, 1, 1, CAST(N'2021-03-19' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (542, 9, 1, 1, CAST(N'2021-03-20' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (555, 9, 1, 1, CAST(N'2021-03-21' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (633, 9, 1, 1, CAST(N'2021-03-22' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (646, 9, 1, 1, CAST(N'2021-03-30' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (1008, 9, 1, 1, CAST(N'2021-05-06' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (20, 9, 1, 2, CAST(N'2021-03-01' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (46, 9, 1, 2, CAST(N'2021-03-02' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (72, 9, 1, 2, CAST(N'2021-03-03' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (98, 9, 1, 2, CAST(N'2021-03-04' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (124, 9, 1, 2, CAST(N'2021-03-05' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (150, 9, 1, 2, CAST(N'2021-03-06' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (176, 9, 1, 2, CAST(N'2021-03-07' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (202, 9, 1, 2, CAST(N'2021-03-08' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (228, 9, 1, 2, CAST(N'2021-03-09' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (254, 9, 1, 2, CAST(N'2021-03-10' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (293, 9, 1, 2, CAST(N'2021-03-11' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (319, 9, 1, 2, CAST(N'2021-03-12' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (345, 9, 1, 2, CAST(N'2021-03-13' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (371, 9, 1, 2, CAST(N'2021-03-14' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (397, 9, 1, 2, CAST(N'2021-03-15' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (436, 9, 1, 2, CAST(N'2021-03-16' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (462, 9, 1, 2, CAST(N'2021-03-17' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (490, 9, 1, 2, CAST(N'2021-03-18' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (516, 9, 1, 2, CAST(N'2021-03-19' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (529, 9, 1, 2, CAST(N'2021-03-20' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (568, 9, 1, 2, CAST(N'2021-03-21' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (607, 9, 1, 2, CAST(N'2021-03-22' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (411, 10, 1, 1, CAST(N'2021-02-28' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (281, 10, 1, 1, CAST(N'2021-03-01' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (34, 10, 1, 1, CAST(N'2021-03-02' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (60, 10, 1, 1, CAST(N'2021-03-03' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (86, 10, 1, 1, CAST(N'2021-03-04' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (112, 10, 1, 1, CAST(N'2021-03-05' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (138, 10, 1, 1, CAST(N'2021-03-06' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (164, 10, 1, 1, CAST(N'2021-03-07' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (190, 10, 1, 1, CAST(N'2021-03-08' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (216, 10, 1, 1, CAST(N'2021-03-09' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (242, 10, 1, 1, CAST(N'2021-03-10' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (268, 10, 1, 1, CAST(N'2021-03-11' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (307, 10, 1, 1, CAST(N'2021-03-12' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (333, 10, 1, 1, CAST(N'2021-03-13' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (359, 10, 1, 1, CAST(N'2021-03-14' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (385, 10, 1, 1, CAST(N'2021-03-15' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (424, 10, 1, 1, CAST(N'2021-03-16' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (450, 10, 1, 1, CAST(N'2021-03-17' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (478, 10, 1, 1, CAST(N'2021-03-18' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (504, 10, 1, 1, CAST(N'2021-03-19' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (543, 10, 1, 1, CAST(N'2021-03-20' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (556, 10, 1, 1, CAST(N'2021-03-21' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (634, 10, 1, 1, CAST(N'2021-03-22' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (647, 10, 1, 1, CAST(N'2021-03-30' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (1009, 10, 1, 1, CAST(N'2021-05-06' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (21, 10, 1, 2, CAST(N'2021-03-01' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (47, 10, 1, 2, CAST(N'2021-03-02' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (73, 10, 1, 2, CAST(N'2021-03-03' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (99, 10, 1, 2, CAST(N'2021-03-04' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (125, 10, 1, 2, CAST(N'2021-03-05' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (151, 10, 1, 2, CAST(N'2021-03-06' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (177, 10, 1, 2, CAST(N'2021-03-07' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (203, 10, 1, 2, CAST(N'2021-03-08' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (229, 10, 1, 2, CAST(N'2021-03-09' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (255, 10, 1, 2, CAST(N'2021-03-10' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (294, 10, 1, 2, CAST(N'2021-03-11' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (320, 10, 1, 2, CAST(N'2021-03-12' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (346, 10, 1, 2, CAST(N'2021-03-13' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (372, 10, 1, 2, CAST(N'2021-03-14' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (398, 10, 1, 2, CAST(N'2021-03-15' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (437, 10, 1, 2, CAST(N'2021-03-16' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (463, 10, 1, 2, CAST(N'2021-03-17' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (491, 10, 1, 2, CAST(N'2021-03-18' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (517, 10, 1, 2, CAST(N'2021-03-19' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (530, 10, 1, 2, CAST(N'2021-03-20' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (569, 10, 1, 2, CAST(N'2021-03-21' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (608, 10, 1, 2, CAST(N'2021-03-22' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (412, 11, 1, 1, CAST(N'2021-02-28' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (282, 11, 1, 1, CAST(N'2021-03-01' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (35, 11, 1, 1, CAST(N'2021-03-02' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (61, 11, 1, 1, CAST(N'2021-03-03' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (87, 11, 1, 1, CAST(N'2021-03-04' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (113, 11, 1, 1, CAST(N'2021-03-05' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (139, 11, 1, 1, CAST(N'2021-03-06' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (165, 11, 1, 1, CAST(N'2021-03-07' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (191, 11, 1, 1, CAST(N'2021-03-08' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (217, 11, 1, 1, CAST(N'2021-03-09' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (243, 11, 1, 1, CAST(N'2021-03-10' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (269, 11, 1, 1, CAST(N'2021-03-11' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (308, 11, 1, 1, CAST(N'2021-03-12' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (334, 11, 1, 1, CAST(N'2021-03-13' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (360, 11, 1, 1, CAST(N'2021-03-14' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (386, 11, 1, 1, CAST(N'2021-03-15' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (425, 11, 1, 1, CAST(N'2021-03-16' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (451, 11, 1, 1, CAST(N'2021-03-17' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (479, 11, 1, 1, CAST(N'2021-03-18' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (505, 11, 1, 1, CAST(N'2021-03-19' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (544, 11, 1, 1, CAST(N'2021-03-20' AS Date), 1)
GO
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (557, 11, 1, 1, CAST(N'2021-03-21' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (635, 11, 1, 1, CAST(N'2021-03-22' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (648, 11, 1, 1, CAST(N'2021-03-30' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (1010, 11, 1, 1, CAST(N'2021-05-06' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (22, 11, 1, 2, CAST(N'2021-03-01' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (48, 11, 1, 2, CAST(N'2021-03-02' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (74, 11, 1, 2, CAST(N'2021-03-03' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (100, 11, 1, 2, CAST(N'2021-03-04' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (126, 11, 1, 2, CAST(N'2021-03-05' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (152, 11, 1, 2, CAST(N'2021-03-06' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (178, 11, 1, 2, CAST(N'2021-03-07' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (204, 11, 1, 2, CAST(N'2021-03-08' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (230, 11, 1, 2, CAST(N'2021-03-09' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (256, 11, 1, 2, CAST(N'2021-03-10' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (295, 11, 1, 2, CAST(N'2021-03-11' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (321, 11, 1, 2, CAST(N'2021-03-12' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (347, 11, 1, 2, CAST(N'2021-03-13' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (373, 11, 1, 2, CAST(N'2021-03-14' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (399, 11, 1, 2, CAST(N'2021-03-15' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (438, 11, 1, 2, CAST(N'2021-03-16' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (464, 11, 1, 2, CAST(N'2021-03-17' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (492, 11, 1, 2, CAST(N'2021-03-18' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (518, 11, 1, 2, CAST(N'2021-03-19' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (531, 11, 1, 2, CAST(N'2021-03-20' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (570, 11, 1, 2, CAST(N'2021-03-21' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (609, 11, 1, 2, CAST(N'2021-03-22' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (413, 12, 1, 1, CAST(N'2021-02-28' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (283, 12, 1, 1, CAST(N'2021-03-01' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (36, 12, 1, 1, CAST(N'2021-03-02' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (62, 12, 1, 1, CAST(N'2021-03-03' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (88, 12, 1, 1, CAST(N'2021-03-04' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (114, 12, 1, 1, CAST(N'2021-03-05' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (140, 12, 1, 1, CAST(N'2021-03-06' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (166, 12, 1, 1, CAST(N'2021-03-07' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (192, 12, 1, 1, CAST(N'2021-03-08' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (218, 12, 1, 1, CAST(N'2021-03-09' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (244, 12, 1, 1, CAST(N'2021-03-10' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (270, 12, 1, 1, CAST(N'2021-03-11' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (309, 12, 1, 1, CAST(N'2021-03-12' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (335, 12, 1, 1, CAST(N'2021-03-13' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (361, 12, 1, 1, CAST(N'2021-03-14' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (387, 12, 1, 1, CAST(N'2021-03-15' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (426, 12, 1, 1, CAST(N'2021-03-16' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (452, 12, 1, 1, CAST(N'2021-03-17' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (480, 12, 1, 1, CAST(N'2021-03-18' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (506, 12, 1, 1, CAST(N'2021-03-19' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (545, 12, 1, 1, CAST(N'2021-03-20' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (558, 12, 1, 1, CAST(N'2021-03-21' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (636, 12, 1, 1, CAST(N'2021-03-22' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (649, 12, 1, 1, CAST(N'2021-03-30' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (1011, 12, 1, 1, CAST(N'2021-05-06' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (23, 12, 1, 2, CAST(N'2021-03-01' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (49, 12, 1, 2, CAST(N'2021-03-02' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (75, 12, 1, 2, CAST(N'2021-03-03' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (101, 12, 1, 2, CAST(N'2021-03-04' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (127, 12, 1, 2, CAST(N'2021-03-05' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (153, 12, 1, 2, CAST(N'2021-03-06' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (179, 12, 1, 2, CAST(N'2021-03-07' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (205, 12, 1, 2, CAST(N'2021-03-08' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (231, 12, 1, 2, CAST(N'2021-03-09' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (257, 12, 1, 2, CAST(N'2021-03-10' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (296, 12, 1, 2, CAST(N'2021-03-11' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (322, 12, 1, 2, CAST(N'2021-03-12' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (348, 12, 1, 2, CAST(N'2021-03-13' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (374, 12, 1, 2, CAST(N'2021-03-14' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (400, 12, 1, 2, CAST(N'2021-03-15' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (439, 12, 1, 2, CAST(N'2021-03-16' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (465, 12, 1, 2, CAST(N'2021-03-17' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (493, 12, 1, 2, CAST(N'2021-03-18' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (519, 12, 1, 2, CAST(N'2021-03-19' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (532, 12, 1, 2, CAST(N'2021-03-20' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (571, 12, 1, 2, CAST(N'2021-03-21' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (610, 12, 1, 2, CAST(N'2021-03-22' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (414, 13, 1, 1, CAST(N'2021-02-28' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (284, 13, 1, 1, CAST(N'2021-03-01' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (37, 13, 1, 1, CAST(N'2021-03-02' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (63, 13, 1, 1, CAST(N'2021-03-03' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (89, 13, 1, 1, CAST(N'2021-03-04' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (115, 13, 1, 1, CAST(N'2021-03-05' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (141, 13, 1, 1, CAST(N'2021-03-06' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (167, 13, 1, 1, CAST(N'2021-03-07' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (193, 13, 1, 1, CAST(N'2021-03-08' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (219, 13, 1, 1, CAST(N'2021-03-09' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (245, 13, 1, 1, CAST(N'2021-03-10' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (271, 13, 1, 1, CAST(N'2021-03-11' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (310, 13, 1, 1, CAST(N'2021-03-12' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (336, 13, 1, 1, CAST(N'2021-03-13' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (362, 13, 1, 1, CAST(N'2021-03-14' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (388, 13, 1, 1, CAST(N'2021-03-15' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (427, 13, 1, 1, CAST(N'2021-03-16' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (453, 13, 1, 1, CAST(N'2021-03-17' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (481, 13, 1, 1, CAST(N'2021-03-18' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (507, 13, 1, 1, CAST(N'2021-03-19' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (546, 13, 1, 1, CAST(N'2021-03-20' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (559, 13, 1, 1, CAST(N'2021-03-21' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (637, 13, 1, 1, CAST(N'2021-03-22' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (650, 13, 1, 1, CAST(N'2021-03-30' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (1012, 13, 1, 1, CAST(N'2021-05-06' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (24, 13, 1, 2, CAST(N'2021-03-01' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (50, 13, 1, 2, CAST(N'2021-03-02' AS Date), 0)
GO
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (76, 13, 1, 2, CAST(N'2021-03-03' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (102, 13, 1, 2, CAST(N'2021-03-04' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (128, 13, 1, 2, CAST(N'2021-03-05' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (154, 13, 1, 2, CAST(N'2021-03-06' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (180, 13, 1, 2, CAST(N'2021-03-07' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (206, 13, 1, 2, CAST(N'2021-03-08' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (232, 13, 1, 2, CAST(N'2021-03-09' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (258, 13, 1, 2, CAST(N'2021-03-10' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (297, 13, 1, 2, CAST(N'2021-03-11' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (323, 13, 1, 2, CAST(N'2021-03-12' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (349, 13, 1, 2, CAST(N'2021-03-13' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (375, 13, 1, 2, CAST(N'2021-03-14' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (401, 13, 1, 2, CAST(N'2021-03-15' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (440, 13, 1, 2, CAST(N'2021-03-16' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (466, 13, 1, 2, CAST(N'2021-03-17' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (494, 13, 1, 2, CAST(N'2021-03-18' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (520, 13, 1, 2, CAST(N'2021-03-19' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (533, 13, 1, 2, CAST(N'2021-03-20' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (572, 13, 1, 2, CAST(N'2021-03-21' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (611, 13, 1, 2, CAST(N'2021-03-22' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (415, 14, 1, 1, CAST(N'2021-02-28' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (285, 14, 1, 1, CAST(N'2021-03-01' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (38, 14, 1, 1, CAST(N'2021-03-02' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (64, 14, 1, 1, CAST(N'2021-03-03' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (90, 14, 1, 1, CAST(N'2021-03-04' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (116, 14, 1, 1, CAST(N'2021-03-05' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (142, 14, 1, 1, CAST(N'2021-03-06' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (168, 14, 1, 1, CAST(N'2021-03-07' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (194, 14, 1, 1, CAST(N'2021-03-08' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (220, 14, 1, 1, CAST(N'2021-03-09' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (246, 14, 1, 1, CAST(N'2021-03-10' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (272, 14, 1, 1, CAST(N'2021-03-11' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (311, 14, 1, 1, CAST(N'2021-03-12' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (337, 14, 1, 1, CAST(N'2021-03-13' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (363, 14, 1, 1, CAST(N'2021-03-14' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (389, 14, 1, 1, CAST(N'2021-03-15' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (428, 14, 1, 1, CAST(N'2021-03-16' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (454, 14, 1, 1, CAST(N'2021-03-17' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (482, 14, 1, 1, CAST(N'2021-03-18' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (508, 14, 1, 1, CAST(N'2021-03-19' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (547, 14, 1, 1, CAST(N'2021-03-20' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (560, 14, 1, 1, CAST(N'2021-03-21' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (638, 14, 1, 1, CAST(N'2021-03-22' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (651, 14, 1, 1, CAST(N'2021-03-30' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (1013, 14, 1, 1, CAST(N'2021-05-06' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (25, 14, 1, 2, CAST(N'2021-03-01' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (51, 14, 1, 2, CAST(N'2021-03-02' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (77, 14, 1, 2, CAST(N'2021-03-03' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (103, 14, 1, 2, CAST(N'2021-03-04' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (129, 14, 1, 2, CAST(N'2021-03-05' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (155, 14, 1, 2, CAST(N'2021-03-06' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (181, 14, 1, 2, CAST(N'2021-03-07' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (207, 14, 1, 2, CAST(N'2021-03-08' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (233, 14, 1, 2, CAST(N'2021-03-09' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (259, 14, 1, 2, CAST(N'2021-03-10' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (298, 14, 1, 2, CAST(N'2021-03-11' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (324, 14, 1, 2, CAST(N'2021-03-12' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (350, 14, 1, 2, CAST(N'2021-03-13' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (376, 14, 1, 2, CAST(N'2021-03-14' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (402, 14, 1, 2, CAST(N'2021-03-15' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (441, 14, 1, 2, CAST(N'2021-03-16' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (467, 14, 1, 2, CAST(N'2021-03-17' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (495, 14, 1, 2, CAST(N'2021-03-18' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (521, 14, 1, 2, CAST(N'2021-03-19' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (534, 14, 1, 2, CAST(N'2021-03-20' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (573, 14, 1, 2, CAST(N'2021-03-21' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (612, 14, 1, 2, CAST(N'2021-03-22' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (416, 15, 1, 1, CAST(N'2021-02-28' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (286, 15, 1, 1, CAST(N'2021-03-01' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (39, 15, 1, 1, CAST(N'2021-03-02' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (65, 15, 1, 1, CAST(N'2021-03-03' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (91, 15, 1, 1, CAST(N'2021-03-04' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (117, 15, 1, 1, CAST(N'2021-03-05' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (143, 15, 1, 1, CAST(N'2021-03-06' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (169, 15, 1, 1, CAST(N'2021-03-07' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (195, 15, 1, 1, CAST(N'2021-03-08' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (221, 15, 1, 1, CAST(N'2021-03-09' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (247, 15, 1, 1, CAST(N'2021-03-10' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (273, 15, 1, 1, CAST(N'2021-03-11' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (312, 15, 1, 1, CAST(N'2021-03-12' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (338, 15, 1, 1, CAST(N'2021-03-13' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (364, 15, 1, 1, CAST(N'2021-03-14' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (390, 15, 1, 1, CAST(N'2021-03-15' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (429, 15, 1, 1, CAST(N'2021-03-16' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (455, 15, 1, 1, CAST(N'2021-03-17' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (483, 15, 1, 1, CAST(N'2021-03-18' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (509, 15, 1, 1, CAST(N'2021-03-19' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (548, 15, 1, 1, CAST(N'2021-03-20' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (561, 15, 1, 1, CAST(N'2021-03-21' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (639, 15, 1, 1, CAST(N'2021-03-22' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (652, 15, 1, 1, CAST(N'2021-03-30' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (1014, 15, 1, 1, CAST(N'2021-05-06' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (26, 15, 1, 2, CAST(N'2021-03-01' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (52, 15, 1, 2, CAST(N'2021-03-02' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (78, 15, 1, 2, CAST(N'2021-03-03' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (104, 15, 1, 2, CAST(N'2021-03-04' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (130, 15, 1, 2, CAST(N'2021-03-05' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (156, 15, 1, 2, CAST(N'2021-03-06' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (182, 15, 1, 2, CAST(N'2021-03-07' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (208, 15, 1, 2, CAST(N'2021-03-08' AS Date), 0)
GO
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (234, 15, 1, 2, CAST(N'2021-03-09' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (260, 15, 1, 2, CAST(N'2021-03-10' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (299, 15, 1, 2, CAST(N'2021-03-11' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (325, 15, 1, 2, CAST(N'2021-03-12' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (351, 15, 1, 2, CAST(N'2021-03-13' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (377, 15, 1, 2, CAST(N'2021-03-14' AS Date), 0)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (403, 15, 1, 2, CAST(N'2021-03-15' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (442, 15, 1, 2, CAST(N'2021-03-16' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (468, 15, 1, 2, CAST(N'2021-03-17' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (496, 15, 1, 2, CAST(N'2021-03-18' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (522, 15, 1, 2, CAST(N'2021-03-19' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (535, 15, 1, 2, CAST(N'2021-03-20' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (574, 15, 1, 2, CAST(N'2021-03-21' AS Date), 1)
INSERT [dbo].[ChamCong] ([id], [congnhanid], [congtrinhid], [pid], [date], [status]) VALUES (613, 15, 1, 2, CAST(N'2021-03-22' AS Date), 0)
SET IDENTITY_INSERT [dbo].[ChamCong] OFF
GO
INSERT [dbo].[CongNhan] ([id], [name], [address], [gender], [dob]) VALUES (1, N'Nguyễn Văn Mạnh', N'Bắc Giang', 1, CAST(N'2020-12-02' AS Date))
INSERT [dbo].[CongNhan] ([id], [name], [address], [gender], [dob]) VALUES (2, N'Nguyễn Bá Trang', N'Bắc Ninh', 1, CAST(N'2000-08-15' AS Date))
INSERT [dbo].[CongNhan] ([id], [name], [address], [gender], [dob]) VALUES (3, N'Ngô Tùng Sơn', N'Hà Nội', 1, CAST(N'2000-07-21' AS Date))
INSERT [dbo].[CongNhan] ([id], [name], [address], [gender], [dob]) VALUES (4, N'Vương Minh Tuấn', N'Ha Noi', 1, CAST(N'2000-06-20' AS Date))
INSERT [dbo].[CongNhan] ([id], [name], [address], [gender], [dob]) VALUES (5, N'Biện Văn Công', N'Hà Tĩnh', 1, CAST(N'2000-06-20' AS Date))
INSERT [dbo].[CongNhan] ([id], [name], [address], [gender], [dob]) VALUES (6, N'Ngô Bá Khá', N'Bắc Ninh', 1, CAST(N'1999-07-21' AS Date))
INSERT [dbo].[CongNhan] ([id], [name], [address], [gender], [dob]) VALUES (7, N'Lê Đình Thoan', N'Hà Tĩnh', 1, CAST(N'1985-06-12' AS Date))
INSERT [dbo].[CongNhan] ([id], [name], [address], [gender], [dob]) VALUES (8, N'Nguyễn Thành Long', N'Hà Tĩnh', 1, CAST(N'1984-03-11' AS Date))
INSERT [dbo].[CongNhan] ([id], [name], [address], [gender], [dob]) VALUES (9, N'Hoàng Đình Thắng', N'Hà Tĩnh', 1, CAST(N'1982-02-12' AS Date))
INSERT [dbo].[CongNhan] ([id], [name], [address], [gender], [dob]) VALUES (10, N'Nguyễn Văn Dũng', N'Hà Tĩnh', 1, CAST(N'1981-04-17' AS Date))
INSERT [dbo].[CongNhan] ([id], [name], [address], [gender], [dob]) VALUES (11, N'Nguyễn Văn Tuấn', N'Hà Tĩnh', 1, CAST(N'1974-03-12' AS Date))
INSERT [dbo].[CongNhan] ([id], [name], [address], [gender], [dob]) VALUES (12, N'Hồ Văn Hoàng', N'Hà Tĩnh', 1, CAST(N'1998-05-19' AS Date))
INSERT [dbo].[CongNhan] ([id], [name], [address], [gender], [dob]) VALUES (13, N'Nguyễn Ngọc Lợi', N'Hà Tĩnh', 1, CAST(N'1994-02-11' AS Date))
INSERT [dbo].[CongNhan] ([id], [name], [address], [gender], [dob]) VALUES (14, N'Hà Văn Thắng', N'Hà Tĩnh', 1, CAST(N'1993-01-02' AS Date))
INSERT [dbo].[CongNhan] ([id], [name], [address], [gender], [dob]) VALUES (15, N'Nguyễn Tất Thắng', N'Ha Tinh', 1, CAST(N'1990-04-19' AS Date))
GO
INSERT [dbo].[CongNhan_Account] ([cid], [username]) VALUES (1, N'manhnv')
INSERT [dbo].[CongNhan_Account] ([cid], [username]) VALUES (2, N'trangnb')
INSERT [dbo].[CongNhan_Account] ([cid], [username]) VALUES (3, N'sonnt')
INSERT [dbo].[CongNhan_Account] ([cid], [username]) VALUES (4, N'tuanvm')
INSERT [dbo].[CongNhan_Account] ([cid], [username]) VALUES (5, N'congbv')
GO
INSERT [dbo].[Congnhan_CongTrinh] ([cid], [congnhanid]) VALUES (1, 1)
INSERT [dbo].[Congnhan_CongTrinh] ([cid], [congnhanid]) VALUES (1, 2)
INSERT [dbo].[Congnhan_CongTrinh] ([cid], [congnhanid]) VALUES (1, 5)
INSERT [dbo].[Congnhan_CongTrinh] ([cid], [congnhanid]) VALUES (1, 6)
INSERT [dbo].[Congnhan_CongTrinh] ([cid], [congnhanid]) VALUES (1, 7)
INSERT [dbo].[Congnhan_CongTrinh] ([cid], [congnhanid]) VALUES (1, 8)
INSERT [dbo].[Congnhan_CongTrinh] ([cid], [congnhanid]) VALUES (1, 9)
INSERT [dbo].[Congnhan_CongTrinh] ([cid], [congnhanid]) VALUES (1, 10)
INSERT [dbo].[Congnhan_CongTrinh] ([cid], [congnhanid]) VALUES (1, 11)
INSERT [dbo].[Congnhan_CongTrinh] ([cid], [congnhanid]) VALUES (1, 12)
INSERT [dbo].[Congnhan_CongTrinh] ([cid], [congnhanid]) VALUES (1, 13)
INSERT [dbo].[Congnhan_CongTrinh] ([cid], [congnhanid]) VALUES (1, 14)
INSERT [dbo].[Congnhan_CongTrinh] ([cid], [congnhanid]) VALUES (1, 15)
INSERT [dbo].[Congnhan_CongTrinh] ([cid], [congnhanid]) VALUES (2, 1)
INSERT [dbo].[Congnhan_CongTrinh] ([cid], [congnhanid]) VALUES (2, 3)
INSERT [dbo].[Congnhan_CongTrinh] ([cid], [congnhanid]) VALUES (3, 4)
GO
INSERT [dbo].[CongNhan_CongViec] ([cid], [cvid]) VALUES (1, 1)
INSERT [dbo].[CongNhan_CongViec] ([cid], [cvid]) VALUES (2, 2)
INSERT [dbo].[CongNhan_CongViec] ([cid], [cvid]) VALUES (3, 1)
INSERT [dbo].[CongNhan_CongViec] ([cid], [cvid]) VALUES (4, 1)
GO
INSERT [dbo].[CongTrinh] ([id], [name], [address], [begintime], [endtime], [statusCongtrinh]) VALUES (1, N'Sua Chua Truong Hoc', N'Hai Duong', CAST(N'2021-02-01' AS Date), NULL, 0)
INSERT [dbo].[CongTrinh] ([id], [name], [address], [begintime], [endtime], [statusCongtrinh]) VALUES (2, N'Khach San Muong Thanh', N'Nghe An', CAST(N'2021-01-02' AS Date), NULL, 0)
INSERT [dbo].[CongTrinh] ([id], [name], [address], [begintime], [endtime], [statusCongtrinh]) VALUES (3, N'Nha Tho Ho Le', N'Ha Tinh', CAST(N'2021-01-01' AS Date), NULL, 1)
GO
INSERT [dbo].[CongViec] ([id], [name], [salary]) VALUES (1, N'Tho Chinh', 350000)
INSERT [dbo].[CongViec] ([id], [name], [salary]) VALUES (2, N'Tho Phu', 300000)
GO
INSERT [dbo].[Feature] ([id], [url]) VALUES (1, N'/quanlicongtrinh')
INSERT [dbo].[Feature] ([id], [url]) VALUES (2, N'/home')
INSERT [dbo].[Feature] ([id], [url]) VALUES (3, N'/thongke')
INSERT [dbo].[Feature] ([id], [url]) VALUES (4, N'/user')
INSERT [dbo].[Feature] ([id], [url]) VALUES (5, N'/attendreport')
INSERT [dbo].[Feature] ([id], [url]) VALUES (6, N'/changesalary')
INSERT [dbo].[Feature] ([id], [url]) VALUES (7, N'/viewapplication')
INSERT [dbo].[Feature] ([id], [url]) VALUES (8, N'/applicationprocessing')
INSERT [dbo].[Feature] ([id], [url]) VALUES (9, N'/application')
INSERT [dbo].[Feature] ([id], [url]) VALUES (10, N'/applicationprocessed')
INSERT [dbo].[Feature] ([id], [url]) VALUES (11, N'/userdetails')
INSERT [dbo].[Feature] ([id], [url]) VALUES (12, N'/viewsalary')
INSERT [dbo].[Feature] ([id], [url]) VALUES (13, N'/salarydetails')
GO
INSERT [dbo].[Feature_Group] ([fid], [gid]) VALUES (1, 1)
INSERT [dbo].[Feature_Group] ([fid], [gid]) VALUES (2, 1)
INSERT [dbo].[Feature_Group] ([fid], [gid]) VALUES (3, 1)
INSERT [dbo].[Feature_Group] ([fid], [gid]) VALUES (4, 2)
INSERT [dbo].[Feature_Group] ([fid], [gid]) VALUES (5, 2)
INSERT [dbo].[Feature_Group] ([fid], [gid]) VALUES (6, 1)
INSERT [dbo].[Feature_Group] ([fid], [gid]) VALUES (7, 2)
INSERT [dbo].[Feature_Group] ([fid], [gid]) VALUES (8, 1)
INSERT [dbo].[Feature_Group] ([fid], [gid]) VALUES (9, 2)
INSERT [dbo].[Feature_Group] ([fid], [gid]) VALUES (10, 1)
INSERT [dbo].[Feature_Group] ([fid], [gid]) VALUES (11, 2)
INSERT [dbo].[Feature_Group] ([fid], [gid]) VALUES (12, 1)
INSERT [dbo].[Feature_Group] ([fid], [gid]) VALUES (13, 1)
GO
INSERT [dbo].[Group] ([gid], [name]) VALUES (1, N'admin')
INSERT [dbo].[Group] ([gid], [name]) VALUES (2, N'user')
GO
INSERT [dbo].[Group_Account] ([gid], [username]) VALUES (1, N'cong')
INSERT [dbo].[Group_Account] ([gid], [username]) VALUES (2, N'manhnv')
INSERT [dbo].[Group_Account] ([gid], [username]) VALUES (2, N'sonnt')
INSERT [dbo].[Group_Account] ([gid], [username]) VALUES (2, N'trangnb')
INSERT [dbo].[Group_Account] ([gid], [username]) VALUES (2, N'tuanvm')
GO
INSERT [dbo].[Phien_LV] ([pid], [sessionName]) VALUES (1, N'sáng')
INSERT [dbo].[Phien_LV] ([pid], [sessionName]) VALUES (2, N'chiều')
GO
INSERT [dbo].[SalaryHistory] ([congnhanid], [salary], [timeChange]) VALUES (1, 450000, CAST(N'2021-02-01' AS Date))
INSERT [dbo].[SalaryHistory] ([congnhanid], [salary], [timeChange]) VALUES (1, 400000, CAST(N'2021-02-06' AS Date))
INSERT [dbo].[SalaryHistory] ([congnhanid], [salary], [timeChange]) VALUES (1, 700000, CAST(N'2021-03-01' AS Date))
INSERT [dbo].[SalaryHistory] ([congnhanid], [salary], [timeChange]) VALUES (1, 600000, CAST(N'2021-03-02' AS Date))
INSERT [dbo].[SalaryHistory] ([congnhanid], [salary], [timeChange]) VALUES (1, 500000, CAST(N'2021-03-15' AS Date))
INSERT [dbo].[SalaryHistory] ([congnhanid], [salary], [timeChange]) VALUES (2, 300000, CAST(N'2021-02-01' AS Date))
INSERT [dbo].[SalaryHistory] ([congnhanid], [salary], [timeChange]) VALUES (3, 300000, CAST(N'2021-01-03' AS Date))
INSERT [dbo].[SalaryHistory] ([congnhanid], [salary], [timeChange]) VALUES (4, 350000, CAST(N'2021-01-03' AS Date))
INSERT [dbo].[SalaryHistory] ([congnhanid], [salary], [timeChange]) VALUES (5, 400000, CAST(N'2021-01-03' AS Date))
INSERT [dbo].[SalaryHistory] ([congnhanid], [salary], [timeChange]) VALUES (6, 200000, CAST(N'2021-01-03' AS Date))
INSERT [dbo].[SalaryHistory] ([congnhanid], [salary], [timeChange]) VALUES (7, 250000, CAST(N'2021-02-03' AS Date))
INSERT [dbo].[SalaryHistory] ([congnhanid], [salary], [timeChange]) VALUES (8, 400000, CAST(N'2021-01-04' AS Date))
INSERT [dbo].[SalaryHistory] ([congnhanid], [salary], [timeChange]) VALUES (9, 190000, CAST(N'2021-03-01' AS Date))
INSERT [dbo].[SalaryHistory] ([congnhanid], [salary], [timeChange]) VALUES (10, 190000, CAST(N'2021-03-27' AS Date))
INSERT [dbo].[SalaryHistory] ([congnhanid], [salary], [timeChange]) VALUES (11, 300000, CAST(N'2021-03-01' AS Date))
INSERT [dbo].[SalaryHistory] ([congnhanid], [salary], [timeChange]) VALUES (12, 300000, CAST(N'2021-02-02' AS Date))
INSERT [dbo].[SalaryHistory] ([congnhanid], [salary], [timeChange]) VALUES (13, 350000, CAST(N'2021-02-02' AS Date))
INSERT [dbo].[SalaryHistory] ([congnhanid], [salary], [timeChange]) VALUES (14, 380000, CAST(N'2021-03-03' AS Date))
INSERT [dbo].[SalaryHistory] ([congnhanid], [salary], [timeChange]) VALUES (15, 200000, CAST(N'2021-01-05' AS Date))
GO
INSERT [dbo].[statusCongtrinh] ([congtrinhid], [status]) VALUES (1, 0)
INSERT [dbo].[statusCongtrinh] ([congtrinhid], [status]) VALUES (2, 0)
INSERT [dbo].[statusCongtrinh] ([congtrinhid], [status]) VALUES (3, 1)
GO
ALTER TABLE [dbo].[application]  WITH CHECK ADD FOREIGN KEY([congnhanid])
REFERENCES [dbo].[CongNhan] ([id])
GO
ALTER TABLE [dbo].[ChamCong]  WITH CHECK ADD FOREIGN KEY([congnhanid])
REFERENCES [dbo].[CongNhan] ([id])
GO
ALTER TABLE [dbo].[ChamCong]  WITH CHECK ADD FOREIGN KEY([congtrinhid])
REFERENCES [dbo].[CongTrinh] ([id])
GO
ALTER TABLE [dbo].[ChamCong]  WITH CHECK ADD FOREIGN KEY([pid])
REFERENCES [dbo].[Phien_LV] ([pid])
GO
ALTER TABLE [dbo].[CongNhan_Account]  WITH CHECK ADD  CONSTRAINT [FK_CongNhan_Account_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[CongNhan_Account] CHECK CONSTRAINT [FK_CongNhan_Account_Account]
GO
ALTER TABLE [dbo].[CongNhan_Account]  WITH CHECK ADD  CONSTRAINT [FK_CongNhan_Account_CongNhan] FOREIGN KEY([cid])
REFERENCES [dbo].[CongNhan] ([id])
GO
ALTER TABLE [dbo].[CongNhan_Account] CHECK CONSTRAINT [FK_CongNhan_Account_CongNhan]
GO
ALTER TABLE [dbo].[Congnhan_CongTrinh]  WITH CHECK ADD  CONSTRAINT [FK_Congnhan_CongTrinh_CongNhan] FOREIGN KEY([congnhanid])
REFERENCES [dbo].[CongNhan] ([id])
GO
ALTER TABLE [dbo].[Congnhan_CongTrinh] CHECK CONSTRAINT [FK_Congnhan_CongTrinh_CongNhan]
GO
ALTER TABLE [dbo].[Congnhan_CongTrinh]  WITH CHECK ADD  CONSTRAINT [FK_Congnhan_CongTrinh_CongTrinh] FOREIGN KEY([cid])
REFERENCES [dbo].[CongTrinh] ([id])
GO
ALTER TABLE [dbo].[Congnhan_CongTrinh] CHECK CONSTRAINT [FK_Congnhan_CongTrinh_CongTrinh]
GO
ALTER TABLE [dbo].[CongNhan_CongViec]  WITH CHECK ADD  CONSTRAINT [FK_CongNhan_CongViec_CongNhan] FOREIGN KEY([cid])
REFERENCES [dbo].[CongNhan] ([id])
GO
ALTER TABLE [dbo].[CongNhan_CongViec] CHECK CONSTRAINT [FK_CongNhan_CongViec_CongNhan]
GO
ALTER TABLE [dbo].[CongNhan_CongViec]  WITH CHECK ADD  CONSTRAINT [FK_CongNhan_CongViec_CongViec] FOREIGN KEY([cvid])
REFERENCES [dbo].[CongViec] ([id])
GO
ALTER TABLE [dbo].[CongNhan_CongViec] CHECK CONSTRAINT [FK_CongNhan_CongViec_CongViec]
GO
ALTER TABLE [dbo].[Feature_Group]  WITH CHECK ADD  CONSTRAINT [FK_Feature_Group_Feature] FOREIGN KEY([fid])
REFERENCES [dbo].[Feature] ([id])
GO
ALTER TABLE [dbo].[Feature_Group] CHECK CONSTRAINT [FK_Feature_Group_Feature]
GO
ALTER TABLE [dbo].[Feature_Group]  WITH CHECK ADD  CONSTRAINT [FK_Feature_Group_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[Feature_Group] CHECK CONSTRAINT [FK_Feature_Group_Group]
GO
ALTER TABLE [dbo].[Group_Account]  WITH CHECK ADD  CONSTRAINT [FK_Group_Account_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Group_Account] CHECK CONSTRAINT [FK_Group_Account_Account]
GO
ALTER TABLE [dbo].[Group_Account]  WITH CHECK ADD  CONSTRAINT [FK_Group_Account_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[Group_Account] CHECK CONSTRAINT [FK_Group_Account_Group]
GO
ALTER TABLE [dbo].[SalaryHistory]  WITH CHECK ADD FOREIGN KEY([congnhanid])
REFERENCES [dbo].[CongNhan] ([id])
GO
ALTER TABLE [dbo].[statusCongtrinh]  WITH CHECK ADD FOREIGN KEY([congtrinhid])
REFERENCES [dbo].[CongTrinh] ([id])
GO
USE [master]
GO
ALTER DATABASE [ChamCong] SET  READ_WRITE 
GO
