DROP TABLE students;
CREATE TABLE students (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(50),
    gender NVARCHAR(10),
    age INT,
    state NVARCHAR(50),
    registration_date DATE,
    school NVARCHAR(100)
);
INSERT INTO students (name, gender, age, state, registration_date, school) VALUES
('Thomas Abas', 'Male', 17, 'Abia', '2024-01-10', 'APPTECH'),
('Samuel Fakuade', 'Male', 18, 'Rivers', '2024-01-12', 'APPTECH'),
('Mann Walters', 'Male', 16, 'Anambra', '2024-01-13', 'APPTECH'),
('Christopher Obi-Gabriel', 'Male', 15, 'Abia', '2024-01-11', 'APPTECH'),
('Divine Bami', 'Female', 14, 'Cross River', '2024-01-14', 'APPTECH'),
('Goodluck Samuel', 'Male', 19, 'Rivers', '2024-01-15', 'APPTECH'),
('Eleanor Ebere', 'Female', 16, 'Abia', '2024-01-09', 'APPTECH'),
('Tartor Gaadi', 'Male', 13, 'Edo', '2024-01-09', 'APPTECH');



SELECT * FROM students
WHERE gender = 'Female';

SELECT * FROM students
WHERE state = 'Abia';

SELECT * FROM students
WHERE age < 18;


SELECT * FROM students
WHERE age BETWEEN 14 AND 16;


DELETE FROM students
WHERE age = (SELECT MIN(age) FROM students);


UPDATE students
SET state = 'Lagos'
WHERE state = 'Rivers';



SELECT state, COUNT(*) AS total_students
FROM students
GROUP BY state;


SELECT gender, COUNT(*) AS total_students
FROM students
GROUP BY gender;


SELECT TOP 1 *
FROM students
WHERE school = 'APPTECH'
ORDER BY registration_date ASC;
