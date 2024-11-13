-- 1. Assignments for Course COMP1234
SELECT title, due_date 
FROM assignments 
WHERE course_id = 'COMP1234';

-- 2. Earliest Assignment Due Date
SELECT min(due_date) AS earliest_due_date 
FROM assignments;

-- 3. Latest Assignment Due Date
SELECT max(due_date) AS latest_due_date 
FROM assignments;

-- 4. Assignments Due on 2024-10-08
SELECT title, course_id 
FROM assignments 
WHERE due_date = '2024-10-08';

-- 5. Assignments Due in October 2024
SELECT title, due_date 
FROM assignments 
WHERE due_date LIKE '2024-10%';

-- 6. Most Recent Completed Assignment
SELECT max(due_date) AS most_recent_completed 
FROM assignments 
WHERE status = 'Completed';

-- Optional 1: Count of "Not Started" Assignments
SELECT count(*) AS not_started_count 
FROM assignments 
WHERE status = 'Not Started';

-- Optional 2: Courses with Labs on Tuesday
SELECT course_id, course_name 
FROM courses 
WHERE lab_days LIKE 'Tue%';

-- Optional 3: Join Courses and Assignments
SELECT courses.course_id, courses.course_name, assignments.title, assignments.due_date 
FROM courses 
JOIN assignments 
ON courses.course_id = assignments.course_id
ORDER BY assignments.due_date;