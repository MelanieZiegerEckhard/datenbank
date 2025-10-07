create database if not exists le_09_01;
use uebungsdatenbank;

-- Punkt 1
-- Tabelle artikel zu Tabelle artikelaktuell umbenennen
rename table artikel to artikelaktuell;
show tables;

-- Punkt 2
-- Spalte bezeichnung_artikel zu bezeichnung umbennen in der Tabelle artikelaktuell
alter table artikelaktuell
change column bezeichnung_artikel bezeichnung varchar(255);

show columns from artikelaktuell;

-- Punkt 3
-- Den Datentyp von status varchar(1) in der Tabelle artikelaktuell in varchar(300) ändern. 
alter table artikelaktuell
modify column status varchar(300);

show columns from artikelaktuell;

-- Punkt 4
-- In der Tabelle artikelaktuell der Spalte artikelid einen primary key hinzufügen
alter table artikelaktuell
add primary key (artikelid);

-- Punkt 5
-- In der Tabelle artikelaktuell der Spalte artikelid den primary key wieder entfernen
alter table artikelaktuell
drop primary key;

show columns from artikelaktuell;

-- Punkt 6
-- In der Tabelle artikelaktuell, Spalte tiefe Null von YES auf NO stellen
alter table artikelaktuell
modify column tiefe decimal(10,2) not null;

show columns from artikelaktuell;

-- Punkt 7
-- In der Tabelle artikelaktuell, Spalte tiefe Null von NO auf YES stellen.
alter table artikelaktuell
modify column tiefe decimal(10,2) null;

show columns from artikelaktuell;

-- Punkt 8
-- In der Tabelkle artikelaktuell soll die Spalte preis einen Wert von 0.00 bekommen
alter table artikelaktuell
modify column preis decimal(10,2) default 0.00;

show columns from artikelaktuell;

-- Punkt 9
-- In der Tabelle artikelaktuell soll der Spalte preis wieder der Wert von 0.00 entfernt werden
alter table artikelaktuell
modify column preis decimal(10,2);

show columns from artikelaktuell;

-- Punkt 10
-- In der Tabelle artikelaktuell sollen Artikel nur 1x vorkommen in der Spalte bezeichnung
alter table artikelaktuell
add unique (bezeichnung);

show columns from artikelaktuell;

-- Punkt 11
-- In der Tabelle artikleaktuell soll die Spalte preis nur Werte zulassen die kleiner als 1000€ sind
alter table artikelaktuell
add constraint chk_preis_max
check (preis < 1000.00);

show columns from artikelaktuell;

-- Punkt 12
-- In der Tabelle artikelaktuell der Spalte preis wieder den Wert entfernen. 
alter table artikelaktuell
drop check chk_preis_max;

show columns from artikelaktuell; 

-- Punkt 13
-- In der Tabelle artikelaktuell eine neue Spalte kommentar varchar(300) hinzufügen
alter table artikelaktuell
add column kommentar varchar(300);

show columns from artikelaktuell;

-- Punkt 14
-- In der Tabelle artikelaktuell die Spalte kommentar wieder entfernen
alter table artikelaktuell
drop column kommentar;

show columns from artikelaktuell;

-- Punkt 15
-- Verbindung zwischen den Tabellen artikelaktuell und positionartikel herstellen
alter table artikelinfo
add primary key (artikelid); 

alter table positionartikel
add constraint fk_artikelinfo
foreign key (fk_artikelinfo_artikelid)
references artikelinfo(artikelid);

show tables;

-- Punkt 16
-- Verbindung aus Punkt 15 wieder löschen
alter table positionartikel
drop foreign key fk_artikelinfo;

show create table positionartikel;
