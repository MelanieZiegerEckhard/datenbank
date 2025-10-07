use uebungsdatenbank;

-- Punkt 1
select mitarbeiterid, name, vorname, eintrittsdatum, austrittsdatum
from mitarbeiter
order by eintrittsdatum;

-- Punkt 2
select mitarbeiterid, name, vorname, eintrittsdatum, austrittsdatum, austrittsgrund
from mitarbeiter
order by eintrittsdatum;

-- Punkt 3
select *
from mitarbeiter;

-- Punkt 4 
select mitarbeiterid, name, vorname, abteilung
from mitarbeiter
where abteilung = 'Vertrieb';

-- Punkt 5
select mitarbeiterid, name, vorname, urlaubgenommen
from mitarbeiter
where urlaubgenommen = 30;

-- Punkt 6
select mitarbeiterid, name, vorname, anzahlkinder
from mitarbeiter
where anzahlkinder >= 1;

-- Punkt 7
select mitarbeiterid, name, vorname, eintrittsdatum
from mitarbeiter
where eintrittsdatum between '1990-01-01' and '2000-01-01';

-- Punkt 8
select mitarbeiterid, name, vorname, geschlecht, abteilung
from mitarbeiter
where abteilung = 'Vertrieb' and geschlecht = 'w';

-- Punkt 9
SELECT *
FROM mitarbeiter
WHERE krankenversicherung IN ('MH Plus Bonn', 'KKK gesund plus');

-- Punkt 10
select *
from mitarbeiter
where geschlecht = 'w'
and verheiratet = 'nein'
and anzahlkinder >= 1;

-- Punkt 11
select *
from krankenkasse
limit 10;

-- Punkt 12
select name, vorname, abteilung
from mitarbeiter
order by abteilung ASC, name ASC, vorname ASC;

-- Punkt 13
select name, vorname, abteilung, bonus
from mitarbeiter
order by abteilung ASC, bonus ASC;

-- Punkt 14
select
name as Name,
vorname as Vorname,
strasse as Strasse,
hausnummer as Hausnummer,
plz as Postleitzahl,
ort as Ort
from mitarbeiter;

-- Punkt 15
select ort, count(*) as Anzahl
from mitarbeiter
group by ort;