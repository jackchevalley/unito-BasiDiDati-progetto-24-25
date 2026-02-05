CREATE TABLE classificazione_aree
(
    ID_classe_area SERIAL PRIMARY KEY,
    nome           varchar(200) NOT NULL UNIQUE
);

CREATE TABLE tipologia_aree
(
    ID_tipo_area   SERIAL PRIMARY KEY,
    ID_classe_area int          NOT NULL,
    nome           varchar(200) NOT NULL UNIQUE,
    CONSTRAINT tipologia_aree_ID_area
        FOREIGN KEY (ID_classe_area)
            REFERENCES classificazione_aree (ID_classe_area)
            ON UPDATE CASCADE
);
CREATE INDEX idx_tipologia_aree_ID_area ON tipologia_aree (ID_classe_area);

CREATE TABLE area_naturale
(
    cod_area      varchar(10) PRIMARY KEY,
    ID_tipo_area  int          NOT NULL,
    nome          varchar(200) NOT NULL,
    regione       varchar(50)  NOT NULL,
    ente          varchar(500) NOT NULL,
    provvedimento varchar(300) NOT NULL,
    sup_terra     int          NOT NULL DEFAULT 0,
    sup_mare      int          NOT NULL DEFAULT 0,
    len_costa     int          NOT NULL DEFAULT 0,
    note          text                  DEFAULT NULL,
    is_CETS       BOOLEAN      NOT NULL DEFAULT FALSE,
    rimosso       BOOLEAN      NOT NULL DEFAULT FALSE,
    CONSTRAINT area_naturale_ID_tipo_area
        FOREIGN KEY (ID_tipo_area)
            REFERENCES tipologia_aree (ID_tipo_area)
            ON UPDATE CASCADE
);
CREATE INDEX idx_area_naturale_ID_tipo_area ON area_naturale (ID_tipo_area);

CREATE TABLE utenti
(
    ID_utente              SERIAL PRIMARY KEY,
    username               varchar(100) NOT NULL UNIQUE,
    password               varchar(255)          DEFAULT NULL,
    nome                   varchar(100) NOT NULL,
    cognome                varchar(100) NOT NULL,
    data_ora_registrazione TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE guide
(
    ID_guida          SERIAL PRIMARY KEY,
    nome              varchar(100) NOT NULL,
    cognome           varchar(100) NOT NULL,
    valutazione_media int DEFAULT NULL
);

CREATE TABLE strutture
(
    ID_struttura      SERIAL PRIMARY KEY,
    nome              varchar(200) NOT NULL,
    indirizzo         varchar(200) NOT NULL,
    contatti          varchar(500)          DEFAULT NULL,
    impegni_ecologici varchar(500)          DEFAULT NULL,
    is_ospita_scuole  BOOLEAN      NOT NULL DEFAULT FALSE,
    is_ospita_gruppi  BOOLEAN      NOT NULL DEFAULT FALSE,
    is_CETS           BOOLEAN      NOT NULL DEFAULT FALSE
);

CREATE TABLE centri_visita
(
    ID_centro           SERIAL PRIMARY KEY,
    cod_area            varchar(10)  NOT NULL,
    nome                varchar(200) NOT NULL,
    orari               text         NOT NULL,
    note                text         NOT NULL,
    indirizzo           varchar(200) NOT NULL,
    indirizzo_comune    varchar(100) NOT NULL,
    indirizzo_provincia varchar(100) NOT NULL,
    indirizzo_cap       varchar(10)  NOT NULL,
    indirizzo_maps_url  text DEFAULT NULL,
    CONSTRAINT centri_visita_cod_area
        FOREIGN KEY (cod_area)
            REFERENCES area_naturale (cod_area)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);
CREATE INDEX idx_centri_visita_cod_area ON centri_visita (cod_area);

CREATE TABLE itinerari
(
    ID_itinerario         SERIAL PRIMARY KEY,
    cod_area              varchar(10)  NOT NULL,
    nome                  varchar(200) NOT NULL,
    descrizione           varchar(1000)         DEFAULT NULL,
    segnaletica           varchar(200) NOT NULL,
    punto_inizio_maps_url text         NOT NULL,
    difficolta            varchar(50)  NOT NULL,
    modalita              varchar(10)  NOT NULL,
    tempo_stimato         int          NOT NULL,
    valutazione_media     int                   DEFAULT NULL,
    disponibile           BOOLEAN      NOT NULL DEFAULT TRUE,
    rimosso               BOOLEAN      NOT NULL DEFAULT FALSE,
    CONSTRAINT itinerari_cod_area
        FOREIGN KEY (cod_area)
            REFERENCES area_naturale (cod_area)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);
CREATE INDEX idx_itinerari_cod_area ON itinerari (cod_area);

CREATE TABLE area_naturale_news
(
    cod_area varchar(10) NOT NULL,
    testo    text        NOT NULL,
    foto     varchar(500)         DEFAULT NULL,
    data_ora TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (cod_area, data_ora),
    CONSTRAINT area_naturale_news_cod_area
        FOREIGN KEY (cod_area)
            REFERENCES area_naturale (cod_area)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

CREATE TABLE area_naturale_commenti_piattaforma
(
    ID_commento SERIAL PRIMARY KEY,
    cod_area    varchar(10) NOT NULL,
    ID_utente   int       DEFAULT NULL,
    testo       text        NOT NULL,
    data_ora    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT area_naturale_commenti_piattaforma_cod_area
        FOREIGN KEY (cod_area)
            REFERENCES area_naturale (cod_area)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT area_naturale_commenti_piattaforma_ID_utente
        FOREIGN KEY (ID_utente)
            REFERENCES utenti (ID_utente)
            ON DELETE SET NULL
            ON UPDATE CASCADE
);
CREATE INDEX idx_area_commenti_cod_area ON area_naturale_commenti_piattaforma (cod_area);
CREATE INDEX idx_area_commenti_ID_utente ON area_naturale_commenti_piattaforma (ID_utente);

CREATE TABLE presenze
(
    ID_presenza      SERIAL PRIMARY KEY,
    cod_area         varchar(10) NOT NULL,
    ID_utente        int                  DEFAULT NULL,
    tipologia_utente varchar(10) NOT NULL,
    modalita_accesso varchar(20) NOT NULL,
    commento         text                 DEFAULT NULL,
    data_ora_in      TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    data_ora_out     TIMESTAMP            DEFAULT NULL,
    CONSTRAINT presenze_cod_area
        FOREIGN KEY (cod_area)
            REFERENCES area_naturale (cod_area)
            ON UPDATE CASCADE,
    CONSTRAINT presenze_ID_utente
        FOREIGN KEY (ID_utente)
            REFERENCES utenti (ID_utente)
            ON DELETE SET NULL
            ON UPDATE CASCADE
);
CREATE INDEX idx_presenze_ID_utente ON presenze (ID_utente);
CREATE INDEX idx_presenze_cod_area ON presenze (cod_area);

CREATE TABLE guide_licenze
(
    ID_licenza SERIAL PRIMARY KEY,
    ID_guida   int  NOT NULL,
    licenza    text NOT NULL,
    CONSTRAINT guide_licenze_ID_guida
        FOREIGN KEY (ID_guida)
            REFERENCES guide (ID_guida)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);
CREATE INDEX idx_guide_licenze_ID_guida ON guide_licenze (ID_guida);

CREATE TABLE guide_itinerari
(
    ID_guida      int     NOT NULL,
    ID_itinerario int     NOT NULL,
    disponibile   BOOLEAN NOT NULL DEFAULT TRUE,
    rimosso       BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (ID_guida, ID_itinerario),
    CONSTRAINT guide_itinerari_ID_guida
        FOREIGN KEY (ID_guida)
            REFERENCES guide (ID_guida)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT guide_itinerari_ID_itinerario
        FOREIGN KEY (ID_itinerario)
            REFERENCES itinerari (ID_itinerario)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);
CREATE INDEX idx_guide_itinerari_ID_itinerario ON guide_itinerari (ID_itinerario);

CREATE TABLE visite_organizzate
(
    ID_visita           SERIAL PRIMARY KEY,
    ID_guida            int           NOT NULL,
    ID_itinerario       int           NOT NULL,
    titolo_visita       varchar(1000) NOT NULL,
    max_partecipanti    int           NOT NULL,
    data_ora            TIMESTAMP     NOT NULL,
    stato_disponibilita varchar(20)   NOT NULL DEFAULT 'prenotabile',
    rimosso             BOOLEAN       NOT NULL DEFAULT FALSE,
    CONSTRAINT visite_organizzate_ID_guide_itinerari
        FOREIGN KEY (ID_guida, ID_itinerario)
            REFERENCES guide_itinerari (ID_guida, ID_itinerario)
            ON UPDATE CASCADE
);
CREATE INDEX idx_visite_ID_guide_itinerari ON visite_organizzate (ID_guida, ID_itinerario);
CREATE INDEX idx_visite_itinerari ON visite_organizzate (ID_itinerario);

CREATE TABLE prenotazioni_visite
(
    ID_visita          int       NOT NULL,
    ID_utente          int       NOT NULL,
    num_partecipanti   int       NOT NULL,
    data_ora_richiesta TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (ID_visita, ID_utente, data_ora_richiesta),
    CONSTRAINT prenotazioni_visite_ID_visita
        FOREIGN KEY (ID_visita)
            REFERENCES visite_organizzate (ID_visita)
            ON UPDATE CASCADE,
    CONSTRAINT prenotazioni_visite_ID_utente
        FOREIGN KEY (ID_utente)
            REFERENCES utenti (ID_utente)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);
CREATE INDEX idx_prenotazioni_visite_ID_utente ON prenotazioni_visite (ID_utente);

CREATE TABLE presenze_itinerari
(
    ID_presenza            int       NOT NULL,
    ID_itinerario          int       NOT NULL,
    ID_visita              int                DEFAULT NULL,
    valutazione_guida      int                DEFAULT NULL,
    valutazione_itinerario int                DEFAULT NULL,
    commento_itinerario    text               DEFAULT NULL,
    data_ora               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (ID_presenza, ID_itinerario),
    CONSTRAINT presenze_itinerari_ID_presenza
        FOREIGN KEY (ID_presenza)
            REFERENCES presenze (ID_presenza)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT presenze_itinerari_ID_itinerario
        FOREIGN KEY (ID_itinerario)
            REFERENCES itinerari (ID_itinerario)
            ON UPDATE CASCADE,
    CONSTRAINT presenze_itinerari_ID_visita
        FOREIGN KEY (ID_visita)
            REFERENCES visite_organizzate (ID_visita)
            ON DELETE SET NULL
            ON UPDATE CASCADE
);
CREATE INDEX idx_presenze_itinerari_ID_itinerario ON presenze_itinerari (ID_itinerario);
CREATE INDEX idx_presenze_itinerari_ID_visita ON presenze_itinerari (ID_visita);

CREATE TABLE strutture_aree_vicine
(
    ID_struttura int         NOT NULL,
    cod_area     varchar(10) NOT NULL,
    PRIMARY KEY (ID_struttura, cod_area),
    CONSTRAINT strutture_vicine_ID_struttura
        FOREIGN KEY (ID_struttura)
            REFERENCES strutture (ID_struttura)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT strutture_vicine_cod_area
        FOREIGN KEY (cod_area)
            REFERENCES area_naturale (cod_area)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);
CREATE INDEX idx_strutture_vicine_cod_area ON strutture_aree_vicine (cod_area);

CREATE TABLE strutture_servizi
(
    ID_servizio  SERIAL PRIMARY KEY,
    ID_struttura int     NOT NULL,
    testo        text    NOT NULL,
    disponibile  BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT strutture_servizi_ID_struttura
        FOREIGN KEY (ID_struttura)
            REFERENCES strutture (ID_struttura)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);
CREATE INDEX idx_strutture_servizi_ID_struttura ON strutture_servizi (ID_struttura);

CREATE TABLE strutture_trattamenti
(
    ID_trattamento SERIAL PRIMARY KEY,
    ID_struttura   int     NOT NULL,
    testo          text    NOT NULL,
    disponibile    BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT strutture_trattamenti_ID_struttura
        FOREIGN KEY (ID_struttura)
            REFERENCES strutture (ID_struttura)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);
CREATE INDEX idx_strutture_trattamenti_ID_struttura ON strutture_trattamenti (ID_struttura);

CREATE TABLE prenotazioni_strutture
(
    ID_struttura       int         NOT NULL,
    ID_utente          int         NOT NULL,
    data_ora_checkin   TIMESTAMP   NOT NULL,
    data_ora_checkout  TIMESTAMP   NOT NULL,
    num_ospiti         int         NOT NULL,
    stato_prenotazione varchar(20) NOT NULL DEFAULT 'in_attesa',
    data_ora_richiesta TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (ID_struttura, ID_utente, data_ora_richiesta),
    CONSTRAINT prenotazioni_strutture_ID_struttura
        FOREIGN KEY (ID_struttura)
            REFERENCES strutture (ID_struttura)
            ON UPDATE CASCADE,
    CONSTRAINT prenotazioni_strutture_ID_utente
        FOREIGN KEY (ID_utente)
            REFERENCES utenti (ID_utente)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);
CREATE INDEX idx_prenotazioni_strutture_ID_utente ON prenotazioni_strutture (ID_utente);

