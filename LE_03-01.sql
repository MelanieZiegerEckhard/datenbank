
-- Punkt 1
select max(qid) from qualifikationen;
select * from qualifikationen;
insert into qualifikationen (qid, bezeichnung, kuerzel, kategorie)
values (1, 'SQL', 'ITE', 'Informatik');

-- Punkt 2
insert into qualifikationen (qid, bezeichnung, kuerzel, kategorie)
values (2, 'Sys-Admin', 'ADA', 'Support');

-- Punkt 3
insert into qualifikationen (qid, bezeichnung)
values (
(select max(qid) + 1 from qualifikationen),
'Projektleitung'
);

-- Punkt 4
-- Änderung für qid = 2
update qualglobal
set bezeichnung = 'Second Level Helpdesk'
where qid = 2;

-- Änderung für qid = 3
update qualglobal
set bezeichnung = 'Fist Level Helpdesk',
kuerzel = 'FLH'
where qid = 3;

-- Punkt 5
update qualglobal
set kuerzel = 'DBE'
where kuerzel = 'DAT'
limit 10;

-- Punkt 6
delete from qualglobalarchiv
where qid = 2;

select * from qualglobalarchiv;

-- Punkt 7
delete from qualglobalarchiv
where qid in (5, 6, 7);

select * from qualglobalarchiv;


-- Punkt 8
delete from qualglobalarchiv
where qid in (1, 2, 3, 4);

select * from qualglobalarchiv;
