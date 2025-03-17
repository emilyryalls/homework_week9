use library_group_3;

-- as a librarian I want to check which books are available

CREATE view vBorrowedBooks
as
select
	u.FirstName,
	u.LastName,
	b.Title,
	l.BorrowDate,
	c.CopyStatus
from user as u
INNER JOIN
loan as l
ON u.UserID = l.UserID
INNER JOIN
copy as c
ON l.CopyID = c.CopyID 
INNER JOIN
book as b
ON c.BookID = b.BookID
WHERE l.ReturnDate IS NULL ;

drop view vBorrowedBooks;

select *
from vBorrowedBooks;
