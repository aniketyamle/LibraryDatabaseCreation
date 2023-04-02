
use library;

select * from book_type;
select * from book_category;
select * from author;
select * from subject_area;
select * from staff_position;
select * from member_status;
select * from member_type;


-- display all books
select b.isbn, b.title, bc.book_category, a.author_name, sa.subject_area, bnd.bind_type, l.language_name
from book as b
join book_category as bc on bc.id = b.book_category_id
join author as a on a.id = b.author_id
join subject_area as sa on sa.id = b.subject_area_id
join binding as bnd on bnd.id = b.binding_id
join lang as l on l.id = b.lang_id;


-- display books interested to acquire
select b.isbn, b.title, bc.book_category, a.author_name, sa.subject_area, bnd.bind_type, l.language_name
from book as b
join interested_to_acquire as ia on b.isbn = ia.book_isbn
join book_category as bc on bc.id = b.book_category_id
join author as a on a.id = b.author_id
join subject_area as sa on sa.id = b.subject_area_id
join binding as bnd on bnd.id = b.binding_id
join lang as l on l.id = b.lang_id
join reason as r on r.id = ia.reason_id;



-- Q3 report query
select b.isbn, b.title, m.member_name, bm.date_of_borrowing,  date(now()) - bm.date_of_borrowing as `Days Since Borrowed`, mt.borrowing_period_limit as `Number of Days Loaned`,
a.author_name, sa.subject_area
from book_member as bm
join book as b on b.isbn = bm.book_isbn
join author as a on a.id = b.author_id
join subject_area as sa on sa.id = b.subject_area_id
join member as m on m.id = bm.member_id
join member_type as mt on mt.id = m.member_type_id
where bm.date_of_borrowing >= (select Date(now()-interval 7 day))
order by sa.subject_area, a.author_name, mt.borrowing_period_limit;