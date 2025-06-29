SELECT 
    b.title,
    CONCAT(a.first_name, ' ', a.last_name) AS author_name,
    COUNT(ir.issuance_id) AS times_issued
FROM books b
LEFT JOIN authors a ON b.author_id = a.author_id
LEFT JOIN issuance_records ir ON b.book_id = ir.book_id
GROUP BY b.book_id, b.title, a.first_name, a.last_name
ORDER BY times_issued DESC
LIMIT 10;

SELECT 
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    s.student_number,
    s.department,
    COUNT(ir.issuance_id) AS books_issued
FROM students s
LEFT JOIN issuance_records ir ON s.student_id = ir.student_id
GROUP BY s.student_id, s.first_name, s.last_name, s.student_number, s.department
ORDER BY books_issued DESC
LIMIT 10;

SELECT 
    EXTRACT(YEAR FROM issue_date) AS year,
    EXTRACT(MONTH FROM issue_date) AS month,
    COUNT(*) AS books_issued
FROM issuance_records
GROUP BY EXTRACT(YEAR FROM issue_date), EXTRACT(MONTH FROM issue_date)
ORDER BY year DESC, month DESC;

SELECT 
    b.title,
    CONCAT(a.first_name, ' ', a.last_name) AS author_name,
    b.available_copies
FROM books b
LEFT JOIN authors a ON b.author_id = a.author_id
LEFT JOIN issuance_records ir ON b.book_id = ir.book_id
WHERE ir.book_id IS NULL
ORDER BY b.title;

SELECT 
    SUM(fine_amount) AS total_fines,
    COUNT(*) AS total_fined_returns
FROM issuance_records
WHERE fine_amount > 0;
