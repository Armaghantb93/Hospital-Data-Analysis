SELECT employee_id, department, performance_score
FROM employee_performance_data
WHERE performance_score IS NOT NULL
AND department IN ('Nursing', 'Pharmacy', 'Administrative', 'Technical');
SELECT department, AVG(performance_score) AS avg_performance_score
FROM employee_performance_data
GROUP BY department;
SELECT employee_id, department, performance_score
FROM (
  SELECT employee_id, department, performance_score, ROW_NUMBER() OVER (PARTITION BY department ORDER BY performance_score DESC) AS row_num
  FROM employee_performance_data
) AS ranked_data
