-- Create a Database
CREATE DATABASE FinanceManagementSystem;

USE FinanceManagementSystem;

-- Create User Table
CREATE TABLE Users (
user_id INT PRIMARY KEY IDENTITY(1,1),
username VARCHAR(255) NOT NULL UNIQUE,
password VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL UNIQUE
);

-- Create Table ExpenseCategories
CREATE TABLE ExpenseCategories (
category_id INT PRIMARY KEY IDENTITY(1,1),
category_name VARCHAR(255) NOT NULL UNIQUE
);

-- Create Table Expenses
CREATE TABLE Expenses (
expense_id INT PRIMARY KEY IDENTITY(1,1),
user_id INT NOT NULL,
amount DECIMAL(10,2) NOT NULL,
category_id INT NOT NULL,
date DATE NOT NULL,
description TEXT,
FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
FOREIGN KEY (category_id) REFERENCES ExpenseCategories(category_id) ON DELETE CASCADE
);

-- Insert Commands
INSERT INTO Users (username, password, email) VALUES ('testuser', 'testpass', 'test@example.com');

SELECT * FROM Users WHERE username = 'testuser';

INSERT INTO ExpenseCategories (category_name) VALUES ('Food');

SELECT * FROM ExpenseCategories WHERE category_name = 'Food';


INSERT INTO Expenses (user_id, amount, category_id, date, description) 
VALUES ((SELECT user_id FROM Users WHERE username = 'testuser'), 50.0, (SELECT category_id FROM ExpenseCategories WHERE category_name = 'Food'), '2024-03-23', 'Lunch');
