CREATE OR REPLACE
	-- ALGORITHM = merge
	-- DEFINER = current_user
	-- SQL SECURITY = definer
	VIEW vwEmployeesByDepartment
AS
SELECT emp.ID, emp.Name, emp.Salary, CAST(emp.DOB AS DATE) AS DOB, emp.Gender
	, dept.Name AS DepartmentName
FROM Employee emp
	INNER JOIN Department dept ON emp.DeptID = dept.ID
-- WITH CHECK OPTION
-- CASCADED
;