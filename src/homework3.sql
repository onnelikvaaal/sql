SELECT * FROM employee;

/*Task 1*/
CREATE TABLE city
(
    city_id   INT NOT NULL,
    city_name VARCHAR   NOT NULL
);

ALTER TABLE employee
    ADD COLUMN city_id INT;

ALTER TABLE city
    ADD PRIMARY KEY (city_id);

ALTER TABLE employee
    ADD FOREIGN KEY (city_id) REFERENCES city (city_id);

INSERT INTO city (city_id, city_name) VALUES
                                          (1, 'Novosibirsk'),
                                          (2, 'Vladivostok'),
                                          (3, 'Almaty'),
                                          (4, 'Istanbul');

UPDATE employee
SET city_id = 1
WHERE id = 1;

UPDATE employee
SET city_id = 2
WHERE id = 2;

UPDATE employee
SET city_id = 3
WHERE id = 5;

UPDATE employee
SET city_id = 1
WHERE id = 4;

UPDATE employee
SET city_id = 1
WHERE id = 6;

/*Task 2.1*/
/*Получите имена и фамилии сотрудников, а также города, в которых они проживают.*/

SELECT first_name || ' ' || last_name AS ФИО,
       city_name AS Город
FROM employee
         JOIN city c
             ON c.city_id = employee.city_id;

/*Task 2.2*/
/*Получите города, а также имена и фамилии сотрудников, которые в них проживают.
Если в городе никто из сотрудников не живет, то вместо имени должен стоять null.*/

SELECT c.city_name,
       e.first_name,
       e.last_name
FROM city c
         LEFT JOIN employee e
             ON c.city_id = e.city_id;

/*Task 2.3*/
/*Получите имена всех сотрудников и названия всех городов.
Если в городе не живет никто из сотрудников, то вместо имени должен стоять null.
Аналогично, если города для какого-то из сотрудников нет в списке, должен быть получен null.*/

SELECT e.first_name AS Имя, c.city_name AS Город
FROM employee e
         FULL JOIN city c
             ON c.city_id = e.city_id;

/*Task 2.4*/
/*Получите таблицу, в которой каждому имени должен соответствовать каждый город.*/

SELECT first_name, city_name
FROM employee
         CROSS JOIN city;

/*Task 2.5*/
/*Получите имена городов, в которых никто не живет.*/
SELECT c.city_name
FROM employee e
         RIGHT JOIN city c on c.city_id = e.city_id
WHERE first_name IS NULL;


