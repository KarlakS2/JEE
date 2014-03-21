CREATE TABLE "CATEGORIE"
(
    "NOM" VARCHAR(45) not null primary key
);

CREATE TABLE "ARTICLE"
(
    "ID" INT not null primary key GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1 ),
    "NOM" VARCHAR(45) not null,
    "PRIX" INT not null,
    "DESCRIPTION" VARCHAR(2000) not null,
    "URLIMAGE" VARCHAR(100) not null,
    "CATEGORIE" VARCHAR(45) not null,
     FOREIGN KEY("CATEGORIE") REFERENCES CATEGORIE("NOM")
);

CREATE TABLE "CLIENT"
(
    "IDENTIFIANT" VARCHAR(100) not null primary key,
    "MDP" VARCHAR(100) not null,
    "MAIL" VARCHAR(100) not null unique,
    "NOM" VARCHAR(100) not null,
    "PRENOM" VARCHAR(100) not null,
    "ADRESSE" VARCHAR(100) not null,
    "NAISSANCE" VARCHAR(100) not null,
    "SEXE" VARCHAR(100) not null
);

CREATE TABLE "ADMIN"
(
    "IDENTIFIANT" VARCHAR(100) not null primary key,
    "MDP" VARCHAR(100) not null,
    "MAIL" VARCHAR(100) not null unique
);

CREATE TABLE "COMMANDE"
(
    "ID" INT not null primary key GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1 ),
    "ID_CLIENT" VARCHAR(100) not null,
    "ID_ARTICLE" INT not null,
    FOREIGN KEY("ID_CLIENT") REFERENCES CLIENT("IDENTIFIANT"),
    FOREIGN KEY("ID_ARTICLE") REFERENCES ARTICLE("ID")
);