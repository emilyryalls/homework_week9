use library_group_3;

-- Copy table
create table Copy
(
CopyID int not null primary key auto_increment,
BookID int not null,
foreign key (BookID) references Book(BookID),
CopyStatus varchar(20) check (CopyStatus in ('Borrowed', 'Available'))
);

