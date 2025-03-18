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
ON c.BookID = b.BookID;

select *
from vShowAllUsers


CREATE PROCEDURE pGetLoanID

DELIMITER //

CREATE PROCEDURE pReturnBook(in FirstName VARCHAR(50), in LastName VARCHAR(100), in Email VARCHAR(100) )
BEGIN
	select FirstName,LastName, UserEmail,Title, ReturnDate from vShowAllUsers
    WHERE Email = UserEmail;
    UPDATE Loan set ReturnDate=CURDATE()
    WHERE Email = UserEmail;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE pReturnBook(in FirstName VARCHAR(50), in LastName VARCHAR(100), in Email VARCHAR(100) )
BEGIN
	select FirstName,LastName, UserEmail,Title, ReturnDate from vShowAllUsers
    WHERE Email = UserEmail;
    UPDATE Loan set ReturnDate=CURDATE()
    WHERE Email = UserEmail;
END //

DELIMITER ;
drop procedure pReturnBook;
CALL pReturnBook('Emily', 'K', 'we@sd.com');




