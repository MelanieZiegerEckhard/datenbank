use uebungsdatenbank;

-- Punkt 1
-- View namens Urlaub erstellen und bestimmte spalten aus der Tabelle Mitarbeiter abfragen. 
drop view if exists v_urlaub; 

create view v_urlaub as
select name, vorname, urlaubstage, urlaubgenommen
from mitarbeiter;

select * from v_urlaub;

-- Punkt 2
-- View mit dem Namen v_praemie erstellen, die die Tabellen mitarbeiter und sachpraemie verbindet
drop view if exists v_praemie;

create view v_praemie as
select m.name, m.vorname, s.praemie, s.grund
from mitarbeiter m
join sachpraemie s on m.mitarbeiterid = s.mitarbeiterid;

select * from v_praemie;

-- Punkt 3
drop view if exists v_mitarbeiterbonus;

create view v_mitarbeiterbonus as
select name, vorname, bonus
from mitarbeiter 
order by bonus asc;

select * from v_mitarbeiterbonus;

-- Punkt 4
drop view if exists v_mitarbeiterkrankenkasse;

create view v_mitarbeiterkrankenkasse as
select mitarbeiterid, name, vorname, krankenversicherung
from mitarbeiter;

INSERT INTO v_mitarbeiterkrankenkasse (mitarbeiterid, name, vorname, krankenversicherung)
VALUES (51, 'Musterfrau', 'Anna', 'ÖGK');

describe mitarbeiter;

drop view if exists v_mitarbeiterkrankenkasse;


