create database if not exists le_08_01;
use le_08_01;

create table if not exists accounts (
kontonummer int primary key,
inhaber varchar(100),
kontostand decimal(10,2)
);

insert ignore into accounts (kontonummer, inhaber, kontostand)
values
(1001, 'Melanie Muster', 500.00),
(1002, 'Peter Lustig', 300.00),
(1003, 'Tom Turbo', 2500.00);

select * from accounts;

drop procedure if exists ueberweisung;

DELIMITER //

CREATE PROCEDURE ueberweisung (
  IN sender INT,
  IN empfaenger INT,
  IN betrag DECIMAL(10,2)
)
BEGIN
  DECLARE senderKontostand DECIMAL(10,2);

  START TRANSACTION;

  -- Prüfen, ob Sender genug Geld hat
  SELECT kontostand INTO senderKontostand FROM accounts WHERE kontonummer = sender;

  IF senderKontostand >= betrag THEN
    -- Betrag abziehen
    UPDATE accounts SET kontostand = kontostand - betrag WHERE kontonummer = sender;

    -- Betrag gutschreiben
    UPDATE accounts SET kontostand = kontostand + betrag WHERE kontonummer = empfaenger;

    COMMIT;
  ELSE
    ROLLBACK;
  END IF;
END //

DELIMITER ;

call ueberweisung(1001, 1002, 150.00);

select * from accounts where kontonummer = 1001;
select * from accounts;

call ueberweisung(1003, 1001, 500.00);
select * from accounts;

