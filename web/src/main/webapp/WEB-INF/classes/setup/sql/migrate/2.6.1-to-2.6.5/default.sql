CREATE TABLE MetadataNotifiers
  (
    id         int,
    name       varchar(32)    not null,
    url        varchar(255)   not null,
    enabled    char(1)        default 'n' not null,
    username       varchar(32),
    password       varchar(32),

    primary key(id)
  );

-- ======================================================================

CREATE TABLE MetadataNotifications
  (
    metadataId         int,
    notifierId         int,
    notified           char(1)        default 'n' not null,
    metadataUuid       varchar(250)   not null,
    action             char(1)        not null,
    errormsg           text,

    primary key(metadataId,notifierId),

    foreign key(notifierId) references MetadataNotifiers(id)
  );

CREATE TABLE CswServerCapabilitiesInfo
  (
    idField   int,
    langId    varchar(5)    not null,
    field     varchar(32)   not null,
    label     varchar(96),

    primary key(idField),

    foreign key(langId) references Languages(id)
  );

CREATE TABLE IndexLanguages
  (
    id            int,
    languageName  varchar(32)   not null,
    selected      char(1)       default 'n' not null,

    primary key(id, languageName)

  );

ALTER TABLE Languages ADD isocode varchar(3);

UPDATE Languages SET isocode = 'eng' where id ='en';
UPDATE Languages SET isocode = 'fre' where id ='fr';
UPDATE Languages SET isocode = 'spa' where id ='es';
UPDATE Languages SET isocode = 'rus' where id ='ru';
UPDATE Languages SET isocode = 'chi' where id ='cn';
UPDATE Languages SET isocode = 'ger' where id ='de';
UPDATE Languages SET isocode = 'dut' where id ='nl';
UPDATE Languages SET isocode = 'por' where id ='pt';
UPDATE Languages SET isocode = 'cat' where id ='ca';
UPDATE Languages SET isocode = 'tur' where id ='tr';

INSERT INTO CswServerCapabilitiesInfo VALUES (1, 'en', 'title', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (2, 'en', 'abstract', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (3, 'en', 'fees', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (4, 'en', 'accessConstraints', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (5, 'es', 'title', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (6, 'es', 'abstract', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (7, 'es', 'fees', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (8, 'es', 'accessConstraints', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (9, 'nl', 'title', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (10, 'nl', 'abstract', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (11, 'nl', 'fees', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (12, 'nl', 'accessConstraints', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (13, 'cn', 'title', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (14, 'cn', 'abstract', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (15, 'cn', 'fees', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (16, 'cn', 'accessConstraints', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (17, 'de', 'title', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (18, 'de', 'abstract', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (19, 'de', 'fees', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (20, 'de', 'accessConstraints', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (21, 'fr', 'title', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (22, 'fr', 'abstract', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (23, 'fr', 'fees', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (24, 'fr', 'accessConstraints', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (25, 'pt', 'title', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (26, 'pt', 'abstract', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (27, 'pt', 'fees', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (28, 'pt', 'accessConstraints', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (29, 'ru', 'title', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (30, 'ru', 'abstract', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (31, 'ru', 'fees', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (32, 'ru', 'accessConstraints', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (33, 'ca', 'title', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (34, 'ca', 'abstract', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (35, 'ca', 'fees', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (36, 'ca', 'accessConstraints', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (37, 'tr', 'title', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (38, 'tr', 'abstract', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (39, 'tr', 'fees', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (40, 'tr', 'accessConstraints', '');

INSERT INTO IndexLanguages VALUES (1, 'danish', 'n');
INSERT INTO IndexLanguages VALUES (2, 'dutch', 'n');
INSERT INTO IndexLanguages VALUES (3, 'english', 'y');
INSERT INTO IndexLanguages VALUES (4, 'finnish', 'n');
INSERT INTO IndexLanguages VALUES (5, 'french', 'n');
INSERT INTO IndexLanguages VALUES (6, 'german', 'n');
INSERT INTO IndexLanguages VALUES (7, 'hungarian', 'n');
INSERT INTO IndexLanguages VALUES (8, 'italian', 'n');
INSERT INTO IndexLanguages VALUES (9, 'norwegian', 'n');
INSERT INTO IndexLanguages VALUES (10, 'portuguese', 'n');
INSERT INTO IndexLanguages VALUES (11, 'russian', 'n');
INSERT INTO IndexLanguages VALUES (12, 'spanish', 'n');
INSERT INTO IndexLanguages VALUES (13, 'swedish', 'n');
INSERT INTO IndexLanguages VALUES (14, 'catalan', 'n');
INSERT INTO IndexLanguages VALUES (15, 'turkish', 'n');

-- 2.6.4 changes
CREATE TABLE CustomElementSet
  (
    xpath  varchar(1000) not null
  );

ALTER TABLE Languages ADD isInspire char(1);
ALTER TABLE Languages ADD isDefault char(1);

UPDATE Languages SET isInspire = 'y', isDefault = 'y' where id ='en';
UPDATE Languages SET isInspire = 'y', isDefault = 'n' where id ='fr';
UPDATE Languages SET isInspire = 'y', isDefault = 'n' where id ='es';
UPDATE Languages SET isInspire = 'n', isDefault = 'n' where id ='ru';
UPDATE Languages SET isInspire = 'n', isDefault = 'n' where id ='cn';
UPDATE Languages SET isInspire = 'y', isDefault = 'n' where id ='de';
UPDATE Languages SET isInspire = 'y', isDefault = 'n' where id ='nl';
UPDATE Languages SET isInspire = 'y', isDefault = 'n' where id ='pt';
UPDATE Languages SET isInspire = 'n', isDefault = 'n' where id ='ca';
UPDATE Languages SET isInspire = 'n', isDefault = 'n' where id ='tr';

-- 2.6.5 changes

INSERT INTO Settings VALUES (23,20,'protocol','http');

INSERT INTO Settings VALUES (88,80,'defaultGroup', NULL);
INSERT INTO Settings VALUES (113,87,'group',NULL);
INSERT INTO Settings VALUES (178,173,'group',NULL);
INSERT INTO Settings VALUES (179,170,'defaultGroup', NULL);

INSERT INTO Languages VALUES ('fi','Finnish', 'fin', 'y', 'n');

INSERT INTO CswServerCapabilitiesInfo VALUES (41, 'fi', 'title', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (42, 'fi', 'abstract', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (43, 'fi', 'fees', '');
INSERT INTO CswServerCapabilitiesInfo VALUES (44, 'fi', 'accessConstraints', '');

INSERT INTO CategoriesDes VALUES (1,'fi','Kartat & kuvat');
INSERT INTO CategoriesDes VALUES (2,'fi','Tietoaineistot');
INSERT INTO CategoriesDes VALUES (3,'fi','Vuorovaikutteiset resurssit');
INSERT INTO CategoriesDes VALUES (4,'fi','Sovellukset');
INSERT INTO CategoriesDes VALUES (5,'fi','Esimerkkitapaukset, parhaat k�yt�nn�t');
INSERT INTO CategoriesDes VALUES (6,'fi','Konferenssijulkaisut');
INSERT INTO CategoriesDes VALUES (7,'fi','Valokuvat');
INSERT INTO CategoriesDes VALUES (8,'fi','��nitteet / Videot');
INSERT INTO CategoriesDes VALUES (9,'fi','Hakemistot');
INSERT INTO CategoriesDes VALUES (10,'fi','Other information resources');

INSERT INTO GroupsDes VALUES (-1,'fi','Vierailija');
INSERT INTO GroupsDes VALUES (0,'fi','Intranet');
INSERT INTO GroupsDes VALUES (1,'fi','Kaikki');
INSERT INTO GroupsDes VALUES (2,'fi','Ryhm�');

UPDATE Settings SET value='2.6.5' WHERE name='version';
UPDATE Settings SET value='0' WHERE name='subVersion';
