-- 3a
SELECT 
department_name AS "Nazwa departamentu",
ROUND(AVG(salary)) AS "Średnia zarobków"
FROM employees e
JOIN departments d ON (d.department_id = e.department_id)
WHERE d.department_id IN (80,50,100)
GROUP BY department_name;


-- 3b
SELECT
job_title AS "Nazwa stanowiska",
COUNT(*) AS "Liczba pracowników",
AVG(salary) AS "Średnia pensja na stanowisku"
FROM employees
JOIN jobs USING (job_id)
GROUP BY (job_title)
HAVING COUNT (job_title)>=5
ORDER BY AVG(salary) DESC;


-- 3c
SELECT
j.job_title AS  "Nazwa stanowiska"
FROM employees e
JOIN jobs j USING (job_id)
GROUP BY (j.job_title)
HAVING COUNT (j.job_title)>=5 AND j.job_title NOT IN 
(SELECT DISTINCT
job_title
from
employees
JOIN jobs USING (job_id)
WHERE max_salary < to_number(salary)*1.1)
ORDER BY j.job_title DESC;
