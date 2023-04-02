insert into book_type values (1,'lent'), (2,'cannot be lent'), (3,'interested to acquire');

insert into book_category values (1, 'rare'), (2, 'out of print'),(3, 'lost'),(4, 'destroyed');

insert into subject_area values (1, 'Physics'), (2, 'Chemistry'), (3, 'Mathematics'), (4, 'History');

insert into binding values (1, 'Hardcover'), (2, 'Softcover');

insert into language values (1, 'English'), (2, 'Hindi');

insert into staff_position values (1, 'Chief Librarian'), (2, 'Departmental Associate Librarian'),
(3, 'Reference Librarian'), (4, 'Check-Out Staff'), (5, 'Library Assistants'), (6, 'professor');

insert into member_status values (1, 'active'), (2, 'inactive');

insert into member_type values (1,'standard',3,1,5), (2,'professor',12,2,50);

insert into author values (1, 'Richard Feynman'), (2, 'Alan Heeger'), (3, 'Eddie Woo'), (4, 'Cleopatra');


insert into book (`title`,`description`,`language`,`book_type_id`,`author_id`,`subject_area_id`, `binding_id`)
values ('Introduction to Chemistry', 'Learn Chemistry', 'English', 1,2,2,1),
('Introduction to Chemistry', 'Learn Chemistry', 'English', 1,2,2,1),
('Introduction to Mathematics', 'Learn Mathematics', 'English', 1,3,3,1),
('Secrets of Egypt', 'Know what is in the Pyramids', 'English', 3,4,4,1),
('Ashoka Empire', 'Know who is Ashoka and what he accomplished', );