#Part 2 Question 2
select b.isbn,a.author_name,b.title,s.subject_area,b.description
from  author a join book b  on a.id=b.author_id join subject_area s on s.id=b.subject_area_id;

select * from book_member;
select * from book;
select * from employee;

#Part 2 Question 3

select b.isbn,s.subject_area, sum(l.loan_count) as Copies,sum(datediff(m.date_of_return,m.date_of_borrowing)) as Total_Borrowed_Days
from subject_area s join book b on s.id=b.subject_area_id 
join book_for_lending l on b.isbn=l.book_isbn
join book_member m on b.isbn=m.book_isbn
where m.date_of_borrowing>='2022-11-14'and m.date_of_return<='2022-11-21'
group by s.subject_area,l.loan_count,b.isbn;


