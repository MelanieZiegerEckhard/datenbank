create database if not exists le_04_02;
use le_04_02;


-- Neue Tabelle Kunden
CREATE TABLE IF NOT EXISTS Kunden (
Kunden_ID int not null auto_increment,
Name varchar(100),
Vorname varchar(100),
EMail varchar(255),
Telefon varchar(50),
Geburtsdatum date,
primary key (Kunden_ID)
);

-- Neue Tabelle Geschenke
create table if not exists mageschenk (
geschenkID smallint not null,
artikel varchar(200) not null,
preis decimal(5,2),
jahrzugehörigkeit smallint not null,
primary key (geschenkID)
);

drop table if exists mageschenk;

create table mageschenk (
geschenkID smallint not null,
artikel varchar(200) not null unique,
preis decimal (5,2),
jahr smallint not null,
primary key (geschenkID)
);

/* -- 2x gültige Datensätze einfügen
insert into mageschenk (geschenkID, artikel, preis, jahr)
values
(1, 'Goldene Uhr', 199.99, 2020),
(2, 'Silberne Kugelschreiberbox', 49.50, 2021);
*/

-- Überprüfung ob doppelte eingabe möglich ist
insert into mageschenk (geschenkID, artikel, preis, jahr)
values (3, 'Goldene Uhr', 189.99, 2022);

/* Fehlermeldung!
0	26	07:53:24	insert into mageschenk (geschenkID, artikel, preis, jahr)
values (3, 'Goldene Uhr', 189.99, 2022)	Error Code: 1062. Duplicate entry 'Goldene Uhr' for key 'mageschenk.artikel'	0.016 sec
Die Fehlermeldung besagt das der Eintrag 'Goldene Uhr' bereits vorhanden ist. Unique verhindert doppelte werte  
*/

alter table mageschenk modify preis decimal(5,2) not null default 0.00;

describe mageschenk;

-- Punkt 4
alter table mageschenk
add constraint jahr
check (jahr in (5, 10, 15, 20));

insert into  mageschenk (geschenkID, artikel, preis, jahr, jahrezugehoerigkeit)
values 
  (6, 'Jubiläumspokal', 75.00, 2025, 10),
  (7, 'Ehrenurkunde', 0.00, 2025, 15);

/* Fehlermeldung Punkt 4
09:39:54	alter table mageschenk add constraint jahr check (jahr in (5, 10, 15, 20))	Error Code: 3819. Check constraint 'jahr' is violated.	0.047 sec
Versucht etwas hinzuzuzufügen was durch bereits durch vorhandene Daten verletzt wird 
*/
