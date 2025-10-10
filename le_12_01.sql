drop database if exists Shop_DB_Zieger;
create database if not exists Shop_DB_zieger;
use Shop_DB_zieger;

create table if not exists Kunden (
kundenID int auto_increment primary key,
vorname varchar(100),
nachname varchar(100),
straße varchar(100),
hausnummer varchar(10),
postleitzahl int,
stadt varchar(100),
telefonnummer varchar(30),
email varchar(50)
);

create table if not exists Lieferanten (
lieferantenID int auto_increment primary key,
name varchar(100),
straße varchar(100),
hausnummer varchar(10),
postleitzahl int,
stadt varchar(100),
telefonnummer varchar(30),
email varchar(50)
);

create table if not exists Artikel (
artikelID int auto_increment primary key,
bezeichnung varchar(100),
beschreibung text,
preis decimal(10,2),
lagerbestand int);

create table if not exists Verkauf (
verkaufID int auto_increment primary key,
kundenID int,
artikelID int,
menge int,
datum date,
foreign key (kundenID) references Kunden(kundenID),
foreign key (artikelID) references Artikel(artikelID)
);

create table if not exists Verkauf_Artikel (
verkaufID int,
artikelID int,
menge int,
foreign key (verkaufID) references Verkauf(verkaufID),
foreign key (artikelID) references Artikel(artikelID)
);

create table if not exists Lieferung (
lieferantenID int,
artikelID int,
lieferdatum date,
menge int,
foreign key (lieferantenID) references Lieferanten(lieferantenID),
foreign key (artikelID) references Artikel(artikelID)
);

insert into Kunden (vorname, nachname, straße, hausnummer, postleitzahl, stadt, telefonnummer, email)
values
('Anna', 'Müller', 'Hauptstraße', '12A', 9020, 'Klagenfurt', '06641234567', 'anna.mueller@example.com'),
('Thomas', 'Gruber', 'Bahnhofstraße', '7', 8010, 'Graz', '06648889900', 'thomas.gruber@example.com'),
('Julia', 'Schmidt', 'Ringstraße', '22', 1010, 'Wien', '06761234567', 'julia.schmidt@example.com'),
('Markus', 'Lehner', 'Berggasse', '3', 5020, 'Salzburg', '06501234567', 'markus.lehner@example.com');

insert into Lieferanten (name, straße, hausnummer, postleitzahl, stadt, telefonnummer, email)
values 
('TechSupply GmbH', 'Industriestraße', '5', 1010, 'Wien', '01/1234567', 'office@techsupply.at'),
('MediaWorld AG', 'Technikweg', '12', 8020, 'Graz', '0316/987654', 'kontakt@mediaworld.at'),
('CompuTrade', 'Handelsplatz', '8', 4020, 'Linz', '0732/456789', 'info@computrade.at'),
('DigitalZone', 'Elektronikstraße', '15', 5020, 'Salzburg', '0662/334455', 'service@digitalzone.at');

insert into Artikel (bezeichnung, beschreibung, preis, lagerbestand)
values 
('USB-Stick 64GB', 'Schneller USB 3.0 Stick', 12.99, 150),
('Bluetooth Maus', 'Kabellose Maus mit ergonomischem Design', 19.90, 80),
('Laptop Tasche 15"', 'Wasserabweisende Tasche für Laptops bis 15 Zoll', 24.50, 60),
('HDMI Kabel 2m', 'Hochwertiges HDMI Kabel für 4K Übertragung', 8.99, 200);

insert into Verkauf (kundenID, artikelID, menge, datum)
values
(1, 1, 3, '2025-10-09'),
(2, 2, 1, '2025-10-10'),
(3, 3, 2, '2025-10-11'),
(4, 4, 5, '2025-10-12');

insert into Lieferung (lieferantenID, artikelID, lieferdatum, menge)
values
(1, 1, '2025-09-01', 100),
(2, 2, '2025-09-02', 80),
(3, 3, '2025-09-03', 60),
(4, 4, '2025-09-04', 200);

-- Abfrage aller Kunden
select * from Kunden;

-- Abfrage aller Lieferanten
select * from Lieferanten;

-- Abfrage aller Artikel
select * from Artikel;

-- Abfrage des Lagerbestands eines bestimmten Artikels
select bezeichnung, lagerbestand
from Artikel
where artikelID = 1;

-- Abfrage aller Verkäufe eines bestimmten Kunden
select * from Verkauf
where kundenID = 2;

-- Abfrage aller Verkäufe eines bestimmten Lieferanten
select
  v.verkaufID,
  v.datum,
  k.vorname,
  k.nachname,
  a.bezeichnung,
  v.menge
from Verkauf v
join Artikel a on v.artikelID = a.artikelID
join Lieferung li on a.artikelID = li.artikelID
join Lieferanten l on li.lieferantenID = l.lieferantenID
join Kunden k on v.kundenID = k.kundenID
where l.lieferantenID = 2;


-- Abfrage aller Artikel, die unter einem bestimmten Preis liegen
select * from Artikel
where preis = 19.90;

-- Abfrage des Gesamtumsatzes des Shops
select sum(menge * preis) as Gesamtumsatz
from Verkauf
join Artikel on Verkauf.artikelID = Artikel.artikelID;

-- Abfrage zum ändern des Lagerbestandes eines Artikels um eine bestimmte Menge,
update Artikel
set lagerbestand = lagerbestand + 10
where artikelID = 1;

-- Abfrage zum löschen eines Kundens und aller zugehörigen Verkäufe
-- Zuerst alle Verkäufe um einen Fremdschlüssel-Fehler zu vermeiden
delete from Verkauf
where kundenID = 3;

-- Kunde löschen
delete from Kunden
where kundenID = 3;

-- Abfrage zum löschen eines Artikels und aller zugehörigen Verkäufe
-- Zuerst Die Verkäufe wegen Fremdschlüssel
delete from Lieferung
where artikelID = 4;

delete from Verkauf
where artikelID = 4;

-- Artikel löschen
delete from Artikel
where artikelID = 4;

-- Abfrage aller Verkäufe mit den Informationen zu Kunde, Lieferant und Artikel
select
  v.verkaufID,
  v.datum,
  k.vorname,
  k.nachname,
  a.bezeichnung,
  v.menge,
  l.name as Lieferant
from Verkauf v
join Kunden k on v.kundenID = k.kundenID
join Artikel a on v.artikelID = a.artikelID
join Lieferung li on a.artikelID = li.artikelID
join Lieferanten l on li.lieferantenID = l.lieferantenID;

-- Abfrage aller Artikel und ihrer Lieferanten
select
  a.artikelID,
  a.bezeichnung,
  l.lieferantenID,
  l.name as Lieferant,
  li.lieferdatum,
  li.menge
from Artikel a
join Lieferung li on a.artikelID = li.artikelID
join Lieferanten l on li.lieferantenID = l.lieferantenID;

-- View von allen Kunden und deren Umsätze
create view Kunden_Umsatz as
select
k.kundenID,
k.vorname,
k.nachname,
sum(v.menge * a.preis) as Umsatz
from Kunden k
join Verkauf v on k.kundenID = v.kundenID
join Artikel a on v.artikelID = a.artikelID
group by k.kundenID;

select * from Kunden_Umsatz;

-- Lagerbestand - und Verkauf protokollieren
start transaction;

update Artikel
set lagerbestand = lagerbestand - 2
where artikelID = 1;

insert into Verkauf (kundenID, artikelID, menge, datum)
values (1, 1, 2, CURDATE());

commit;

-- Zeige neuen Lagerbestand
select bezeichnung, lagerbestand
from Artikel
where artikelID = 1;

-- Transaktion Neuer Kunde + Verkauf
start transaction;

insert into Kunden (vorname, nachname, straße, hausnummer, postleitzahl, stadt, telefonnummer, email)
values ('Laura', 'Klein', 'Wiesenweg', '9', 8010, 'Graz', '06641234568', 'laura.klein@example.com');

set @neueKundenID = LAST_INSERT_ID();

insert into Verkauf (kundenID, artikelID, menge, datum)
values (@neueKundenID, 2, 1, CURDATE());

commit;

-- Zeigt neu angelegten Kunden
select * from Kunden 
where email = 'laura.klein@example.com';

-- Zeigt zugehörigen Verkauf
select * from Verkauf 
where kundenID = LAST_INSERT_ID()
order by datum desc
limit 1;

-- Zeige neuen Verkaufseintrag
select * from Verkauf
where kundenID = 1
order by datum desc
limit 1;

-- Transaktion Preis eines Artikels ändern + Verkauf aktualisieren
start transaction;

update Artikel
set preis = 29.99
where artikelID = 2;

alter table Verkauf_Artikel
add column preis decimal(10,2);

update Verkauf_Artikel
set preis = 29.99
where artikelID = 2;

commit;

-- Zeige aktualisierten Preis
select va.verkaufID, va.artikelID, va.menge, a.preis
from Verkauf_Artikel va
join Artikel a on va.artikelID = a.artikelID;


-- Sinnvolle indizes
create index idx_kundenID on Verkauf(kundenID);
create index idx_artikelID on Verkauf(artikelID);
create index idx_lieferantenID on Lieferung(lieferantenID);
create index idx_artikel_lieferung on Lieferung(artikelID);

-- Zeige alle Indizes der Tabelle Verkauf
show index from Verkauf;

-- Zeige alle Indizes der Tabelle Lieferung
show index from Lieferung;
