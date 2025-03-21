create database case_study2
use case_study2

Simple Queries: 
1.	List all the employee details. 
ANSWER 1 . SELECT * FROM EMPLOYEE;

2.	List all the department details. 
ANSWER 2. SELECT * FROM DEPARTMENT;

3.	List all job details. 
ANSWER 3. SELECT * FROM JOB;

4.	List all the locations. 
ANSWER 4. SELECT * FROM LOCATION;

5.	List out the First Name, Last Name, Salary, Commission for all Employees.
ANSWER 5. SELECT First_Name, Last_Name, Salary, Comm FROM EMPLOYEE;

6.	List out the Employee ID, Last Name, Department ID for all employees and alias 
Employee ID as "ID of the Employee", Last Name as "Name of the Employee", Department ID as "Dep_id". 
ANSWER 6. SELECT Employee_Id AS "ID of the Employee", Last_Name AS "Name of the Employee", Department_Id AS "Dep_id"
FROM EMPLOYEE;

7.	List out the annual salary of the employees with their names only.
ANSWER 7. SELECT First_Name, Last_Name, (Salary * 12) AS Annual_Salary FROM EMPLOYEE;

WHERE Condition: 
1.	List the details about "Smith". 
ANSWER 1. SELECT * FROM EMPLOYEE WHERE Last_Name = 'Smith';

2.	List out the employees who are working in department 20. 
ANSWER 2. SELECT * FROM EMPLOYEE WHERE Department_Id = 20;

3.	List out the employees who are earning salary between 2000 and 3000.
ANSWER 3. SELECT * FROM EMPLOYEE WHERE Salary BETWEEN 2000 AND 3000;

4.	List out the employees who are working in department 10 or 20. 
ANSWER 4. SELECT * FROM EMPLOYEE WHERE Department_Id IN (10, 20);

5.	Find out the employees who are not working in department 10 or 30. 
ANSWER 5. SELECT * FROM EMPLOYEE WHERE Department_Id NOT IN (10, 30);

6.	List out the employees whose name starts with 'L'. 
ANSWER 6. SELECT * FROM EMPLOYEE WHERE First_Name LIKE 'L%';

7.	List out the employees whose name starts with 'L' and ends with 'E'. 
ANSWER 7. SELECT * FROM EMPLOYEE WHERE First_Name LIKE 'L%E';

8.	List out the employees whose name length is 4 and start with 'J'. 
ANSWER 8. SELECT * FROM EMPLOYEE WHERE LENGTH(First_Name) = 4 AND First_Name LIKE 'J%';

9.	List out the employees who are working in department 30 and draw the salaries more than 2500. 
ANSWER 9. SELECT * FROM EMPLOYEE WHERE Department_Id = 30 AND Salary > 2500;

10.	List out the employees who are not receiving commission.
ANSWER 10. SELECT * FROM EMPLOYEE WHERE Comm IS NULL;

ORDER BY Clause: 
1.	List out the Employee ID and Last Name in ascending order based on the Employee ID. 
ANSWER 1. SELECT Employe_e_Id, Last_Na_me 
FROM EMPLOYEE 
ORDER BY Employe_e_Id ASC;

2.	List out the Employee ID and Name in descending order based on salary. 
ANSWER 2.SELECT Employe_e_Id, First_Na_me, Last_Na_me 
FROM EMPLOYEE 
ORDER BY Salary DESC;

3.	List out the employee details according to their Last Name in ascending-order. 
ANSWER 3. SELECT * 
FROM EMPLOYEE 
ORDER BY Last_Na_me ASC;

4.	List out the employee details according to their Last Name in ascending order and then Department ID in descending order. 
ANSWER 4. SELECT * 
FROM EMPLOYEE 
ORDER BY Last_Na_me ASC, Department_Id DESC;

GROUP BY and HAVING Clause: 
1.	List out the department wise maximum salary, minimum salary and average salary of the employees. 
ANSWER 1. SELECT Department_Id, MAX(Salary) AS Max_Salary, MIN(Salary) AS Min_Salary, AVG(Salary) AS Avg_Salary
FROM EMPLOYEE
GROUP BY Department_Id;

2.	List out the job wise maximum salary, minimum salary and average salary of the employees. 
ANSWER 2.SELECT Job_Id, MAX(Salary) AS Max_Salary, MIN(Salary) AS Min_Salary, AVG(Salary) AS Avg_Salary
FROM EMPLOYEE
GROUP BY Job_Id;

3.	List out the number of employees who joined each month in ascending order.
ANSWER 3. SELECT MONTH(Hire_Date) AS Join_Month, COUNT(*) AS Employee_Count
FROM EMPLOYEE
GROUP BY MONTH(Hire_Date)
ORDER BY Join_Month ASC;

4.	List out the number of employees for each month and year in ascending order based on the year and month. 
ANSWER 4. SELECT YEAR(Hire_Date) AS Join_Year, MONTH(Hire_Date) AS Join_Month, COUNT(*) AS Employee_Count
FROM EMPLOYEE
GROUP BY YEAR(Hire_Date), MONTH(Hire_Date)
ORDER BY Join_Year, Join_Month;

5.	List out the Department ID having at least four employees.
ANSWER 5. SELECT Department_Id, COUNT(*) AS Employee_Count
FROM EMPLOYEE
GROUP BY Department_Id
HAVING COUNT(*) >= 4;

6.	How many employees joined in February month.
ANSWER 6. SELECT COUNT(*) AS Employee_Count
FROM EMPLOYEE
WHERE MONTH(Hire_Date) = 2;

7.	How many employees joined in May or June month. 
ANSWER 7. SELECT COUNT(*) AS Employee_Count
FROM EMPLOYEE
WHERE MONTH(Hire_Date) IN (5, 6);

8.	How many employees joined in 1985? 
ANSWER 8. SELECT COUNT(*) AS Employee_Count
FROM EMPLOYEE
WHERE YEAR(Hire_Date) = 1985;

9.	How many employees joined each month in 1985? 
ANSWER 9. SELECT MONTH(Hire_Date) AS Join_Month, COUNT(*) AS Employee_Count
FROM EMPLOYEE
WHERE YEAR(Hire_Date) = 1985
GROUP BY MONTH(Hire_Date)
ORDER BY Join_Month ASC;

10.	How many employees were joined in April 1985? 
ANSWER 10. SELECT COUNT(*) AS Employee_Count
FROM EMPLOYEE
WHERE YEAR(Hire_Date) = 1985 AND MONTH(Hire_Date) = 4;

11.	Which is the Department ID having greater than or equal to 3 employees joining in April 1985? 
ANSWER 11. SELECT Department_Id, COUNT(*) AS Employee_Count
FROM EMPLOYEE
WHERE YEAR(Hire_Date) = 1985 AND MONTH(Hire_Date) = 4
GROUP BY Department_Id
HAVING COUNT(*) >= 3;

Joins: 
1.	List out employees with their department names. 
ANSWER 1. SELECT E.Employee_Id, E.Last_Name, E.First_Name, D.Department_Name
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.Department_Id = D.Department_Id;

2.	Display employees with their designations. 
ANSWER 2.SELECT E.Employee_Id, E.Last_Name, E.First_Name, J.Job_Title
FROM EMPLOYEE E
JOIN JOB J ON E.Job_Id = J.Job_Id;

3.	Display the employees with their department names and city.
ANSWER 3. SELECT E.Employee_Id, E.Last_Name, E.First_Name, D.Department_Name, D.City
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.Department_Id = D.Department_Id;

4.	How many employees are working in different departments? Display with department names. 
ANSWER 4. SELECT D.Department_Name, COUNT(E.Employee_Id) AS Employee_Count
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.Department_Id = D.Department_Id
GROUP BY D.Department_Name;

5.	How many employees are working in the sales department? 
ANSWER 5. SELECT COUNT(E.Employee_Id) AS Employee_Count
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.Department_Id = D.Department_Id
WHERE D.Department_Name = 'Sales';

6.	Which is the department having greater than or equal to 3 employees and display the department names in ascending order. 
ANSWER 6. SELECT D.Department_Name, COUNT(E.Employee_Id) AS Employee_Count
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.Department_Id = D.Department_Id
GROUP BY D.Department_Name
HAVING COUNT(E.Employee_Id) >= 3
ORDER BY D.Department_Name ASC;

7.	How many employees are working in 'Dallas'?
ANSWER 7. SELECT COUNT(E.Employee_Id) AS Employee_Count
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.Department_Id = D.Department_Id
WHERE D.City = 'Dallas';

8.	Display all employees in sales or operation departments. 
ANSWER 8. SELECT E.Employee_Id, E.Last_Name, E.First_Name
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.Department_Id = D.Department_Id
WHERE D.Department_Name IN ('Sales', 'Operations');

CONDITIONAL STATEMENT 
1.	Display the employee details with salary grades. Use conditional statement to create a grade column. 
ANSWER 1. SELECT 
    Employe_e_Id, Last_Name, First_Name, Salary,
    CASE 
        WHEN Salary >= 5000 THEN 'A'
        WHEN Salary >= 3000 THEN 'B'
        WHEN Salary >= 2000 THEN 'C'
        WHEN Salary >= 1000 THEN 'D'
        ELSE 'E'
    END AS Grade
FROM 
    EMPLOYEE;

2.	List out the number of employees grade wise. Use conditional statement to create a grade column. 
ANSWER 2. SELECT 
    CASE 
        WHEN Salary >= 5000 THEN 'A'
        WHEN Salary >= 3000 THEN 'B'
        WHEN Salary >= 2000 THEN 'C'
        WHEN Salary >= 1000 THEN 'D'
        ELSE 'E'
    END AS Grade,
    COUNT(*) AS Number_of_Employees
FROM 
    EMPLOYEE
GROUP BY Grade;

3.	Display the employee salary grades and the number of employees between 2000 to 5000 range of salary. 
ANSWER 3.SELECT 
    CASE 
        WHEN Salary >= 5000 THEN 'A'
        WHEN Salary >= 3000 THEN 'B'
        WHEN Salary >= 2000 THEN 'C'
    END AS Grade,
    COUNT(*) AS Number_of_Employees
FROM 
    EMPLOYEE
WHERE 
    Salary BETWEEN 2000 AND 5000
GROUP BY Grade;

Subqueries:
1.	Display the employees list who got the maximum salary.
ANSWER 1. SELECT * 
FROM EMPLOYEE 
WHERE Salary = (SELECT MAX(Salary) FROM EMPLOYEE);

2.	Display the employees who are working in the sales department.
ANSWER 2. SELECT * 
FROM EMPLOYEE 
WHERE Department_Id = (SELECT Department_Id FROM Department WHERE Department_Name = 'Sales');

3.	Display the employees who are working as 'Clerk'.
ANSWER 3. SELECT * 
FROM EMPLOYEE 
WHERE Job_Id = (SELECT Job_Id FROM Job WHERE Job_Title = 'Clerk');

4.	Display the list of employees who are living in 'Boston'.
ANSWER 4. SELECT * 
FROM EMPLOYEE 
WHERE City = 'Boston';

5.	Find out the number of employees working in the sales department.
ANSWER 5. SELECT COUNT(*) 
FROM EMPLOYEE 
WHERE Department_Id = (SELECT Department_Id FROM Department WHERE Department_Name = 'Sales');

6.	Update the salaries of employees who are working as clerks on the basis of 10%.
ANSWER 6. UPDATE EMPLOYEE 
SET Salary = Salary * 1.10 
WHERE Job_Id = (SELECT Job_Id FROM Job WHERE Job_Title = 'Clerk');

7.  Display the second highest salary drawing employee details.
ANSWER 7. SELECT * 
FROM EMPLOYEE 
WHERE Salary = (SELECT MAX(Salary) 
                FROM EMPLOYEE 
                WHERE Salary < (SELECT MAX(Salary) FROM EMPLOYEE));

8.  list out the employees who earn more than every employee in department 30.
ANSWER 8. SELECT * 
FROM EMPLOYEE 
WHERE Salary > ALL (SELECT Salary FROM EMPLOYEE WHERE Department_Id = 30);

9.  find out which department has no employees. 
ANSWER 9. SELECT Department_Name 
FROM Department 
WHERE Department_Id NOT IN (SELECT DISTINCT Department_Id FROM EMPLOYEE);

10. find out the employees who earn greater than the average salary for their deparment.
ANSWER 10. SELECT * 
FROM EMPLOYEE E 
WHERE Salary > (SELECT AVG(Salary) 
                FROM EMPLOYEE 
                WHERE Department_Id = E.Department_Id);








