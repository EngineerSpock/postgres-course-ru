ALTER TABLE employees
ADD COLUMN salary numeric(12,2);

UPDATE employees
SET salary=64.47
WHERE employee_id=1;

UPDATE employees
SET salary=52.42
WHERE employee_id=2;

UPDATE employees
SET salary=78.47
WHERE employee_id=3;

UPDATE employees
SET salary=62.95
WHERE employee_id=4;

UPDATE employees
SET salary=55.56
WHERE employee_id=5;

UPDATE employees
SET salary=54.92
WHERE employee_id=6;

UPDATE employees
SET salary=64.35
WHERE employee_id=7;

UPDATE employees
SET salary=75.60
WHERE employee_id=8;

UPDATE employees
SET salary=0.00
WHERE employee_id=9;
SELECT employee_id, salary FROM employees
order by employee_id
