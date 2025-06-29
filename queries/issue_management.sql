INSERT INTO issuance_records (book_id, student_id, due_date, issued_by, notes)
VALUES (1, 1, CURRENT_DATE + INTERVAL '14 days', 'LIB001', 'Regular issuance');

UPDATE issuance_records 
SET 
    return_date = CURRENT_DATE,
    status = 'RETURNED',
    returned_by = 'LIB002',
    updated_at = CURRENT_TIMESTAMP
WHERE issuance_id = 1 AND status = 'ISSUED';

SELECT 
    ir.issuance_id,
    b.title,
    b.isbn,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    s.student_number,
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
WHERE ir.status = 'ISSUED'
ORDER BY ir.due_date;

SELECT 
    ir.issuance_id,
    b.title,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    s.email,
    s.phone,
    ir.issue_date,
    ir.due_date,
    CURRENT_DATE - ir.due_date AS days_overdue,
    (CURRENT_DATE - ir.due_date) * 1.00 AS fine_amount
FROM issuance_records ir
JOIN books b ON ir.book_id = b.book_id
JOIN students s ON ir.student_id = s.student_id
WHERE ir.status = 'ISSUED' 
  AND ir.due_date < CURRENT_DATE
ORDER BY days_overdue DESC;

SELECT 
    b.title,
    ir.issue_date,
    ir.due_date,
    ir.return_date,
    ir.status,
    ir.fine_amount
FROM issuance_records ir
JOIN books b ON ir.book_id = b.book_id
WHERE ir.student_id = 1
ORDER BY ir.issue_date DESC;
