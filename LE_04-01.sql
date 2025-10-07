create database if not exists le_04_01;
use le_04_01;



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