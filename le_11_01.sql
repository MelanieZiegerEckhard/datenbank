use uebungsdatenbank;

-- Punkt 1
--
CREATE INDEX index_arbeitszeit_mitarbeiter
ON arbeitszeit (mitarbeiterID);

SHOW INDEX FROM arbeitszeit;
