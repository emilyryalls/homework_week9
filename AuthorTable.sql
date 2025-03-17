use library_group_3;

-- Author table
create table Author
(
AuthorID int not null primary key auto_increment,
FirstName varchar(100) not null,
LastName varchar(100) not null
);

INSERT INTO Author(FirstName, LastName)
VALUES ('J.K.', 'Rowling'),
('Jane', 'Austen'),
('David', 'Nicholls'),
('William', 'Shakespeare'),
('Beatrix', 'Potter'),
('Harper', 'Lee');

select*
from Author;