/* Functions */

#1

DROP FUNCTION calculate_fine;

DELIMITER //

CREATE FUNCTION calculate_fine(loan_id INT) 
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    -- Declare variables for fine amount, days overdue, and daily fine rate
    DECLARE fine_amount DECIMAL(10, 2) DEFAULT 0;
    DECLARE days_overdue INT DEFAULT 0;
    DECLARE daily_fine DECIMAL(10, 2);

    -- Calculate the number of overdue days; only consider if the item has not been returned
    SELECT DATEDIFF(CURRENT_DATE, due_date) INTO days_overdue
    FROM Loan 
    WHERE loan_id = loan_id AND returned_on IS NULL;

    -- If there are overdue days, calculate the fine based on daily rate from loan_rules
    IF days_overdue > 0 THEN
        SELECT lr.daily_fine INTO daily_fine
        FROM loan_rules lr
        JOIN Items i ON i.itemtype_id = lr.itemtype_id
        JOIN Loan l ON l.item_id = i.item_id
        WHERE l.loan_id = loan_id;

        -- Calculate fine amount as days overdue multiplied by daily rate
        SET fine_amount = days_overdue * daily_fine;
    END IF;

    RETURN fine_amount;
END //

DELIMITER ;


#2

DROP FUNCTION get_borrower_status;

DELIMITER //

CREATE FUNCTION get_borrower_status(borrower_id INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    -- Declare a variable to store the borrower's status
    DECLARE status VARCHAR(50) DEFAULT 'Unknown';

    -- Retrieve the borrower's status by joining with BorrowerStatus table
    SELECT bs.status_name INTO status
    FROM Borrowers b
    JOIN BorrowerStatus bs ON b.borrower_status = bs.status_id
    WHERE b.borrower_id = borrower_id
    LIMIT 1;

    RETURN status;
END //

DELIMITER ;


#3

DROP FUNCTION is_item_available;

DELIMITER //

CREATE FUNCTION is_item_available(item_id INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    -- Declare a variable to indicate availability status, default to TRUE
    DECLARE available BOOLEAN DEFAULT TRUE;

    -- Check if the item is currently on loan by finding active loans with "on loan" status
    SET available = NOT EXISTS (
        SELECT 1 
        FROM Loan 
        WHERE item_id = item_id 
        AND loan_status_id IN (SELECT loan_status_id FROM LoanStatus WHERE loan_status = 'on loan')
    );

    RETURN available;
END //

DELIMITER ;


#4

DROP FUNCTION count_items_by_genre;

DELIMITER //

CREATE FUNCTION count_items_by_genre(genre_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    -- Declare a variable to store the count of items
    DECLARE item_count INT DEFAULT 0;

    -- Count the items by genre by joining Items and Biblio tables
    SELECT COUNT(*) INTO item_count
    FROM Items i
    JOIN Biblio b ON i.biblioitems_id = b.biblio_id
    WHERE b.genre_id = genre_id;

    RETURN item_count;
END //

DELIMITER ;


#5

DROP FUNCTION calculate_outstanding_balance;

DELIMITER //

CREATE FUNCTION calculate_outstanding_balance(customer_id INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    -- Declare a variable to store the total outstanding balance
    DECLARE total_balance DECIMAL(10, 2) DEFAULT 0;

    -- Calculate the total outstanding balance by summing unpaid order amounts for the given customer
    SELECT SUM(od.quantityOrdered * od.priceEach) INTO total_balance
    FROM orders o
    JOIN orderdetails od ON o.orderNumber = od.orderNumber
    WHERE o.customer_id = customer_id 
      AND o.status <> 'Shipped';

    RETURN total_balance;
END //

DELIMITER ;
