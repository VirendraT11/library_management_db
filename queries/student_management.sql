SELECT 
    student_id,
    student_number,
    CONCAT(first_name, ' ', last_name) AS full_name,
    email,
    department,
    year_of_study,
    enrollment_date
FROM students
WHERE status = 'ACTIVE'
ORDER BY last_name, first_name;

-- Find student by student number
SELECT * FROM students WHERE student_number = 'STU001';