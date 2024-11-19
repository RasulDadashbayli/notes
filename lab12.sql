INSERT INTO assignments (course_id, title, status) 
VALUES ('COMP1238', 'Assignment with no date', 'Not Started');

SELECT * FROM assignments LIMIT 10;

SELECT count(*) FROM courses;

SELECT min(due_date) FROM assignments;

SELECT * FROM courses WHERE course_name LIKE 'Intro%';

SELECT sqlite_version();

SELECT upper('ABCxyz');

SELECT length('abcde');

SELECT 7*5;

SELECT concat('ABC', '-', 'xyz');

SELECT date();

SELECT strftime('%Y', due_date) AS Year, * FROM assignments;

-- SUBSTRING(string, start, length)
SELECT DISTINCT SUBSTRING(course_id, 1, 4) FROM courses;

-- Count how many courses there are with each prefix like 'MATH' and 'COMP'
SELECT SUBSTRING(course_id, 1, 4) AS prefix, count(*)
FROM courses
GROUP BY prefix;

SELECT * FROM assignments
WHERE status != 'Completed'
ORDER BY due_date;

-- Use this query as a reference for the next step
SELECT course_id, title, status, due_date
FROM assignments
WHERE status != 'Completed'	
  AND course_id LIKE 'COMM%'
  AND due_date < '2024-12-31'
ORDER BY due_date;

-- Step 4: Exercise Questions

-- 1. Concatenate Course Name and Semester
SELECT course_name || ' - ' || semester AS course_details
FROM courses;

-- 2. Find Courses with Labs on Fridays
SELECT course_id, course_name, lab_time
FROM courses
WHERE lab_time LIKE '%Friday%';

-- 3. List Upcoming Assignments
SELECT *
FROM assignments
WHERE due_date > date();

-- 4. Count Assignments by Status
SELECT status, COUNT(*) AS assignment_count
FROM assignments
GROUP BY status;

-- 5. Find the Course with the Longest Name
SELECT course_name
FROM courses
ORDER BY LENGTH(course_name) DESC
LIMIT 1;

-- 6. Uppercase Course Names
SELECT UPPER(course_name) AS course_name_uppercase
FROM courses;

-- 7. Assignments Due in September
SELECT title
FROM assignments
WHERE due_date LIKE '____-09-%';

-- 8. Assignments with Missing Due Dates
SELECT *
FROM assignments
WHERE due_date IS NULL;

-- Optional Tasks

-- 1. Total Assignments per Course
SELECT c.course_id, c.course_name, COUNT(a.id) AS total_assignments
FROM courses c
LEFT JOIN assignments a ON c.course_id = a.course_id
GROUP BY c.course_id;

-- 2. Courses Without Assignments
SELECT c.course_id, c.course_name
FROM courses c
LEFT JOIN assignments a ON c.course_id = a.course_id
WHERE a.id IS NULL;
