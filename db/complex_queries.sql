use spheredb;
-- #1 list novels and fantasies
SELECT 
    b.biblio_name, 
    b.biblio_desc, 
    ig.genre_name AS genre
FROM 
    Biblio b
JOIN 
    ItemGenre ig ON b.genre_id = ig.genre_id
JOIN 
    ItemType it ON b.itemtype_id = it.itemtype_id
WHERE 
    it.itemtype_name = 'Novel' 
    AND ig.genre_name = 'Fantasy';

-- # 2 list author names and number of works by them in fantasy or young adult
SELECT  
    author.author_name AS Author, 
    COUNT(Biblio.biblio_id) AS NumberOfFantasyNovels, 
    GROUP_CONCAT(Biblio.biblio_name ORDER BY Biblio.biblio_name SEPARATOR ', ') AS FantasyNovelTitles 

FROM  
    author 

INNER JOIN  
    Biblio ON author.author_id = Biblio.author_id
INNER JOIN 
    ItemGenre ON  Biblio.genre_id = ItemGenre.genre_id
WHERE  
    ItemGenre.genre_name = 'Fantasy' OR ItemGenre.genre_name = 'Young Adult'

GROUP BY  
    author.author_id 

ORDER BY  
    NumberOfFantasyNovels DESC; 


-- #3 List items borrowed by a borrower
SELECT  
    br.name AS borrower_name, 
    COUNT(l.item_id) AS total_items_borrowed, 
    MAX(l.loaned_on) AS last_loan_date 

FROM 
    spheredb.Borrowers br 
    JOIN spheredb.Loan l ON br.borrower_id = l.borrower_id 
    JOIN spheredb.Items i ON l.item_id = i.item_id 

GROUP BY  
    br.borrower_id 

HAVING  
    total_items_borrowed > 0 

ORDER BY  
    total_items_borrowed DESC; 

-- # 4 list biblio written by author whose name starts with A
SELECT 
    b.biblio_name, 
    b.biblio_desc, 
    a.author_name AS author_name
FROM 
    Biblio b
JOIN 
    Author a ON b.author_id = a.author_id
WHERE 
    a.author_name LIKE 'A%'  -- Filters authors whose name starts with "A"
ORDER BY 
    b.biblio_name;  -- Optional: Orders by book name


-- #5 List biblio
SELECT  
    biblio.biblio_name, 
    biblio.biblio_desc, 
    author.author_name, 
    ItemGenre.genre_name, 
    PublisherDetails.publisher_name, 
    Ratings.rating, 
    BiblioItems.published_date, 
    ItemType.itemtype_name 

FROM  
    biblio 

JOIN  
    author ON biblio.author_id = author.author_id 

JOIN  
    ItemType ON biblio.itemtype_id = ItemType.itemtype_id 

JOIN  
    ItemGenre ON biblio.genre_id = ItemGenre.genre_id 

JOIN  
    PublisherDetails ON biblio.publisher_id = PublisherDetails.publisher_id 

JOIN  
    BiblioItems ON biblio.biblio_id = BiblioItems.biblio_id 

JOIN  
    Ratings ON biblio.biblio_id = Ratings.biblio_id; 


-- #6 List Biblio by Author Name (Full or Partial)

SELECT  
    biblio.biblio_name, 
    biblio.biblio_desc, 
    author.author_name, 
    ItemGenre.genre_name, 
    PublisherDetails.publisher_name, 
    Ratings.rating, 
    BiblioItems.published_date, 
    ItemType.itemtype_name 

FROM  
    biblio 

JOIN  
    author ON biblio.author_id = author.author_id 

JOIN  
    ItemType ON biblio.itemtype_id = ItemType.itemtype_id 

JOIN  
    ItemGenre ON biblio.genre_id = ItemGenre.genre_id 

JOIN  
    PublisherDetails ON biblio.publisher_id = PublisherDetails.publisher_id 

JOIN  
    BiblioItems ON biblio.biblio_id = BiblioItems.biblio_id 

JOIN  
    Ratings ON biblio.biblio_id = Ratings.biblio_id 

WHERE  
    author.author_name LIKE 'A_%'; 

-- #7 List Items Loaned by Borrowers ID

SELECT  
    borrowers.name, 
    borrowers.phone, 
    loan.loaned_on, 
    loan.returned_on, 
    loanstatus.loan_status, 
    biblio.biblio_name, 
    biblio.biblio_desc, 
    author.author_name, 
    BiblioItems.isbn, 
    PublisherDetails.publisher_name, 
    ratings.rating 

FROM  
    borrowers 

JOIN  
    loan ON borrowers.borrower_id = loan.borrower_id 

JOIN 
	loanstatus ON loanstatus.loan_status_id = loan.loan_status_id

JOIN  
    items ON loan.item_id = items.item_id 

JOIN  
    BiblioItems ON items.biblioitems_id = BiblioItems.biblioitems_id 

JOIN  
    biblio ON BiblioItems.biblio_id = biblio.biblio_id 

JOIN  
    author ON biblio.author_id = author.author_id 

JOIN  
    ItemGenre ON biblio.genre_id = ItemGenre.genre_id 

JOIN  
    ItemType ON BiblioItems.itemtype_id = ItemType.itemtype_id 

JOIN  
    PublisherDetails ON biblio.publisher_id = PublisherDetails.publisher_id 

JOIN  
    ratings ON biblio.biblio_id = ratings.biblio_id 

WHERE  
    loan.borrower_id = 1; 


-- #8 List Items Reserved by Borrowers 

SELECT  
    borrowers.name, 
    borrowers.phone, 
    reserves.date_reserved, 
    reserves.expiration_date, 
    biblio.biblio_name, 
    biblio.biblio_desc, 
    author.author_name, 
    BiblioItems.isbn, 
    PublisherDetails.publisher_name, 
    ratings.rating 

FROM  
    borrowers 

JOIN  
    reserves ON borrowers.borrower_id = reserves.borrower_id 

JOIN  
    items ON reserves.item_id = items.item_id 

JOIN  
    BiblioItems ON items.biblioitems_id = BiblioItems.biblioitems_id 

JOIN  
    biblio ON BiblioItems.biblio_id = biblio.biblio_id 

JOIN  
    author ON biblio.author_id = author.author_id 

JOIN  
    ItemGenre ON biblio.genre_id = ItemGenre.genre_id 

JOIN  
    ItemType ON BiblioItems.itemtype_id = ItemType.itemtype_id 

JOIN  
    PublisherDetails ON biblio.publisher_id = PublisherDetails.publisher_id 

JOIN  
    ratings ON biblio.biblio_id = ratings.biblio_id 

WHERE  
    reserves.borrower_id = 1; 

-- #9 Show notifications by borrower id 

SELECT 
    b.name AS borrower_name,
    n.NotificationText,
    n.NotificationDate,
    n.IsRead
FROM 
    Notifications n
JOIN 
    Borrowers b ON n.UserID = b.borrower_id
WHERE 
    b.borrower_id = 1  
    AND n.IsRead = 0  
ORDER BY 
    n.NotificationDate DESC;

-- #10 Display Fine by borrower id 
SELECT 
    b.name AS borrower_name,
    f.fine_amount,
    f.fine_date,
    i.barcode AS item_barcode,
    i.item_location,
    bib.biblio_name
FROM 
    Fines f
JOIN 
    Borrowers b ON f.borrower_id = b.borrower_id
JOIN 
    Items i ON f.item_id = i.item_id
JOIN 
    BiblioItems bi ON i.biblioitems_id = bi.biblioitems_id
JOIN
    Biblio bib ON bib.biblio_id = bi.biblio_id
WHERE 
    b.borrower_id = 1  
ORDER BY 
    f.fine_date DESC;
