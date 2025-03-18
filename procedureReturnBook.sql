 use library_group_3;
 
 -- As a librarian I wan to update the Return Date of a Loan
 -- so  I can keep a record of when the book was returned
 DELIMITER //
 
create procedure ReturnBook(
in UserFirstName varchar(100), in BorrowedBook varchar(255), in Email varchar(255))
begin
	update loan as l
    join user as u on u.UserID = l.UserID
    join copy as c on l.CopyID = c.CopyID
    join book as b on b.BookID = c. BookID
    set ReturnDate = curdate()
    where u.FirstName = UserFirstName
    and b.Title = BorrowedBook
	and u.UserEmail = Email
    and l.ReturnDate is null;

END//

DELIMITER ;

drop procedure ReturnBook;

call ReturnBook('Tim', 'Pride and Prejudice', 'lerqwc@sd.com');

select *
from loan;
 