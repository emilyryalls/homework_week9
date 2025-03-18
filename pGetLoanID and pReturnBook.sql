use library_group_3;

-- see all users
select *
from vShowAllUsers


-- procedure to get loan id of unreturned books
DELIMITER //

CREATE PROCEDURE pGetLoanID(in FirstName VARCHAR(50), in LastName VARCHAR(100), in Email VARCHAR(100) )
BEGIN
	select LoanID, FirstName,LastName, UserEmail, Title, ReturnDate from vShowAllUsers
    WHERE Email = UserEmail and ReturnDate IS NULL;
END //

DELIMITER ;

-- drop procedure pGetLoanID;

call pGetLoanID('Emily', 'K', 'we@sd.com');
-- the below returns an empty table as Ivon currently has no unreturned booked (no ReturnDate values are NULL)
call pGetLoanID('Ivon', 'Martinez', 'dthe@sd.com');



-- this can be copied to be used in another procedure to update return date to a defined date
DELIMITER //

CREATE PROCEDURE pReturnBook(in Loan_ID int, in RDate date)
BEGIN
	UPDATE Loan set ReturnDate = RDate
    WHERE Loan_ID = LoanID;
    
    SELECT LoanID, FirstName,LastName, UserEmail, Title, ReturnDate from vShowAllUsers
    WHERE LoanID = Loan_ID;
END //

DELIMITER ;

drop procedure pReturnBook;

call pReturnBook(1, '2025-03-18');

select *
from vShowAllUsers


