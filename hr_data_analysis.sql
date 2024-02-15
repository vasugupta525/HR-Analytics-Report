use hr_dataset;

select * from hr_data;

select count(*) from hr_data;

-- Employee Count:
select sum(employee_count) as Employee_Count from hr_data;


-- Attrition Count:
select count(attrition) as attrition_count from hr_data where attrition='Yes';


-- Attrition Rate:
select round (((select count(attrition) from hr_data where attrition='Yes')/ 
sum(employee_count)) * 100,2) as attrition_rate
from hr_data;


-- Active Employee:
select sum(employee_count) - (select count(attrition) from hr_data  where attrition='Yes') as active_employee from hr_data;
-- OR 
select (select sum(employee_count) from hr_data) - count(attrition) as active_employee from hr_data
where attrition='Yes';


-- Average Age:
select round(avg(age),0) as average_age from hr_data;


-- Attrition by Gender:
select gender, count(attrition) as attrition_count from hr_data
where attrition='Yes'
group by gender
order by count(attrition) desc;


-- Department wise Attrition:
select department, count(attrition) as attrition_count from hr_data
where attrition='Yes'
group by department 
order by count(attrition) desc;


-- No of Employee by Age Group:
SELECT age,  sum(employee_count) AS employee_count FROM hr_data
GROUP BY age
order by age;


-- Education Field wise Attrition:
select education_field, count(attrition) as attrition_count from hr_data
where attrition='Yes'
group by education_field
order by count(attrition) desc;


-- Attrition Rate by Gender for different Age Group:
select `CF_age band`, gender, count(attrition) as attrition from hr_data
where attrition = 'Yes'
group by `CF_age band`, gender
order by `CF_age band`, gender desc;