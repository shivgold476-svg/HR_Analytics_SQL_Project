SELECT Name,DepartmentName,
Experience FROM(
  SELECT e.Name,d.DepartmentName,
  e.Experience ,
  DENSE_RANK() OVER(PARTITION BY 
  d.DepartmentName ORDER BY 
  e.Experience DESC )AS ranks 
FROM Employees e 
INNER JOIN Departments d 
)A 
WHERE ranks = 1;

SELECT d.DepartmentName,
SUM(e.Salary) AS TotalSalary 
FROM Employees e
INNER JOIN Departments d 
ON e.DepartmentID = d.DepartmentID 
GROUP BY d.DepartmentName
HAVING SUM(e.Salary) > 150000;


WITH AvgSalary AS 
(
  SELECT DepartmentID,AVG(Salary)
  AS AvgSalary
  FROM Employees GROUP BY 
  DepartmentID)
SELECT d.DepartmentName,COUNT(*)
AS EmployeesBelowAvgSalary 
FROM Employees e INNER 
JOIN AvgSalary a 
ON e.DepartmentID = a.DepartmentID 
INNER JOIN Departments d 
ON e.DepartmentID = d.DepartmentID 
WHERE e.Salary < a.AVGsALARY 
GROUP BY d.DepartmentName;


WITH AverageSalary AS
( 
  SELECT DepartmentID,AVG(Salary) 
  AS AvgSalary FROM Employees 
  GROUP BY DepartmentID )
SELECT d.DepartmentName,
COUNT(*) AS EmployeesAboveAvgSalary 
FROM Employees e INNER JOIN 
AverageSalary a 
ON e.DepartmentID = a.DepartmentID 
INNER JOIN 
Departments d ON 
e.DepartmentID = d.DepartmentID 
WHERE e.Salary > a.AvgSalary
GROUP BY d.DepartmentName;


SELECT Name,DepartmentName,
Salary FROM(
  SELECT e.Name,d.DepartmentName,e.Salary,
  DENSE_RANK() OVER (PARTITION BY 
  d.DepartmentName ORDER BY 
  e.Salary DESC) AS ranks
  FROM Employees e 
  INNER JOIN Departments d 
  ON e.DepartmentID = d.DepartmentID )RankedSalary
  WHERE ranks <= 3;
  
WITH AverageSalary AS 
(
  SELECT DepartmentID ,AVG(Salary) 
  AS AvgSalary FROM Employees  
  GROUP BY DepartmentID )
SELECT Name,DepartmentName,
Salary,AvgSalary FROM 
           (SELECT e.Name,d.DepartmentName,
           e.Salary,a.AvgSalary,DENSE_RANK() OVER( 
           PARTITION BY d.DepartmentName 
           ORDER BY e.Salary DESC) AS ranks 
           FROM Employees e INNER JOIN 
           AverageSalary a 
           ON e.DepartmentID = a.DepartmentID 
           INNER JOIN Departments d 
           ON e.DepartmentID = d.DepartmentID)SalaryRanks 
           WHERE ranks = 1;






















































