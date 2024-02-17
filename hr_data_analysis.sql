use hr_dataset;

SELECT * FROM hr_data;

SELECT COUNT(*) FROM hr_data;

-- Employee Count:
SELECT SUM(employee_count) AS Employee_Count FROM hr_data;


-- Attrition Count:
SELECT COUNT(attrition) AS attrition_count FROM hr_data
WHERE attrition = 'Yes';


-- Attrition Rate:
SELECT ROUND(((SELECT COUNT(attrition) FROM hr_data
WHERE attrition = 'Yes') / SUM(employee_count)) * 100, 2) AS attrition_rate
FROM hr_data;


-- Active Employee:
SELECT SUM(employee_count) - (SELECT COUNT(attrition) FROM hr_data 
WHERE attrition = 'Yes') AS active_employee
FROM hr_data;
-- OR 
SELECT (SELECT SUM(employee_count) FROM hr_data) - COUNT(attrition) AS active_employee FROM hr_data
WHERE attrition = 'Yes';


-- Average Age:
SELECT ROUND(AVG(age), 0) AS average_age FROM hr_data;


-- Attrition by Gender:
SELECT gender, COUNT(attrition) AS attrition_count FROM hr_data
WHERE attrition = 'Yes'
GROUP BY gender
ORDER BY COUNT(attrition) DESC;


-- Department wise Attrition:
SELECT department, COUNT(attrition) AS attrition_count FROM hr_data
WHERE attrition = 'Yes'
GROUP BY department
ORDER BY COUNT(attrition) DESC;


-- No of Employee by Age Group:
SELECT age, SUM(employee_count) AS employee_count FROM hr_data
GROUP BY age
ORDER BY age;


-- Education Field wise Attrition:
SELECT education_field, COUNT(attrition) AS attrition_count FROM hr_data
WHERE attrition = 'Yes'
GROUP BY education_field
ORDER BY COUNT(attrition) DESC;


-- Attrition Rate by Gender for different Age Group:
SELECT `CF_age band`, gender, COUNT(attrition) AS attrition FROM hr_data
WHERE attrition = 'Yes'
GROUP BY `CF_age band` , gender
ORDER BY `CF_age band` , gender DESC;