use uebungsdatenbank;

-- Punkt 1
select name, vorname from niederlassungbelgien
union
select name, vorname from niederlassungholland;

-- Punkt 2
select name, vorname from niederlassungbelgien
union all
select name, vorname from niederlassungholland;

-- Punkt 3
select name, vorname from niederlassungholland
union
select name, vorname from niederlassungbelgien
union
select name, vorname from niederlassungschweiz;

-- Punkt 4
select name, vorname from niederlassungholland;
select name, vorname from niederlassungbelgien;

select niederlassungholland.name, niederlassungholland.vorname
from niederlassungholland
inner join niederlassungbelgien
on niederlassungholland.name = niederlassungbelgien.name
and niederlassungholland.vorname = niederlassungbelgien.vorname;

-- Punkt 5
select name, vorname from niederlassungholland;
select name, vorname from niederlassungbelgien;

select niederlassungholland.name, niederlassungholland.vorname from niederlassungholland
left join niederlassungbelgien
on niederlassungholland.name = niederlassungbelgien.name
and niederlassungholland.vorname = niederlassungbelgien.vorname
where niederlassungbelgien.name is null
and niederlassungbelgien.vorname is null;

-- Punkt 6
select name, vorname, status from niederlassungholland
where status = 'aktiv'
union
select name, vorname, status from niederlassungbelgien
where status = 'aktiv';

-- Punkt 7
select name, vorname from niederlassungholland
union
select name, vorname from niederlassungbelgien
order by name;