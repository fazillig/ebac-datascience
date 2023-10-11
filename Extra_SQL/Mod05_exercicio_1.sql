-- @block Query 1
SELECT * FROM heartattack limit 10;

-- @block Query 2
SELECT COUNT(age) AS QUANTIDADE_LINHAS
FROM heartattack

-- @block Query 3
SELECT COUNT(age) AS QUANTIDADE, 
CASE
WHEN output =1 THEN ' more chance of heart attack'
ELSE 'less chance of heart attack'
END AS output
FROM heartattack
GROUP BY output;


-- @block Query 4
SELECT MAX(age), MIN(age), AVG(age), output  
FROM heartattack
GROUP BY output

-- @block Query 5
SELECT MAX(age), MIN(age), AVG(age), output ,sex
FROM heartattack
GROUP BY output, sex;

-- @block Query 6
SELECT COUNT(output), output, sex 
FROM heartattack
GROUP BY output, sex
having COUNT(output) > 25