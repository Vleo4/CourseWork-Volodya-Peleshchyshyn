-- Create the Categories table
CREATE TABLE Categories (
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
CREATE TABLE Products (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES Categories(id)
);

-- Create the Regions table
CREATE TABLE Regions (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    time_zone NVARCHAR(100) NOT NULL
);

-- Create the Stores table
CREATE TABLE Stores (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    address NVARCHAR(MAX) NOT NULL,
    region_id INT NOT NULL,
    FOREIGN KEY (region_id) REFERENCES Regions(id)
);

-- Create the Sales table
CREATE TABLE Sales (
    id INT IDENTITY(1,1) PRIMARY KEY,
    Date date NOT NULL,
    description NVARCHAR(MAX),
    product_id INT NOT NULL,
    store_id INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Products(id),
    FOREIGN KEY (store_id) REFERENCES Stores(id)
);

