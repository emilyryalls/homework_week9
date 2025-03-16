use library_group_3;

-- Author table
create table Author
(
AuthorID int not null primary key auto_increment,
FirstName varchar(100) not null,
LastName varchar(100) not null
);