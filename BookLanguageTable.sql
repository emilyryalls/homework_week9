use library_group_3;

-- Language table
create table BookLanguage
(
BookLanguageID int not null primary key auto_increment,
BookLanguage varchar(100) not null
);

INSERT INTO BookLanguage(BookLanguage)
VALUES('English'),
('Spanish'),
('Japanese'),
('German'),
('French'),
('Greek'),
('Polish');

select *
from booklanguage;