 CREATE DATABASE HR_Analytics;
USE HR_Analytics;
CREATE TABLE Employees (
  EmployeeID INT PRIMARY KEY,
  Name VARCHAR(50),
  DepartmentID INT,
  ManagerID INT,
  Salary INT,
  Experience INT 
);
CREATE TABLE Departments (
  DepartmentID INT PRIMARY KEY,
  DepartmentName VARCHAR(50)
);

INSERT INTO Departments (DepartmentID,DepartmentName) VALUES
(1,'IT'),
(2,'HR'),
(3,'Finance'),
(4,'Salaes');

INSERT INTO Employees (EmployeeID,Name,DepartmentID,ManagerID,Salary,Experience) VALUES
(101,'Rahul',1,NULL,90000,8),
(102,'Amit',1,101,75000,5),
(103,'Priya',1,101,70000,4),
(104,'Sneha',2,NULL,85000,9),
(105,'Neha',2,104,60000,3),
(106,'Akhshita',2,104,55000,2),
(107,'Rohit',3,NULL,95000,10),
(108,'Karan',3,107,65000,4),
(109,'Pooja',4,NULL,80000,7),
(110,'Ankit',4,109,50000,2);

SELECT * FROM Employees;
SELECT * FROM Departments;
