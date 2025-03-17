use library_group_3;

-- as a librarian I want to register a user

DELIMITER //

CREATE PROCEDURE RegisterUser(in FirstName  VARCHAR(50), in LastName VARCHAR(100), in UserEmail VARCHAR(100), in UserType VARCHAR(20))
BEGIN
	INSERT INTO User(FirstName, LastName, UserEmail, UserType)
	VALUES(FirstName, LastName, UserEmail, UserType);
END //


DELIMITER ;
drop PROCEDURE RegisterUser;

CALL RegisterUser('John', 'K', 'qe@sd.com', 'member');
CALL RegisterUser('George', 'K', 'ze@sd.com', 'user');

select *
from user;