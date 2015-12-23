1. Add columns 'created_at' and 'updated_at' to the tables marks, students and medals.


mysql> alter table students add column created_at timestamp default '0000-00-00 00:00:00',add column updated_at timestamp default now() on update now();  
Query OK, 6 rows affected (0.28 sec)
Records: 6  Duplicates: 0  Warnings: 0



mysql> alter table marks add column created_at timestamp default '0000-00-00 00:00:00',add column updated_at timestamp default now() on update now(); 
Query OK, 0 rows affected (0.26 sec)
Records: 0  Duplicates: 0  Warnings: 0




mysql> alter table medals add column created_at timestamp default '0000-00-00 00:00:00',add column updated_at timestamp default now() on update now(); 
Query OK, 0 rows affected (0.26 sec)
Records: 0  Duplicates: 0  Warnings: 0



2. Replace the null values in quarterly, half_yearly and annual columns with 0 and make those columns as not nullable.

mysql> UPDATE marks SET quartely=0 WHERE quarterly IS NULL; 
ERROR 1054 (42S22): Unknown column 'quartely' in 'field list'
mysql> UPDATE marks SET quarterly=0 WHERE quarterly IS NULL; 
Query OK, 7 rows affected (0.05 sec)
Rows matched: 7  Changed: 7  Warnings: 0

mysql> UPDATE marks SET half_yearly=0 WHERE half_yearly IS NULL; 
Query OK, 4 rows affected (0.06 sec)
Rows matched: 4  Changed: 4  Warnings: 0

mysql> UPDATE marks SET annual=0 WHERE annual IS NULL; 
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> alter table marks modify quarterly int(11) not null,modify half_yearly int(11) not null,modify annual int(11) not null;
Query OK, 125 rows affected (0.26 sec)
Records: 125  Duplicates: 0  Warnings: 0



3. While inserting the value of updated_at & created_at should be the current time

INSERT INTO `students` (id,name,created_at)VALUES (100007,'Thor',now()),(100008,'Hulk',now()),(100009,'Daredevil',now());
   
query OK, 3 rows affected (0.06 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from students;+--------+-------------+---------------------+---------------------+
| id     | name        | created_at          | updated_at          |
+--------+-------------+---------------------+---------------------+
| 100001 | Thor        | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 |
| 100002 | Hulk        | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 |
| 100003 | Daredevil   | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 |
| 100004 | X Man       | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 |
| 100005 | Ironman     | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 |
| 100006 | Quicksilver | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 |
| 100007 | Thor        | 2015-12-09 19:00:54 | 2015-12-09 19:00:54 |
| 100008 | Hulk        | 2015-12-09 19:00:54 | 2015-12-09 19:00:54 |
| 100009 | Daredevil   | 2015-12-09 19:00:54 | 2015-12-09 19:00:54 |
+--------+-------------+---------------------+---------------------+
9 rows in set (0.00 sec)

4. While updating the value of updated_at alone should be the time of update

mysql> update students set name='vishal' where id='100001';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0


mysql> select * from students;
+--------+-------------+---------------------+---------------------+
| id     | name        | created_at          | updated_at          |
+--------+-------------+---------------------+---------------------+
| 100001 | vishal      | 0000-00-00 00:00:00 | 2015-12-09 19:02:32 |
| 100002 | Hulk        | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 |
| 100003 | Daredevil   | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 |
| 100004 | X Man       | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 |
| 100005 | Ironman     | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 |
| 100006 | Quicksilver | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 |
| 100007 | Thor        | 2015-12-09 19:00:54 | 2015-12-09 19:00:54 |
| 100008 | Hulk        | 2015-12-09 19:00:54 | 2015-12-09 19:00:54 |
| 100009 | Daredevil   | 2015-12-09 19:00:54 | 2015-12-09 19:00:54 |
+--------+-------------+---------------------+---------------------+
9 rows in set (0.00 sec)



