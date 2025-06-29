CREATE OR REPLACE FUNCTION update_book_availability()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        UPDATE books 
        SET available_copies = available_copies - 1 
        WHERE book_id = NEW.book_id;
        
    ELSIF TG_OP = 'UPDATE' THEN
        IF OLD.status = 'ISSUED' AND NEW.status = 'RETURNED' THEN
            UPDATE books 
            SET available_copies = available_copies + 1 
            WHERE book_id = NEW.book_id;
        END IF;
    END IF;
    
    RETURN COALESCE(NEW, OLD);
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_book_availability
    AFTER INSERT OR UPDATE ON issuance_records
    FOR EACH ROW
    EXECUTE FUNCTION update_book_availability();

CREATE OR REPLACE FUNCTION calculate_fine()
RETURNS TRIGGER AS $$
DECLARE
    days_overdue INTEGER;
    fine_per_day DECIMAL(5,2) := 1.00; 
BEGIN
    IF NEW.return_date IS NOT NULL AND NEW.return_date > NEW.due_date THEN
        days_overdue := NEW.return_date - NEW.due_date;
        NEW.fine_amount := days_overdue * fine_per_day;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_calculate_fine
    BEFORE UPDATE ON issuance_records
    FOR EACH ROW
    EXECUTE FUNCTION calculate_fine();
