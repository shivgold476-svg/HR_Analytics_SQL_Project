SELECT d.DepartmentName,COUNT(*) AS 
TotalEmployees ,MAX(e.Salary)
AS MaximumSalary FROM 
Employees e 
INNER JOIN departments d 
ON e.DepartmentID = d.DepartmentID 
GROUP BY d.DepartmentName 
HAVING COUNT(*) >= 2;

SELECT 
m.Name AS ManagerName,
COUNT(e.Name) AS Employee 
FROM Employees e 
INNER JOIN 
Employees  m 
ON e.ManagerID = m.EmployeeID
GROUP BY m.Name ;


SELECT m.Name AS ManagerName,
AVG(e.Salary) AS AvgSalary FROM 
Employees e 
INNER JOIN 
Employees m 
ON e.ManagerID = m.EmployeeID 
GROUP BY m.Name ;

SELECT Name,DepartmentName,
Salary FROM(
     SELECT e.Name,d.DepartmentName,
     e.Salary,DENSE_RANK() OVER(
      PARTITION BY d.DepartmentName 
      ORDER BY Salary DESC) AS ranks 
      FROM Employees e 
      INNER JOIN Departments d 
      ON e.DepartmentID = d.DepartmentID 
      )A
      WHERE ranks = 1;

SELECT Name,DepartmentName,
Salary FROM (
          SELECT e.Name,d.DepartmentName,
          e.Salary,DENSE_RANK() OVER( PARTITION 
          BY d.DepartmentName ORDER BY e.Salary 
          DESC )AS ranks 
          FROM Employees e INNER JOIN 
          Departments d ON 
          e.DepartmentID = d.DepartmentID 
          )A 
          WHERE ranks = 2;


WITH AvgSalary AS 
(
   SELECT DepartmentID ,
   AVG(Salary) AS AvgSalary 
   FROM Employees 
   GROUP BY DepartmentID
   )
SELECT e.Name,d.DepartmentName,
e.Salary FROM Employees e 
INNER JOIN 
AvgSalary a ON 
e.DepartmentId = a.DepartmentId 
INNER JOIN 
Departments d 
ON e.DepartmentID = d.departmentID
WHERE e.Salary > a.AvgSalary;


SELECT Name,DepartmentName,
Salary FROM (
        SELECT e.Name,d.DepartmentName,
        e.Salary ,DENSE_RANK() OVER (
        PARTITION BY d.DepartmentName 
        ORDER BY e.Salary DESC) AS ranks 
        FROM Employees e INNER JOIN
        Departments d ON 
        e.DepartmentID = d.DepartmentID 
        )A 
	WHERE ranks <= 2;


WITH AvgSalary AS 
(
   SELECT DepartmentID,AVG(Salary) AS AvgSalary
   FROM Employees GROUP BY 
   DepartmentID ) 
SELECT Name,DepartmentName,
Salary ,AvgSalary,
Salary-AvgSalary AS Difference
FROM (
    SELECT e.Name ,
    d.DepartmentName,
    e.Salary,a.AvgSalary,
    DENSE_RANK() OVER(PARTITION 
    BY d.DepartmentName ORDER BY 
    e.Salary DESC )AS ranks 
    FROM Employees e 
    INNER JOIN AvgSalary a 
    ON e.DepartmentID =a.DepartmentID
    INNER JOIN Departments d 
    ON e.DepartmentID = d.DepartmentID 
    )A 
    WHERE ranks <= 2;

















  






















































