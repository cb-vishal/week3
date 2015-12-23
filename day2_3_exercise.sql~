mysql> create table users(userid varchar(20) primary key, loginid varchar(20),lpassword varchar(20));
Query OK, 0 rows affected (0.10 sec)

insert into users values('10001','vishal','kumar');
insert into users values('10002','raju','kumar');
insert into users values('10003','ajit','kumar');
insert into users values('10004','vaibhav','kumar');



mysql> create table stations(station_id varchar(20) primary key, station_code varchar(20));
Query OK, 0 rows affected (0.09 sec)

insert into stations values('s0001','mas');
insert into stations values('s0002','pnbe');
insert into stations values('s0003','ndls');
insert into stations values('s0004','hwh');
insert into stations values('s0005','bbs');
insert into stations values('s0006','gaya');
insert into stations values('s0007','bngr');



mysql> create table trains(train_no varchar(20) primary key, train_name varchar(40));
Query OK, 0 rows affected (0.09 sec)

insert into trains values('1123','hawrah mail express');
insert into trains values('1124','sangmitra express');
insert into trains values('1125','coromandal express');
insert into trains values('1126','banglor express');
insert into trains values('1127','gaya express');



mysql> create table coaches(coach_code varchar(20) primary key, cost_per_km numeric(5,2));
Query OK, 0 rows affected (0.11 sec)

insert into coaches values('sleeper',5);
insert into coaches values('first ac',10);
insert into coaches values('second ac',8);
insert into coaches values('third ac',7);
insert into coaches values('chair',4);
insert into coaches  values('general',2);



mysql> create table traincoaches(train_no varchar(20),coach_code varchar(20),no_of_seats int, FOREIGN KEY(train_no) REFERENCES trains(train_no),  FOREIGN KEY(coach_code) REFERENCES coaches(coach_code));
Query OK, 0 rows affected (0.16 sec)

insert into traincoaches values(1123,'sleeper',100);
insert into traincoaches values(1123,'third ac',50);
insert into traincoaches values(1123,'general',400);
insert into traincoaches values(1124,'sleeper',200);
insert into traincoaches values(1124,'third ac',50);
insert into traincoaches values(1124,'second ac',50);
insert into traincoaches values(1125,'sleeper',400);
insert into traincoaches values(1125,'first ac',50);
insert into traincoaches values(1125,'second ac',50);
insert into traincoaches values(1126,'first ac',100);
insert into traincoaches values(1126,'third ac',200);
insert into traincoaches values(1126,'second ac',100);
insert into traincoaches values(1127,'chair',500);


mysql> create table routes(route_id varchar(20) primary key,originalstation_id varchar(20),destinationstation_id varchar(20),distanceinkm int, FOREIGN KEY(originalstation_id) REFERENCES stations(station_id),  FOREIGN KEY(destinationstation_id) REFERENCES stations(station_id));
Query OK, 0 rows affected (0.12 sec)

insert into routes values('r0001','s0001','s0002',2200);
insert into routes values('r0002','s0001','s0003',2100);
insert into routes values('r0003','s0001','s0004',1600);
insert into routes values('r0004','s0001','s0005',1200);
insert into routes values('r0005','s0001','s0006',2000);
insert into routes values('r0006','s0001','s0007',500);
insert into routes values('r0007','s0007','s0001',500);








mysql> create table trainroutemaps(route_id varchar(20) ,train_no varchar(20),arrivaltime varchar(10),departuretime varchar(10),durationinmins numeric(5), FOREIGN KEY(route_id) REFERENCES routes(route_id),  FOREIGN KEY(train_no) REFERENCES trains(train_no),primary key(route_id,train_no));
Query OK, 0 rows affected (0.12 sec)

insert into trainroutemaps values('r0001','1124','16:20','08:35',2740);
insert into trainroutemaps values('r0003','1123','18:20','04:35',2040);
insert into trainroutemaps values('r0003','1125','09:20','12:35',1945);
insert into trainroutemaps values('r0004','1123','18:20','11:25',1540);
insert into trainroutemaps values('r0004','1125','09:20','08:35',1440);
insert into trainroutemaps values('r0005','1127','15:20','07:35',2840);
insert into trainroutemaps values('r0006','1126','01:40','06:35',400);
insert into trainroutemaps values('r0007','1126','03:40','00:35',400);




mysql> create table bookings(bookingref_no varchar(20) primary key,route_id varchar(20) ,train_no varchar(20),coach_code varchar(20),dateofjourney date,dateofbooking date,nooftickets int, FOREIGN KEY(route_id) REFERENCES routes(route_id),  FOREIGN KEY(train_no) REFERENCES trains(train_no),FOREIGN KEY(coach_code) REFERENCES coaches(coach_code));
Query OK, 0 rows affected (0.19 sec)

insert into bookings values('b00001','r0001','1124','sleeper','2006-02-15','2006-02-10',1);
insert into bookings values('b00002','r0001','1124','second ac','2006-02-15','2006-02-10',5);
insert into bookings values('b00003','r0001','1124','second ac','2006-02-15','2006-02-10',3);
insert into bookings values('b00004','r0003','1123','sleeper','2008-02-15','2008-02-11',1);
insert into bookings values('b00006','r0006','1125','second ac','2010-04-16','2010-03-10',3);
insert into bookings values('b00007','r0004','1123','sleeper','2009-11-12','2009-10-11',1);











1. To get the list of all trains


mysql> select train_name from trains;
+---------------------+
| train_name          |
+---------------------+
| hawrah mail express |
| sangmitra express   |
| coromandal express  |
| banglor express     |
| gaya express        |
+---------------------+
5 rows in set (0.00 sec)



2. To get the list of all train routes in the database

select route_id, s.station_code,s1.station_code from routes r left join stations s on r.originalstation_id=s.station_id left join stations s1 on s1.station_id=r.destinationstation_id group by originalstation_id,destinationstation_id; 
+----------+--------------+--------------+
| route_id | station_code | station_code |
+----------+--------------+--------------+
| r0001    | mas          | pnbe         |
| r0002    | mas          | ndls         |
| r0003    | mas          | hwh          |
| r0004    | mas          | bbs          |
| r0005    | mas          | gaya         |
| r0006    | mas          | bngr         |
+----------+--------------+--------------+
6 rows in set (0.00 sec)


mysql> select t.train_name, s.station_code source_station,s1.station_code destinstion_station from routes r left join trainroutemaps tm on tm.route_id=r.route_id left join trains t on tm.train_no=t.train_no left join stations s on r.originalstation_id=s.station_id left join stations s1 on s1.station_id=r.destinationstation_id group by originalstation_id,destinationstation_id;
+---------------------+----------------+---------------------+
| train_name          | source_station | destinstion_station |
+---------------------+----------------+---------------------+
| sangmitra express   | mas            | pnbe                |
| NULL                | mas            | ndls                |
| hawrah mail express | mas            | hwh                 |
| hawrah mail express | mas            | bbs                 |
| gaya express        | mas            | gaya                |
| banglor express     | mas            | bngr                |
+---------------------+----------------+---------------------+
6 rows in set (0.00 sec)


3. Total number of seats in the each train.


mysql> select train_name ,sum(no_of_seats) total_seats from trains t,traincoaches tc where t.train_no=tc.train_no group by tc.train_no;
+---------------------+-------------+
| train_name          | total_seats |
+---------------------+-------------+
| hawrah mail express |         550 |
| sangmitra express   |         300 |
| coromandal express  |         500 |
| banglor express     |         400 |
| gaya express        |         500 |
+---------------------+-------------+
5 rows in set (0.00 sec)


4. List of all routes goes to Bangalore

mysql> select route_id, s.station_code,s1.station_code from routes r inner join stations s on r.originalstation_id=s.station_id inner join stations s1 on s1.station_id=r.destinationstation_id and s1.station_code='bngr' group by originalstation_id,destinationstation_id; 
+----------+--------------+--------------+
| route_id | station_code | station_code |
+----------+--------------+--------------+
| r0006    | mas          | bngr         |
+----------+--------------+--------------+
1 row in set (0.00 sec)


5.List of all routes starting from bangalore, calcutta and chennai

mysql> select route_id, s.station_code,s1.station_code from routes r inner join stations s on r.originalstation_id=s.station_id inner join stations s1 on s1.station_id=r.destinationstation_id and s.station_code in('mas','hwh','bngr') group by originalstation_id,destinationstation_id; 
+----------+--------------+--------------+
| route_id | station_code | station_code |
+----------+--------------+--------------+
| r0001    | mas          | pnbe         |
| r0002    | mas          | ndls         |
| r0003    | mas          | hwh          |
| r0004    | mas          | bbs          |
| r0005    | mas          | gaya         |
| r0006    | mas          | bngr         |
| r0007    | bngr         | mas          |
+----------+--------------+--------------+
7 rows in set (0.00 sec)



6.List of all the bookings booked between 1st Jan 2005 and 31st Dec 2005

mysql> select * from bookings where dateofbooking between '2001-01-01' and '2012-01-01';
+---------------+----------+----------+------------+---------------+---------------+-------------+
| bookingref_no | route_id | train_no | coach_code | dateofjourney | dateofbooking | nooftickets |
+---------------+----------+----------+------------+---------------+---------------+-------------+
| b00001        | r0001    | 1124     | sleeper    | 2006-02-15    | 2006-02-10    |           1 |
| b00002        | r0001    | 1124     | second ac  | 2006-02-15    | 2006-02-10    |           5 |
| b00003        | r0001    | 1124     | second ac  | 2006-02-15    | 2006-02-10    |           3 |
| b00004        | r0003    | 1123     | sleeper    | 2008-02-15    | 2008-02-11    |           1 |
| b00005        | r0003    | 1125     | second ac  | 2006-04-16    | 2007-03-10    |           3 |
| b00006        | r0006    | 1125     | second ac  | 2010-04-16    | 2010-03-10    |           3 |
| b00007        | r0004    | 1123     | sleeper    | 2009-11-12    | 2009-10-11    |           1 |
+---------------+----------+----------+------------+---------------+---------------+-------------+
7 rows in set (0.00 sec)


7. List of all trains whose name begins with B
mysql> select train_name from trains where train_name like 'b%'
    -> ;
+-----------------+
| train_name      |
+-----------------+
| banglor express |
+-----------------+
1 row in set (0.00 sec)



8. List of all bookings where DOB is not null


mysql> select * from bookings where dateofbooking is not NULL;
+---------------+----------+----------+------------+---------------+---------------+-------------+
| bookingref_no | route_id | train_no | coach_code | dateofjourney | dateofbooking | nooftickets |
+---------------+----------+----------+------------+---------------+---------------+-------------+
| b00001        | r0001    | 1124     | sleeper    | 2006-02-15    | 2006-02-10    |           1 |
| b00002        | r0001    | 1124     | second ac  | 2006-02-15    | 2006-02-10    |           5 |
| b00003        | r0001    | 1124     | second ac  | 2006-02-15    | 2006-02-10    |           3 |
| b00004        | r0003    | 1123     | sleeper    | 2008-02-15    | 2008-02-11    |           1 |
| b00005        | r0003    | 1125     | second ac  | 2006-04-16    | 2007-03-10    |           3 |
| b00006        | r0006    | 1125     | second ac  | 2010-04-16    | 2010-03-10    |           3 |
| b00007        | r0004    | 1123     | sleeper    | 2009-11-12    | 2009-10-11    |           1 |
+---------------+----------+----------+------------+---------------+---------------+-------------+
7 rows in set (0.00 sec)


9. List of all bookings for the booked in 2006, DOJ in 2007

mysql> select * from bookings where year(dateofbooking)=2006 and year(dateofjourney)=2007;
Empty set (0.00 sec)


10. Total number of coaches in the all the trains

mysql> select train_name,count(*) noofcoaches from trains t,traincoaches tc where t.train_no=tc.train_no group by tc.train_no;
+---------------------+-------------+
| train_name          | noofcoaches |
+---------------------+-------------+
| hawrah mail express |           3 |
| sangmitra express   |           3 |
| coromandal express  |           3 |
| banglor express     |           3 |
| gaya express        |           1 |
+---------------------+-------------+
5 rows in set (0.00 sec)



11.Total number of bookings in the database for the train no 1124

mysql> select train_no,count(train_no) no_of_booking from bookings where train_no='1124' group by train_no;
+----------+---------------+
| train_no | no_of_booking |
+----------+---------------+
| 1124     |             3 |
+----------+---------------+
1 row in set (0.00 sec)


12. Total no of tickets column 'total' , booked for train no. 1124

mysql> select sum(nooftickets) total from bookings where train_no='1124';
+-------+
| total |
+-------+
|     9 |
+-------+
1 row in set (0.00 sec)


13. Minimum distance route

mysql> select s.station_code, s1.station_code from routes r left join stations s on s.station_id=r.originalstation_id left join stations s1 on s1.station_id=r.destinationstation_id group by originalstation_id,destinationstation_id having min(distanceinkm)  ;
+--------------+--------------+
| station_code | station_code |
+--------------+--------------+
| mas          | pnbe         |
| mas          | ndls         |
| mas          | hwh          |
| mas          | bbs          |
| mas          | gaya         |
| mas          | bngr         |
+--------------+--------------+
6 rows in set (0.01 sec)



14. Total number of tickets booked for each train in the database

mysql> select train_name, sum(nooftickets) total_ticket_booked from trains t, bookings b where t.train_no=b.train_no group by b.train_no;
+---------------------+---------------------+
| train_name          | total_ticket_booked |
+---------------------+---------------------+
| hawrah mail express |                   2 |
| sangmitra express   |                   9 |
| coromandal express  |                   6 |
+---------------------+---------------------+
3 rows in set (0.00 sec)


15. cost for 50 kms for each coach.
   mysql> select coach_code,cost_per_km*50 from coaches;
+------------+----------------+
| coach_code | cost_per_km*50 |
+------------+----------------+
| chair      |         200.00 |
| first ac   |         500.00 |
| general    |         100.00 |
| second ac  |         400.00 |
| sleeper    |         250.00 |
| third ac   |         350.00 |
+------------+----------------+
6 rows in set (0.01 sec)


16. List the train name and departure time for the trains starting from Bangalore.


mysql> select t.train_name,s.station_code, s1.station_code from routes r inner join stations s on s.station_id=r.originalstation_id inner join trainroutemaps tm on tm.route_id=r.route_id inner join trains t on tm.train_no=t.train_no inner join stations s1 on s1.station_id=r.destinationstation_id and s.station_code='bngr' group by originalstation_id,destinationstation_id  ;
+-----------------+--------------+--------------+
| train_name      | station_code | station_code |
+-----------------+--------------+--------------+
| banglor express | bngr         | mas          |
+-----------------+--------------+--------------+
1 row in set (0.00 sec)



17. List the trains for which the total no of tickets booked is greater than 500


mysql> select train_name from trains t,bookings b where t.train_no=b.train_no group by b.train_no having sum(nooftickets)>500;
Empty set (0.00 sec)



18. List the trains for which the total no of tickets booked is lesser than 50
mysql> select train_name from trains t,bookings b where t.train_no=b.train_no group by b.train_no having sum(nooftickets)<50;
+---------------------+
| train_name          |
+---------------------+
| hawrah mail express |
| sangmitra express   |
| coromandal express  |
+---------------------+
3 rows in set (0.00 sec)


19. List the bookings along with train name, origin station, destination station and coach code after the date of journey ’25th Feb 2015’
mysql> select t.train_name, s.station_code,s1.station_code,coach_code from bookings b inner join routes r on b.route_id=r.route_id inner join trains t on b.train_no=t.train_no inner join stations s on r.originalstation_id=s.station_id inner join stations s1 on s1.station_id=r.destinationstation_id and dateofbooking>'2001-01-01' group by originalstation_id,destinationstation_id;
+---------------------+--------------+--------------+------------+
| train_name          | station_code | station_code | coach_code |
+---------------------+--------------+--------------+------------+
| sangmitra express   | mas          | pnbe         | sleeper    |
| hawrah mail express | mas          | hwh          | sleeper    |
| hawrah mail express | mas          | bbs          | sleeper    |
| coromandal express  | mas          | bngr         | second ac  |
+---------------------+--------------+--------------+------------+
4 rows in set (0.00 sec)




20. List the trains via the route Mysore - Chennai

mysql> select t.train_name,s.station_code, s1.station_code from routes r inner join stations s on s.station_id=r.originalstation_id inner join trainroutemaps tm on tm.route_id=r.route_id inner join trains t on tm.train_no=t.train_no inner join stations s1 on s1.station_id=r.destinationstation_id and s.station_code='mas' and s1.station_code='bngr' group by originalstation_id,destinationstation_id  ;
+-----------------+--------------+--------------+
| train_name      | station_code | station_code |
+-----------------+--------------+--------------+
| banglor express | mas          | bngr         |
+-----------------+--------------+--------------+
1 row in set (0.00 sec)


