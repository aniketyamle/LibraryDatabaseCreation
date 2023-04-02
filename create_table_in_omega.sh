amlanalok@Amlans-MacBook-Pro submission % sftp axa5861@omega.uta.edu

This UT Arlington information resource, including all related equipment,
networks and network devices, is provided for authorized use only. All
unauthorized use of this information resource is prohibited. Misuse is
subject to criminal prosecution and/or administrative or other
disciplinary action.

Usage of this information resource, authorized or unauthorized, may be
subject to security testing and monitoring. In addition, all information,
including personal information that is placed on or sent over this
resource is the properly of the State of Texas and may also be subject
to security testing and monitoring. Evidence of unauthorized use and/or
misuse collected during security testing and monitoring is subject to
criminal prosecution and/or administrative or other disciplinary action.

Usage of this information resource constitutes consent to all policies
and procedures set forth by UT Arlington and there is no expectation of
privacy except as otherwise provided by applicable privacy laws.



axa5861@omega.uta.edu's password:
Connected to omega.uta.edu.
sftp> put create_library.sql
Uploading create_library.sql to /home/a/ax/axa5861/create_library.sql
create_library.sql                                                                                                    100% 7141   255.9KB/s   00:00
sftp> exit
amlanalok@Amlans-MacBook-Pro submission % ssh axa5861@omega.uta.edu

This UT Arlington information resource, including all related equipment,
networks and network devices, is provided for authorized use only. All
unauthorized use of this information resource is prohibited. Misuse is
subject to criminal prosecution and/or administrative or other
disciplinary action.

Usage of this information resource, authorized or unauthorized, may be
subject to security testing and monitoring. In addition, all information,
including personal information that is placed on or sent over this
resource is the properly of the State of Texas and may also be subject
to security testing and monitoring. Evidence of unauthorized use and/or
misuse collected during security testing and monitoring is subject to
criminal prosecution and/or administrative or other disciplinary action.

Usage of this information resource constitutes consent to all policies
and procedures set forth by UT Arlington and there is no expectation of
privacy except as otherwise provided by applicable privacy laws.



axa5861@omega.uta.edu's password:
Last login: Sun Nov 13 14:03:59 2022 from 129.107.153.151
*****************************************************************************
      U N I V E R S I T Y   O F   T E X A S   A T   A R L I N G T O N
*****************************************************************************
    ____  ____ ___  ___  ____  ____ _ | Red Hat Enterprise Linux 5.11       |
   / __ \/ __ `__ \/ _ \/ __ `/ __ `/ | release 5.11 (Tikanga)              |
  / /_/ / / / / / /  __/ /_/ / /_/ /  | Intel Xeon CPU E5-2699 v4 @ 2.20GHz |
  \____/_/ /_/ /_/\___/\__, /\__,_/   | Processors: 4   RAM: 16GB           |
                      /____/          ***************************************

  Omega(Ω) is available for UTA student academic use. It is a general
  purpose UNIX server suitable for learning software development.

  For more information about Omega, visit https://go.uta.edu/omega

  Available tools: gcc/g++/gfortran 4.1.2, Python 2.4.3, PHP 5.1.6,
    ruby 1.8.5, mysql 14.14, SQL*Plus 11.2.0.4, SML 110.74, Sonnet 16.56
    Mathematica 7.0/8.0, perl 5.8.8, Java 1.6.0r20, cmake 2.6p4

  News:
    * Jan 20, 2022 – Please consider migrating to an updated version of the
      omega server, omegabeta.uta.edu, the new sever is running Red Hat
      Enterprise Linux 7.9 and will become the primary version of omega
      after the end of the current semester. For more information please
      submit a request through the OIT Help Desk.

  OIT Help Desk Self Service is available: https://go.uta.edu/sn
*****************************************************************************
[axa5861@omega ~]$ clear

[axa5861@omega ~]$ ls
create_library.sql  'm-0.txt'  public_html  Q3_output_0.txt  Q3_output_2.txt  Q4_output.txt  Q6_output.txt
db_create.sql	    m-1.txt    Q1.txt	    Q3_output_1.txt  Q3_output.txt    Q5_output.txt  test_01.csv
[axa5861@omega ~]$ mysql -u axa5861 -p -h academicmysql.mysql.database.azure.com
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 6758
Server version: 8.0.28 Source distribution

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> source create_library.sql;
Query OK, 1 row affected, 2 warnings (0.03 sec)

Database changed
Query OK, 0 rows affected (0.10 sec)

Query OK, 0 rows affected (0.08 sec)

Query OK, 0 rows affected (0.09 sec)

Query OK, 0 rows affected (0.10 sec)

Query OK, 0 rows affected (0.09 sec)

Query OK, 0 rows affected (0.12 sec)

Query OK, 0 rows affected (0.11 sec)

Query OK, 0 rows affected (0.09 sec)

Query OK, 0 rows affected (0.08 sec)

Query OK, 0 rows affected (0.10 sec)

Query OK, 0 rows affected (0.09 sec)

Query OK, 0 rows affected (0.11 sec)

Query OK, 0 rows affected (0.10 sec)

Query OK, 0 rows affected (0.09 sec)

Query OK, 0 rows affected (0.10 sec)

Database changed
Database changed
Query OK, 0 rows affected (0.04 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| axa5861            |
| information_schema |
+--------------------+
2 rows in set (0.01 sec)

mysql> use axa5861;
Database changed
mysql> show tables;
+-----------------------+
| Tables_in_axa5861     |
+-----------------------+
| author                |
| binding               |
| book                  |
| book_category         |
| book_for_lending      |
| book_member           |
| confirmed_cases       |
| county                |
| deaths                |
| employee              |
| interested_to_acquire |
| lang                  |
| member                |
| member_status         |
| member_type           |
| reason                |
| staff_position        |
| state                 |
| subject_area          |
| vaccinations          |
+-----------------------+
20 rows in set (0.02 sec)

