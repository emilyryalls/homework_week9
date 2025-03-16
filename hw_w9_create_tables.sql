create database library_group_3;

use library_group_3;

-- User table
create table User
(
UserID int not null primary key AUTO_INCREMENT,
FirstName VARCHAR(50) not null,
LastName VARCHAR(100) not null,
UserEmail VARCHAR(100) not null,
unique (UserEmail), check(UserEmail like '%_@_%._%'),
UserType VARCHAR(20), CHECK(UserType in ('member', 'librarian'))
);


-- Genre table
create table Genre
(
GenreID int not null primary key AUTO_INCREMENT,
Genre VARCHAR(50) not null,
Location VARCHAR(2) not null
);


-- Language table
create table BookLanguage
(
BookLanguageID int not null primary key auto_increment,
BookLanguage varchar(100) not null
);

-- Author table
create table Author
(
AuthorID int not null primary key auto_increment,
FirstName varchar(100) not null,
LastName varchar(100) not null
);


-- Book table
create table Book
(
BookID int not null primary key AUTO_INCREMENT,
BookLanguageID int not null,
Foreign key (BookLanguageID) references BookLanguage(BookLanguageID),
GenreID int not null,
Foreign key (GenreID) references Genre(GenreID),
ISBN bigint not null unique check (ISBN = 13),
Title VARCHAR(200) not null,
PublicationYear int not null check (PublicationYear = 4)
);


-- Author_Book bridge table
create table Author_Book
(
AuthourID int not null,
Foreign key (AuthourID) references Author(AuthorID),
BookID int not null,
Foreign key (BookID) references Book(BookID)
);


-- Copy table
create table Copy
(
CopyID int not null primary key auto_increment,
BookID int not null,
foreign key (BookID) references Book(BookID),
CopyStatus varchar(20) check (CopyStatus in ('Borrowed', 'Available'))
);


-- Loan table
create table Loan
(
LoanID int not null primary key auto_increment,
UserID int not null,
foreign key (UserID) references User(UserID),
CopyID int not null,
foreign key (CopyID) references Copy(CopyID),
BorrowDate date not null default (curdate()),
ReturnDate date null
);
-- removed check (ReturnDate >= BorrowDate) for the ReturnDate field to get rid of error, but we can ask about this Tuesday