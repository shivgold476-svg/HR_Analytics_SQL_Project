SELECT e.Name,d.Departmentname,e.Salary ,
FIRST_VALUE(e.Salary) OVER (PARTITION BY
d.DepartmentName ORDER BY e.Salary DESC) 
AS HighestSalary FROM Employees e 
INNER JOIN Departments d 
ON e.DepartmentID = d.DepartmentID;


SELECT e.Name ,d.DepartmentName,e.Salary,
FIRST_VALUE(e.Salary) OVER(PARTITION BY 
d.DepartmentName ORDER BY e.Salary DESC)
AS HighestSalary ,
FIRST_VALUE(e.Salary) OVER(PARTITION BY 
d.DepartmentName ORDER BY e.Salary DESC)
- e.Salary AS Difference 
FROM Employees e INNER JOIN 
Departments d ON 
e.DepartmentID = d.DepartmentID ;


SELECT e.Name,d.Departmentname,e.Salary ,
LAST_VALUE(e.Salary) OVER (PARTITION BY 
d.DepartmentName ORDER BY e.Salary DESC 
ROWS BETWEEN UNBOUNDED PRECEDING 
AND UNBOUNDED FOLLOWING) AS LastSalary 
FROM Employees e INNER JOIN 
Departments d ON e.DepartmentId = d.departmentID;



SELECT e.Name,d.DepartmentName,e.Salary,
FIRST_VALUE(e.Salary) OVER(PARTITION BY
d.DepartmentName ORDER BY e.Salary DESC)
AS HighestSalary ,LAST_VALUE(e.Salary) 
OVER(PARTITION BY d.DepartmentName ORDER
BY e.Salary DESC ROWS BETWEEN UNBOUNDED 
PRECEDING AND UNBOUNDED FOLLOWING)AS LastSalary,
FIRST_VALUE(e.Salary) OVER(PARTITION BY
d.DepartmentName ORDER BY e.Salary DESC)
- e.Salary AS DifferencFromHighestSalary ,
LAST_VALUE(e.Salary) OVER(PARTITION BY 
d.DepartmentName ORDER BY e.Salary DESC
ROWS BETWEEN UNBOUNDED PRECEDING AND 
UNBOUNDED FOLLOWING )- e.Salary AS 
DifferenceFromLowestSalary FROM
Employees e INNER JOIN Departments d 
ON e.DepartmentID = d.DepartmentID;














































































































