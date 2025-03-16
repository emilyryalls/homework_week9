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

INSERT INTO User(FirstName, LastName, UserEmail, UserType)
VALUES('Emily', 'K', 'we@sd.com', 'member'),
('Daphne', 'M', 'sde@sd.com', 'Librarian'),
('Malvina', 'F', 'dte@sd.com', 'Librarian'),
('Ivon', 'Martinez', 'dthe@sd.com', 'Librarian'),
('Anna', 'Koutsaki', 'lerc@sd.com', 'Member'),
('Leo', 'Jones', 'jgdte@sd.com', 'Member'),
('William', 'Davis', 'dlkjthe@sd.com', 'Member'),
('Tim', 'Brown', 'lerqwc@sd.com', 'Member')
;


select *
from User;
