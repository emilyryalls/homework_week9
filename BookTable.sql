use library_group_3;

-- Book table
create table Book
(
BookID int not null primary key AUTO_INCREMENT,
BookLanguageID int not null,
Foreign key (BookLanguageID) references BookLanguage(BookLanguageID),
GenreID int not null,
Foreign key (GenreID) references Genre(GenreID),
ISBN bigint not null unique check (ISBN REGEXP '^[0-9]{13}$'),
Title VARCHAR(200) not null,
PublicationYear int not null check (PublicationYear BETWEEN 1000 AND 9999)
);


INSERT INTO Book(ISBN, Title, PublicationYear,BookLanguageID,GenreID)
VALUES(9780747532699,'Harry Potter',1997,1,1),
(9788498382662,'Harry Potter y la piedra filosofal',2010,2,1),
(9780140434262,'Pride and Prejudice',1813,1,3),
(9781405265204,'One Day',2009,1,3),
(9781234566543,'Much Ado About Nothing',1993,1,3),
(9780723247702,'The Tale of Peter Rabbit',1902,1,4),
(9780061120084,'To Kill a Mockingbird',1960,1,6);
