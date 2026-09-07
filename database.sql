IF DB_ID('ServletCRUDMVC') IS NULL
BEGIN
    CREATE DATABASE ServletCRUDMVC;
END
GO

USE ServletCRUDMVC;
GO

IF OBJECT_ID('dbo.Products', 'U') IS NOT NULL
    DROP TABLE dbo.Products;
GO

IF OBJECT_ID('dbo.Category', 'U') IS NOT NULL
    DROP TABLE dbo.Category;
GO

IF OBJECT_ID('dbo.Users', 'U') IS NOT NULL
    DROP TABLE dbo.Users;
GO

CREATE TABLE Category
(
    cate_id INT IDENTITY(1,1) PRIMARY KEY,
    cate_name NVARCHAR(100) NOT NULL,
    icons NVARCHAR(255) NULL
);
GO

CREATE TABLE Products
(
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    product_name NVARCHAR(255) NOT NULL,
    images NVARCHAR(255) NULL,
    price FLOAT NOT NULL,
    description NVARCHAR(500) NULL,
    cate_id INT NOT NULL,
    created_at DATETIME2 NOT NULL DEFAULT SYSDATETIME(),

    CONSTRAINT FK_Products_Category
        FOREIGN KEY (cate_id)
        REFERENCES Category(cate_id)
);
GO

CREATE TABLE Users
(
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    full_name NVARCHAR(100) NOT NULL,
    email NVARCHAR(255) NOT NULL UNIQUE,
    password_hash NVARCHAR(255) NOT NULL,
    active BIT NOT NULL DEFAULT 0,
    activation_otp VARCHAR(6) NULL,
    activation_otp_expiry DATETIME2 NULL,
    reset_otp VARCHAR(6) NULL,
    reset_otp_expiry DATETIME2 NULL,
    created_at DATETIME2 NOT NULL DEFAULT SYSDATETIME()
);
GO

INSERT INTO Category(cate_name, icons)
VALUES
(N'Điện thoại', NULL),
(N'Thời trang nam', NULL),
(N'Thời trang nữ', NULL);
GO

INSERT INTO Products
(
    product_name,
    images,
    price,
    description,
    cate_id
)
VALUES
(N'iPhone 15', NULL, 7500000, N'Điện thoại Apple', 1),

(N'Samsung S24', NULL, 18000000, N'Điện thoại Samsung', 1),

(N'Áo thun nam', NULL, 250000, N'Áo thun nam basic', 2),

(N'Quần jean nam', NULL, 450000, N'Quần jean nam', 2),

(N'Váy nữ', NULL, 500000, N'Váy nữ thời trang', 3),

(N'Áo sơ mi nữ', NULL, 350000, N'Áo sơ mi nữ', 3),

(N'iPhone 16', NULL, 25000000, N'Điện thoại Apple mới', 1);
GO

SELECT * FROM Category;
SELECT * FROM Products;
SELECT * FROM Users;
GO