--Create table + Constraints--

DROP TABLE IF EXISTS Staff;

CREATE TABLE Staff (
    StaffID INTEGER PRIMARY KEY,
    FullName TEXT NOT NULL,
    Age INTEGER CHECK (Age >= 18),
    Department TEXT NOT NULL,
    Salary INTEGER CHECK (Salary > 0),
    Email TEXT UNIQUE
); 
 
--- Insert data---

INSERT INTO Staff VALUES
(1, 'uday', 26, 'IT', 55000, 'uday@gmail.com'),
(2, 'yamuna', 29, 'HR', 48000, 'yamuna@gmail.com'),
(3, 'Vinay', 32, 'Finance', 65000, 'vinay@gmail.com'),
(4, 'anitha', 24, 'IT', 50000, 'anitha@gmail.com'),
(5, 'lucky', 28, 'Sales', 45000, 'lucky@gmail.com');

--SELECT--

SELECT * FROM Staff;

--WHERE--
SELECT * FROM Staff
WHERE Salary > 50000;

--ORDER BY--
SELECT * FROM Staff
ORDER BY Salary DESC;

--GROUP BY--
SELECT Department, COUNT(*) AS TotalStaff
FROM Staff
GROUP BY Department;

--HAVING--
SELECT Department, AVG(Salary) AS AvgSalary
FROM Staff
GROUP BY Department
HAVING AVG(Salary) > 50000;

--JOINS (self demo table)--
CREATE TABLE Department (
    DeptID INTEGER,
    Department TEXT
);

INSERT INTO Department VALUES
(1,'IT'),
(2,'HR'),
(3,'Finance');

SELECT Staff.FullName, Staff.Department
FROM Staff
INNER JOIN Department
ON Staff.Department = Department.Department;

--VIEWS--
CREATE VIEW StaffView AS
SELECT FullName, Department, Salary
FROM Staff;

SELECT * FROM StaffView;

--STRING FUNCTIONS--
SELECT
UPPER(FullName),
LOWER(Department),
LENGTH(FullName),
SUBSTR(FullName,1,4)
FROM Staff;

--NUMERIC FUNCTIONS--
SELECT
ROUND(Salary,0),
ABS(-500),
MOD(10,3);

--DATA FUNCTIONS(SQlite)--
SELECT DATE('now') AS Today;

--NULL HANDLING--
SELECT FullName,
IFNULL(Email, 'No Email')
FROM Staff;

--SUBQUERY--
SELECT * FROM Staff
WHERE Salary > (
    SELECT AVG(Salary) FROM Staff
);

--CASE STATEMENT--
SELECT FullName, Salary,
CASE
    WHEN Salary >= 60000 THEN 'High'
    WHEN Salary >= 50000 THEN 'Medium'
    ELSE 'Low'
END AS SalaryLevel
FROM Staff;

--CTEE(Common table expression)--
WITH HighEarners AS (
    SELECT * FROM Staff WHERE Salary > 50000
)
SELECT * FROM HighEarners;

--WINDOW FUNCTION(RANK)--
SELECT FullName, Salary,
RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
FROM Staff;

--INDEX--
CREATE INDEX idx_name ON Staff(FullName);

--FINAL REPORT QUERY--
SELECT
Department,
COUNT(*) AS TotalStaff,
AVG(Salary) AS AvgSalary,
MAX(Salary) AS MaxSalary
FROM Staff
GROUP BY Department;













