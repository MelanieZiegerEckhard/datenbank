use uebungsdatenbank;

-- Punkt 1
-- Namen und Vornamen der Mitarbeiter die eine oder mehere sachprämien bekommen haben.alter
select distinct m.vorname, m.name
from mitarbeiter m
join sachpraemie s on m.mitarbeiterid = s.mitarbeiterid;

-- Punkt 2
-- Welcher Mitarbeiter hat welche sachprämie bekommen und sie Summe der erhaltenen sachprämie
select m.vorname, m.name, SUM(s.preis) as gesamtpraemie
from mitarbeiter m
join sachpraemie s on m.mitarbeiterid = s.mitarbeiterid
group by m.mitarbeiterid, m.vorname, m.name
limit 0, 1000;

-- Punkt 3
-- Welche Mitarbeiter haben eine Steuerklasse die nicht in der Tabelle steuerklasse zu finden sind
select m.vorname, m.name, m.steuerklasse
from mitarbeiter m
where m.steuerklasse not in (
    select steuerklassezahl
    from steuerklasse
);

-- Punkt 4
-- 
SELECT m.vorname, m.name, m.steuerklasse
FROM mitarbeiter m
WHERE m.steuerklasse IS NOT NULL
AND NOT EXISTS (
    SELECT 1
    FROM steuerklasse s
    WHERE s.steuerklasse = m.steuerklasse
);

