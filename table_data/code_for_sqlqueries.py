#code to connect mysql server to upload csv data
import mysql.connector as msql
from mysql.connector import Error
try:
    conn = msql.connect(host='acadmysqldb001p.uta.edu', database='axy9230',user='axy9230',password="ANIYAM25$$");
    print("SQL Server Connected")
except Error as e:
    print("Error ", e)

import pandas as pd
cursor=conn.cursor()

#first transaction is to add information about a new MEMBER.
cursor.execute("insert into member values (15, 'Vaerys', '12345234789','Arbor Oaks','Omaha','123456789','2022-11-10','2026-11-10', 0, 1, 1)")

#second transaction is to add all the information about a new BOOK.
cursor.execute("insert into book (`isbn`,`title`,`description`,`book_category_id`,`author_id`,`subject_area_id`, `binding_id`,`lang_id`) values (50, 'Risk Factor', 'Precaution and updating carefully', 1,8,5,1,1)")

#transaction is to add all the information about a new BORROW (LOAN)
cursor.execute("insert into book_member values (15,15,'2022-11-18','2022-12-11',NULL);")

#transaction is to handle the return of a book. This transaction should print a return receipt with the details of the book and days when it was borrowed and returned

cursor.execute("select b.title,b.description, m.date_of_borrowing ,m.date_of_return from book b join book_member m on b.isbn=m.book_isbn;")


#transaction is to renew the membership
cursor.execute("update member set member_status=1 where id=5 and member_status=2")


