drop database if exists meine_datenbank;
create database meine_datenbank;
use meine_datenbank;

-- TeilnehmerInnen
create table participants (
id int auto_increment primary key, 	-- ID für jeden Teilnehmer
name varchar(100),	-- Name
email varchar(100),	-- E-Mail
company varchar(100)	-- Firma
);

-- ReferentInnen Tabelle
create table speakers (
id int auto_increment primary key,	-- ID für jeden Referenten
name varchar(100),
expertise varchar(100),
email varchar(100)
);

create table topics (
id int auto_increment primary key,	-- ID für die Konferenz
title varchar(100),	-- Titel des Themas
description text	-- Beschreibung des Themas
);

-- Tabelle für die Konferenzveranstaltungen
create table conference (
id int auto_increment primary key,	-- ID für jede Konferenz
location varchar(100),	-- Veranstaltungsort
topic_id int,	-- Verknüpfung zum Thema
speaker_id int,	-- Verknüpfung zum Referenten
foreign key (topic_id) references topics(id),	-- Fremdschlüssel zu Themen
foreign key (speaker_id) references speakers(id)	-- Fremdschlüssel zu Referenten
);

insert into participants (name, email, company)
values
('Anna Miller', 'anna.miller@example.com', 'TechCorp'),
('Max Sample', 'max.sample@example.com', 'Innovate Ltd'),
('Lisa Berger', 'lisa.berger@example.com', 'Future Inc');

insert into speakers (name, expertise, email)
values
('Dr. John Smith', 'AI & Robotics', 'john.smith@example.com'),
('Prof. Emily Clark', 'Cypersecurity', 'emily.clark@example.com'),
('Dr. Alex Novak', 'Cloud Computing', 'alex.novak@example.com');

insert into topics (title, description)
values
('Artifical Intelligence', 'Einführung in KI und ihre Anwendungen'),
('Cypersecurity Trends', 'Aktuelle Entwicklungen in der digitalen Sicherheit'),
('Cloud Technologien', 'Moderne Cloud-Lösungen für Unternehmen');

insert into conference (location, topic_id, speaker_id)
values
('Wien', 1, 1),
('Graz', 2, 2),
('Linz', 3, 3);

show tables;

SELECT * FROM participants;
SELECT * FROM speakers;
SELECT * FROM topics;
SELECT * FROM conference;

SELECT c.id, c.date, c.location, t.title AS topic, s.name AS speaker
FROM conference c
JOIN topics t ON c.topic_id = t.id
JOIN speakers s ON c.speaker_id = s.id;

SELECT * FROM participants WHERE company = 'TechCorp';

SELECT * FROM participants WHERE company = 'TechCorp';
SELECT * FROM speakers WHERE expertise LIKE '%AI%';
