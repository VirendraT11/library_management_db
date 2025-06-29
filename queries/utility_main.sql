UPDATE books 
SET available_copies = total_copies - (
    SELECT COUNT(*) 
    FROM issuance_records 
    WHERE book_id = books.book_id AND status = 'ISSUED'
)
WHERE book_id = 1;

SELECT 
    b.title,
    b.available_copies,
    CASE 
        WHEN b.available_copies > 0 THEN 'Available'
        ELSE 'Not Available'
    END AS availability_status
FROM books b
WHERE b.book_id = 1;

UPDATE issuance_records 
SET 
    due_date = due_date + INTERVAL '7 days',
    notes = CONCAT(COALESCE(notes, ''), ' - Due date extended'),
    updated_at = CURRENT_TIMESTAMP
WHERE issuance_id = 1 AND status = 'ISSUED';

UPDATE issuance_records 
SET 
    status = 'LOST',
    fine_amount = (SELECT price FROM books WHERE book_id = issuance_records.book_id),
    notes = CONCAT(COALESCE(notes, ''), ' - Book reported lost'),
    updated_at = CURRENT_TIMESTAMP
WHERE issuance_id = 1;
