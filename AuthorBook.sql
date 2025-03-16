use library_group_3;

-- Author_Book bridge table
create table Author_Book
(
AuthourID int not null,
Foreign key (AuthourID) references Author(AuthorID),
BookID int not null,
Foreign key (BookID) references Book(BookID)
);

