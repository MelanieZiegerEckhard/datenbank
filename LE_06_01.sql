use uebungsdatenbank;

-- Punkt 1
create user if not exists 'melanie'@'localhost' identified by 'secret';
grant select, insert, update on artikel to 'melanie'@'localhost';

show grants for 'melanie'@'localhost';

-- Punkt 2
revoke select, insert, update on artikel from 'melanie'@'localhost';
drop user 'melanie'@'localhost';

-- Punkt 3
create role if not exists 'vertrieb';
grant select, insert, update on artikel to 'vertrieb';

create user 'franz'@'localhost' identified by 'secret';
create user 'maria'@'localhost' identified by 'secret';

grant 'vertrieb' to 'franz'@'localhost';
grant 'vertrieb' to 'maria'@'localhost';

revoke insert, update on artikel from 'vertrieb';

revoke 'vertrieb' from 'franz'@'localhost';
revoke 'vertrieb' from 'maria'@'localhost';

drop role 'vertrieb';

