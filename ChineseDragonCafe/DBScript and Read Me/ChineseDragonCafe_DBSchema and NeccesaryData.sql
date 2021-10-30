
/****** Object:  Table [dbo].[MenuItems]    Script Date: 10/31/2021 12:38:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemCode] [varchar](10) NULL,
	[Description] [varchar](100) NULL,
	[PortionSize] [int] NULL,
	[Price] [decimal](6, 2) NULL,
 CONSTRAINT [PK_MenuItems] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 10/31/2021 12:38:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderReference] [varchar](10) NULL,
	[OrderDate] [datetime] NULL,
	[OrderThrough] [int] NULL,
	[OrderType] [int] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 10/31/2021 12:38:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ItemID] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderThroughTable]    Script Date: 10/31/2021 12:38:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderThroughTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderThrough] [varchar](10) NULL,
 CONSTRAINT [PK_OrderThroughTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderTypeTable]    Script Date: 10/31/2021 12:38:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderTypeTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderType] [varchar](10) NULL,
 CONSTRAINT [PK_OrderTypeTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PortionTable]    Script Date: 10/31/2021 12:38:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PortionTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PortionSize] [varchar](10) NULL,
 CONSTRAINT [PK_PortionTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/31/2021 12:38:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[MobileNo] [varchar](10) NULL,
	[IsManager] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MenuItems] ON 
GO
INSERT [dbo].[MenuItems] ([ID], [ItemCode], [Description], [PortionSize], [Price]) VALUES (1, N'bsr_s', N'Basmati Steamed Rice', 1, CAST(490.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[MenuItems] ([ID], [ItemCode], [Description], [PortionSize], [Price]) VALUES (2, N'bsr_m', N'Basmati Steamed Rice', 2, CAST(700.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[MenuItems] ([ID], [ItemCode], [Description], [PortionSize], [Price]) VALUES (3, N'bsr_l', N'Basmati Steamed Rice', 3, CAST(1000.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[MenuItems] ([ID], [ItemCode], [Description], [PortionSize], [Price]) VALUES (4, N'bpfr_s', N'Bnic Pack (Fried Rice)', 1, CAST(1990.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[MenuItems] ([ID], [ItemCode], [Description], [PortionSize], [Price]) VALUES (5, N'bpfr_m', N'Bnic Pack (Fried Rice)', 2, CAST(2550.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[MenuItems] ([ID], [ItemCode], [Description], [PortionSize], [Price]) VALUES (6, N'cdc_s', N'Chicken Dragon Combo', 1, CAST(640.00 AS Decimal(6, 2)))
GO
SET IDENTITY_INSERT [dbo].[MenuItems] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderThroughTable] ON 
GO
INSERT [dbo].[OrderThroughTable] ([ID], [OrderThrough]) VALUES (1, N'Online')
GO
INSERT [dbo].[OrderThroughTable] ([ID], [OrderThrough]) VALUES (2, N'POS')
GO
SET IDENTITY_INSERT [dbo].[OrderThroughTable] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderTypeTable] ON 
GO
INSERT [dbo].[OrderTypeTable] ([ID], [OrderType]) VALUES (1, N'Dine In')
GO
INSERT [dbo].[OrderTypeTable] ([ID], [OrderType]) VALUES (2, N'Take Away')
GO
SET IDENTITY_INSERT [dbo].[OrderTypeTable] OFF
GO
SET IDENTITY_INSERT [dbo].[PortionTable] ON 
GO
INSERT [dbo].[PortionTable] ([ID], [PortionSize]) VALUES (1, N'Small')
GO
INSERT [dbo].[PortionTable] ([ID], [PortionSize]) VALUES (2, N'Medium')
GO
INSERT [dbo].[PortionTable] ([ID], [PortionSize]) VALUES (3, N'Large')
GO
SET IDENTITY_INSERT [dbo].[PortionTable] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([ID], [Username], [Password], [Name], [MobileNo], [IsManager]) VALUES (1, N'admin', N'admin123', N'Lahiru', N'0715648525', 1)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[MenuItems]  WITH CHECK ADD  CONSTRAINT [FK_MenuItems_PortionTable] FOREIGN KEY([PortionSize])
REFERENCES [dbo].[PortionTable] ([ID])
GO
ALTER TABLE [dbo].[MenuItems] CHECK CONSTRAINT [FK_MenuItems_PortionTable]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderThroughTable] FOREIGN KEY([OrderThrough])
REFERENCES [dbo].[OrderThroughTable] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderThroughTable]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderTypeTable] FOREIGN KEY([OrderType])
REFERENCES [dbo].[OrderTypeTable] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderTypeTable]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Users]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Order]
GO
