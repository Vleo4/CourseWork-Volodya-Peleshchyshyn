-- Create the Categories table
CREATE TABLE [dbo].[Dim_Categories] (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    tax DECIMAL(10, 2) NOT NULL
);

CREATE TABLE [dbo].[Dim_Date](
	[Date_ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[YEAR] [int] NOT NULL,
	[Mounth] [int] NOT NULL,
	[Day] [int] NOT NULL)
;

-- Create the Products table
CREATE TABLE [dbo].[Dim_Products] (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    category_id INT NOT NULL,
	purchase_price DECIMAL(10, 2) NOT NULL,
    sale_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (category_id) REFERENCES Dim_Categories(id)
);

-- Create the Regions table
CREATE TABLE [dbo].[Dim_Regions] (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    time_zone NVARCHAR(100) NOT NULL
);

-- Create the Stores table
CREATE TABLE [dbo].[Dim_Stores] (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    address NVARCHAR(MAX) NOT NULL,
    region_id INT NOT NULL,
    FOREIGN KEY (region_id) REFERENCES Dim_Regions(id)
);

-- Create the Sales table
CREATE TABLE [dbo].[Dim_Sales] (
    id INT IDENTITY(1,1) PRIMARY KEY,
    description NVARCHAR(MAX),
    product_id INT NOT NULL,
    store_id INT NOT NULL,
    quantity INT NOT NULL;
    FOREIGN KEY (product_id) REFERENCES Dim_Products(id),
    FOREIGN KEY (store_id) REFERENCES Dim_Stores(id)
);

CREATE TABLE Dim_Supplies (
    id INT IDENTITY(1,1) PRIMARY KEY,
    product_id INT NOT NULL,
    store_id INT NOT NULL,
    supply_date DATE NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL, -- Ціна за одиницю під час поставки
    FOREIGN KEY (product_id) REFERENCES Dim_Products(id),
    FOREIGN KEY (store_id) REFERENCES Dim_Stores(id)
);