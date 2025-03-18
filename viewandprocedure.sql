use library_group_3;

-- as a librarian I want to search for a user and see if they have borrowed a book when the user asks 
create view vShowAllUsers
as
select
	u.UserID,
	u.FirstName,
	u.LastName,
    u.UserEmail,
    b.Title,
    l.BorrowDate,
    l.ReturnDate,
    l.LoanID
from user as u
LEFT OUTER JOIN
loan as l
ON u.UserID = l.UserID
LEFT OUTER JOIN
copy as c
ON l.CopyID = c.CopyID 
LEFT OUTER JOIN
book as b
ON c.BookID = b.BookID

ORDER BY lastName;

drop view vShowAllUsers;
select * from  vShowAllUsers;

create view vShowLoanCount
as
select
	u.UserID,
	u.FirstName,
	u.LastName,
    u.UserEmail,
    COUNT(l.LoanID) AS NumberOfLoans
from user as u
LEFT OUTER JOIN
loan as l
ON u.UserID = l.UserID
GROUP BY u.UserID,u.FirstName,u.LastName,u.UserEmail
ORDER BY lastName;


select * from vShowLoanCount;


