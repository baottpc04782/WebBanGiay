USE [ASM_JAVA6]
GO
/****** Object:  Table [dbo].[account_address]    Script Date: 11/30/2023 8:30:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account_address](
	[address_id] [varchar](255) NOT NULL,
	[city] [varchar](255) NULL,
	[district] [varchar](255) NULL,
	[wards] [varchar](255) NULL,
	[username] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 11/30/2023 8:30:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounts](
	[username] [varchar](255) NOT NULL,
	[activated] [bit] NOT NULL,
	[email] [varchar](255) NULL,
	[fullname] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[phonenumber] [varchar](255) NULL,
	[photo] [varchar](255) NULL,
	[verify_code] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[authorities]    Script Date: 11/30/2023 8:30:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authorities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](255) NULL,
	[role_id] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UKhtk0tjw6uf67w0vkhy5n3j1oq] UNIQUE NONCLUSTERED 
(
	[username] ASC,
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 11/30/2023 8:30:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[category_id] [varchar](255) NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[color]    Script Date: 11/30/2023 8:30:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[color](
	[color_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[color_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[discount]    Script Date: 11/30/2023 8:30:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discount](
	[category_id] [int] NOT NULL,
	[end_day] [datetime2](7) NULL,
	[quantity] [int] NULL,
	[start_day] [datetime2](7) NULL,
	[status] [varchar](255) NULL,
	[product_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[manufactor]    Script Date: 11/30/2023 8:30:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manufactor](
	[manufactor_id] [varchar](255) NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[manufactor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 11/30/2023 8:30:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[address_id] [varchar](255) NULL,
	[create_date] [datetime2](7) NULL,
	[order_note] [varchar](255) NULL,
	[order_status] [int] NULL,
	[phonenumber] [varchar](255) NULL,
	[price] [float] NOT NULL,
	[username] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders_detail]    Script Date: 11/30/2023 8:30:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders_detail](
	[orders_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NULL,
	[order_id] [int] NULL,
	[pd_detail_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[orders_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 11/30/2023 8:30:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](255) NULL,
	[image] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[price] [float] NOT NULL,
	[category_id] [varchar](255) NULL,
	[manufactor_id] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products_detail]    Script Date: 11/30/2023 8:30:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products_detail](
	[pd_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NULL,
	[color_id] [int] NULL,
	[product_id] [int] NULL,
	[size_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[pd_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 11/30/2023 8:30:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [varchar](255) NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[size]    Script Date: 11/30/2023 8:30:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[size](
	[pd_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[pd_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[account_address]  WITH CHECK ADD  CONSTRAINT [FKmsgc8bkcitd6o5aciq9wid1g2] FOREIGN KEY([username])
REFERENCES [dbo].[accounts] ([username])
GO
ALTER TABLE [dbo].[account_address] CHECK CONSTRAINT [FKmsgc8bkcitd6o5aciq9wid1g2]
GO
ALTER TABLE [dbo].[authorities]  WITH CHECK ADD  CONSTRAINT [FK7kj74d912rytfp5su91jfv0tg] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[authorities] CHECK CONSTRAINT [FK7kj74d912rytfp5su91jfv0tg]
GO
ALTER TABLE [dbo].[authorities]  WITH CHECK ADD  CONSTRAINT [FKlw0sapcjvuxfa1kvyjw7jml88] FOREIGN KEY([username])
REFERENCES [dbo].[accounts] ([username])
GO
ALTER TABLE [dbo].[authorities] CHECK CONSTRAINT [FKlw0sapcjvuxfa1kvyjw7jml88]
GO
ALTER TABLE [dbo].[discount]  WITH CHECK ADD  CONSTRAINT [FKr4tq0e68q1e2id6odo428vawp] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[discount] CHECK CONSTRAINT [FKr4tq0e68q1e2id6odo428vawp]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FKk3cjfcgb621qhahps1tre43e4] FOREIGN KEY([username])
REFERENCES [dbo].[accounts] ([username])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FKk3cjfcgb621qhahps1tre43e4]
GO
ALTER TABLE [dbo].[orders_detail]  WITH CHECK ADD  CONSTRAINT [FKgic892mhh720sx9wmoq4cjtgp] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
GO
ALTER TABLE [dbo].[orders_detail] CHECK CONSTRAINT [FKgic892mhh720sx9wmoq4cjtgp]
GO
ALTER TABLE [dbo].[orders_detail]  WITH CHECK ADD  CONSTRAINT [FKpxwexsaojuke8ulp9jdrg0n1s] FOREIGN KEY([pd_detail_id])
REFERENCES [dbo].[products_detail] ([pd_detail_id])
GO
ALTER TABLE [dbo].[orders_detail] CHECK CONSTRAINT [FKpxwexsaojuke8ulp9jdrg0n1s]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FKog2rp4qthbtt2lfyhfo32lsw9] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([category_id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FKog2rp4qthbtt2lfyhfo32lsw9]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FKp2kjqew90jdj0pvnlvo48pu4j] FOREIGN KEY([manufactor_id])
REFERENCES [dbo].[manufactor] ([manufactor_id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FKp2kjqew90jdj0pvnlvo48pu4j]
GO
ALTER TABLE [dbo].[products_detail]  WITH CHECK ADD  CONSTRAINT [FK9vr1o58klgakj16118rmfd18m] FOREIGN KEY([size_id])
REFERENCES [dbo].[size] ([pd_detail_id])
GO
ALTER TABLE [dbo].[products_detail] CHECK CONSTRAINT [FK9vr1o58klgakj16118rmfd18m]
GO
ALTER TABLE [dbo].[products_detail]  WITH CHECK ADD  CONSTRAINT [FKjy9bofbtifh814ew6ed22u64w] FOREIGN KEY([color_id])
REFERENCES [dbo].[color] ([color_id])
GO
ALTER TABLE [dbo].[products_detail] CHECK CONSTRAINT [FKjy9bofbtifh814ew6ed22u64w]
GO
ALTER TABLE [dbo].[products_detail]  WITH CHECK ADD  CONSTRAINT [FKmyklheiqbxehp2v4oqj3wrg1o] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[products_detail] CHECK CONSTRAINT [FKmyklheiqbxehp2v4oqj3wrg1o]
GO
