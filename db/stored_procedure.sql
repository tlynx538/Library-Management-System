-- This procedure extends the loan for a specified item and borrower, provided the loan exists and has not been returned.

DELIMITER $$

CREATE PROCEDURE extend_loan (
    IN borrower_id INT,
    IN item_id INT,
    IN new_due_date DATE
)
BEGIN
    DECLARE loan_exists INT;

    -- Step 1: Check if the loan exists and has not been returned
    SELECT COUNT(*) INTO loan_exists

    FROM loan
    WHERE borrower_id = borrower_id
      AND item_id = item_id
      AND returned_on IS NULL;

    -- Step 2: If the loan exists, update the due date and increment the renewal count

    IF loan_exists > 0 THEN
        UPDATE loan
        SET due_date = new_due_date,
            renewal_count = renewal_count + 1
        WHERE borrower_id = borrower_id
          AND item_id = item_id
          AND returned_on IS NULL;

        SELECT 'Loan extended successfully' AS status;
    ELSE

        -- Step 3: If no active loan exists, return an error message
        SELECT 'No active loan found to extend' AS status;
    END IF;
END$$

DELIMITER ;

-- This stored procedure checks if an item needs to be loaned or put on hold

DELIMITER $$

CREATE PROCEDURE create_loan_or_hold (
    IN borrower_id INT,
    IN item_id INT,
    IN loaned_on DATE,
    IN due_date DATE
)
BEGIN
    DECLARE item_on_loan INT;

    -- Step 1: Check if the item is already on loan (i.e., no returned_on value)
    SELECT COUNT(*) INTO item_on_loan
    FROM loan
    WHERE item_id = item_id
      AND returned_on IS NULL;

    -- Step 2: If the item is on loan, create a hold
    IF item_on_loan > 0 THEN
        -- Create a new hold in the reserves table
        INSERT INTO reserves (item_id, borrower_id, date_reserved, expiration_date)
        VALUES (item_id, borrower_id, CURRENT_DATE, DATE_ADD(CURRENT_DATE, INTERVAL 14 DAY));  -- Example: expiration 14 days from today

        SELECT 'Hold created' AS status;
    ELSE
        -- Step 3: If the item is not on loan, create a loan
        INSERT INTO loan (borrower_id, item_id, loaned_on, due_date, loan_status_id, renewal_count)
        VALUES (borrower_id, item_id, loaned_on, due_date, 0, 0);  -- Initial loan with status 0 and renewal count 0

        SELECT 'Loan created' AS status;
    END IF;
END$$

DELIMITER ;


-- This procedure calculates fine if borrower has not returned book or any other bibliographic item on time

DROP PROCEDURE CalculateFine;
DELIMITER //
CREATE PROCEDURE CalculateFine(IN borrowerId INT, IN loanId INT, OUT fineAmount DECIMAL(10, 2))
BEGIN
    DECLARE overdueDays INT;
    DECLARE dailyFine DECIMAL(10, 2);
    DECLARE maxFine DECIMAL(10, 2);
    DECLARE fineAmount DECIMAL(10, 2);
    DECLARE isFirstOffense BOOLEAN;

    -- Get the overdue days and fine rules
    SELECT DATEDIFF(CURDATE(), due_date) INTO overdueDays
    FROM Loan
    WHERE loan_id = loanId AND borrower_id = borrowerId AND returned_on IS NULL;

    -- Default values if the item is not overdue
    IF overdueDays IS NULL OR overdueDays <= 0 THEN
        SET fineAmount = 0;
    ELSE
        -- Get fine rules based on the loaned item
        SELECT lr.daily_fine, lr.max_renewals
        INTO dailyFine, maxFine
        FROM Loan_rules lr
        JOIN Items i ON lr.itemtype_id = i.item_id
        JOIN Loan l ON i.item_id = l.item_id
        WHERE l.loan_id = loanId;

        -- Calculate fine (after 2-week grace period)
        IF overdueDays > 14 THEN
            SET fineAmount = LEAST((overdueDays - 14) * dailyFine, maxFine);
        ELSE
            SET fineAmount = 0;
        END IF;
    END IF;

    -- Check if the borrower is a first-time offender
    SET isFirstOffense = NOT EXISTS (
        SELECT 1 FROM Fines WHERE borrower_id = borrowerId
    );

    -- Waive fine for first-time offenders
    IF isFirstOffense THEN
        SET fineAmount = 0;
    END IF;

    -- Record the fine
    IF fineAmount > 0 THEN
        INSERT INTO Fines (borrower_id, item_id, fine_amount, fine_date, loan_id)
        SELECT borrower_id, item_id, fineAmount, CURDATE(), loan_id
        FROM Loan
        WHERE loan_id = loanId;
    END IF;
END //
DELIMITER ;


