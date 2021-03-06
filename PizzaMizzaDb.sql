CREATE DATABASE PizzaMizza

USE PizzaMizza

CREATE TABLE Settings(
    Id INT PRIMARY KEY IDENTITY,
    [Key] VARCHAR(255),
    [Value] VARCHAR(255)
)

CREATE TABLE Sliders(
    Id INT PRIMARY KEY IDENTITY,
    [Image] VARCHAR(225)
)

CREATE TABLE DeletedSliders(
    Id INT PRIMARY KEY IDENTITY,
    [Image] VARCHAR(225)
)

CREATE TABLE Sizes(
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(225),
    Price DECIMAL(6,2)
)

CREATE TABLE Prices(
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(225),
    [Value] DECIMAL(6,2)
)

CREATE TABLE SizePrices(
    Id INT PRIMARY KEY IDENTITY,
    PriceId INT CONSTRAINT FK_PriceId FOREIGN KEY REFERENCES Prices(Id),
    SizeId INT CONSTRAINT FK_SizeId FOREIGN KEY REFERENCES Sizes(Id),
)

CREATE TABLE Pizzas(
    Id INT PRIMARY KEY IDENTITY,
    [Image] VARCHAR(255),
    [Name] NVARCHAR(25),
    [Description] NVARCHAR(255),
    SizeID INT,
    IsVegetarian BIT DEFAULT 'false',
    IsSpicy BIT DEFAULT 'false',
    IsHalal BIT DEFAULT 'false'
)
CREATE TRIGGER v_SendToDeletedSliders
ON Sliders
AFTER DELETE 
AS
BEGIN

DECLARE @Image NVARCHAR(225)
SELECT  @Image=GroupList.Image FROM DELETED GroupList
INSERT INTO DeletedSliders VALUES(@Image)

END

DELETE FROM Sliders WHERE Id=4

SELECT * FROM Pizzas
