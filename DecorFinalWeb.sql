Create Database DecorFinalWeb
CREATE TABLE [dbo].[admin_Login](
	[LoginID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[RoleType] [int] NULL,
	[Notes] [varchar](255) NULL,
 CONSTRAINT [PK_admin_Login] PRIMARY KEY CLUSTERED 
(
	[LoginID] ASC,
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[admin_Employee](
	[EmpID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](20) NULL,
	[Age] [int] NULL,
	[DateofBirth] [date] NULL,
	[Gender] [varchar](10) NULL,
	[Email] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[Phone] [varchar](15) NULL,
	[Mobile] [varchar](15) NOT NULL,
	[PhotoPath] [varchar](500) NULL,
 CONSTRAINT [PK_admin_Employee] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[SupplierID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[SubCategoryID] [int] NULL,
	[UnitPrice] [decimal](18, 0) NOT NULL,
	[OldPrice] [decimal](18, 0) NULL,
	[Discount] [decimal](18, 0) NULL,
	[UnitInStock] [int] NULL,
	[UnitOnOrder] [int] NULL,
	[ProductAvailable] [bit] NULL,
	[ImageURL] [varchar](500) NULL,
	[AltText] [varchar](50) NULL,
	[AddBadge] [bit] NULL,
	[OfferTitle] [varchar](50) NULL,
	[OfferBadgeClass] [varchar](50) NULL,
	[ShortDescription] [varchar](300) NULL,
	[LongDescription] [varchar](2000) NULL,
	[Picture1] [varchar](500) NULL,
	[Picture2] [varchar](500) NULL,
	[Picture3] [varchar](500) NULL,
	[Picture4] [varchar](500) NULL,
	[Note] [varchar](250) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Description] [varchar](50) NULL,
	[Picture1] [varchar](255) NULL,
	[Picture2] [varchar](250) NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [decimal](18, 0) NULL,
	[Quantity] [int] NULL,
	[Discount] [decimal](18, 0) NULL,
	[TotalAmount] [decimal](18, 0) NULL,
	[OrderDate] [datetime] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[ContactName] [varchar](50) NULL,
	[ContactTitle] [varchar](50) NULL,
	[Address] [varchar](128) NULL,
	[Mobile] [varchar](15) NULL,
	[Phone] [varchar](15) NOT NULL,
	[Fax] [varchar](20) NULL,
	[Email] [varchar](50) NOT NULL,
	[City] [varchar](20) NULL,
	[Country] [varchar](20) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dbo].[RecentlyViews](
	[RViewID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ViewDate] [datetime] NOT NULL,
	[Note] [varchar](255) NULL,
 CONSTRAINT [PK_RecentlyViews] PRIMARY KEY CLUSTERED 
(
	[RViewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Review](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[ProductID] [int] NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Review] [varchar](500) NULL,
	[Rate] [int] NULL,
	[DateTime] [datetime] NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Wishlist](
	[WishlistID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[isActive] [bit] NULL CONSTRAINT [DF_Wishlist_isActive]  DEFAULT ((1)),
 CONSTRAINT [PK_Wishlist] PRIMARY KEY CLUSTERED 
(
	[WishlistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[First Name] [varchar](50) NOT NULL,
	[Last Name] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Age] [int] NULL,
	[Gender] [varchar](50) NULL,
	[DateofBirth] [date] NULL,
	[Organization] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[PostalCode] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[AltEmail] [varchar](50) NULL,
	[Phone1] [varchar](50) NULL,
	[Phone2] [varchar](20) NULL,
	[Mobile1] [varchar](50) NULL,
	[Mobile2] [varchar](50) NULL,
	[Address1] [varchar](50) NULL,
	[Address2] [varchar](50) NULL,
	[Picture] [varchar](250) NULL,
	[status] [varchar](50) NULL,
	[LastLogin] [datetime] NULL,
	[Created] [date] NULL,
	[Notes] [varchar](250) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Sellers](
	[SellerID] [int] IDENTITY(1,1) NOT NULL,
	[First Name] [varchar](50) NOT NULL,
	[Last Name] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Age] [int] NULL,
	[Gender] [varchar](50) NULL,
	[DateofBirth] [date] NULL,
	[Organization] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[PostalCode] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[AltEmail] [varchar](50) NULL,
	[Phone1] [varchar](50) NULL,
	[Phone2] [varchar](20) NULL,
	[Mobile1] [varchar](50) NULL,
	[Mobile2] [varchar](50) NULL,
	[Address1] [varchar](50) NULL,
	[Address2] [varchar](50) NULL,
	[Picture] [varchar](250) NULL,
	[status] [varchar](50) NULL,
	[LastLogin] [datetime] NULL,
	[Created] [date] NULL,
	[Notes] [varchar](250) NULL,
 CONSTRAINT [PK_Sellers] PRIMARY KEY CLUSTERED 
(
	[SellerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Professional](
	[ProfessionalID] [int] IDENTITY(1,1) NOT NULL,
	[First Name] [varchar](50) NOT NULL,
	[Last Name] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Age] [int] NULL,
	[Gender] [varchar](50) NULL,
	[DateofBirth] [date] NULL,
	[Organization] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[PostalCode] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[AltEmail] [varchar](50) NULL,
	[Phone1] [varchar](50) NULL,
	[Phone2] [varchar](20) NULL,
	[Mobile1] [varchar](50) NULL,
	[Mobile2] [varchar](50) NULL,
	[Address1] [varchar](50) NULL,
	[Address2] [varchar](50) NULL,
	[Picture] [varchar](250) NULL,
	[status] [varchar](50) NULL,
	[LastLogin] [datetime] NULL,
	[Created] [date] NULL,
	[Notes] [varchar](250) NULL,
 CONSTRAINT [PK_Professional] PRIMARY KEY CLUSTERED 
(
	[ProfessionalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Order](
	[OrderID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[PaymentID] [int] NULL,
	[ShippingID] [int] NULL,
	[Discount] [int] NULL CONSTRAINT [DF_Order_Discount]  DEFAULT ((0)),
	[Taxes] [int] NULL CONSTRAINT [DF_Order_Taxes]  DEFAULT ((0)),
	[TotalAmount] [int] NULL,
	[isCompleted] [bit] NULL CONSTRAINT [DF_Order_isCompleted]  DEFAULT ((0)),
	[OrderDate] [datetime] NULL,
	[DIspatched] [bit] NULL CONSTRAINT [DF_Order_DIspatched]  DEFAULT ((0)),
	[DispatchedDate] [datetime] NULL,
	[Shipped] [bit] NULL CONSTRAINT [DF_Order_Shipped]  DEFAULT ((0)),
	[ShippingDate] [datetime] NULL,
	[Deliver] [bit] NULL CONSTRAINT [DF_Order_Deliver]  DEFAULT ((0)),
	[DeliveryDate] [datetime] NULL,
	[Notes] [varchar](500) NULL,
	[CancelOrder] [bit] NULL CONSTRAINT [DF_Order_CancelOrder]  DEFAULT ((0)),
 CONSTRAINT [PK_Oder] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Payment](
	[PaymentID] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[CreditAmount] [money] NULL,
	[DebitAmount] [money] NULL,
	[Balance] [money] NULL,
	[PaymentDateTime] [datetime] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[PaymentType](
	[PayTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
	[Description] [varchar](500) NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[PayTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
	[Description] [varchar](500) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[ShippingDetails](
	[ShippingID] [int] NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](20) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Mobile] [varchar](20) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[Province] [varchar](20) NULL,
	[City] [varchar](20) NULL,
	[PostCode] [varchar](10) NULL,
 CONSTRAINT [PK_ShippingDetails] PRIMARY KEY CLUSTERED 
(
	[ShippingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[SubCategory](
	[SubCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Name] [nchar](50) NOT NULL,
	[Description] [varchar](250) NULL,
	[Picture1] [varchar](500) NULL,
	[Picture2] [varchar](500) NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


SET IDENTITY_INSERT [dbo].[admin_Login] ON 
INSERT [dbo].[admin_Login] ([LoginID], [EmpID], [UserName], [Password], [RoleType], [Notes]) VALUES (1, 1, N'John', N'123456@a', 2, NULL)
INSERT [dbo].[admin_Login] ([LoginID], [EmpID], [UserName], [Password], [RoleType], [Notes]) VALUES (2, 3, N'Alex', N'123456@a', 1, NULL)
INSERT [dbo].[admin_Login] ([LoginID], [EmpID], [UserName], [Password], [RoleType], [Notes]) VALUES (3, 4, N'Christine', N'123456@a', 1, NULL)
SET IDENTITY_INSERT [dbo].[admin_Login] OFF

SET IDENTITY_INSERT [dbo].[admin_Employee] ON 
INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [LastName], [Age], [DateofBirth], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath]) VALUES (1, N'John', N'Patrick', 22, CAST(N'1996-08-26' AS Date), N'Male', N'john@gmail.com', N'Yangon', N'09-36256352', N'0951234567', NULL)
INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [LastName], [Age], [DateofBirth], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath]) VALUES (3, N'Alex', N'Aung', 21, CAST(N'1997-08-27' AS Date), N'Male', N'alex@gmail.com', N'Mandalay', N'09-441234567', N'09441234567', NULL)
INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [LastName], [Age], [DateofBirth], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath]) VALUES (4, N'Christine', N'Jenner', 21, CAST(N'1997-07-25' AS Date), N'Female', N'christine@gmail.com', N'Nay-Pyi-Taw', N'09-441234567', N'0944123467', NULL)
SET IDENTITY_INSERT [dbo].[admin_Employee] OFF

SET IDENTITY_INSERT [dbo].[Products] ON 
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [UnitPrice], [OldPrice], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (1, N'Wooden Table', 2, 1, 1, CAST(50000 AS Decimal(18, 0)), CAST(65000 AS Decimal(18, 0)), NULL, 6, NULL, NULL, N'/Content/Images/living1.jpg', N'Table img', 1, N'SALE!', N'aa-sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [UnitPrice], [OldPrice], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (2, N'Table', 2, 1, 2, CAST(20000 AS Decimal(18, 0)), CAST(35000 AS Decimal(18, 0)), NULL, 8, NULL, NULL, N'/Content/Images/living2.jpg', N'Chair img', 1, N'SOLD OUT', N'aa-sold-out', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [UnitPrice], [OldPrice], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (3, N'Sofa', 2, 1, 3, CAST(50000 AS Decimal(18, 0)), CAST(65000 AS Decimal(18, 0)), NULL, 9, NULL, NULL, N'/Content/Images/living3.jpg', N'1st Avenue Chair img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [UnitPrice], [OldPrice], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (4, N'MOD Table Set', 2, 1, 4, CAST(80000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), NULL, 48, NULL, NULL, N'/Content/Images/living4.jpg', N'MOD Table Set img', 1, N'HOT!', N'aa-hot', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [UnitPrice], [OldPrice], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (5, N'LS Wall Lamp', 2, 2, 5, CAST(70000 AS Decimal(18, 0)), NULL, Null, 51, NULL, NULL, N'/Content/Images/lg1.jpg', N'LS Lighting img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [UnitPrice], [OldPrice], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (6, N'Wall Lighting', 2, 2,6, CAST(45000 AS Decimal(18, 0)), CAST(75000 AS Decimal(18, 0)), NULL, 99, NULL, NULL, N'/Content/Images/lg2.jpg', N'wall lighting img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [UnitPrice], [OldPrice], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (7, N'Ceiling Lighting', 2, 2, 7, CAST(70000 AS Decimal(18, 0)), CAST(95000 AS Decimal(18, 0)), NULL, 20, NULL, NULL, N'/Content/Images/lg3.jpg', N'fancy lighting img', 1, N'SALE!', N'aa-sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [UnitPrice], [OldPrice], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (8, N'Fancy Lighting', 2, 2, 8, CAST(70000 AS Decimal(18, 0)), CAST(85000 AS Decimal(18, 0)), NULL, 0, NULL, NULL, N'/Content/Images/lg4.jpg', N'ceiling lighting img', 1, N'SOLD OUT', N'aa-sold-out', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [UnitPrice], [OldPrice], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (9, N'Indoor Furniture', 2, 3,  9, CAST(55000 AS Decimal(18, 0)), CAST(65000 AS Decimal(18, 0)), NULL, 0, NULL, NULL, N'/Content/Images/furniture1.jpg', N'outdoor furniture img', 1, N'SALE!', N'aa-sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [UnitPrice], [OldPrice], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (10, N'Laptop Table Set', 2,3, 10, CAST(85000 AS Decimal(18, 0)), CAST(65000 AS Decimal(18, 0)), NULL, 8, NULL, NULL, N'/Content/Images/furniture2.jpg', N'living room furniture img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [UnitPrice], [OldPrice], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (11, N'Book Shelf', 2, 3,  11,CAST(75000 AS Decimal(18, 0)), NULL, Null, 25, NULL, NULL, N'/Content/Images/furniture3.jpg', N'bed room furniture img', 1, N'HOT!', N'aa-hot', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [UnitPrice], [OldPrice], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (12, N'Fancy Wooden Table', 2, 3, 12,  CAST(55000 AS Decimal(18, 0)), CAST(65000 AS Decimal(18, 0)), NULL, 2, NULL, NULL, N'/Content/Images/furniture4.jpg', N'grandstand comfort seat img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [UnitPrice], [OldPrice], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (13, N'Wooden Table 1989', 2, 4, 13, CAST(90000 AS Decimal(18, 0)), Null, NuLL, 8, NULL, NULL, N'/Content/Images/new1.jpg', N'dining room furniture img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [UnitPrice], [OldPrice], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (14, N'Fancy Ceiling Lighting', 2, 4, 14, CAST(55000 AS Decimal(18, 0)), CAST(65000 AS Decimal(18, 0)), NULL, 0, NULL, NULL, N'/Content/Images/new2.jpg', N'Fancy img', 1, N'SOLD OUT!', N'aa-sold-out', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [UnitPrice], [OldPrice], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (15, N'LS Ceiling Lighting', 2, 4, 15, CAST(150000 AS Decimal(18, 0)), CAST(250000 AS Decimal(18, 0)), NULL, 16, NULL, NULL, N'/Content/Images/new3.jpg', N'Kitchen img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [UnitPrice], [OldPrice], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (16, N'Office Table Set', 2, 4, 16, CAST(170000 AS Decimal(18, 0)), NULL,  Null, 18, NULL, NULL, N'/Content/Images/new4.jpg', N'outdoor furniture img', 1, N'SALE!', N'aa-sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF

SET IDENTITY_INSERT [dbo].[Categories] ON 
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (1, N'Living', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (2, N'Lighting', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (3, N'Furniture', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (4, N'New', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF

SET IDENTITY_INSERT [dbo].[OrderDetails] ON 
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (1, 1, 1, CAST(450 AS Decimal(18, 0)), 1, NULL, CAST(450 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (2, 2, 2, CAST(450 AS Decimal(18, 0)), 1, NULL, CAST(450 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (3, 2, 3, CAST(900 AS Decimal(18, 0)), 2, NULL, CAST(1800 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (4, 2, 4, CAST(550 AS Decimal(18, 0)), 3, NULL, CAST(1650 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (5, 2, 5, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (6, 2, 6, CAST(800 AS Decimal(18, 0)), 3, NULL, CAST(2400 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (7, 3, 7, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (8, 3, 8, CAST(450 AS Decimal(18, 0)), 3, NULL, CAST(1350 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (9, 4, 9, CAST(450 AS Decimal(18, 0)), 1, NULL, CAST(450 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (10, 4, 10, CAST(700 AS Decimal(18, 0)), 1, NULL, CAST(700 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (11, 4, 11, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (12, 4, 12, CAST(850 AS Decimal(18, 0)), 1, NULL, CAST(850 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (13, 4, 13, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (14, 4, 14, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (15, 5, 15, CAST(450 AS Decimal(18, 0)), 1, NULL, CAST(450 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (16, 5, 16, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF

SET IDENTITY_INSERT [dbo].[Suppliers] ON 
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [ContactTitle], [Address], [Mobile], [Phone], [Fax], [Email], [City], [Country]) VALUES (2, N'Shwe&Mya Ltd', N'Myo Min', N'Marketing Manager', N'Yangon', N'03441234567', N'09441234567', N'(01) 256-4588', N'myomin@gmail.com', N'Yangon', N'Myanmar')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF

SET IDENTITY_INSERT [dbo].[RecentlyViews] ON 
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (1, 1, 1, CAST(N'2016-09-12 13:04:22.833' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (2, 2, 2, CAST(N'2016-09-12 13:06:15.157' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (3, 3, 3, CAST(N'2016-09-12 13:06:23.053' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (4, 4, 6, CAST(N'2016-09-12 13:08:32.260' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (5, 5, 5, CAST(N'2016-09-12 13:08:38.983' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (6, 6, 7, CAST(N'2016-09-12 13:09:03.177' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (7, 7, 8, CAST(N'2016-09-12 13:11:26.760' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[RecentlyViews] OFF

SET IDENTITY_INSERT [dbo].[Review] ON 
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Name], [Email], [Review], [Rate], [DateTime], [isDelete]) VALUES (1, 1, 1, N'Alex', N'alex@gmail.com', N'Good Product.', 4, CAST(N'2016-08-11 19:03:00.227' AS DateTime), NULL)
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Name], [Email], [Review], [Rate], [DateTime], [isDelete]) VALUES (6, 2, 2, N'Christine', N'christine@gmail.com', N'Nice', 5, CAST(N'2016-08-11 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Name], [Email], [Review], [Rate], [DateTime], [isDelete]) VALUES (7, 3, 3, N'Su Su', N'susu@gmail.com', N'Excellent product. thank you', 5, CAST(N'2016-08-11 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Name], [Email], [Review], [Rate], [DateTime], [isDelete]) VALUES (8, 4, 4, N'Anna', N'anna@gmail.com', N'bad', 2, CAST(N'2015-09-23 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Name], [Email], [Review], [Rate], [DateTime], [isDelete]) VALUES (9, 5, 5, N'Kyaw Kyaw', N'kyawkyaw@gmail.com', N'Good Product', 4, CAST(N'2016-09-17 22:26:20.900' AS DateTime), NULL)
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Name], [Email], [Review], [Rate], [DateTime], [isDelete]) VALUES (10, 6, 6, N'Myo Myo', N'myomyo@gmail.com', N'Good Product', 4, CAST(N'2016-09-17 22:29:30.030' AS DateTime), NULL)
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Name], [Email], [Review], [Rate], [DateTime], [isDelete]) VALUES (11, 7, 7, N'Hein Htet', N'heinhtet@gmail.com', N'Nice Product', 4, CAST(N'2016-09-17 22:32:11.457' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Review] OFF


SET IDENTITY_INSERT [dbo].[Wishlist] ON 
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (1, 1, 1, NULL)
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (5, 2, 8, NULL)
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (6, 3, 9, NULL)
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (7, 4, 7, NULL)
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (8, 5, 2, NULL)
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (9, 6, 5, NULL)
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (10, 7, 11, NULL)
SET IDENTITY_INSERT [dbo].[Wishlist] OFF

SET IDENTITY_INSERT [dbo].[Customers] ON 
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes]) VALUES (1, N'Kyaw', N'Kyaw', N'kyawkyaw', N'1111', 22, N'Male', CAST(N'1996-08-26' AS Date), N'BC', N'Myanmar', N'Yangon', N'Yangon', N'75300', N'kyawkyaw@gmail.com', NULL, N'0942354887', NULL, N'+9599827902', NULL, N'Latha Street Yangon', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes]) VALUES (2, N'Su', N'Su', N'susu', N'1111', NULL, NULL, NULL, NULL, N'Myanmar', NULL, NULL, NULL, N'susu@gmail.com', NULL, NULL, NULL, N'09441234567', NULL, N'Sanchaung', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes]) VALUES (3, N'Aye', N'Aye', N'ayeaye', N'1111', NULL, NULL, NULL, NULL, N'Myanmar', NULL, NULL, NULL, N'ayeaye@gmail.com', NULL, NULL, NULL, N'094456787', NULL, N'Insein', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes]) VALUES (4, N'Hein Htet', N'Aung', N'heinhtetaung', N'1111', NULL, NULL, NULL, NULL, N'Myanmar', NULL, NULL, NULL, N'heinhtetaung@gmail.com', NULL, NULL, NULL, N'0944567467', NULL, N'Yankin', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes]) VALUES (5, N'Nyi', N'Nyi', N'nyinyi', N'1111', NULL, NULL, NULL, NULL, N'Myanmar', NULL, NULL, NULL, N'nyinyi@gmail.com', NULL, NULL, NULL, N'09441234567', NULL, N'Sanchaung', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes]) VALUES (6, N'Yadanar', N'Moe', N'yadanarmoe', N'1111', 22, N'Female', CAST(N'1996-08-26' AS Date), N'AC', N'Myanmar', N'Yangon', N'Yangon', N'75300', N'yadanarmoe@gmail.com', NULL, N'0942354847', NULL, N'+9599827902', NULL, N'Ma Po Street Yangon', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes]) VALUES (7, N'Myo', N'Myo', N'myomyo', N'1111', NULL, NULL, NULL, NULL, N'Myanmar', NULL, NULL, NULL, N'myomyo@gmail.com', NULL, NULL, NULL, N'09441454567', NULL, N'Sanchaung', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Customers] OFF

SET IDENTITY_INSERT [dbo].[Sellers] ON 
INSERT [dbo].[Sellers] ([SellerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes]) VALUES (1, N'Mg', N'Mg', N'mgmg', N'1111', 22, N'Male', CAST(N'1996-08-26' AS Date), N'BC', N'Myanmar', N'Yangon', N'Yangon', N'75300', N'kyawkyaw@gmail.com', NULL, N'0942354887', NULL, N'+9599827902', NULL, N'Latha Street Yangon', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sellers] ([SellerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes]) VALUES (2, N'Hla', N'Hla', N'hlahla', N'1111', NULL, NULL, NULL, NULL, N'Myanmar', NULL, NULL, NULL, N'susu@gmail.com', NULL, NULL, NULL, N'09441234567', NULL, N'Sanchaung', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sellers] ([SellerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes]) VALUES (3, N'Nwe', N'Nwe', N'nwenwe', N'1111', NULL, NULL, NULL, NULL, N'Myanmar', NULL, NULL, NULL, N'ayeaye@gmail.com', NULL, NULL, NULL, N'094456787', NULL, N'Insein', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sellers] ([SellerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes]) VALUES (4, N'Myat', N'Lay', N'myatlay', N'1111', NULL, NULL, NULL, NULL, N'Myanmar', NULL, NULL, NULL, N'heinhtetaung@gmail.com', NULL, NULL, NULL, N'0944567467', NULL, N'Yankin', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sellers] ([SellerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes]) VALUES (5, N'Ko', N'Ko', N'koko', N'1111', NULL, NULL, NULL, NULL, N'Myanmar', NULL, NULL, NULL, N'nyinyi@gmail.com', NULL, NULL, NULL, N'09441234567', NULL, N'Sanchaung', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sellers] ([SellerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes]) VALUES (6, N'Khin', N'Khin', N'khinkhin', N'1111', 22, N'Female', CAST(N'1996-08-26' AS Date), N'AC', N'Myanmar', N'Yangon', N'Yangon', N'75300', N'yadanarmoe@gmail.com', NULL, N'0942354847', NULL, N'+9599827902', NULL, N'Ma Po Street Yangon', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sellers] ([SellerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes]) VALUES (7, N'La', N'Min', N'lamin', N'1111', NULL, NULL, NULL, NULL, N'Myanmar', NULL, NULL, NULL, N'myomyo@gmail.com', NULL, NULL, NULL, N'09441454567', NULL, N'Sanchaung', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Sellers] OFF

SET IDENTITY_INSERT [dbo].[Professional] ON 
INSERT [dbo].[Professional] ([ProfessionalID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes]) VALUES (1, N'Su', N'Myat', N'sumyat', N'1111', 22, N'Female', CAST(N'1996-08-26' AS Date), N'BC', N'Myanmar', N'Yangon', N'Yangon', N'75300', N'kyawkyaw@gmail.com', NULL, N'0942354887', NULL, N'+9599827902', NULL, N'Latha Street Yangon', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Professional] ([ProfessionalID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes]) VALUES (2, N'Nan', N'Su', N'nansu', N'1111', NULL, NULL, NULL, NULL, N'Myanmar', NULL, NULL, NULL, N'susu@gmail.com', NULL, NULL, NULL, N'09441234567', NULL, N'Sanchaung', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Professional] ([ProfessionalID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes]) VALUES (3, N'Myat', N'Naing', N'mnaing', N'1111', NULL, NULL, NULL, NULL, N'Myanmar', NULL, NULL, NULL, N'ayeaye@gmail.com', NULL, NULL, NULL, N'094456787', NULL, N'Insein', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Professional] ([ProfessionalID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes]) VALUES (4, N'Min', N'Soe', N'minsoe', N'1111', NULL, NULL, NULL, NULL, N'Myanmar', NULL, NULL, NULL, N'heinhtetaung@gmail.com', NULL, NULL, NULL, N'0944567467', NULL, N'Yankin', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Professional] ([ProfessionalID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes]) VALUES (5, N'Min', N'San', N'minsan', N'1111', NULL, NULL, NULL, NULL, N'Myanmar', NULL, NULL, NULL, N'nyinyi@gmail.com', NULL, NULL, NULL, N'09441234567', NULL, N'Sanchaung', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Professional] ([ProfessionalID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes]) VALUES (6, N'Chaw', N'Chaw', N'chawchaw', N'1111', 22, N'Female', CAST(N'1996-08-26' AS Date), N'AC', N'Myanmar', N'Yangon', N'Yangon', N'75300', N'yadanarmoe@gmail.com', NULL, N'0942354847', NULL, N'+9599827902', NULL, N'Ma Po Street Yangon', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Professional] ([ProfessionalID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes]) VALUES (7, N'Moe', N'Zaw', N'moezaw', N'1111', NULL, NULL, NULL, NULL, N'Myanmar', NULL, NULL, NULL, N'myomyo@gmail.com', NULL, NULL, NULL, N'09441454567', NULL, N'Sanchaung', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Professional] OFF

INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (1, 1, 1, 1, 0, 0, 450, 1, CAST(N'2016-09-09 20:54:32.980' AS DateTime), 0, NULL, 0, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (2, 2, 2, 2, 0, 0, 3250, 1, CAST(N'2017-09-11 17:57:16.727' AS DateTime), 1, NULL, 1, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (3, 3, 3, 3, 0, 0, 1000, 1, CAST(N'2018-09-11 18:01:33.653' AS DateTime), 1, NULL, 0, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (4, 4, 4, 4, 0, 0, 3650, 1, CAST(N'2016-09-11 18:07:10.180' AS DateTime), 0, NULL, 0, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (5, 5, 5, 5, 0, 0, 2550, 1, CAST(N'2017-09-12 11:48:10.897' AS DateTime), 0, NULL, 0, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (6, 6, 6, 6, 0, 0, 1400, 1, CAST(N'2017-09-12 11:49:50.607' AS DateTime), 1, NULL, 1, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (7, 7, 7, 7, 0, 0, 1600, 1, CAST(N'2018-09-12 13:15:02.647' AS DateTime), 1, NULL, 1, NULL, 0, NULL, NULL, NULL)


INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (3, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (4, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (5, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (6, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (7, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (8, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (9, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (10, 1, NULL, NULL, NULL, NULL)

SET IDENTITY_INSERT [dbo].[PaymentType] ON 
INSERT [dbo].[PaymentType] ([PayTypeID], [TypeName], [Description]) VALUES (1, N'Cash on Delivery', NULL)
INSERT [dbo].[PaymentType] ([PayTypeID], [TypeName], [Description]) VALUES (2, N'Paypal', NULL)
INSERT [dbo].[PaymentType] ([PayTypeID], [TypeName], [Description]) VALUES (3, N'Master Card', NULL)
INSERT [dbo].[PaymentType] ([PayTypeID], [TypeName], [Description]) VALUES (4, N'CBPay', NULL)
SET IDENTITY_INSERT [dbo].[PaymentType] OFF

SET IDENTITY_INSERT [dbo].[Roles] ON 
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (1, N'Admin', N'All rights')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (2, N'Buyer', N'Some rights')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (3, N'Seller', N'Some rights')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (4, N'Professional', N'Some rights')
SET IDENTITY_INSERT [dbo].[Roles] OFF

INSERT [dbo].[ShippingDetails] ([ShippingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (1, N'Kyaw', N'Kyaw', N'kyawkyaw@gmail.com', N'+923448127902', N'Latha Yangon', N'Yangon', N'Yangon', N'11222')
INSERT [dbo].[ShippingDetails] ([ShippingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (2, N'Su', N'Su', N'susu@gmail.com', N'03441234567', N'Lanmadaw', N'Yangon', N'Yangon', N'75000')
INSERT [dbo].[ShippingDetails] ([ShippingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (3, N'Aye', N'Aye', N'ayeaye@gmail.com', N'+923448127902', N'Sanchaung', N'Yangon', N'Yangon', N'3123')
INSERT [dbo].[ShippingDetails] ([ShippingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (4, N'Myo', N'Myo', N'myomyo@gmail.com', N'+923448127902', N'Hldan', N'Yangon', N'Yangon', N'71120')
INSERT [dbo].[ShippingDetails] ([ShippingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (5, N'Khine', N'Zar', N'khinezar@gmail.com', N'09421234567', N'Hlaing', N'Yangon', N'Yangon', N'75000')
INSERT [dbo].[ShippingDetails] ([ShippingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (6, N'Wai', N'Yan', N'waiyan@gmail.com', N'+97944127902', N'Sanchaung', N'Yangon', N'Yangon', N'3123')
INSERT [dbo].[ShippingDetails] ([ShippingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (7, N'Myat', N'Pwint', N'myatpwint@gmail.com', N'+9578127902', N'Sanchaung', N'Yangon', N'Yangon', N'71120')

SET IDENTITY_INSERT [dbo].[SubCategory] ON 
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (1, 1, N'Table                  ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (2, 1, N'Chair                  ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (3, 1, N'1st Avenue Chair       ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (4, 1, N'MOD Table Set          ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (5, 2, N'LS Lighting            ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (6, 2, N'Wall Lighting          ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (7, 2, N'Fancy Lighting         ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (8, 2, N'Ceiling Lighting       ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (9, 3, N'Outdoor Furniture      ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (10, 3, N'Living Room Furniture  ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (11, 3, N'Bed Room Furniture     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (12, 3, N'Grandstand Comfort Seat', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (13, 4, N'Dining Room Furniture  ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (14, 4, N'Fancy                  ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (15, 4, N'Kitchen                ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (16, 4, N'Outdoor Furniture      ', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SubCategory] OFF

ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customers]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Payment] FOREIGN KEY([PaymentID])
REFERENCES [dbo].[Payment] ([PaymentID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Payment]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_ShippingDetails] FOREIGN KEY([ShippingID])
REFERENCES [dbo].[ShippingDetails] ([ShippingID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_ShippingDetails]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_PaymentType] FOREIGN KEY([Type])
REFERENCES [dbo].[PaymentType] ([PayTypeID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_PaymentType]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_SubCategory] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[SubCategory] ([SubCategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_SubCategory]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [dbo].[RecentlyViews]  WITH CHECK ADD  CONSTRAINT [FK_RecentlyViews_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[RecentlyViews] CHECK CONSTRAINT [FK_RecentlyViews_Customers]
GO
ALTER TABLE [dbo].[RecentlyViews]  WITH CHECK ADD  CONSTRAINT [FK_RecentlyViews_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[RecentlyViews] CHECK CONSTRAINT [FK_RecentlyViews_Products]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Customers]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Products]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Categories]
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK_Wishlist_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK_Wishlist_Customers]
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK_Wishlist_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK_Wishlist_Products]
GO
USE [master]
GO
ALTER DATABASE [DecorFinalProject] SET  READ_WRITE 
GO

Select * from [dbo].[Customers]
Select * from [dbo].[Order]
Select * from [dbo].[OrderDetails]
Select * from [dbo].[Payment]
Select * from [dbo].[Products]
Select * from [dbo].[admin_Login]

drop table Customers
drop table [dbo].[OrderDetails]
drop table [dbo].[Order]
drop table [dbo].[Payment]
drop table [dbo].[PaymentType]
drop table [dbo].[ShippingDetails]
drop table RecentlyViews
drop table Review
drop table Wishlist
drop table Products
drop table [dbo].[Categories]
drop table SubCategory
drop table [dbo].[Payment]
drop table PaymentType
drop table [dbo].[Suppliers]
drop table [dbo].[RecentlyViews]
drop table [dbo].[Review]
drop table [dbo].[Wishlist]