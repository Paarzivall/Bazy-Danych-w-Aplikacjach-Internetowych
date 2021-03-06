USE [ProjektZaliczeniowy]
GO
/****** Object:  Table [dbo].[Bilety]    Script Date: 14.12.2019 10:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bilety](
	[IdBiletu] [int] IDENTITY(1,1) NOT NULL,
	[TypBiletu] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Bilety] PRIMARY KEY CLUSTERED 
(
	[IdBiletu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Klienci]    Script Date: 14.12.2019 10:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klienci](
	[IdKlienta] [int] IDENTITY(1,1) NOT NULL,
	[Imie] [varchar](30) NOT NULL,
	[Nazwisko] [varchar](30) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[DataUrodzenia] [varchar](10) NOT NULL,
	[Ulica] [varchar](40) NOT NULL,
	[Miasto] [varchar](30) NOT NULL,
	[KodPocztowy] [varchar](60) NOT NULL,
	[Haslo] [varchar](256) NOT NULL,
	[Superuser] [bool](1) NOT NULL,
 CONSTRAINT [PK_Klienci] PRIMARY KEY CLUSTERED 
(
	[IdKlienta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SaleKinowe]    Script Date: 14.12.2019 10:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleKinowe](
	[IdSali] [int] NOT NULL,
	[IloscMiejsc] [int] NOT NULL,
 CONSTRAINT [PK_SaleKinowe] PRIMARY KEY CLUSTERED 
(
	[IdSali] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seanse]    Script Date: 14.12.2019 10:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seanse](
	[IdSeansu] [int] IDENTITY(1,1) NOT NULL,
	[TytulFilmu] [varchar](50) NOT NULL,
	[DataSeansu] [varchar](11) NOT NULL,
	[GodzinaSeansu] [varchar](5) NOT NULL,
	[IdSali] [int] NOT NULL,
	[TypSeansu] [varchar](6) NOT NULL,
 CONSTRAINT [PK_Seanse] PRIMARY KEY CLUSTERED 
(
	[IdSeansu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zamowienia]    Script Date: 14.12.2019 10:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zamowienia](
	[IdZamowienia] [int]IDENTITY(1,1) NOT NULL,
	[IdBiletu] [int] NOT NULL,
	[IdKlienta] [int] NOT NULL,
	[IdSeansu] [int] NOT NULL,
 CONSTRAINT [PK_Zamowienia] PRIMARY KEY CLUSTERED 
(
	[IdZamowienia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
