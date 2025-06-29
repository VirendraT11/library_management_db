CREATE VIEW current_issuances AS
SELECT 
    ir.issuance_id,
    b.title,
    b.isbn,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    s.student_number,
    s.email,
    ir.issue_date,
    ir.due_date,
    CASE 
        WHEN ir.due_date < CURRENT_DATE THEN 'OVERDUE'
        ELSE 'ACTIVE'
    END AS status,
    CASE 
        WHEN ir.due_date < CURRENT_DATE THEN CURRENT_DATE - ir.due_date
        ELSE 0
    END AS days_overdue
FROM issuance_records ir
JOIN books b ON ir.book_id = b.book_id
JOIN students s ON ir.student_id = s.student_id
WHERE ir.status = 'ISSUED';

CREATE VIEW book_catalog AS
SELECT 
    b.book_id,
    b.isbn,
    b.title,
    CONCAT(a.first_name, ' ', a.last_name) AS author_name,
    c.category_name,
    b.publisher,
    b.publication_year,
    b.total_copies,
    b.available_copies,
    b.price,
    b.location,
    CASE 
        WHEN b.available_copies > 0 THEN 'Available'
        ELSE 'Not Available'
    END AS availability_status
FROM books b
LEFT JOIN authors a ON b.author_id = a.author_id
LEFT JOIN categories c ON b.category_id = c.category_id;