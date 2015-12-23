Write the queries from the "marks" table using inner join with the table "students" table to replace student_id with name.

Queries that uses “marks” table:

 1. Select the students who has not appeared in the annual exams.
Format: All columns of the “marks” table.

mysql> select m.id,name ,subject_id,quarterly,half_yearly,annual,year,grade from marks m,students s where m.student_id=s.id and annual is null;
+------+------+------------+-----------+-------------+--------+------+-------+
| id   | name | subject_id | quarterly | half_yearly | annual | year | grade |
+------+------+------------+-----------+-------------+--------+------+-------+
| 1101 | Thor |          1 |      NULL |        NULL |   NULL | 2007 |    10 |
+------+------+------------+-----------+-------------+--------+------+-------+
1 row in set (0.00 sec)



2. Select the students who has not appeared in the annual exams during the year “2005”.
Format: student_id, subject_id, year

mysql> select name ,subject_id,year from marks m,students s where m.student_id=s.id and year='2005' and annual is null;
Empty set (0.00 sec)



3. Select the students who has appeared in one of the exams - quarterly, half_yearly or annual.
Format: student_id, subject_id, year

mysql> select name ,subject_id,year from marks m,students s where m.student_id=s.id and (quarterly is not null or half_yearly is not null or annual is not null);
+-----------+------------+------+
| name      | subject_id | year |
+-----------+------------+------+
| Thor      |          1 | 2003 |
| Thor      |          2 | 2003 |
| Thor      |          3 | 2003 |
| Thor      |          4 | 2003 |
| Thor      |          5 | 2003 |
| Thor      |          1 | 2004 |
| Thor      |          2 | 2004 |
| Thor      |          3 | 2004 |
| Thor      |          4 | 2004 |
| Thor      |          5 | 2004 |
| Thor      |          1 | 2005 |
| Thor      |          2 | 2005 |
| Thor      |          3 | 2005 |
| Thor      |          4 | 2005 |
| Thor      |          5 | 2005 |
| Thor      |          1 | 2006 |
| Thor      |          2 | 2006 |
| Thor      |          3 | 2006 |
| Thor      |          4 | 2006 |
| Thor      |          5 | 2006 |
| Thor      |          2 | 2007 |
| Thor      |          3 | 2007 |
| Thor      |          4 | 2007 |
| Thor      |          5 | 2007 |
| Hulk      |          1 | 2003 |
| Hulk      |          2 | 2003 |
| Hulk      |          3 | 2003 |
| Hulk      |          4 | 2003 |
| Hulk      |          5 | 2003 |
| Hulk      |          1 | 2004 |
| Hulk      |          2 | 2004 |
| Hulk      |          3 | 2004 |
| Hulk      |          4 | 2004 |
| Hulk      |          5 | 2004 |
| Hulk      |          1 | 2005 |
| Hulk      |          2 | 2005 |
| Hulk      |          3 | 2005 |
| Hulk      |          4 | 2005 |
| Hulk      |          5 | 2005 |
| Hulk      |          1 | 2006 |
| Hulk      |          2 | 2006 |
| Hulk      |          3 | 2006 |
| Hulk      |          4 | 2006 |
| Hulk      |          5 | 2006 |
| Hulk      |          1 | 2007 |
| Hulk      |          2 | 2007 |
| Hulk      |          3 | 2007 |
| Hulk      |          4 | 2007 |
| Hulk      |          5 | 2007 |
| Daredevil |          1 | 2003 |
| Daredevil |          2 | 2003 |
| Daredevil |          3 | 2003 |
| Daredevil |          4 | 2003 |
| Daredevil |          5 | 2003 |
| Daredevil |          1 | 2004 |
| Daredevil |          2 | 2004 |
| Daredevil |          3 | 2004 |
| Daredevil |          4 | 2004 |
| Daredevil |          5 | 2004 |
| Daredevil |          1 | 2005 |
| Daredevil |          2 | 2005 |
| Daredevil |          3 | 2005 |
| Daredevil |          4 | 2005 |
| Daredevil |          5 | 2005 |
| Daredevil |          1 | 2006 |
| Daredevil |          2 | 2006 |
| Daredevil |          3 | 2006 |
| Daredevil |          4 | 2006 |
| Daredevil |          5 | 2006 |
| Daredevil |          1 | 2007 |
| Daredevil |          2 | 2007 |
| Daredevil |          3 | 2007 |
| Daredevil |          4 | 2007 |
| Daredevil |          5 | 2007 |
| X Man     |          1 | 2003 |
| X Man     |          2 | 2003 |
| X Man     |          3 | 2003 |
| X Man     |          4 | 2003 |
| X Man     |          5 | 2003 |
| X Man     |          1 | 2004 |
| X Man     |          2 | 2004 |
| X Man     |          3 | 2004 |
| X Man     |          4 | 2004 |
| X Man     |          5 | 2004 |
| X Man     |          1 | 2005 |
| X Man     |          2 | 2005 |
| X Man     |          3 | 2005 |
| X Man     |          4 | 2005 |
| X Man     |          5 | 2005 |
| X Man     |          1 | 2006 |
| X Man     |          2 | 2006 |
| X Man     |          3 | 2006 |
| X Man     |          4 | 2006 |
| X Man     |          5 | 2006 |
| X Man     |          1 | 2007 |
| X Man     |          2 | 2007 |
| X Man     |          3 | 2007 |
| X Man     |          4 | 2007 |
| X Man     |          5 | 2007 |
| Ironman   |          1 | 2003 |
| Ironman   |          2 | 2003 |
| Ironman   |          3 | 2003 |
| Ironman   |          4 | 2003 |
| Ironman   |          5 | 2003 |
| Ironman   |          1 | 2004 |
| Ironman   |          2 | 2004 |
| Ironman   |          3 | 2004 |
| Ironman   |          4 | 2004 |
| Ironman   |          5 | 2004 |
| Ironman   |          1 | 2005 |
| Ironman   |          2 | 2005 |
| Ironman   |          3 | 2005 |
| Ironman   |          4 | 2005 |
| Ironman   |          5 | 2005 |
| Ironman   |          1 | 2006 |
| Ironman   |          2 | 2006 |
| Ironman   |          3 | 2006 |
| Ironman   |          4 | 2006 |
| Ironman   |          5 | 2006 |
| Ironman   |          1 | 2007 |
| Ironman   |          2 | 2007 |
| Ironman   |          3 | 2007 |
| Ironman   |          4 | 2007 |
| Ironman   |          5 | 2007 |
+-----------+------------+------+
124 rows in set (0.00 sec)


3. Select the students who has scored more than 90 in all the exams - quarterly, half_yearly and annual.
Format: student_id, subject_id, year, quarterly, half_yearly, annual

mysql> select name ,subject_id,year,quarterly,half_yearly,annual from marks m,students s where m.student_id=s.id and quarterly>90 and half_yearly>90 and annual>90;
+-----------+------------+------+-----------+-------------+--------+
| name      | subject_id | year | quarterly | half_yearly | annual |
+-----------+------------+------+-----------+-------------+--------+
| Daredevil |          1 | 2003 |       100 |          97 |     95 |
| Daredevil |          2 | 2003 |        93 |          91 |     98 |
| Daredevil |          4 | 2003 |        91 |          95 |     99 |
| Daredevil |          2 | 2006 |       100 |          99 |     95 |
+-----------+------------+------+-----------+-------------+--------+
4 rows in set (0.00 sec)




4. List the average marks(in quarterly, half_yearly & annual) for each subject scored for the year.
Format: student_id, subject_id, average, year


mysql> select name ,subject_id,sum(quarterly+half_yearly+annual)/3 average,year from marks m,students s where m.student_id=s.id group by student_id,subject_id,year;
+-----------+------------+---------+------+
| name      | subject_id | average | year |
+-----------+------------+---------+------+
| Thor      |          1 |    NULL | 2003 |
| Thor      |          1 | 50.0000 | 2004 |
| Thor      |          1 | 82.3333 | 2005 |
| Thor      |          1 | 67.3333 | 2006 |
| Thor      |          1 |    NULL | 2007 |
| Thor      |          2 |    NULL | 2003 |
| Thor      |          2 | 43.0000 | 2004 |
| Thor      |          2 | 65.0000 | 2005 |
| Thor      |          2 | 74.0000 | 2006 |
| Thor      |          2 | 59.3333 | 2007 |
| Thor      |          3 |    NULL | 2003 |
| Thor      |          3 | 62.6667 | 2004 |
| Thor      |          3 | 53.3333 | 2005 |
| Thor      |          3 |    NULL | 2006 |
| Thor      |          3 | 78.3333 | 2007 |
| Thor      |          4 |    NULL | 2003 |
| Thor      |          4 | 55.0000 | 2004 |
| Thor      |          4 | 73.3333 | 2005 |
| Thor      |          4 | 72.3333 | 2006 |
| Thor      |          4 | 68.6667 | 2007 |
| Thor      |          5 |    NULL | 2003 |
| Thor      |          5 | 69.0000 | 2004 |
| Thor      |          5 | 80.6667 | 2005 |
| Thor      |          5 | 76.6667 | 2006 |
| Thor      |          5 | 62.0000 | 2007 |
| Hulk      |          1 | 53.6667 | 2003 |
| Hulk      |          1 | 59.3333 | 2004 |
| Hulk      |          1 | 53.0000 | 2005 |
| Hulk      |          1 | 59.0000 | 2006 |
| Hulk      |          1 | 67.6667 | 2007 |
| Hulk      |          2 | 56.3333 | 2003 |
| Hulk      |          2 | 90.0000 | 2004 |
| Hulk      |          2 | 60.6667 | 2005 |
| Hulk      |          2 | 63.3333 | 2006 |
| Hulk      |          2 | 56.6667 | 2007 |
| Hulk      |          3 | 56.6667 | 2003 |
| Hulk      |          3 | 58.6667 | 2004 |
| Hulk      |          3 | 52.0000 | 2005 |
| Hulk      |          3 | 54.3333 | 2006 |
| Hulk      |          3 | 68.6667 | 2007 |
| Hulk      |          4 | 42.0000 | 2003 |
| Hulk      |          4 | 74.0000 | 2004 |
| Hulk      |          4 | 65.0000 | 2005 |
| Hulk      |          4 | 55.6667 | 2006 |
| Hulk      |          4 | 81.0000 | 2007 |
| Hulk      |          5 | 43.3333 | 2003 |
| Hulk      |          5 | 77.3333 | 2004 |
| Hulk      |          5 | 68.3333 | 2005 |
| Hulk      |          5 | 46.0000 | 2006 |
| Hulk      |          5 | 60.0000 | 2007 |
| Daredevil |          1 | 97.3333 | 2003 |
| Daredevil |          1 | 74.6667 | 2004 |
| Daredevil |          1 | 72.0000 | 2005 |
| Daredevil |          1 | 72.0000 | 2006 |
| Daredevil |          1 | 80.6667 | 2007 |
| Daredevil |          2 | 94.0000 | 2003 |
| Daredevil |          2 | 68.0000 | 2004 |
| Daredevil |          2 | 51.3333 | 2005 |
| Daredevil |          2 | 98.0000 | 2006 |
| Daredevil |          2 | 91.0000 | 2007 |
| Daredevil |          3 |    NULL | 2003 |
| Daredevil |          3 | 52.6667 | 2004 |
| Daredevil |          3 | 69.6667 | 2005 |
| Daredevil |          3 | 61.3333 | 2006 |
| Daredevil |          3 | 63.0000 | 2007 |
| Daredevil |          4 | 95.0000 | 2003 |
| Daredevil |          4 | 62.0000 | 2004 |
| Daredevil |          4 | 71.3333 | 2005 |
| Daredevil |          4 | 74.0000 | 2006 |
| Daredevil |          4 | 69.3333 | 2007 |
| Daredevil |          5 | 93.3333 | 2003 |
| Daredevil |          5 | 61.6667 | 2004 |
| Daredevil |          5 | 58.3333 | 2005 |
| Daredevil |          5 | 80.3333 | 2006 |
| Daredevil |          5 | 54.0000 | 2007 |
| X Man     |          1 | 47.0000 | 2003 |
| X Man     |          1 | 66.6667 | 2004 |
| X Man     |          1 | 77.0000 | 2005 |
| X Man     |          1 | 80.6667 | 2006 |
| X Man     |          1 | 46.3333 | 2007 |
| X Man     |          2 | 71.6667 | 2003 |
| X Man     |          2 | 77.6667 | 2004 |
| X Man     |          2 | 53.0000 | 2005 |
| X Man     |          2 | 59.0000 | 2006 |
| X Man     |          2 | 57.3333 | 2007 |
| X Man     |          3 | 58.6667 | 2003 |
| X Man     |          3 | 61.6667 | 2004 |
| X Man     |          3 | 90.0000 | 2005 |
| X Man     |          3 | 74.6667 | 2006 |
| X Man     |          3 | 50.0000 | 2007 |
| X Man     |          4 | 53.6667 | 2003 |
| X Man     |          4 | 65.0000 | 2004 |
| X Man     |          4 | 44.6667 | 2005 |
| X Man     |          4 | 66.0000 | 2006 |
| X Man     |          4 | 85.6667 | 2007 |
| X Man     |          5 | 59.3333 | 2003 |
| X Man     |          5 | 72.3333 | 2004 |
| X Man     |          5 | 72.6667 | 2005 |
| X Man     |          5 | 60.6667 | 2006 |
| X Man     |          5 | 53.3333 | 2007 |
| Ironman   |          1 | 71.0000 | 2003 |
| Ironman   |          1 | 67.0000 | 2004 |
| Ironman   |          1 | 61.3333 | 2005 |
| Ironman   |          1 | 70.0000 | 2006 |
| Ironman   |          1 | 78.0000 | 2007 |
| Ironman   |          2 | 56.0000 | 2003 |
| Ironman   |          2 | 54.3333 | 2004 |
| Ironman   |          2 | 56.3333 | 2005 |
| Ironman   |          2 | 63.6667 | 2006 |
| Ironman   |          2 | 85.6667 | 2007 |
| Ironman   |          3 | 41.3333 | 2003 |
| Ironman   |          3 | 63.3333 | 2004 |
| Ironman   |          3 | 68.3333 | 2005 |
| Ironman   |          3 | 70.0000 | 2006 |
| Ironman   |          3 | 71.3333 | 2007 |
| Ironman   |          4 | 71.6667 | 2003 |
| Ironman   |          4 | 61.3333 | 2004 |
| Ironman   |          4 | 65.0000 | 2005 |
| Ironman   |          4 | 80.3333 | 2006 |
| Ironman   |          4 | 61.6667 | 2007 |
| Ironman   |          5 | 54.6667 | 2003 |
| Ironman   |          5 | 39.6667 | 2004 |
| Ironman   |          5 | 58.0000 | 2005 |
| Ironman   |          5 | 81.0000 | 2006 |
| Ironman   |          5 | 93.0000 | 2007 |
+-----------+------------+---------+------+
125 rows in set (0.00 sec)


5. List the average marks(in quarterly, half_yearly & annual) for each subject scored for the years 2003 & 2004
Format: student_id, subject_id, average, year

mysql> select name ,subject_id,sum(quarterly+half_yearly+annual)/3 average,year from marks m,students s where m.student_id=s.id and year in('2003','2004') group by student_id,subject_id,year;
+-----------+------------+---------+------+
| name      | subject_id | average | year |
+-----------+------------+---------+------+
| Thor      |          1 |    NULL | 2003 |
| Thor      |          1 | 50.0000 | 2004 |
| Thor      |          2 |    NULL | 2003 |
| Thor      |          2 | 43.0000 | 2004 |
| Thor      |          3 |    NULL | 2003 |
| Thor      |          3 | 62.6667 | 2004 |
| Thor      |          4 |    NULL | 2003 |
| Thor      |          4 | 55.0000 | 2004 |
| Thor      |          5 |    NULL | 2003 |
| Thor      |          5 | 69.0000 | 2004 |
| Hulk      |          1 | 53.6667 | 2003 |
| Hulk      |          1 | 59.3333 | 2004 |
| Hulk      |          2 | 56.3333 | 2003 |
| Hulk      |          2 | 90.0000 | 2004 |
| Hulk      |          3 | 56.6667 | 2003 |
| Hulk      |          3 | 58.6667 | 2004 |
| Hulk      |          4 | 42.0000 | 2003 |
| Hulk      |          4 | 74.0000 | 2004 |
| Hulk      |          5 | 43.3333 | 2003 |
| Hulk      |          5 | 77.3333 | 2004 |
| Daredevil |          1 | 97.3333 | 2003 |
| Daredevil |          1 | 74.6667 | 2004 |
| Daredevil |          2 | 94.0000 | 2003 |
| Daredevil |          2 | 68.0000 | 2004 |
| Daredevil |          3 |    NULL | 2003 |
| Daredevil |          3 | 52.6667 | 2004 |
| Daredevil |          4 | 95.0000 | 2003 |
| Daredevil |          4 | 62.0000 | 2004 |
| Daredevil |          5 | 93.3333 | 2003 |
| Daredevil |          5 | 61.6667 | 2004 |
| X Man     |          1 | 47.0000 | 2003 |
| X Man     |          1 | 66.6667 | 2004 |
| X Man     |          2 | 71.6667 | 2003 |
| X Man     |          2 | 77.6667 | 2004 |
| X Man     |          3 | 58.6667 | 2003 |
| X Man     |          3 | 61.6667 | 2004 |
| X Man     |          4 | 53.6667 | 2003 |
| X Man     |          4 | 65.0000 | 2004 |
| X Man     |          5 | 59.3333 | 2003 |
| X Man     |          5 | 72.3333 | 2004 |
| Ironman   |          1 | 71.0000 | 2003 |
| Ironman   |          1 | 67.0000 | 2004 |
| Ironman   |          2 | 56.0000 | 2003 |
| Ironman   |          2 | 54.3333 | 2004 |
| Ironman   |          3 | 41.3333 | 2003 |
| Ironman   |          3 | 63.3333 | 2004 |
| Ironman   |          4 | 71.6667 | 2003 |
| Ironman   |          4 | 61.3333 | 2004 |
| Ironman   |          5 | 54.6667 | 2003 |
| Ironman   |          5 | 39.6667 | 2004 |
+-----------+------------+---------+------+
50 rows in set (0.00 sec)













Write SQL queries for the below questions after loading the sample exercise data. All these queries should be joined with the “students” table to display the student name instead of student_id.

1. List the students who didn’t appear for any exams.
Format: name
mysql> select s.name from students s, marks m where s.id=m.student_id and (quarterly is NULL and half_yearly is NULL and annual is NULL);
+------+
| name |
+------+
| Thor |
+------+
1 row in set (0.00 sec)




2. Find the total marks scored by each students in the annual exams. If the student hasn’t appeared for any annual exam, he should still be listed with total marks scored as “0”.
Format: name, marks, year

mysql> select name ,coalesce(sum(annual),0) marks,year from students s inner join marks m on s.id=m.student_id group by m.student_id,m.year;
+-----------+-------+------+
| name      | marks | year |
+-----------+-------+------+
| Thor      |   424 | 2003 |
| Thor      |   309 | 2004 |
| Thor      |   375 | 2005 |
| Thor      |   296 | 2006 |
| Thor      |   212 | 2007 |
| Hulk      |   296 | 2003 |
| Hulk      |   463 | 2004 |
| Hulk      |   295 | 2005 |
| Hulk      |   218 | 2006 |
| Hulk      |   429 | 2007 |
| Daredevil |   465 | 2003 |
| Daredevil |   319 | 2004 |
| Daredevil |   385 | 2005 |
| Daredevil |   318 | 2006 |
| Daredevil |   306 | 2007 |
| X Man     |   261 | 2003 |
| X Man     |   307 | 2004 |
| X Man     |   312 | 2005 |
| X Man     |   287 | 2006 |
| X Man     |   354 | 2007 |
| Ironman   |   323 | 2003 |
| Ironman   |   287 | 2004 |
| Ironman   |   287 | 2005 |
| Ironman   |   320 | 2006 |
| Ironman   |   412 | 2007 |
+-----------+-------+------+
25 rows in set (0.00 sec)




3. List the students with the total marks scored in quarterly from all the subjects they had appeared during the year 2003.
Format: name, total, grade


mysql> select name, sum(coalesce(quarterly,0)) total,grade from students s inner join marks m on s.id=m.student_id and year='2003' group by m.student_id;
+-----------+-------+-------+
| name      | total | grade |
+-----------+-------+-------+
| Thor      |     0 |     6 |
| Hulk      |   203 |     6 |
| Daredevil |   428 |     6 |
| X Man     |   300 |     6 |
| Ironman   |   277 |     6 |
+-----------+-------+-------+
5 rows in set (0.00 sec)


4. List the 9th and 10th grade students who received more than 3 medals.
Format: name, grade, no_of_medals
 select name,m.grade,count(me.student_id) no_of_medals from students s left join (select student_id from medals) me on s.id=me.student_id left join (select student_id,grade from marks where grade=10 or grade=9 group by student_id,grade) m on s.id=m.student_id group by m.grade,s.id having no_of_medals>3;
+-----------+-------+--------------+
| name      | grade | no_of_medals |
+-----------+-------+--------------+
| Thor      |     9 |            4 |
| Hulk      |     9 |            4 |
| Daredevil |     9 |            5 |
| Thor      |    10 |            4 |
| Hulk      |    10 |            4 |
| Daredevil |    10 |            5 |
+-----------+-------+--------------+
6 rows in set (0.00 sec)



5. List the students who got less than 2 medals. This should also include the students who has not won any medals.
Format: name, grade, no_of_medals

mysql> select name,m.grade,count(me.student_id) no_of_medals from students s left join (select student_id from medals) me on s.id=me.student_id left join (select student_id,grade from marks where grade=10 or grade=9 group by student_id,grade) m on s.id=m.student_id group by m.grade,s.id having no_of_medals<2;
+-------------+-------+--------------+
| name        | grade | no_of_medals |
+-------------+-------+--------------+
| Quicksilver |  NULL |            0 |
| X Man       |     9 |            0 |
| Ironman     |     9 |            0 |
| X Man       |    10 |            0 |
| Ironman     |    10 |            0 |
+-------------+-------+--------------+
5 rows in set (0.00 sec)


6. List the students who has not yet received any medals but scored more than 90 marks in all the subjects in the annual exam for that year.
Format: name, year
mysql> select name, m.year from students s,marks m where s.id=m.student_id and m.student_id not in(select student_id from medals )  group by m.student_id,year having min(annual)>90;
Empty set (0.00 sec)


7. List the records from the medals table for the students who had won more than 3 medals.
Format: name, game_id, medal_won, year, grade

mysql> select name,game_id,medal_won,year,grade from students s,medals m where s.id=m.student_id and s.id in(select student_id from medals group by student_id having count(*)>3);
+-----------+---------+-----------+------+-------+
| name      | game_id | medal_won | year | grade |
+-----------+---------+-----------+------+-------+
| Daredevil |       5 | gold      | 2003 |     6 |
| Thor      |       5 | silver    | 2003 |     6 |
| Hulk      |       4 | silver    | 2003 |     6 |
| Daredevil |       1 | gold      | 2003 |     6 |
| Daredevil |       3 | bronze    | 2004 |     7 |
| Daredevil |       4 | silver    | 2004 |     7 |
| Hulk      |       2 | silver    | 2004 |     7 |
| Hulk      |       4 | bronze    | 2004 |     7 |
| Hulk      |       5 | gold      | 2004 |     7 |
| Daredevil |       3 | bronze    | 2005 |     8 |
| Thor      |       2 | gold      | 2005 |     8 |
| Thor      |       3 | bronze    | 2005 |     8 |
| Thor      |       4 | bronze    | 2005 |     8 |
+-----------+---------+-----------+------+-------+
13 rows in set (0.00 sec)


8.List the number of medals and percentage of marks(based on total for the 5 subjects) scored in each year.
Format: name, medals, quarterly_per, half_yearly_per, annual_per, year, grade


mysql> select name, coalesce(medals,0),quarterly_per,half_yearly_per,annual_per,a.year,b.grade from(select student_id,sum(quarterly)/5 quarterly_per,sum(half_yearly)/5 half_yearly_per,sum(annual)/5 annual_per,year from marks group by student_id,year) a left join (select student_id,grade,count(*) medals, year from medals group by student_id,year) b on a.student_id=b.student_id and a.year=b.year inner join students s on s.id=a.student_id;
+-----------+--------------------+---------------+-----------------+------------+------+-------+
| name      | coalesce(medals,0) | quarterly_per | half_yearly_per | annual_per | year | grade |
+-----------+--------------------+---------------+-----------------+------------+------+-------+
| vishal    |                  1 |        0.0000 |         45.2000 |    84.8000 | 2003 |     6 |
| vishal    |                  0 |       47.2000 |         58.8000 |    61.8000 | 2004 |  NULL |
| vishal    |                  3 |       66.8000 |         71.0000 |    75.0000 | 2005 |     8 |
| vishal    |                  0 |       57.6000 |         63.8000 |    59.2000 | 2006 |  NULL |
| vishal    |                  0 |       60.2000 |         58.4000 |    42.4000 | 2007 |  NULL |
| vishal    |                  0 |       16.0000 |         15.8000 |    18.2000 | 2013 |  NULL |
| vishal    |                  0 |       18.0000 |         15.8000 |    18.2000 | 2014 |  NULL |
| Hulk      |                  1 |       40.6000 |         51.4000 |    59.2000 | 2003 |     6 |
| Hulk      |                  3 |       64.8000 |         58.2000 |    92.6000 | 2004 |     7 |
| Hulk      |                  0 |       65.6000 |         54.8000 |    59.0000 | 2005 |  NULL |
| Hulk      |                  0 |       73.8000 |         49.6000 |    43.6000 | 2006 |  NULL |
| Hulk      |                  0 |       60.6000 |         54.0000 |    85.8000 | 2007 |  NULL |
| Daredevil |                  2 |       85.6000 |         75.0000 |    93.0000 | 2003 |     6 |
| Daredevil |                  2 |       64.8000 |         62.8000 |    63.8000 | 2004 |     7 |
| Daredevil |                  1 |       66.8000 |         49.8000 |    77.0000 | 2005 |     8 |
| Daredevil |                  0 |       81.0000 |         86.8000 |    63.6000 | 2006 |  NULL |
| Daredevil |                  0 |       79.8000 |         73.8000 |    61.2000 | 2007 |  NULL |
| X Man     |                  0 |       60.0000 |         62.0000 |    52.2000 | 2003 |  NULL |
| X Man     |                  0 |       75.6000 |         69.0000 |    61.4000 | 2004 |  NULL |
| X Man     |                  0 |       74.8000 |         65.2000 |    62.4000 | 2005 |  NULL |
| X Man     |                  0 |       76.2000 |         71.0000 |    57.4000 | 2006 |  NULL |
| X Man     |                  0 |       56.6000 |         48.2000 |    70.8000 | 2007 |  NULL |
| Ironman   |                  0 |       55.4000 |         56.8000 |    64.6000 | 2003 |  NULL |
| Ironman   |                  0 |       58.6000 |         55.4000 |    57.4000 | 2004 |  NULL |
| Ironman   |                  0 |       51.0000 |         77.0000 |    57.4000 | 2005 |  NULL |
| Ironman   |                  0 |       86.2000 |         68.8000 |    64.0000 | 2006 |  NULL |
| Ironman   |                  0 |       74.2000 |         77.2000 |    82.4000 | 2007 |  NULL |
+-----------+--------------------+---------------+-----------------+------------+------+-------+
27 rows in set (0.00 sec)





9. Lets assign some rating for the total marks scored - S(450-500), A(400-449), B(350-399), C(300-349), D(250,299), E(200-249), F(below 200). List the students with the grade obtained in each year for each exam(quarterly, half-yearly and annual)
Format: name, quarterly_rating, half_yearly_rating, annual_rating, year



mysql> select name,
     if(sum(quarterly)>=450,'S',
     if(sum(quarterly)>=400,'A',
     if(sum(quarterly)>=350,'B',
     if(sum(quarterly)>=300,'C',
     if(sum(quarterly)>=250,'D',
     if(sum(quarterly)>=200,'E',
     'F')))))) quarterly_rating,
    if(sum(half_yearly)>=450,'S',
     if(sum(half_yearly)>=400,'A',
     if(sum(half_yearly)>=350,'B',
     if(sum(half_yearly)>=300,'C',
     if(sum(half_yearly)>=250,'D',
     if(sum(half_yearly)>=200,'E',
     'F')))))) half_yearly_rating ,
      if(sum(annual)>=450,'S',
     if(sum(annual)>=400,'A',
     if(sum(annual)>=350,'B',
     if(sum(annual)>=300,'C',
     if(sum(annual)>=250,'D',
     if(sum(annual)>=200,'E',
     'F')))))) annual_rating ,year from students s,marks m where s.id=m.student_id group by student_id,year;
+-----------+------------------+--------------------+---------------+------+
| name      | quarterly_rating | half_yearly_rating | annual_rating | year |
+-----------+------------------+--------------------+---------------+------+
| Thor      | F                | E                  | A             | 2003 |
| Thor      | E                | D                  | C             | 2004 |
| Thor      | C                | B                  | B             | 2005 |
| Thor      | D                | C                  | D             | 2006 |
| Thor      | C                | D                  | E             | 2007 |
| Hulk      | E                | D                  | D             | 2003 |
| Hulk      | C                | D                  | S             | 2004 |
| Hulk      | C                | D                  | D             | 2005 |
| Hulk      | B                | E                  | E             | 2006 |
| Hulk      | C                | D                  | A             | 2007 |
| Daredevil | A                | B                  | S             | 2003 |
| Daredevil | C                | C                  | C             | 2004 |
| Daredevil | C                | E                  | B             | 2005 |
| Daredevil | A                | A                  | C             | 2006 |
| Daredevil | B                | B                  | C             | 2007 |
| X Man     | C                | C                  | D             | 2003 |
| X Man     | B                | C                  | C             | 2004 |
| X Man     | B                | C                  | C             | 2005 |
| X Man     | B                | B                  | D             | 2006 |
| X Man     | D                | E                  | B             | 2007 |
| Ironman   | D                | D                  | C             | 2003 |
| Ironman   | D                | D                  | D             | 2004 |
| Ironman   | D                | B                  | D             | 2005 |
| Ironman   | A                | C                  | C             | 2006 |
| Ironman   | B                | B                  | A             | 2007 |
+-----------+------------------+--------------------+---------------+------+
25 rows in set (0.00 sec)



