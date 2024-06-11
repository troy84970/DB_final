create table IF NOT EXISTS course_time(
	arrangement_id Integer,
    weekday char(1),
    period integer,
    primary key(arrangement_id,weekday,period),
    foreign key(arrangement_id) references course_arrangement(arrangement_id)
);
insert into course_time (arrangement_id,weekday,period) values 
(1,'一',5),(1,'一',6),(1,'一',7),
(2,'二',3),(2,'二',4),(2,'五',4),
(3,'四',5),(3,'四',6),(3,'四',7),
(4,'四',5),(4,'四',6),(4,'四',7),
(5,'五',2),(5,'五',3),(5,'五',4),
(6,'三',5),(6,'三',6),
(7,'三',2),(7,'三',3),(7,'三',4);
