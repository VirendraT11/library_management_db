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
    b.location
FROM books b
LEFT JOIN authors a ON b.author_id = a.author_id
LEFT JOIN categories c ON b.category_id = c.category_id
ORDER BY b.title;

SELECT 
    b.book_id,
    b.title,
    CONCAT(a.first_name, ' ', a.last_name) AS author_name,
    b.available_copies
FROM books b
LEFT JOIN authors a ON b.author_id = a.author_id
WHERE b.title ILIKE '%harry%' 
   OR CONCAT(a.first_name, ' ', a.last_name) ILIKE '%rowling%';

SELECT 
    b.title,
    CONCAT(a.first_name, ' ', a.last_name) AS author_name,
    b.available_copies
FROM books b
LEFT JOIN authors a ON b.author_id = a.author_id
WHERE b.available_copies > 0
ORDER BY b.title;