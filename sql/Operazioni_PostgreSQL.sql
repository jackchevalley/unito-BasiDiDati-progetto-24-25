-- | Operazione con SUCCESSO, rimozione di un area protetta che non ha storico
--
-- Controlliamo gli itinerari dell'area naturale
SELECT *
FROM itinerari
WHERE cod_area = 'EUAP9999';

-- Cancello l'area natuarale con CASCADE su itinerario
DELETE
FROM area_naturale
WHERE cod_area = 'EUAP9999';

-- Controllo gli itinerari (sono stati rimossi)
SELECT *
FROM itinerari
WHERE cod_area = 'EUAP9999';





-- | Operazione FALLITA, rimozione di un area protetta che ha delle visite guidate
--
-- Selezioniamo le visite organizzate disponibili per gli itinerari di un'area selezionata
SELECT vo.*
FROM visite_organizzate vo
    JOIN itinerari i ON i.ID_itinerario = vo.ID_itinerario
WHERE i.cod_area = 'EUAP0001';

-- Rimozione fallimentare dell'area naturale
DELETE
FROM area_naturale
WHERE cod_area = 'EUAP0001';





-- | Operazione con SUCCESSO, aggiorno COD_identificativo di un area naturale con storico ed itinerari
--
-- Controlliamo numero di itinerari e presenze di un'area naturale esistente
SELECT COUNT(*) AS n_itinerari FROM itinerari WHERE cod_area = 'EUAP0013';
SELECT COUNT(*) AS n_presenze FROM presenze WHERE cod_area = 'EUAP0013';

-- Aggiorniamo codice identificativo di un area naturale
UPDATE area_naturale
SET cod_area = 'EUAP1013'
WHERE cod_area = 'EUAP0013';

-- Rieseguiamo i conteggi sia con il codice vecchio che con il codice nuovo
SELECT COUNT(*) AS n_itinerari_old FROM itinerari WHERE cod_area = 'EUAP0013';
SELECT COUNT(*) AS n_presenze_old FROM presenze WHERE cod_area = 'EUAP0013';
SELECT COUNT(*) AS n_itinerari FROM itinerari WHERE cod_area = 'EUAP1013';
SELECT COUNT(*) AS n_presenze FROM presenze WHERE cod_area = 'EUAP1013';





-- | Operazione con SUCCESSO, elimino i precedenti di un utente anonimizzando valutazioni e commenti
--
-- Controlliamo le valutazioni ricevute dagli itinerari di un'area protetta
SELECT
    p.ID_utente, pi.valutazione_itinerario
FROM area_naturale a
    JOIN itinerari i ON i.cod_area = a.cod_area
    JOIN presenze_itinerari pi ON pi.ID_itinerario = i.ID_itinerario
    JOIN presenze p ON p.ID_presenza = pi.ID_presenza
WHERE
    a.cod_area = 'EUAP0001'
    AND pi.valutazione_itinerario IS NOT NULL
ORDER BY p.ID_utente, pi.valutazione_itinerario;

-- Eliminiamo uno degli utenti che ha lasciato delle valutazioni
DELETE
FROM utenti
WHERE ID_utente = 1;

-- Rieseguiamo i conteggi sia con il codice vecchio che con il codice nuovo
SELECT
    p.ID_utente, pi.valutazione_itinerario
FROM area_naturale a
    JOIN itinerari i ON i.cod_area = a.cod_area
    JOIN presenze_itinerari pi ON pi.ID_itinerario = i.ID_itinerario
    JOIN presenze p ON p.ID_presenza = pi.ID_presenza
WHERE
    a.cod_area = 'EUAP0001'
    AND pi.valutazione_itinerario IS NOT NULL
ORDER BY p.ID_utente, pi.valutazione_itinerario;

-- Se si vuole reinserire
-- INSERT INTO utenti (ID_utente, username, password, nome, cognome, data_ora_registrazione) VALUES (1, 'mario.rossi', '$2y$10$abcdefghijklmnopqrstuvwxyz123456', 'Mario', 'Rossi', '2024-01-15 10:30:00');





-- | Operazione a STEP, elimino una guida che però ha una visita organizzata programmata, aggiorno quindi ad una nuova guida e poi elimino
--
-- Controlliamo la visita della guida
SELECT *
FROM visite_organizzate
WHERE
    ID_guida = 3
    AND ID_itinerario = 2;

-- Proviamo a rimuovere la guida (fallimento, ha una visita impostata)
DELETE
FROM guide
WHERE
    ID_guida = 3;

-- Proviamo ad aggiornare la guida (fallimento, non è abilitata all'itinerario)
UPDATE visite_organizzate
SET ID_guida = 2
WHERE
    ID_guida = 3
    AND ID_itinerario = 2;

-- Abilitiamo la nuova guida all'itinerario
INSERT INTO guide_itinerari (ID_guida, ID_itinerario)
VALUES (2, 2);

-- Eseguiamo agggiornamento
UPDATE visite_organizzate
SET ID_guida = 2
WHERE
    ID_guida = 3
    AND ID_itinerario = 2;

-- Eseguiamo eliminazione
DELETE
FROM guide
WHERE ID_guida = 3;

-- Controlliamo la visita della guida (non esiste più)
SELECT *
FROM visite_organizzate
WHERE
    ID_guida = 3
    AND ID_itinerario = 2;

-- Controlliamo la nuova guida
SELECT *
FROM visite_organizzate
WHERE
    ID_guida = 2
    AND ID_itinerario = 2;
