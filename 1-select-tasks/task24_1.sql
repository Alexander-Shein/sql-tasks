select 	e.employeeid as EmployeeId, 
		e.firstname || ' ' || e.lastname as FullName,
		e.title as Title,
		e.city as City
from northwind.employees as e
order by City, FullName;