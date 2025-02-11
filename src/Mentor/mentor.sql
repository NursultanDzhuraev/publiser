create table Groups
(
    id            serial primary key,
    group_name    varchar,
    date_of_birth date,
    image         varchar
);
create table Courses
(
    id          serial primary key,
    course_name varchar,
    image       varchar,
    group_id    int references groups (id)
);
create table Students
(
    id          serial primary key,
    first_name  varchar,
    last_name   varchar,
    gender      varchar,
    phoneNumber varchar,
    group_id    int references groups (id)
);
create table Mentors
(
    id             serial primary key,
    first_name     varchar,
    last_name      varchar,
    gender         varchar,
    email          varchar,
    specialization varchar,
    phoneNumber    varchar,
    course_id      int references courses (id)
);
create table Lesson
(
    id          serial primary key,
    lesson_name varchar,
    course_id   int references courses (id)
);
--DDL
--#1
alter table groups
    drop column date_of_birth;
alter table groups
    drop column image;
--#2
alter table courses
    drop column image;
alter table courses
    add column start_date varchar;
--#3
alter table students
    add column email varchar;
alter table students
    add column date_of_birth date;
-- alter table students drop column fist_name;
alter table students
    add column first_name varchar;
--#4
alter table mentors
    drop column phoneNumber;
alter table mentors
    add column experience int;
alter table mentors
    add column date_of_birth date;
alter table mentors
    drop column date_of_birth;
-- alter table mentors drop column fist_name;
alter table mentors
    add column first_name varchar;



insert into groups(group_name)
values ('Java 16'),
       ('JS 17'),
       ('Java 12'),
       ('JS 16'),
       ('Java 17'),
       ('JS 12');
-------- ------------------------------------------------------------
insert into courses (course_name, start_date, group_id)
values ('Java 16 core', '2023-01-03', 1),
       ('JS 16 core', '2023-01-03', 2),
       ('Java 17 core', '2023-10-03', 3),
       ('JS 17 core', '2023-10-03', 4),
       ('Java 12 core', '2024-01-08', 5),
       ('JS 12 core', '2024-01-08', 6),
       ('Technical English', '2024-01-08', 1),
       ('Python', '2024-01-08', 6);

-------- ---------------------------------- --------------------------
insert into lessons(lesson_name, course_id)
values ('Loops', 1),
       ('HTML', 2),
       ('Methods', 3),
       ('CSS', 4),
       ('Collections', 5),
       ('React', 6);
-------- ---------------------------------- ---------------------------------- ---------------------------------- --------------------------
insert into mentors (first_name, last_name, gender, email, specialization, experience, course_id)
values ('Mukhammed', 'Asantegin', 'Female', 'datka@gmail.com', 'java', 2, 1),
       ('Urmat', 'Taichikov', 'Male', 'ulan@gmail.com', 'java', 3, 3),
       ('Aizat', 'Duisheeva', 'Female', 'aizat@gmail.com', 'java', 1, 5),
       ('Elizar', 'Aitbek uulu', 'Male', 'elizar@gmail.com', 'js', 1, 2),
       ('Aziat', 'Abdimalikov', 'Male', 'aziat@gmail.com', 'js', 1, 4),
       ('Alisher', 'Jumanov', 'Male', 'alisher@gmail.com', 'js', 1, 6);

-------- ---------------------------------- ---------------------------------- ---------------------------------- --------------------------
insert into students (id, first_name, last_name, email, gender, date_of_birth, group_id)
values (1, 'Knox', 'Jacquot', 'kjacquot0@addthis.com', 'Male', '2004-04-12', 1);
insert into students (id, first_name, last_name, email, gender, date_of_birth, group_id)
values (2, 'Dewain', 'Hunt', 'dhunt1@trellian.com', 'Male', '2003-04-13', 2);
insert into students (id, first_name, last_name, email, gender, date_of_birth, group_id)
values (3, 'Jarrett', 'Iianon', 'jiianon2@chronoengine.com', 'Male', '2005-05-05', 3);
insert into students (id, first_name, last_name, email, gender, date_of_birth, group_id)
values (4, 'Merry', 'Niezen', 'mniezen3@canalblog.com', 'Male', '1999-04-03', 4);
insert into students (id, first_name, last_name, email, gender, date_of_birth, group_id)
values (5, 'Nollie', 'Pellingar', 'npellingar4@usgs.gov', 'Female', '2003-05-06', 5);
insert into students (id, first_name, last_name, email, gender, date_of_birth, group_id)
values (6, 'Eveleen', 'Moukes', 'emoukes5@amazon.co.uk', 'Female', '1996-03-03', 6);
insert into students (id, first_name, last_name, email, gender, date_of_birth, group_id)
values (7, 'Nollie', 'Becker', 'nbecker6@is.gd', 'Male', '1994-02-04', 1);
insert into students (id, first_name, last_name, email, gender, date_of_birth, group_id)
values (8, 'Nadine', 'Robilart', 'nrobilart7@walmart.com', 'Female', '2000-06-06', 2);
insert into students (id, first_name, last_name, email, gender, date_of_birth, group_id)
values (9, 'Dex', 'Prugel', 'dprugel8@arizona.edu', 'Male', '2001-03-04', 3);
insert into students (id, first_name, last_name, email, gender, date_of_birth, group_id)
values (10, 'Phyllis', 'Baroche', 'pbaroche9@state.gov', 'Female', '2004-04-04', 4);
insert into students (id, first_name, last_name, email, gender, date_of_birth, group_id)
values (11, 'Bernadette', 'Dulson', 'bdulsona@altervista.org', 'Female', '2004-04-04', 5);
insert into students (id, first_name, last_name, email, gender, date_of_birth, group_id)
values (12, 'Earlie', 'Pledge', 'epledgeb@jimdo.com', 'Male', '1993-12-04', 6);
insert into students (id, first_name, last_name, email, gender, date_of_birth, group_id)
values (13, 'Luigi', 'Standish', 'lstandishc@army.mil', 'Male', '1998-11-13', 1);
insert into students (id, first_name, last_name, email, gender, date_of_birth, group_id)
values (14, 'Cody', 'McLeoid', 'cmcleoidd@yahoo.com', 'Male', '2000-10-10', 2);
insert into students (id, first_name, last_name, email, gender, date_of_birth, group_id)
values (15, 'Heall', 'Dolligon', 'hdolligone@squidoo.com', 'Male', '2003-09-09', 3);
insert into students (id, first_name, last_name, email, gender, date_of_birth, group_id)
values (16, 'Isiahi', 'Somerscales', 'isomerscalesf@eepurl.com', 'Male', '1995-05-03', 4);
insert into students (id, first_name, last_name, email, gender, date_of_birth, group_id)
values (17, 'Matthieu', 'Spolton', 'mspoltong@so-net.ne.jp', 'Male', '1995-03-30', 5);
insert into students (id, first_name, last_name, email, gender, date_of_birth, group_id)
values (18, 'Esme', 'Brockway', 'ebrockwayh@hexun.com', 'Female', '1997-08-08', 6);
insert into students (id, first_name, last_name, email, gender, date_of_birth, group_id)
values (19, 'Erroll', 'Cutforth', 'ecutforthi@wisc.edu', 'Male', '2002-03-30', 1);
insert into students (id, first_name, last_name, email, gender, date_of_birth, group_id)
values (20, 'Gordon', 'Thieme', 'gthiemej@japanpost.jp', 'Male', '1994-04-04', 2);
insert into students (id, first_name, last_name, email, gender, date_of_birth, group_id)
values (21, 'Dom', 'Arnecke', 'darneckek@google.fr', 'Male', '2000-03-03', 3);
insert into students (id, first_name, last_name, email, gender, date_of_birth, group_id)
values (22, 'Raven', 'Yarrall', 'ryarralll@vimeo.com', 'Female', '2009-05-05', 4);
insert into students (id, first_name, last_name, email, gender, date_of_birth, group_id)
values (23, 'Emery', 'McSporon', 'emcsporonm@reverbnation.com', 'Male', '1990-12-20', 5);
insert into students (id, first_name, last_name, email, gender, date_of_birth, group_id)
values (24, 'Der', 'Caville', 'dcavillen@csmonitor.com', 'Male', '2003-03-20', 6);
insert into students (id, first_name, last_name, email, gender, date_of_birth, group_id)
values (25, 'Erich', 'Lorroway', 'elorrowayo@bizjournals.com', 'Male', '2000-08-07', 1);
insert into students (id, first_name, last_name, email, gender, date_of_birth, group_id)
values (26, 'Edan', 'Brayne', 'ebraynep@prweb.com', 'Male', '2008-12-23', 2);
insert into students (id, first_name, last_name, email, gender, date_of_birth, group_id)
values (27, 'Garald', 'Puddle', 'gpuddleq@taobao.com', 'Male', '1990-03-03', 3);
insert into students (id, first_name, last_name, email, gender, date_of_birth, group_id)
values (28, 'Orelee', 'Hoggan', 'ohogganr@e-recht24.de', 'Female', '1999-03-29', 4);
insert into students (id, first_name, last_name, email, gender, date_of_birth, group_id)
values (29, 'Dion', 'Kepp', 'dkepps@boston.com', 'Female', '2000-12-13', 5);
insert into students (id, first_name, last_name, email, gender, date_of_birth, group_id)
values (30, 'Winna', 'Ganders', 'wganderst@artisteer.com', 'Female', '2001-11-11', 6);

-- Запросы:
--
-- todo Tasks(Query) Groups
--
-- 1. Получите все записи таблицы groups;
select *
from groups;

--
-- 2. Получите общее количество записей таблицы groups
select count(*)
from groups;
--
-- 3. Выведите группы их курсы
select g.group_name, c.course_name
from groups g
         join Courses C on g.id = C.group_id;

--
-- 4. Выведите курсы групп у которых курс начался с 202011 по 202333
select g.group_name, c.start_date
from groups g
         join Courses c on g.id = c.group_id
where c.start_date between '2020-01-01' and '2023-03-03';
--
-- 5. Выведите имена, дату рождения студентов , которые родились с 198011 по 20041212, и названиегруппы
select s.first_name, s.date_of_birth
from groups g
         join students s on g.id = s.group_id
where s.date_of_birth between '1980-01-01' and '2004-12-12';
--
-- 6. Вывести полное имя, возраст, почту студентов и название группы, где айди группы равен 3
select s.first_name, s.last_name, s.email, g.group_name, s.date_of_birth, g.id
from groups g
         join students s on g.id = s.group_id
where g.id = 3;
--
-- 7. Вывести все курсы одной группы, где название группы 'Java-16'
--
select *
from groups g
where g.group_name = 'Java 16';
-- 8. Вывести название всех групп и количество студентов в группе
select g.group_name, count(s.id)
from groups g
         join students s on g.id = s.group_id
group by g.group_name;
--
-- 9.Вывести название всех групп и количество студентов в группе, если в
-- группе больше 4 студентов.
select g.group_name, count(s.id) as count_st
from groups g
         join students s on g.id = s.group_id
group by g.group_name
having count(s.id) > 4;

-- 10. Отсортируйте имена студентов группы по убыванию, где айди группы равна 4 и выведите айдистудента, имя, пол и название группы.
select s.id, s.first_name, s.gender, g.group_name
from groups g
         join students s on g.id = s.group_id
where g.id = 4
order by g.group_name desc;


--todo  Tasks(Query) Course
-- 1. Вывести все курсы
select *
from courses;
--
-- 2. Вывести все уроки курса 'Technical English'
select l.lesson_name, c.course_name
from courses c
         join lesson l on c.id = l.course_id
where c.course_name = 'Technical English';
--
-- 3. Вывести количество всех студентов курса id  4
select count(s.id), g.group_name
from courses c
         join groups g on c.group_id = g.id
         join students s on g.id = s.group_id
where g.id = 4
group by g.group_name;
--
-- 4. Вывести имя, почту, специализацию ментора и название курса где курс айди равен 2
--
select m.first_name, m.email, m.specialization
from courses c
         join mentors m on c.id = m.course_id
where c.id = 2;
-- 5. Посчитaть сколько менторов в каждом курсе
select c.course_name, count(m.id)
from courses c
         join mentors m on c.id = m.course_id
group by c.course_name;
--
-- 6. Сгруппируйте и посчитайте менторов в каждом курсе и выведите только те курсы, где в курсебольше 2 менторов
select c.course_name, count(m.id)
from courses c
         join mentors m on c.id = m.course_id
group by c.course_name;
--
-- 7. Вывести название, дату и полное имя ментора, все курсы которые начинаются с 202011 по 202333
select c.course_name, c.start_date, m.first_name, m.last_name
from courses c
         join mentors m on c.id = m.course_id
where c.start_date between '2020-01-01' and '2023-03-03';

--
-- 8. Вывести имя, почту, возраст студентов курса 'Java 17 core'
select s.first_name, s.email, 2025 - extract(year from s.date_of_birth)
from courses c
         join groups g on c.group_id = g.id
         join students s on g.id = s.group_id
where c.course_name = 'Java 17 core';
--
-- 9. Вывести тот курс где нет ментора
select c.course_name, m.first_name
from courses c
         left join mentors m on c.id = m.course_id
where m.course_id is null
group by c.course_name, m.first_name;
--
-- 10.Вывести тот курс где нет уроков
select c.course_name, l.lesson_name
from courses c
         left join lesson l on l.course_id = c.id
where l.course_id is null;
--
-- 11.Вывести тот курс где нет студентов
--todo 1
select c.*
from courses c
         left join groups g on g.id = c.group_id
         left join students s on g.id = s.group_id
where s.id is null;
--todo 2
select c.*
from courses c
where c.id not in (select c1.id
                   from courses c1
                            join groups g on c1.group_id = g.id
                            join students s on g.id = s.group_id);
--todo 3
select c.*
from groups g
         join Courses C on g.id = C.group_id
         join students s on s.group_id = g.id
where s.id is null;


--  todo    Student
-- 1. Студенттердин жалпы санын чыгаруу
select count(s.id)
from students s;
-- 2. 1-айдидеги группадагы студенттин атын, электрондук почтасын жана жынысын чыгаруу
select s.first_name, s.email, s.gender
from students s
         join groups g on g.id = s.group_id
where g.id = 1;
-- 3. 4-айдидеги студенттин группасын чыгаруу
select g.group_name, s.first_name
from students s
         join groups g on g.id = s.group_id
where g.id = 4;
-- 4. Студенттерди жынысы боюнча топтоштуруп, жынысынын жалпы санын чыгаруу
select s.gender, count(s.gender)
from students s
group by s.gender;
-- 5. 4-айдидеги студентти табып, анын маалыматтарын жаңыртуу
update students s
set first_name    = 'Nursultan',
    last_name     ='Dzhuraev',
    gender        ='Male',
    email         = 'nurs@gmail.com',
    date_of_birth = '1997-03-10'
where s.id = 4;
select *
from students
where id = 4;

-- 6. 4-айдидеги курстун эң улуу студентин табуу
select s.*, c.id
from students s
         join groups g on g.id = s.group_id
         join courses c on c.group_id = g.id
where c.id = 4
order by s.date_of_birth asc
limit 1;
-- 7. Студенттер таблицасынын электрондук почтасына unique constraint кошуу
alter table students
    add constraint unique_email unique (email);
-- 8. Менторлор таблицасынын жынысына check constraint кошуу
alter table mentors
    add constraint check_gender check ( gender in ('Male', 'Female'));
-- 9. Студенттер таблицасынын жынысына check constraint кошуу
alter table students
    add constraint check_gender check ( gender in ('Male', 'Female'));
-- todo Mentor
-- 1. Бардык менторлордун орточо жашын чыгаруу
select avg( m.experience) as avg_mentors
from mentors m;
-- 2. 'Java-12' гурппасынын менторунун атын, электрондук почтасын жана адистигин чыгаруу
select m.first_name, m.email, m.specialization
from mentors m
         join courses c on c.id = m.course_id
         join groups g on g.id = c.group_id
where g.group_name = 'Java 12';
-- 3. Тажрыйбасы 1 жылдан ашкан бардык менторлорду чыгаруу
select *
from mentors m
where m.experience > 1;
-- 4. Курсу жок менторду чыгаруу
select m.first_name, c.id
from mentors m
         left join courses c on m.course_id = c.id
where c.id is null;
-- 5. Менторлордун идентификаторун, атын жана анын студенттерин чыгаруу
select m.id, m.first_name, s.first_name
from mentors m
         join courses c on m.course_id = c.id
         join groups g on g.id = c.group_id
         join students s on s.group_id = g.id;

-- 6. Ар бир ментордун студенттеринин санын эсептеп, ментордун толук атын жана анын студенттеринин санын чыгаруу
select (m.first_name, '', m.last_name) as full_name, count(s.id)
from mentors m
         join courses c on m.course_id = c.id
         join groups g on g.id = c.group_id
         join students s on s.group_id = g.id
group by m.first_name, m.last_name;
-- 7. Студенттери жок менторду чыгаруу
select m.id, m.first_name, s.first_name
from mentors m
         left join courses c on m.course_id = c.id
         left join groups g on g.id = c.group_id
         left join students s on s.group_id = g.id
where s.id is null;

-- 8. 2ден көп студенти бар менторду чыгаруу
select m.id, m.first_name, count(s.id)
from mentors m
         left join courses c on m.course_id = c.id
         left join groups g on g.id = c.group_id
         left join students s on s.group_id = g.id
group by m.id, m.first_name
having count(s.id) > 2;
-- 9. 5-айдидеги ментордун курстарын чыгаруу
select c.course_name, m.first_name, m.id
from mentors m
         join courses c on m.course_id = c.id
where m.id = 5;

-- 10. 5-айдидеги ментордун бардык сабактарын чыгаруу
select m.first_name, l.lesson_name
from mentors m
         join courses c on m.course_id = c.id
         join lessons l on l.course_id = c.id
where m.id = 5;
-- todo Lesson
-- 1. Бардык сабактарды чыгаруу
select *
from lessons;
-- 2. 2-айдидеги студенттин бардык сабактарын алуу
select l.lesson_name
from lessons l
         join courses c on l.course_id = c.id
         join groups g on g.id = c.group_id
         join students s on g.id = s.group_id
where s.id = 2;
-- 3. Ар бир топтун сабактарын эсептеп, сабактардын саны 2ден
-- көп болгон группанын аталышын жана сабактардын санын чыгаруу
select g.group_name, count(l.id)
from lessons l
         join courses c on l.course_id = c.id
         join groups g on g.id = c.group_id
         join students s on g.id = s.group_id
group by g.group_name
having count(l.id) > 2;
-- 4. 7-айдидеги студенттин сабактарын аталышы боюнча иреттөө (сорттоо)
select l.lesson_name
from lessons l
         join courses c on l.course_id = c.id
         join groups g on g.id = c.group_id
         join students s on g.id = s.group_id
where s.id = 7
order by l.lesson_name;
-- 5. 'Python kids' курсунун бардык сабактарын алуу
insert into lessons (lesson_name, course_id)
values ('Python kids', 8);
select l.lesson_name, c.course_name
from lessons l
         left join courses c on l.course_id = c.id
where c.course_name in ('Python', 'Python kids');

-- 6. 5-айдидеги ментордун бардык сабактарын алуу
select l.*
from lessons l
         join courses c on l.course_id = c.id
         join mentors m on m.course_id = c.id
where m.id = 5;
