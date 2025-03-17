use library_group_3;

-- Author_Book bridge table
create table Author_Book
(
AuthorID int not null,
Foreign key (AuthorID) references Author(AuthorID),
BookID int not null,
Foreign key (BookID) references Book(BookID)
);

INSERT INTO Author_Book(AuthorID, BookID)
VALUES (1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7);

select *
from Author_Book;