create table Publisher
(
    id   serial primary key,
    name varchar
);
create type Genre as enum ('DETECTIVE','DRAMA','HISTORY','BIOGRAPHY','FANTASY');

create type Gender as enum ('Male','Female');
create table Book
(
    id             serial primary key,
    name           varchar,
    published_year date,
    price          numeric,
    genre          genre
);
create table Language
(
    id       serial primary key,
    language varchar
);
create table Author
(
    id            serial primary key,
    first_name    varchar,
    last_name     varchar,
    email         varchar,
    fate_of_brith date,
    country       varchar,
    gender        gender
);
alter table book
    add column county varchar;
alter table book
    add column language_id int references language (id);
alter table book
    add column publisher_id int references publisher (id);
alter table book
    add column author_id int references author (id);
alter table language
    add constraint unique_language unique (language);
alter table Language
    drop constraint unique_language;
alter table language
    alter column language set not null;
alter table author
    add constraint unique_email unique (email);
truncate table language cascade;
alter table author
    rename column fate_of_brith to date_of_brith;
alter type gender add value 'Male';
alter type genre add value 'ROMANS';
alter table book
    drop constraint book_language_id_fkey;
alter table book
    add constraint book_language_id_fkey foreign key (language_id) references language (id);

alter table author
    alter column gender type text using gender::text;
drop type gender;
create type gender as enum ('Female', 'Male');
alter table author
    alter column gender type gender using gender::gender;


values ('RELX Group'),
       ('Thomson Reuters'),
       ('Holtzbrinck Publishing Group'),
       ('Shanghai Jiao Tong University Press'),
       ('Wolters Kluwer'),
       ('Hachette Livre'),
       ('Aufbau-Verlag'),
       ('Macmillan'),
       ('Harper Collins'),
       ('China Publishing Group'),
       ('Springer Nature'),
       ('Grupo Planeta'),
       ('Books.Ru Ltd.St Petersburg'),
       ('The Moscow Times'),
       ('Zhonghua Book Company');


insert into author(first_name, last_name, email, date_of_brith, country, gender)
values ('Sybilla', 'Toderbrugge', 'stoderbrugge0@jugem.jp', '9/25/1968', 'France', 'Female'),
       ('Patti', 'Walster', 'pwalster1@addtoany.com', '10/31/1965', 'China', 'Female'),
       ('Sonnie', 'Emmens', 'semmens2@upenn.edu', '5/16/1980', 'Germany', 'Male'),
       ('Brand', 'Burel', 'bburel3@ovh.net', '4/24/1964', 'United States', 'Male'),
       ('Silvan', 'Smartman', 'ssmartman4@spiegel.de', '7/3/1967', 'France', 'Male'),
       ('Alexey', 'Arnov', 'larnoldi5@writer.com', '12/29/1964', 'Russia', 'Male'),
       ('Bunni', 'Aggio', 'baggio6@yahoo.co.jp', '12/14/1983', 'China', 'Female'),
       ('Viole', 'Sarath', 'vsarath7@elegantthemes.com', '1/29/1960', 'United States', 'Female'),
       ('Boigie', 'Etridge', 'betridge8@ed.gov', '11/17/1978', 'France', 'Male'),
       ('Hilliard', 'Burnsyde', 'hburnsyde9@omniture.com', '9/8/1962', 'Germany', 'Male'),
       ('Margarita', 'Bartova', 'mbartova@example.com', '12/3/1984', 'Russia', 'Female'),
       ('Innis', 'Hugh', 'ihughb@marriott.com', '8/28/1983', 'Germany', 'Male'),
       ('Lera', 'Trimnella', 'ltrimnellc@msn.com', '3/28/1980', 'Russia', 'Female'),
       ('Jakob', 'Bransby', 'jbransbyd@nasa.gov', '8/5/1966', 'Spain', 'Male'),
       ('Loretta', 'Gronaver', 'lgronavere@technorati.com', '10/17/1962', 'United States', 'Female');

insert into language(language)
values ('English'),
       ('French'),
       ('German'),
       ('Chinese'),
       ('Russian'),
       ('Spanish');

insert into book(name, county, published_year, price, genre, language_id, publisher_id, author_id)
values ('Taina', 'Russia', '11/12/2021', '568', 'DETECTIVE', '5', '12', '6'),
       ('Zvezdopad', 'Russia', '12/9/2004', '446', 'ROMANS', '5', '13', '11'),
       ('Homo Faber', 'Germany', '4/10/2022', '772', 'FANTASY', '3', '5', '3'),
       ('Der Richter und Sein Henker', 'Germany', '2/1/2011', '780', 'DETECTIVE', '3', '3', '10'),
       ('Lord of the Flies', 'United States', '7/11/2015', '900', 'FANTASY', '1', '2', '4'),
       ('Un soir au club', 'France', '1/12/2018', '480', 'DRAMA', '2', '1', '1'),
       ('Voina', 'Russia', '12/6/2004', '880', 'HISTORY', '5', '4', '13'),
       ('Sun Tzu', 'China', '9/5/2022', '349', 'HISTORY', '4', '4', '2'),


       ('Emil und die Detektive', 'Germany', '6/11/2010', '228', 'DETECTIVE', '3', '5', '10'),
       ('Coule la Seine', 'France', '3/1/2015', '732', 'FANTASY', '2', '6', '1'),
       ('Love and hatred', 'Russia', '2/3/2012', '763', 'ROMANS', '5', '14', '13'),
       ('Fantastic Mr Fox', 'United States', '3/10/2018', '309', 'FANTASY', '1', '9', '8'),
       ('Contes de la Bécasse', 'France', '10/5/2019', '378', 'ROMANS', '2', '6', '9'),
       ('“The Death of Ivan Ilyich', 'Russia', '9/24/2000', '814', 'DRAMA', '5', '6', '6'),
       ('Bonjour Tristesse', 'France', '8/2/2015', '502', 'ROMANS', '2', '8', '5'),
       ('Die Verwandlung', 'Germany', '6/19/2008', '305', 'DETECTIVE', '3', '7', '12'),
       ('The Inspector Barlach Mysteries', 'Germany', '3/10/2007', '566', 'DETECTIVE', '3', '3', '3'),
       ('LÉtranger', 'France', '11/14/2017', '422', 'ROMANS', '2', '8', '5'),
       ('Lao Tse', 'China', '7/16/2005', '900', 'FANTASY', '4', '4', '2'),
       ('Semya', 'Russia', '4/12/2004', '194', 'DRAMA', '5', '13', '11'),
       ('Empty World', 'United States', '1/4/2008', '324', 'FANTASY', '1', '11', '15'),
       ('Domainer', 'Germany', '1/6/2020', '420', 'ROMANS', '3', '5', '10'),
       ('The Fault in Our Stars', 'United States', '2/13/2008', '396', 'ROMANS', '1', '9', '4'),
       ('Die R uber', 'Germany', '6/25/2020', '300', 'ROMANS', '3', '7', '12'),
       ('Jung Chang', 'China', '5/14/2021', '600', 'HISTORY', '4', '10', '7'),
       ('Les Aventures de Tintin', 'France', '4/10/2015', '582', 'DRAMA', '2', '1', '5'),
       ('Unvollendete Geschichte', 'Germany', '12/12/2010', '269', 'DETECTIVE', '3', '5', '10'),
       ('Amy Tan', 'China', '1/9/2023', '486', 'DRAMA', '4', '4', '7'),
       ('Krasnaya luna', 'Russia', '2/7/2020', '550', 'FANTASY', '5', '12', '11'),
       ('Emma', 'United States', '10/11/2021', '599', 'BIOGRAPHY', '1', '2', '15');

-- Запросы:
-- 1.Китептердин атын, чыккан жылын, жанрын чыгарыныз.
select b.name, b.published_year, b.genre
from book b;
-- 2.author мамлекеттери уникалдуу чыксын.
select distinct a.country
from Author a;
-- 3.2020-2023 жылдардын арасындагы китептер чыксын.
select *
from book
where published_year between '1/1/2020' and '1/1/2023';
-- 4.Детектив китептер жана алардын аттары чыксын.
select name, genre
from book
where genre = 'DETECTIVE';
-- 5.Автордун аты-жону author деген бир колонкага чыксын.
select (first_name, ' ', last_name) as full_name
from Author;
-- 6.Германия жана Франциядан болгон авторлорду толук аты-жону менен сорттоп чыгарыныз.
select a.first_name, a.last_name, a.country
from Author a
where a.country = 'France'
order by a.first_name;
-- 7.Романдан башка жана баасы 500 дон кичине болгон китептердин аты, олкосу, чыккан жылы, баасы жанры чыксын..
select b.name, b.county, b.published_year, b.county
from Book b
where b.genre != 'ROMANS'
  and b.price < 500;
-- 8.Бардык кыз авторлордун биринчи 3 ну чыгарыныз.
select *
from Author a
where a.gender = 'Female'
limit 3;
-- 9.Почтасы .com мн буткон, аты 4 тамгадан турган, кыз авторлорду чыгарыныз.
select *
from Author a
where a.gender = 'Female'
  and a.email ilike '%.com'
  and length(a.first_name) = 4;
-- 10.Бардык олколорду жана ар бир олкодо канчадан автор бар экенин чыгаргыла.
select a.country, count(a.id)
from Author a
group by a.country;
-- 11.Уч автор бар болгон олколорду аты мн сорттоп чыгарыныз.
select a.country, count(a.id) as count_author
from Author a
group by a.country
having count(a.id) = 3;
-- 12. Ар бир жанрдагы китептердин жалпы суммасын чыгарыныз
select b.genre, count(b.id)
from Book b
group by b.genre;
-- 13. Роман жана Детектив китептеринин эн арзан бааларын чыгарыныз
select min(b.price),
       b.genre
from Book b
where b.genre in ('ROMANS', 'DETECTIVE')
group by b.genre;
-- 14.История жана Биографиялык китептердин сандарын чыгарыныз
select count(b.id), b.genre
from Book b
where b.genre in ('HISTORY', 'BIOGRAPHY')
group by b.genre;
-- 15.Китептердин , издательстволордун аттары жана тили чыксын.
select b.name, p.name, l.language
from book b
         join publisher p on b.publisher_id = p.id
         join language l on b.language_id = l.id;
-- 16Авторлордун бардык маалыматтары жана издательстволору чыксын, издательство болбосо null чыксын
select a.*, p.name as publisher_name
from author a
         left join book b on b.author_id = a.id
         left join publisher p on b.publisher_id = p.id;
-- 17.Авторлордун толук аты-жону жана китептери чыксын, китеби жок болсо null чыксын.
select a.first_name, a.last_name, b.name
from author a
         left join book b on a.id = b.author_id;
-- 18.Кайсы тилде канча китеп бар экендиги ылдыйдан ойлдого сорттолуп чыксын.
select l.language, count(b.id) as count_book
from language l
         join book b on l.id = b.language_id
group by l.language;

-- 19.Издательсtвонун аттары жана алардын тапкан акчасынын оточо суммасы тегеректелип чыгарылсын.
    select p.name,round(avg(b.price)) as round_book
    from publisher p join book b on p.id = b.publisher_id
    group by p.name
    order by round_book desc;
-- 20.2010-2015 жылдардын арасындагы китептер жана автордун аты-фамилиясы чыксын.
select b.name, a.last_name, a.first_name,b.published_year
from book b
         join author a on b.author_id = a.id
where b.published_year between '1/1/2010' and '1/1/2015';
-- 21.2010-2015 жылдардын арасындагы китептердин авторлорунун толук аты-жону жана алардын тапкан акчаларынын жалпы суммасы чыксын.

select b.name, a.last_name, a.first_name,b.published_year,sum(b.price)
from book b
         join author a on b.author_id = a.id
where b.published_year between '1/1/2010' and '1/1/2015'
group by b.name, a.last_name, a.first_name, b.published_year ;
select * from ?;