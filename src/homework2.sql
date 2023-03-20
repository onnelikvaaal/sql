SELECT * FROM employee;

/*task 1.1*/
INSERT INTO employee (
first_name, last_name, gender, age)
VALUES ('Alexey', 'Alexeev', 'male', 30);

INSERT INTO employee (
first_name, last_name, gender, age)
VALUES ('Andrey', 'Andreev', 'male', 21);

INSERT INTO employee (
first_name, last_name, gender, age)
VALUES ('Evgeniya', 'Evgenyeva', 'female', 33);

/*task 1.2*/
SELECT first_name AS Имя,
last_name AS Фамилия FROM employee;

/*task 1.3*/
SELECT * FROM employee
WHERE age < 30 OR age > 50;

/*task 1.4*/
SELECT * FROM employee
WHERE age
BETWEEN 30 AND 50;

/*task 1.5*/
SELECT * FROM employee
ORDER BY last_name DESC;

/*task 1.6*/
SELECT * FROM employee
WHERE first_name
LIKE '_____%';

/*task 2.1*/
UPDATE employee
SET first_name = 'Alexandra'
WHERE id = 6;
UPDATE employee
SET first_name = 'Ivan'
WHERE id = 5;

/*task 2.2*/
SELECT first_name AS Имя,
SUM(Age) AS Суммарный_возраст
FROM employee
GROUP BY Имя;

/*task 2.3*/
SELECT first_name AS Имя,
MIN(age) AS Минимальный_возраст
FROM employee
GROUP BY Имя;

/*task 2.4*/
SELECT e.first_name, MAX(age)
FROM employee e
WHERE (
          SELECT count(*) FROM employee
          WHERE first_name = e.first_name) > 1
GROUP BY first_name;
