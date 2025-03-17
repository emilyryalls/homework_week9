use library_group_3;

-- Genre table
create table Genre
(
GenreID int not null primary key AUTO_INCREMENT,
Genre VARCHAR(50) not null,
Location VARCHAR(2) not null
);

INSERT INTO Genre(Genre, Location)
VALUES('Fantasy','F'),
('Sci-Fi','G'),
('Romance','A'),
('Children''s Fiction','C'),
('Horror','B'),
('Thriller','T');

select *
from Genre;