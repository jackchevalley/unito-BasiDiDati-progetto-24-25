INSERT INTO classificazione_aree (ID_classe_area, nome) VALUES
(1, 'Parchi Nazionali'),
(2, 'Parchi naturali regionali e interregionali'),
(3, 'Riserve naturali'),
(4, 'Zone umide di interesse internazionale'),
(5, 'Altre aree naturali protette'),
(6, 'Aree di reperimento terrestri e marine');

INSERT INTO tipologia_aree (ID_tipo_area, ID_classe_area, nome) VALUES
(1, 1, 'Parco Nazionale'),
(2, 1, 'Biotipo'),
(3, 2, 'Parco Suburbano'),
(4, 2, 'Parco Territoriale Attrezzato'),
(5, 3, 'Riserva Naturale Marina'),
(6, 3, 'Riserva Naturale Integrale'),
(7, 4, 'Oasi Marina'),
(8, 4, 'Oasi'),
(9, 5, 'Area Marina Protetta'),
(10, 5, 'Giardino Botanico'),
(11, 6, 'Zona di Salvaguardia'),
(12, 6, 'Area Fluviale');

INSERT INTO area_naturale (cod_area, ID_tipo_area, nome, regione, ente, provvedimento, sup_terra, sup_mare, len_costa, note, is_CETS, rimosso) VALUES
('EUAP0001', 1, 'Parco nazionaale Abruzzo, Lazio e Molise', 'Abruzzo, Lazio, Molise', 'Ente parco', 'L. 395, 06. 12 91 - DD. MM. 04. 12. 92', 49680, 0, 0, NULL, FALSE, FALSE),
('EUAP0013', 2, 'Parco nazionale della Maiella', 'Abruzzo', 'Ente parco', 'L. 394, 06. 12 91 - DD. MM. 04. 12. 92', 62838, 0, 0, NULL, FALSE, FALSE),
('EUAP9999', 7, 'Parco Test Cancellabile', 'Lazio', 'Ente Test', 'DM test', 100, 0, 0, NULL, FALSE, FALSE);

INSERT INTO utenti (ID_utente, username, password, nome, cognome, data_ora_registrazione) VALUES
(1, 'mario.rossi', '$2y$10$abcdefghijklmnopqrstuvwxyz123456', 'Mario', 'Rossi', '2024-01-15 10:30:00'),
(2, 'laura.bianchi', '$2y$10$abcdefghijklmnopqrstuvwxyz123457', 'Laura', 'Bianchi', '2024-02-20 14:20:00'),
(3, 'guest_7ff1fca0-891a-47b1-9813-09aaea37987e', NULL, 'Marco', 'Verdi', '2024-03-10 09:15:00'),
(4, 'guest_f40d7110-9e5e-4687-81a1-d183959c51e7', NULL, 'Sofia', 'Neri', '2024-03-12 11:45:00'),
(5, 'paolo.ferrari', '$2y$10$abcdefghijklmnopqrstuvwxyz123458', 'Paolo', 'Ferrari', '2023-12-01 16:00:00'),
(6, 'chiara.romano', '$2y$10$abcdefghijklmnopqrstuvwxyz123459', 'Chiara', 'Romano', '2024-01-05 08:30:00');

INSERT INTO guide (ID_guida, nome, cognome, valutazione_media) VALUES
(1, 'Giovanni', 'Montanari', NULL),
(2, 'Elena', 'Boschi', NULL),
(3, 'Luca', 'Valli', NULL),
(4, 'Anna', 'Fontana', NULL),
(5, 'Marco', 'Serra', NULL);

INSERT INTO strutture (ID_struttura, nome, indirizzo, contatti, impegni_ecologici, is_ospita_scuole, is_ospita_gruppi, is_CETS) VALUES
(1, 'Rifugio Val di Rose', 'Località Val di Rose - Pescasseroli', 'Tel: 0863/912345 - info@rifugiovaldirose.it', 'Pannelli solari, raccolta differenziata, prodotti km 0', TRUE, TRUE, TRUE),
(2, 'Hotel Paradiso', 'Via Roma 45 - Pescasseroli', 'Tel: 0863/910111 - booking@hotelparadiso.it', 'Certificazione ambientale ISO 14001, energia rinnovabile', TRUE, TRUE, TRUE),
(3, 'B&B La Camosciara', 'Via Fonte Fracida 12 - Civitella Alfedena', 'Tel: 0864/890234 - info@lacamosciara.it', 'Bioedilizia, prodotti biologici a colazione', FALSE, TRUE, FALSE),
(4, 'Camping Maiella', 'Località San Tommaso - Caramanico Terme', 'Tel: 085/920456 - camping@maiella.it', 'Compostaggio, utilizzo acqua piovana', TRUE, TRUE, TRUE);

INSERT INTO centri_visita (ID_centro, cod_area, nome, orari, note, indirizzo, indirizzo_comune, indirizzo_provincia, indirizzo_cap, indirizzo_maps_url) VALUES
(4, 'EUAP0001', 'Centro Visitatori Pescasseroli', 'Lun-Dom 9:00-13:00, 15:00-18:00. Chiuso martedì in inverno', 'Museo naturalistico e punto informazioni. Visite guidate su prenotazione', 'Via Santa Lucia, 1', 'Pescasseroli', 'L''Aquila', '67032', 'https://maps.google.com/?q=41.8089,13.7934'),
(5, 'EUAP0001', 'Centro Visitatori Civitella Alfedena', 'Lun-Dom 10:00-13:00, 14:30-17:30. Chiuso mercoledì', 'Museo del Lupo Appenninico. Area faunistica', 'Via Colle dell''Orso, 3', 'Civitella Alfedena', 'L''Aquila', '67030', 'https://maps.google.com/?q=41.7589,13.9234'),
(6, 'EUAP0013', 'Centro Visitatori Caramanico', 'Lun-Dom 9:00-12:30, 15:30-18:00. Chiuso lunedì', 'Punto informazioni e museo geologico', 'Via Occidentale, 6', 'Caramanico Terme', 'Pescara', '65023', 'https://maps.google.com/?q=42.1587,14.0234');

INSERT INTO itinerari (ID_itinerario, cod_area, nome, descrizione, segnaletica, punto_inizio_maps_url, difficolta, modalita, tempo_stimato, valutazione_media, disponibile, rimosso) VALUES
(1, 'EUAP0001', 'Sentiero della Camosciara', 'Percorso panoramico che attraversa la Val Fondillo fino alla Camosciara, con possibilità di avvistare camosci e cervi', 'Segnavia rosso-bianco F1', 'https://maps.google.com/?q=41.7689,13.8234', 'media', 'piedi', 240, NULL, TRUE, FALSE),
(2, 'EUAP0001', 'Anello di Pescasseroli', 'Facile passeggiata ad anello intorno a Pescasseroli, adatta a famiglie con bambini', 'Segnavia giallo G2', 'https://maps.google.com/?q=41.8089,13.7934', 'facile', 'piedi', 90, NULL, TRUE, FALSE),
(3, 'EUAP0001', 'Val di Rose', 'Itinerario impegnativo che raggiunge il rifugio della Val di Rose attraversando faggete secolari', 'Segnavia rosso-bianco VR1', 'https://maps.google.com/?q=41.7589,13.8434', 'difficile', 'piedi', 360, NULL, TRUE, FALSE),
(4, 'EUAP0013', 'Sentiero del Blockhaus', 'Ascesa alla vetta del Blockhaus con vista spettacolare sulla Maiella', 'Segnavia blu B3', 'https://maps.google.com/?q=42.1234,14.1567', 'difficile', 'piedi', 300, NULL, TRUE, FALSE),
(5, 'EUAP0013', 'Grotta del Cavallone', 'Percorso che conduce alla famosa grotta del Cavallone, una delle più belle d''Italia', 'Segnavia verde V5', 'https://maps.google.com/?q=42.0987,14.1234', 'media', 'piedi', 180, NULL, TRUE, FALSE),
(6, 'EUAP0001', 'Mountain Bike Val Fondillo', 'Percorso MTB attraverso la Val Fondillo con tratti tecnici', 'Segnavia MTB1', 'https://maps.google.com/?q=41.7689,13.8234', 'media', 'MTB', 150, NULL, TRUE, FALSE),
(7, 'EUAP9999', 'Itinerario Test 1', 'Solo test', 'ok', 'https://maps.google.com/?q=0,0', 'facile', 'piedi', 60, NULL, TRUE, FALSE),
(8, 'EUAP9999', 'Itinerario Test 2', 'Solo test', 'ok', 'https://maps.google.com/?q=0,0', 'media', 'piedi', 120, NULL, TRUE, FALSE);

INSERT INTO area_naturale_news (cod_area, testo, foto, data_ora) VALUES
('EUAP0001', 'Nuovi sentieri aperti nella zona della Camosciara. Disponibili mappe aggiornate presso i centri visita.', NULL, '2026-01-05 13:30:00'),
('EUAP0001', 'Weekend della Biodiversità: 25-26 gennaio eventi gratuiti per famiglie sui lupi appenninici.', 'https://storage.example.com/parchi/weekend_biodiversita.jpg', '2026-01-06 15:00:00'),
('EUAP0001', 'Avvistati 15 orsi marsicani nella Val Fondillo durante il monitoraggio annuale. La popolazione è in lenta crescita.', 'https://storage.example.com/parchi/orso_marsicano_2026.jpg', '2026-01-08 09:00:00'),
('EUAP0013', 'Chiusura temporanea sentiero Blockhaus per neve abbondante. Riapertura prevista metà febbraio.', NULL, '2026-01-09 08:00:00');

INSERT INTO area_naturale_commenti_piattaforma (ID_commento, cod_area, ID_utente, testo, data_ora) VALUES
(1, 'EUAP0001', 1, 'Parco meraviglioso! Abbiamo visto cervi e camosci. Le guide sono molto preparate e appassionate.', '2025-06-16 20:30:00'),
(2, 'EUAP0001', 2, 'Bellissima esperienza in famiglia. I sentieri sono ben segnalati e i centri visita molto interessanti.', '2025-07-23 18:45:00'),
(3, 'EUAP0013', 3, 'La Grotta del Cavallone è spettacolare! Consiglio la visita guidata per apprezzarla al meglio.', '2025-08-11 21:15:00'),
(4, 'EUAP0001', NULL, 'Ottima organizzazione e natura incontaminata. Tornerò sicuramente!', '2025-09-20 19:00:00');

INSERT INTO presenze (ID_presenza, cod_area, ID_utente, tipologia_utente, modalita_accesso, commento, data_ora_in, data_ora_out) VALUES
(1, 'EUAP0001', 1, 'adulto', 'singolo', 'Bella giornata di trekking', '2025-06-15 09:00:00', '2025-06-15 17:30:00'),
(2, 'EUAP0001', 2, 'adulto', 'gruppo', 'Visita con famiglia', '2025-07-22 10:00:00', '2025-07-22 18:00:00'),
(3, 'EUAP0013', 3, 'adulto', 'singolo', NULL, '2025-08-10 08:30:00', '2025-08-10 16:00:00'),
(4, 'EUAP0001', 6, 'bambino', 'gruppo scolastico', 'Visita didattica scuola elementare', '2025-09-15 09:00:00', '2025-09-15 15:00:00'),
(5, 'EUAP0001', 5, 'senior', 'gruppo', 'Gruppo CAI', '2025-10-12 08:00:00', '2025-10-12 17:00:00'),
(6, 'EUAP0013', NULL, 'adulto', 'singolo', NULL, '2025-11-20 10:00:00', '2025-11-20 15:30:00');

INSERT INTO guide_licenze (ID_licenza, ID_guida, licenza) VALUES
(1, 1, 'Guida Ambientale Escursionistica GAE - Numero 12345 - Valida fino al 2026'),
(2, 1, 'Abilitazione Parco Nazionale Abruzzo, Lazio e Molise - N. PN/001/2023'),
(3, 2, 'Guida Ambientale Escursionistica GAE - Numero 23456 - Valida fino al 2027'),
(4, 2, 'Abilitazione Parco Nazionale della Maiella - N. PM/015/2023'),
(5, 3, 'Guida Naturalistica Regionale - Numero 34567 - Valida fino al 2025'),
(6, 4, 'Guida Ambientale Escursionistica GAE - Numero 45678 - Valida fino al 2026'),
(7, 5, 'Guida Turistica Regionale - Numero 56789 - Valida fino al 2028');

INSERT INTO guide_itinerari (ID_guida, ID_itinerario, disponibile, rimosso) VALUES
(1, 1, TRUE, FALSE),
(1, 2, TRUE, FALSE),
(1, 3, TRUE, FALSE),
(2, 1, TRUE, FALSE),
(2, 4, TRUE, FALSE),
(2, 5, TRUE, FALSE),
(3, 2, TRUE, FALSE),
(3, 6, TRUE, FALSE),
(4, 4, TRUE, FALSE),
(4, 5, TRUE, FALSE),
(5, 1, FALSE, FALSE);

INSERT INTO visite_organizzate (ID_visita, ID_guida, ID_itinerario, titolo_visita, max_partecipanti, data_ora, stato_disponibilita, rimosso) VALUES
(1, 1, 1, 'Alla scoperta della Camosciara - Visita guidata con Giovanni Montanari', 15, '2026-01-15 09:00:00', 'prenotabile', FALSE),
(2, 1, 2, 'Passeggiata in famiglia - Anello di Pescasseroli', 20, '2026-01-20 10:00:00', 'prenotabile', FALSE),
(3, 2, 4, 'Conquista del Blockhaus - Escursione con Elena Boschi', 12, '2026-01-16 09:30:00', 'prenotabile', FALSE),
(4, 2, 5, 'Meraviglie sotterranee - Visita alla Grotta del Cavallone', 10, '2026-01-22 10:00:00', 'vuoto', FALSE),
(5, 3, 2, 'Trekking per famiglie - Anello di Pescasseroli al pomeriggio', 25, '2026-01-18 14:00:00', 'prenotabile', FALSE),
(6, 4, 4, 'Vetta della Maiella - Escursione al Blockhaus', 15, '2026-01-19 09:00:00', 'completo', FALSE),
(7, 1, 3, 'Val di Rose - Trekking avanzato tra le faggete secolari', 10, '2026-01-25 08:00:00', 'prenotabile', FALSE);

INSERT INTO prenotazioni_visite (ID_visita, ID_utente, num_partecipanti, data_ora_richiesta) VALUES
(1, 1, 2, '2025-12-20 15:30:00'),
(1, 2, 4, '2025-12-22 10:15:00'),
(3, 3, 3, '2026-01-05 09:45:00'),
(5, 4, 2, '2026-01-08 14:20:00'),
(6, 1, 15, '2026-01-10 11:00:00'),
(7, 5, 3, '2026-01-11 16:30:00');

INSERT INTO presenze_itinerari (ID_presenza, ID_itinerario, ID_visita, valutazione_guida, valutazione_itinerario, commento_itinerario, data_ora) VALUES
(1, 1, 1, NULL, 5, 'Guida eccellente, molto preparata sulla fauna locale', '2026-01-14 13:44:38'),
(2, 2, 1, NULL, 4, 'Bel percorso, adatto ai bambini', '2026-01-14 13:44:38'),
(3, 4, 2, NULL, 5, 'Esperienza indimenticabile, paesaggi mozzafiato', '2026-01-14 13:44:38'),
(4, 2, 3, NULL, NULL, NULL, '2026-01-14 13:44:38'),
(5, 1, 1, NULL, 4, 'Buona organizzazione', '2026-01-14 13:44:38'),
(6, 5, NULL, NULL, 3, 'Percorso interessante ma segnaletica migliorabile', '2026-01-14 13:44:38');

INSERT INTO strutture_aree_vicine (ID_struttura, cod_area) VALUES
(1, 'EUAP0001'),
(2, 'EUAP0001'),
(3, 'EUAP0001'),
(3, 'EUAP0013'),
(4, 'EUAP0013');

INSERT INTO strutture_servizi (ID_servizio, ID_struttura, testo, disponibile) VALUES
(1, 1, 'Cucina tipica abruzzese con prodotti locali', TRUE),
(2, 1, 'Noleggio attrezzatura trekking', TRUE),
(3, 2, 'Wi-Fi gratuito in tutte le camere', TRUE),
(4, 2, 'Ristorante con cucina tradizionale', TRUE),
(5, 2, 'Centro benessere e spa', TRUE),
(6, 2, 'Parcheggio custodito', TRUE),
(7, 3, 'Colazione biologica con prodotti locali', TRUE),
(8, 3, 'Biblioteca naturalistica', TRUE),
(9, 4, 'Piazzole per camper e roulotte', TRUE),
(10, 4, 'Area giochi per bambini', TRUE),
(11, 4, 'Punto noleggio mountain bike', TRUE);

INSERT INTO strutture_trattamenti (ID_trattamento, ID_struttura, testo, disponibile) VALUES
(1, 1, 'Mezza pensione', TRUE),
(2, 1, 'Pensione completa', TRUE),
(3, 2, 'Solo pernottamento', TRUE),
(4, 2, 'Bed & Breakfast', TRUE),
(5, 2, 'Mezza pensione', TRUE),
(6, 2, 'Pensione completa', TRUE),
(7, 3, 'Bed & Breakfast', TRUE),
(8, 4, 'Solo piazzola', TRUE),
(9, 4, 'Piazzola + colazione', TRUE);

INSERT INTO prenotazioni_strutture (ID_struttura, ID_utente, data_ora_checkin, data_ora_checkout, num_ospiti, stato_prenotazione, data_ora_richiesta) VALUES
(1, 2, '2026-03-20 00:00:00', '2026-03-22 00:00:00', 4, 'in_attesa', '2026-01-08 14:20:00'),
(2, 1, '2026-02-15 00:00:00', '2026-02-18 00:00:00', 2, 'accettata', '2026-01-05 10:30:00'),
(2, 6, '2026-02-20 00:00:00', '2026-02-21 00:00:00', 2, 'rifiutata', '2025-12-15 16:00:00'),
(3, 3, '2026-04-10 00:00:00', '2026-04-12 00:00:00', 2, 'accettata', '2026-01-09 09:15:00'),
(4, 5, '2026-05-01 00:00:00', '2026-05-03 00:00:00', 3, 'in_attesa', '2026-01-10 11:45:00');

