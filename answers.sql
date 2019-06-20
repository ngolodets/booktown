--Order
  --Find all subjects sorted by subject:
    SELECT * FROM subjects ORDER BY subject;

  --Find all subjects sorted by location:
    SELECT * FROM subjects ORDER BY location;

--Where
  --Find the book "Little Women":
    SELECT * FROM books WHERE title = 'Little Women';

  --Find all books containing the word "Python":
    SELECT * FROM books WHERE title LIKE '%Python%';

  --Find all subjects with the location "Main St" sort them by subject:
    SELECT * FROM subjects WHERE location = 'Main St' ORDER BY subject;

--Joins
  --Find all books about Computers and list ONLY the book titles:
    SELECT s.subject, b.title 
    FROM subjects s LEFT JOIN books b                                                                           
    ON s.id = b.subject_id WHERE subject = 'Computers';

            select title from books join subjects
            on books.subject_id = subjects.id where subjects.id = 4;

  --Find all books and display a result table with ONLY the following columns

    SELECT title, first_name, last_name, subject
    FROM books JOIN authors ON books.author_id = authors.id
    JOIN subjects ON books.subject_id = subjects.id;

      --Book title
        SELECT s.subject, b.title                                          
        FROM subjects s INNER JOIN books b                   
        ON s.id = b.subject_id ORDER BY title;

      --Author's first name

      --Author's last name

      --Book subject  

--Find all books that are listed in the stock table
    SELECT title, retail
    FROM books JOIN editions ON books.id = editions.book_id
    JOIN stock ON editions.isbn = stock.isbn
    ORDER BY retail desc;

      --Sort them by retail price (most expensive first)

      --Display ONLY: title and price

--Find the book "Dune" and display ONLY the following columns
    SELECT title, editions.isbn, name, retail
    FROM books JOIN editions ON books.id = editions.book_id
    JOIN stock ON editions.isbn = stock.isbn
    JOIN publishers ON editions.publisher_id = publishers.id
    WHERE title = 'Dune';
    --Book title
    --ISBN number
    --Publisher name
    --Retail price

--Find all shipments sorted by ship date display a result table with ONLY the following columns:
    --Customer first name
    --Customer last name
    --ship date
    --book title
    SELECT first_name, last_name, ship_date, title
    FROM shipments JOIN editions ON shipments.isbn = editions.isbn
    JOIN customers ON shipments.customer_id = customers.id
    JOIN books ON editions.book_id = books.id
    ORDER BY ship_date;

    --OR
    SELECT first_name, last_name, ship_date, title
    FROM books JOIN editions ON books.id = editions.book_id
    JOIN shipments ON shipments.isbn = editions.isbn
    JOIN customers ON customers.id = shipments.customer_id
    ORDER BY ship_date;

--Grouping and Counting
  --Get the COUNT of all books
    SELECT count(*) from books;

  --Get the COUNT of all Locations
    SELECT count(location) from subjects;

  --Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
    SELECT count(location), location from subjects group by location;

  --List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
    SELECT books.id, title, count(editions.edition)
    FROM books JOIN editions ON books.id = editions.book_id
    GROUP BY books.id;


