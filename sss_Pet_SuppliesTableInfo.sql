-- Drop the database if it exists
DROP DATABASE IF EXISTS SSS_Pet_Supplies;

-- Create a new database
CREATE DATABASE SSS_Pet_Supplies;

-- Use the newly created database
USE SSS_Pet_Supplies;

-- Create USERS table
CREATE TABLE USERS (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    FullName TEXT NOT NULL,
    UserName VARCHAR(50) NOT NULL UNIQUE,
    Password VARCHAR(100) NOT NULL UNIQUE,
    PhoneNumber VARCHAR(15) NOT NULL,
    Email TEXT NOT NULL,
    Address TEXT NOT NULL,
    ReturnCustomer BOOLEAN NOT NULL
);

-- Set the starting value for the auto-increment column
ALTER TABLE USERS AUTO_INCREMENT = 10000;

-- Create USER_PAYMENT table
CREATE TABLE USER_PAYMENT (
    PayID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    CardName VARCHAR(100),
    PaymentType VARCHAR(30),
    EncryptedCardNumber VARBINARY(100),
    Last4Digits CHAR(4),
    Expiry DATE,
    CardAddress TEXT,
    FOREIGN KEY (UserID) REFERENCES USERS(UserID)
);

-- Set the starting value for the auto-increment column
ALTER TABLE USER_PAYMENT AUTO_INCREMENT = 100000; 

-- Create trigger to populate Last4Digits column
DELIMITER //

CREATE TRIGGER before_insert_user_payment
BEFORE INSERT ON USER_PAYMENT
FOR EACH ROW
BEGIN
    SET NEW.Last4Digits = RIGHT(AES_DECRYPT(NEW.EncryptedCardNumber, 'secret_key'), 4);
END //

DELIMITER ;

-- Create PRODUCT table with auto-increment SKU starting at 90000
CREATE TABLE PRODUCT (
    SKU INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Animal VARCHAR(50),
    Description TEXT,
    Price DECIMAL(10, 2)
);

-- Set the starting value for the auto-increment column
ALTER TABLE PRODUCT AUTO_INCREMENT = 90000; 


-- Create PET_FOOD table (subclass of PRODUCT)
CREATE TABLE PET_FOOD (
    SKU INT PRIMARY KEY,
    Flavour VARCHAR(50),
    Weight INT,
    FOREIGN KEY (SKU) REFERENCES PRODUCT(SKU)
);

-- Create PET_OUTERWEAR table (subclass of PRODUCT)
CREATE TABLE PET_OUTWEAR (
    SKU INT PRIMARY KEY,
    Size VARCHAR(10),
    ClothesType VARCHAR(50),
    Colour VARCHAR(30),
    FOREIGN KEY (SKU) REFERENCES PRODUCT(SKU)
);

-- Create PET_TOY table (subclass of PRODUCT)
CREATE TABLE PET_TOY (
    SKU INT PRIMARY KEY,
    Size VARCHAR(10),
    Material VARCHAR(50),
    FOREIGN KEY (SKU) REFERENCES PRODUCT(SKU)
);

-- Create PET_NECESSITIES table (subclass of PRODUCT)
CREATE TABLE PET_NECESSITIES (
    SKU INT PRIMARY KEY,
    Item VARCHAR(50),
    Material VARCHAR(50),
    FOREIGN KEY (SKU) REFERENCES PRODUCT(SKU)
);

-- Create REVIEWS table
CREATE TABLE REVIEWS (
    ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    SKU INT,
    Rating INT,
    Date DATE,
    Comment TEXT,
    FOREIGN KEY (UserID) REFERENCES USERS(UserID),
    FOREIGN KEY (SKU) REFERENCES PRODUCT(SKU)
);

-- Create CATEGORY table
CREATE TABLE CATEGORY (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(50) UNIQUE,
    Description TEXT
);

-- Create PRODUCT_CATEGORY table
CREATE TABLE PRODUCT_CATEGORY (
	ProductCategoryID INT PRIMARY KEY AUTO_INCREMENT,
    SKU INT,
    CategoryID INT,
    FOREIGN KEY (SKU) REFERENCES PRODUCT(SKU),
    FOREIGN KEY (CategoryID) REFERENCES CATEGORY(CategoryID)
);

ALTER TABLE PRODUCT_CATEGORY AUTO_INCREMENT = 2000; 

-- Create INVENTORY table
CREATE TABLE INVENTORY (
    InventoryID INT PRIMARY KEY AUTO_INCREMENT,
    SKU INT,
    ProductName VARCHAR(100),
    Quantity INT,
    CheckDate DATE,
    DeleteDate DATE,
    FOREIGN KEY (SKU) REFERENCES PRODUCT(SKU)
);

-- Create TRACKING table
CREATE TABLE TRACKING (
    TrackingID INT PRIMARY KEY AUTO_INCREMENT,
    ShipMethod VARCHAR(30),
    ShipAddress TEXT,
    ShippingDate DATE,
    DeliveryDate DATE
);

-- Create ORDER table
CREATE TABLE ORDER_HISTORY (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    OrderDate DATE,
    Name TEXT,
    TrackingID INT,
    Amount DECIMAL(10, 2),
    Tax DECIMAL(10, 2),
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (UserID) REFERENCES USERS(UserID),
    FOREIGN KEY (TrackingID) REFERENCES TRACKING(TrackingID)
);

-- Set the starting value for the auto-increment column
ALTER TABLE ORDER_HISTORY AUTO_INCREMENT = 80000;

-- Create ORDER_ITEM table
CREATE TABLE ORDER_ITEM (
    OrderItemID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    SKU INT,
    QuantityPerProduct INT,
    TotalQuantity INT,
    SubTotal DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES ORDER_HISTORY(OrderID),
    FOREIGN KEY (SKU) REFERENCES PRODUCT(SKU)
);

-- Create TRANSACTION_REPORT table
CREATE TABLE TRANSACTION_REPORT (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    PayID INT,
    Layaway BOOLEAN,
    GrossAmount DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES ORDER_HISTORY(OrderID),
    FOREIGN KEY (PayID) REFERENCES USER_PAYMENT(PayID)
);



-- 	STORED PROCEDURES

-- Create stored procedure to update product price
DELIMITER //

CREATE PROCEDURE updateProduct(
    IN sku INT,
    IN newPrice DECIMAL(10, 2)
)
BEGIN
    UPDATE PRODUCT
    SET Price = newPrice
    WHERE SKU = sku;
END //

-- Create stored procedure to delete a product
CREATE PROCEDURE deleteProduct(
    IN sku INT
)
BEGIN
    DELETE FROM PRODUCT WHERE SKU = sku;
END //
