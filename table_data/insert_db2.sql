use axy9230;

insert into book_category values (1,'can be lent'), (2,'do not lend'), (3,'interested to acquire');

insert into reason values (1, 'rare'), (2, 'out of print'),(3, 'lost'),(4, 'destroyed');

insert into subject_area values (1, 'Physics'), (2, 'Chemistry'), (3, 'Mathematics'), (4, 'History'),(5,'Computer Science'),(6,'Aerospace'),(7,'Mechanical'),(8,'Literature');

insert into binding values (1, 'Hardcover'), (2, 'Softcover');

insert into lang values (1, 'English'), (2, 'Hindi'),(3, 'Spanish'),(4, 'Polish'),(5, 'Italian'),(6, 'Russian');

insert into staff_position
values (1, 'Chief Librarian'),
(2, 'Departmental Associate Librarian'),
(3, 'Reference Librarian'),
(4, 'Check-Out Staff'),
(5, 'Library Assistants'),
(6, 'professor');

insert into member_status values (1, 'Active'), (2, 'Inactive');

insert into member_type values (1,'standard',21,1,5), (2,'professor',90,2,50);

insert into author values (1, 'Richard Feynman'), (2, 'Alan Heeger'), (3, 'Eddie Woo'), (4, 'Cleopatra'), (5, 'Amit'),(12, 'Amish Tripathi')
, (6, 'Shakespeare'), (7, 'Charles Lewin'), (8, 'George RR'), (9, 'Elnasri'), (10, 'Antony Adams'),(11, 'Eric Dier');

insert into book (`isbn`,`title`,`description`,`book_category_id`,`author_id`,`subject_area_id`, `binding_id`,`lang_id`)
values (1, 'Introduction to Physics', 'Learn Physics', 1,1,1,1,1),
(2, 'Introduction to Chemistry', 'Learn Chemistry', 1,2,2,1,1),
(3, 'Introduction to Mathematics', 'Learn Mathematics', 1,3,3,1,1),
(4, 'Secrets of Egypt', 'Know what is in the Pyramids', 3,4,4,1,1),
(5, 'Ashoka Empire', 'Know who is Ashoka and what he accomplished', 3,5,4,1,2),
(6, 'Introduction to Algorithms', 'Knowledge about Algorithms', 1,7,5,2,1),
(7, 'Introduction to Algorithms', 'Knowledge about Algorithms', 1,7,5,1,1),
(8, 'Introduction to Algorithms', 'Knowledge about Algorithms', 1,7,5,1,5),
(9, 'Introduction to Algorithms', 'Knowledge about Algorithms', 1,7,5,1,6),
(10, 'Game of thrones', 'Best Series of all time with all life experience', 1,8,8,1,1),
(11, 'Game of thrones', 'Best Series of all time with all life experience', 1,8,8,1,3),
(12, 'Hamlet', 'Drama of love and passion', 3,6,8,1,2),
(13, 'Julius Caeser', 'Violence', 2,6,8,2,5),
(14, 'Python Programming', 'Intermediate level to develop code', 1,10,5,1,1),
(15, 'Python Expert', 'Intermediate level to develop code', 1,10,5,1,1),
(16, 'Database Systems', 'easy  to write sql query', 1,9,5,1,1),
(17, 'Flying Machine', 'Fly High', 3,11,6,2,1),
(18, 'Machine to Machine', 'fix the bolts instructions', 3,11,7,2,2),
(19, 'Ikigai', 'Learn Chemistry', 1,11,2,1,2),
(20, 'Algebra Expressions', 'xyz+abc+pqrs', 3,2,3,1,1),
(21, 'Algebra Expressions', 'xyz+abc+pqrs', 1,2,3,1,1),
(22, 'Integral Expressions', 'Integration Stuff', 2,3,3,1,1),
(23, 'Integral Expressions', 'Integration Stuff', 3,3,3,1,1),
(24, 'Immortals of Meluha', 'Fantasy of Mythology Drama', 2,5,4,1,2),
(25, 'Immortals of Meluha', 'Fantasy of Mythology Drama', 2,12,4,1,1),
(26, 'Concepts of Physics', 'Learn Experimental Knowledge', 1,1,1,1,2),
(27, 'Football Mechanics', 'Think about dynamics', 1,11,7,2,1),
(28, 'Football Mechanics', 'Think about dynamics', 1,11,7,2,2),
(29, 'Football Mechanics', 'Think about dynamics', 1,11,7,1,1),
(30, 'House of Dragons', 'House Targeryen', 2,8,4,1,1),
(31, 'Concepts of Physics', 'Learn Experimental Knowledge', 1,1,1,1,1);


insert into interested_to_acquire (`book_isbn`,`reason_id`)
values (4,1), (5,3),(12,2),(13,1),(17,4),(18,3),(20,2),(22,1),(23,3),(24,2),(25,1),(30,1);

insert into book_for_lending values 
(1, 1, 1, 1), 
(2, 2, 2, 2), 
(3, 3, 3,3),
(4, 1, 1,6),
(5, 0, 5,7),
(6, 0, 5,8),
(7, 5, 5,9),
(8, 5, 5,10),
(9, 3, 3,15),
(10, 4, 1,27),
(11, 5, 0,19),
(12, 1, 0,26);


insert into member values (1, 'Jon', '123456789','Arbor Oaks','Irving','123456789','2022-11-10','2026-11-10', 1, 1, 1,0),
(2, 'Arya', '123456780','Meadow Run','Dallas','123456789','2022-11-04','2026-11-04', 0, 1, 1,0),
(3, 'Sansa', '123456781','Meadow Run','Frisco','123456789','2018-11-06','2022-11-06', 0, 1, 2,0),
(4, 'Ned', '1234126781','Arbor Run','Waco','123456789','2018-10-07','2022-10-07', 0, 2, 2,0),
(5, 'Rob', '1234526781','Benge Run','Irving','123456789','2018-11-05','2022-11-05', 0, 1, 2,0),
(6, 'Daemon', '123456881','Queen Run','Frisco','123456789','2022-11-16','2026-11-16', 0, 2, 1,0),
(7, 'Tyrion', '123456981','Cooper Street','Waco','6852345689','2022-11-06','2026-11-06', 15, 2, 1,0),
(8, 'Cersei', '153456781','Mead Street','Frisco','6843456789','2022-10-02','2026-10-02', 0, 2, 1,0),
(9, 'Aegon', '113456781','Cooper Street','Waco','9823456789','2022-09-18','2026-09-18', 5, 1, 1,0),
(10, 'Jamie', '123356781','Cooper Street','Potter','8823456789','2022-11-26','2026-11-26', 1, 1, 1,0),
(11, 'Alok', '123451781','Randol Street','Irving','223456789','2022-11-06','2026-11-06', 1, 1, 1,0),
(12, 'Aniket', '123456788','Fielder Street','Irving','1293456789','2021-11-09','2025-11-09', 2, 1, 1,0);


insert into employee values (1, 'Jennifer', '987654321', 'library', 'Grapevine', '1112223334','2022-11-11', 1),
(2, 'James', '987654322', 'library', 'Aplpevine', '9992223335','2012-11-11', 2),
(3, 'Karen', '987654344', 'library', 'Divine', '1112221234','2016-01-11', 3),
(4, 'Ashley', '987655555', 'library', 'Pine', '9999993335','2020-05-11', 4),
(5, 'Carlsen', '987677777', 'library', 'Qeri', '8888888885','2021-09-28', 5),
(6, 'Damain', '987654328', 'library', 'Tahoe','9876543210' ,'2010-11-12', 5);



insert into employee values (14, 'Mike', '987654323', 'library', 'Grapevine', '1112223336','2022-11-11', 6);

insert into book_member values (1,1,1,'2022-11-10','2022-12-01',NULL),
(2,2,4,'2022-11-10','2023-02-10',NULL),
(3,10,7,'2022-11-22','2023-02-22',NULL),
(4,26,7,'2022-11-15','2022-12-06','2022-11-17'),
(5,6,6,'2022-11-21','2023-02-21',NULL),
(6,19,11,'2022-11-21','2022-12-12','2022-11-22'),
(7,19,12,'2022-11-21','2022-12-12','2022-11-21');


