INSERT INTO authors (first_name, last_name, email, phone, birth_date) VALUES
('J.K.', 'Rowling', 'jk.rowling@email.com', '+44-123-456789', '1965-07-31'),
('George', 'Orwell', 'g.orwell@email.com', '+44-987-654321', '1903-06-25'),
('Harper', 'Lee', 'h.lee@email.com', '+1-555-123456', '1926-04-28'),
('Agatha', 'Christie', 'a.christie@email.com', '+44-111-222333', '1890-09-15'),
('Stephen', 'King', 's.king@email.com', '+1-555-987654', '1947-09-21');

INSERT INTO categories (category_name, description) VALUES
('Fiction', 'Fictional literature and novels'),
('Science Fiction', 'Science fiction and fantasy books'),
('Mystery', 'Mystery and thriller novels'),
('Biography', 'Biographical and autobiographical works'),
('Technical', 'Technical and educational books'),
('History', 'Historical books and documentaries'),
('Romance', 'Romance novels and stories');

INSERT INTO books (isbn, title, author_id, category_id, publisher, publication_year, pages, total_copies, available_copies, price, location) VALUES
('9780439708180', 'Harry Potter and the Sorcerer''s Stone', 1, 2, 'Scholastic', 1997, 309, 5, 5, 12.99, 'A1-001'),
('9780451524935', '1984', 2, 1, 'Signet Classics', 1949, 328, 3, 3, 9.99, 'A2-015'),
('9780061120084', 'To Kill a Mockingbird', 3, 1, 'Harper Perennial', 1960, 376, 4, 4, 11.50, 'A2-023'),
('9780062073501', 'And Then There Were None', 4, 3, 'William Morrow', 1939, 272, 2, 2, 10.99, 'B1-045'),
('9781501142970', 'The Shining', 5, 3, 'Doubleday', 1977, 447, 3, 3, 14.99, 'B2-012');

INSERT INTO students (student_number, first_name, last_name, email, phone, address, department, year_of_study) VALUES
('STU001', 'John', 'Doe', 'john.doe@university.edu', '+1-555-001001', '123 Main St, City, State', 'Computer Science', 2),
('STU002', 'Jane', 'Smith', 'jane.smith@university.edu', '+1-555-002002', '456 Oak Ave, City, State', 'English Literature', 3),
('STU003', 'Mike', 'Johnson', 'mike.johnson@university.edu', '+1-555-003003', '789 Pine Rd, City, State', 'Mathematics', 1),
('STU004', 'Sarah', 'Williams', 'sarah.williams@university.edu', '+1-555-004004', '321 Elm St, City, State', 'Psychology', 4),
('STU005', 'David', 'Brown', 'david.brown@university.edu', '+1-555-005005', '654 Maple Dr, City, State', 'History', 2);

INSERT INTO library_staff (staff_number, first_name, last_name, email, phone, position) VALUES
('LIB001', 'Alice', 'Cooper', 'alice.cooper@library.edu', '+1-555-101001', 'Head Librarian'),
('LIB002', 'Bob', 'Miller', 'bob.miller@library.edu', '+1-555-101002', 'Assistant Librarian'),
('LIB003', 'Carol', 'Davis', 'carol.davis@library.edu', '+1-555-101003', 'Library Assistant');

INSERT INTO issuance_records (book_id, student_id, issue_date, due_date, issued_by, notes) VALUES
(1, 1, '2024-06-01', '2024-06-15', 'LIB001', 'First issuance'),
(2, 2, '2024-06-05', '2024-06-19', 'LIB002', 'Regular issuance'),
(3, 3, '2024-06-10', '2024-06-24', 'LIB001', 'Student requested extension');
