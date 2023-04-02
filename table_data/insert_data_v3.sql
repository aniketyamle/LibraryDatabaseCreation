use library;

insert into book_category values (1,'can be lent'), (2,'do not lend'), (3,'interested to acquire');

insert into reason values (1, 'rare'), (2, 'out of print'),(3, 'lost'),(4, 'destroyed');

insert into subject_area values (1, 'Physics'), (2, 'Chemistry'), (3, 'Mathematics'), (4, 'History');

insert into binding values (1, 'Hardcover'), (2, 'Softcover');

insert into lang values (1, 'English'), (2, 'Hindi');

insert into staff_position
values (1, 'Chief Librarian'),
(2, 'Departmental Associate Librarian'),
(3, 'Reference Librarian'),
(4, 'Check-Out Staff'),
(5, 'Library Assistants'),
(6, 'professor');

insert into member_status values (1, 'active'), (2, 'inactive');

insert into member_type values (1,'standard',21,1,5), (2,'professor',90,2,50);

insert into author values (1, 'Richard Feynman'), (2, 'Alan Heeger'), (3, 'Eddie Woo'), (4, 'Cleopatra'), (5, 'Amit');

insert into book (`isbn`,`title`,`description`,`book_category_id`,`author_id`,`subject_area_id`, `binding_id`,`lang_id`)
values (1, 'Introduction to Physics', 'Learn Physics', 1,1,1,1,1),
(2, 'Introduction to Chemistry', 'Learn Chemistry', 1,2,2,1,1),
(3, 'Introduction to Mathematics', 'Learn Mathematics', 1,3,3,1,1),
(4, 'Secrets of Egypt', 'Know what is in the Pyramids', 3,4,4,1,1),
(5, 'Ashoka Empire', 'Know who is Ashoka and what he accomplished', 3,5,4,1,2);

insert into interested_to_acquire (`book_isbn`,`reason_id`)
values (4,1), (5,3);

insert into book_for_lending values (1, 0, 10, 1), (2, 0, 20, 2), (3, 0, 30, 3);

insert into member values (1, 'Jon', '123456789','Arbor Oaks','Irving','123456789','2022-11-10','2026-11-10', 0, 1, 1),
(2, 'Arya', '123456780','Meadow Run','Dallas','123456789','2022-11-04','2026-11-04', 0, 1, 1),
(3, 'Sansa', '123456781','Meadow Run','Frisco','123456789','2018-11-06','2022-11-06', 0, 1, 2);

insert into employee values (1, 'Jennifer', '987654321', 'library', 'Grapevine', '1112223334','2022-11-11', 1),
(2, 'James', '987654322', 'library', 'Grapevine', '1112223335','2022-11-11', 5);

insert into employee values (3, 'Mike', '987654323', 'library', 'Grapevine', '1112223336','2022-11-11', 6);

insert into book_member values (1,1,'2022-11-10','2022-12-01',NULL),
(2,4,'2022-11-10','2023-02-10',NULL);

