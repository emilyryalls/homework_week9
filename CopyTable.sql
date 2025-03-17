use library_group_3;

-- Copy table
create table Copy
(
CopyID int not null primary key auto_increment,
BookID int not null,
foreign key (BookID) references Book(BookID),
CopyStatus varchar(20) check (CopyStatus in ('Borrowed', 'Available'))
);

INSERT INTO Copy(BookID, CopyStatus)
VALUES (1, 'Borrowed'),
(1, 'Borrowed'),
(1, 'Available'),
(2, 'Borrowed'),
(2, 'Available'),
(3, 'Available'),
(3, 'Borrowed'),
(3, 'Available'),
(4, 'Available'),
(5, 'Available'),
(6, 'Available'),
(6, 'Available'),
(6, 'Available'),
(7, 'Available'),
(7, 'Available');

select *
from copy;

