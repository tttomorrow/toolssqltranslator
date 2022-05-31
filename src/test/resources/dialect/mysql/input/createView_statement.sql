create
or replace          algorithm = merge                           definer=current_user()                     sql security definer                       VIEW vwEmployeesByDepartment               AS
SELECT emp.ID, emp.Name, emp.Salary, CAST(emp.DOB AS Date) AS DOB, emp.Gender, dept.Name AS DepartmentName
FROM Employee emp
         INNER JOIN Department dept ON emp.DeptID = dept.ID with cascaded check
option;