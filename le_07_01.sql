create database if not exists bibliothek;
use bibliothek;

create table if not exists verlag (
verlagID int primary key,
verlag varchar(100));

create table if not exists fachbuch (
fachbuchID int primary key,
ISBN varchar(13),
titel varchar(255),
verlagID int
);

create table if not exists fachbereich (
fachbereichsID int primary key,
ISBN varchar(13),
titel varchar(255)
);

create table if not exists fachbereichfachbuch (
fachbereichsID int,
fachbuchID int,
primary key (fachbereichsID, fachbuchID),
foreign key (fachbereichsID) references fachbereich(fachbereichsID),
foreign key (fachbuchID) references fachbuch(fachbuchID)
);

insert ignore into verlag (verlagID, verlag)
values
(1, 'Progammier Verlag'),
(2, 'IT Technik Verlag'),
(3, 'Elektrotechnik Verlag'),
(4, 'Automatisierung Verlag'),
(5, 'Medien Verlag');

select * from verlag;

insert ignore into fachbereich (fachbereichsID, titel)
values
(1, 'Applikationsentwicklung'),
(2, 'IT Technik'),
(3, 'Elektrotechnik'),
(4, 'Automatisierungstechnik');

select * from fachbereich;

insert ignore into fachbuch (fachbuchID, ISBN, titel, verlagID)
values
(1, '1111', 'Applikationsentwicklung Fundamentals', 1),
(2, '2222', 'Applikationsentwicklung Advanced', 1),
(3, '3333', 'IT Technik - Betriebstechnik Fundamentals', 2),
(4, '4444', 'IT Technik - Betriebstechnik Advanced', 2),
(5, '5555', 'IT Technik - Systemtechnik Fundamentals', 2),
(6, '6666', 'IT Technik - Systemtechnik Advanced', 2),
(7, '7777', 'Elektrotechnik I', 3),
(8, '8888', 'Elektrotechnik II', 3),
(9, '9999', 'Robotik', 4);

select * from fachbuch;

insert ignore into	fachbereichfachbuch (fachbereichsID, fachbuchID)
values
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 7),
(3, 8),
(4, 9);

select * from fachbereichfachbuch;

-- Punkt 1
select
fb.titel,
fb.ISBN,
fb.verlagID,
v.verlag,
v.verlagID
from fachbuch fb
join verlag v on fb.verlagID = v.verlagID;

-- Punkt 2
select 
  fb.titel,
  fb.ISBN,
  fb.verlagID,
  v.verlag,
  v.verlagID
from verlag v
left join fachbuch fb on v.verlagID = fb.verlagID;

-- Punkt 3
select
  fb.titel,
  fb.ISBN,
  fb.verlagID as fachbuch_verlagID,
  v.verlag,
  v.verlagID as verlag_verlagID
from fachbuch fb
cross join verlag v;

-- Punkt 4
select
  fb.titel,
  fb2.titel as fachbereich
from fachbuch fb
join fachbereichfachbuch fbf on fb.fachbuchID = fbf.fachbuchID
join fachbereich fb2 on fbf.fachbereichsID = fb2.fachbereichsID;

-- Punkt 5
create table if not exists ausleihe (
ausleiheID int,
exemplarID int,
von date,
bis date,
primary key (ausleiheID, exemplarID)
);

select
  fb.fachbuchID as fachbuch_fachbuchID,
  fb.titel as fachbuch_titel,
  fb.ISBN as fachbuch_isbn,
  a.ausleiheID,
  a.exemplarID,
  a.von,
  a.bis
from fachbuch fb
join ausleihe a on fb.fachbuchID = a.exemplarID;
