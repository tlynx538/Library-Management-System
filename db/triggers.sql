-- before insert trigger to check if there are 5 holds
DELIMITER $$

CREATE TRIGGER before_insert_reserve
BEFORE INSERT ON reserves
FOR EACH ROW
BEGIN
    -- Check if the borrower already has 5 active holds
    DECLARE hold_count INT;

    -- Count active holds for the borrower (those with expiration_date in the future)
    SELECT COUNT(*)
    INTO hold_count
    FROM reserves
    WHERE borrower_id = NEW.borrower_id
      AND expiration_date > CURRENT_DATE;

    -- If the borrower already has 5 active holds, raise an error
    IF hold_count >= 5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A borrower can only have a maximum of 5 active holds at once.';
    END IF;
END$$

DELIMITER ;


DELIMITER $$


-- set trigger for holds expiration
CREATE TRIGGER set_hold_expiration
AFTER INSERT ON reserves
FOR EACH ROW
BEGIN
    -- Automatically set the expiration_date to 7 days after the reservation date if not provided
    IF NEW.expiration_date IS NULL THEN
        UPDATE reserves
        SET expiration_date = DATE_ADD(NEW.date_reserved, INTERVAL 7 DAY)
        WHERE reserve_id = NEW.reserve_id;
    END IF;
END$$

DELIMITER ;

DELIMITER $$


-- deleted expired holds
CREATE TRIGGER delete_expired_holds
AFTER UPDATE ON reserves
FOR EACH ROW
BEGIN
    -- Check if the expiration_date is in the past and the hold is not yet expired
    IF OLD.expiration_date < CURRENT_DATE THEN
        DELETE FROM reserves WHERE reserve_id = OLD.reserve_id;
    END IF;
END$$

DELIMITER ;

DELETE FROM reserves
WHERE expiration_date < CURDATE();