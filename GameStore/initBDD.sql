DROP TABLE "ADMIN";
DROP TABLE "COMMANDE";
DROP TABLE "ARTICLE";
DROP TABLE "CATEGORIE";
DROP TABLE "CLIENT";


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

INSERT INTO ADMIN(IDENTIFIANT,MDP,MAIL)
        VALUES ('admin','admin','admin@mail.fr');


INSERT INTO CATEGORIE(NOM) VALUES ('PC');
INSERT INTO CATEGORIE(NOM) VALUES ('Playstation 4');
INSERT INTO CATEGORIE(NOM) VALUES ('Playstation 3');
INSERT INTO CATEGORIE(NOM) VALUES ('Playstation 2');
INSERT INTO CATEGORIE(NOM) VALUES ('Playstation');
INSERT INTO CATEGORIE(NOM) VALUES ('Xbox One');
INSERT INTO CATEGORIE(NOM) VALUES ('Xbox 360');
INSERT INTO CATEGORIE(NOM) VALUES ('Xbox');
INSERT INTO CATEGORIE(NOM) VALUES ('Wii U');
INSERT INTO CATEGORIE(NOM) VALUES ('Wii');
INSERT INTO CATEGORIE(NOM) VALUES ('GameCube');
INSERT INTO CATEGORIE(NOM) VALUES ('Nintendo 64');
INSERT INTO CATEGORIE(NOM) VALUES ('Super NES');
INSERT INTO CATEGORIE(NOM) VALUES ('NES');
INSERT INTO CATEGORIE(NOM) VALUES ('3DS');
INSERT INTO CATEGORIE(NOM) VALUES ('DS');
INSERT INTO CATEGORIE(NOM) VALUES ('GameBoy Advance');
INSERT INTO CATEGORIE(NOM) VALUES ('GameBoy Color');
INSERT INTO CATEGORIE(NOM) VALUES ('GameBoy');

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Metal Gear Solid',
                42,
                'Metal Gear Solid est un jeu dinfiltration sorti sur PlayStation. Dans cet opus, Solid Snake doit infiltrer Shadow Moses, une base militaire en Alaska, afin de sauver des otages. Le joueur trouve tout au long de laventure de nouvelles armes et nouveaux équipements tout en alternant dialogues, séquences dinfiltration et combats contre les boss. Le scénario hollywoodien allié à de nombreuses cinématiques en font un jeu très cinématographique.',
                'image/miniatureArticle/mgs1mini.jpg',
                'playstation'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('TEKKEN',
                44,
                'Tekken est un jeu de combat sur Playstation qui propose différents personnages possédant tous un style de combat différent du jeet kune do au karaté en passant par le muay thai. Côté modes de jeu on retrouve l''Arcade, l''Histoire, le Contre-la-montre, le mode Survie ainsi que deux nouveaux totalement inédits, le Tekken Force mode et le combat en équipe. Vous avez aussi la possibilité daffronter un ami via le mode Versus.',
                'image/miniatureArticle/tekkenmini.jpg',
                'playstation'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Final Fantasy IX',
                149,
                'Final Fantasy IX est un jeu de rôle sur Playstation. Neuvième volet de la série, il se distingue de ses prédécesseurs par de nouveaux graphismes plus jolis, des cinématiques à couper le souffle et un univers pittoresque. Parcourez le vaste monde du titre pour découvrir une histoire riche en rebondissements et en magie.',
                'image/miniatureArticle/ffixmini.jpg',
                'playstation'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Crash Bandicoot',
                80,
                'Crash Bandicoot sur Playstation est un jeu de plates-formes dans lequel vous incarnez un animal peu commun et complètement loufoque. L''ami Crash, c''est son petit nom, va devoir traverser 32 niveaux répartis en trois îles pour lutter contre l''infâme Dr Neo Cortex. Affrontez les ennemis en tournoyant sur vous-même comme une toupie et ramassez les diamants de chaque tableau.',
                'image/miniatureArticle/bandicootmini.jpg',
                'playstation'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Metal Gear Solid 2',
                51,
                'MGS2 : Sons of Liberty est un jeu dinfiltration/action sorti sur PS2. Dans cet opus le joueur incarne Snake puis Raiden dans une lutte contre la prolifération du Metal Gear. Equipé de divers armes et gadgets, il doit sinfiltrer pour arriver au but, mais libre à lui dutiliser la manière forte. Senchaînent alors phases dinfiltration, daction, de boss. Le scénario dense comte de nombreuses cinématiques pour un jeu très proche du 7ème art.',
                'image/miniatureArticle/mgs2mini.jpg',
                'playstation 2'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Kingdom Hearts',
                70,
                'Kingdom Hearts sur Playstation 2 est un jeu de rôle/action qui se déroule dans un univers où fusionnent Square Enix et Disney. Vous incarnez Sora, un jeune garçon, accompagné de Donald et Dingo, à la recherche de votre amie enlevée ainsi que du roi Mickey. Pour cela, vous allez traverser une multitude de niveaux reprenant les classiques de Walt Disney et les succès de Squaresoft, dont Final Fantasy.',
                'image/miniatureArticle/kingdommini.jpg',
                'playstation 2'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Kingdom Hearts 2',
                20,
                'Kingdom Hearts II sur PS2 fait suite au premier opus et garde l''ambiance action/aventure de son prédécesseur. Incarnez Roxas et Sora, toujours accompagné de Donald et Dingo et levez le mystère sur l''Organisation XIII et la disparition du roi Mickey. Rencontrez les personnages des dessins animés de Walt Disney et des jeux de Squaresoft (notamment Final Fantasy) dans une aventure pleine de poésie.',
                'image/miniatureArticle/kingdom2mini.jpg',
                'playstation 2'
                );
INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Final Fantasy X',
                55,
                'Final Fantasy X est un jeu de rôle sorti sur Playstation 2. Le monde de Spira vit dans la crainte d''une entité maléfique nommée Sin. Vous incarnez une équipe menée par le jeune Tidus dans une quête pour libérer la terre de l''oppression, uniquement possible au prix d''une invocation finale...',
                'image/miniatureArticle/ffxmini.jpg',
                'playstation 2'
                );
INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Final Fantasy X-2',
                60,
                'Final Fantasy X-2 est un jeu de rôle sur PS2 dans lequel vous évoluez dans un scénario sous forme de missions. Alors que le monde de Spira est en plein bouleversements, vous allez devoir faire face à de nouveaux dangers. Suite de Final Fantasy X, découvrez les mystères qui se cachent derrière l''histoire de Yuna.',
                'image/miniatureArticle/ffx2mini.jpg',
                'playstation 2'
                );
INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Grand Theft Auto San Andreas',
                12,
                'GTA : San Andreas sur PS2 est un jeu d''action dans lequel vous dirigez Carl Johnson, une petite frappe revenue dans sa ville natale. Vous découvrez que la dure loi des gangs règne et il vous faut vous créer un nom et une réputation pour gagner en respect. La zone de jeu est immense et se compose de trois grandes villes pour accomplir des missions. Meurtres, corruption, vols, trahison... Trouvez votre place à Los Santos !',
                'image/miniatureArticle/gtasamini.jpg',
                'playstation 2'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Metal Gear Solid 3',
                51,
                'MGS3 sorti sur PS2 se déroule avant les autres épisodes de la saga. Sur fond de guerre froide, le joueur y incarne Naked Snake et doit infiltrer le territoire russe pour rapatrier un scientifique. Explorant la jungle, les montagnes et autres complexes militaires, Snake a à sa disposition tout un panel darmes et de gadgets. Outre ces phases dinfiltration/action, le travail et la présence des scénaristes relèvent des plus grandes montures hollywoodiennes.',
                'image/miniatureArticle/mgs3mini.jpg',
                'playstation 2'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Metal Gear Solid 4',
                51,
                'Quatrième épisode de la saga Metal Gear Solid, Guns of the Patriots reprend sur PS3 les mécanismes des anciens opus en mélangeant action et infiltration. Répondant à toutes les questions laissées en suspens, cet ultime segment fait une fois de plus la part belle aux cinématiques hollywoodiennes mettant en avant un casting haut de gamme.',
                'image/miniatureArticle/mgs3mini.jpg',
                'playstation 3'
                );


 INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Heavy Rain',
                19,
                'Heavy Rain sur Playstation 3 est un jeu d''aventure. Vous incarnez 4 personnages différents ayant tous un lien avec le tueur à l''Origami. Chacun tente d''enquêter sur l''identité du criminel. Le jeu se présente sous la forme de phases d''exploration et d''actions durant lesquelles le joueur doit réaliser des actions contextuelles pour effectuer ses actions. Le titre autorise un choix conséquent d''actions ce qui permet quasiment d''agir dans le jeu comme dans la réalité.',
                'image/miniatureArticle/heavyrainmini.jpg',
                'playstation 3'
                );

 INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Grand Theft Auto V',
                37,
                'Dans Grand Theft Auto V sur PS3, jeu en monde ouvert, le joueur enchaîne braquages et missions en incarnant alternativement ou simultanément 3 personnages pour la première fois dans l''histoire de la série : Michael, Trevor et Franklin. L''histoire se passe à Los Santos, l''une des villes de la région de San Andreas. Le jeu propose aussi un mode multijoueur en univers persistant pouvant accueillir jusqu''à 16 utilisateurs dans des modes coopératifs ou compétitifs.',
                'image/miniatureArticle/gtavmini.jpg',
                'playstation 3'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Watch Dogs',
                60,
                'Watch Dogs est un jeu d''action à la troisième personne sur PS4. Dans un univers moderne et ouvert où tout est connecté à un système de contrôle central appartenant à des sociétés privées, le joueur incarne un groupe de hackeurs et d''assassins capables de manipuler et de pirater les systèmes électroniques.',
                'image/miniatureArticle/watchdogmini.jpg',
                'playstation 4'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Metal Gear Solid V',
                20,
                'MGS V - Ground Zeroes sur PlayStation 4 est le prologue de The Phantom Pain. Le titre est vendu séparément et plonge le joueur dans l''introduction du 5ème épisode de la saga. En plus de la mission principale scénarisée, on retrouve 5 missions annexes visant à faire découvrir aux joueurs les subtilités du gameplay.',
                'image/miniatureArticle/mgs5mini.jpg',
                'playstation 4'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Titanfall',
                46,
                'Titanfall sur Xbox One est un FPS multijoueur mettant en scène l''affrontement entre de puissants mechas et une infanterie lourdement armée dans un univers science-fiction. Les joueurs peuvent à tout moment bénéficier de l’appuie de leur propre titan ou "au sol" en profitant d''un gameplay axé parkour ultra-dynamique.',
                'image/miniatureArticle/titalfall.jpg',
                'Xbox One'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Plantes contre Zombies : Garden Warfare',
                25,
                'Plantes contre Zombies : Garden Warfare est un jeu de tir à la première personne disponible sur Xbox 360. Le joueur y choisit son camp (les plantes ou les zombies) et s''engage dans des combats délirants et drôles pouvant mêler jusqu''à 24 personnes.',
                'image/miniatureArticle/plantvszombimini.jpg',
                'Xbox 360'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Halo',
                50,
                'Halo sur Xbox est un jeu de tir à la première personne dont l''action se déroule dans un contexte futuriste. Confrontée à une alliance extraterrestre déterminée à l''éradiquer, l''humanité lance dans la bataille le dernier représentant d''une section de soldats génétiquement modifiés : le Master Chief. Contraint de prendre la fuite après une défaite, un petit contingent d''humains, accompagné du Master Chief, échoue sur un étrange monde artificiel en forme d''anneau..',
                'image/miniatureArticle/halomini.jpg',
                'Xbox'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('ZombiU',
                12,
                'ZombiU est un jeu de tir à la première personne sur Wii U. Dans une ambiance survival-horror, le joueur est un des rares rescapés d''une infection qui transforme les gens en zombie. A chaque mort, un changement de personnage s''opère. L''ancien avatar maintenant devenu un infecté peut ainsi être croisé dans les rues de Londres, cadre de l''aventure. Le GamePad est utilisé pour diverses fonctions : comme un radar, un sonar ou encore comme inventaire.',
                'image/miniatureArticle/zombiumini.jpg',
                'Wii U'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Wii Sport Resort',
                25,
                'Wii Sports Resort sur Wii est une nouvelle version du jeu vendu traditionnellement avec la console. Une série de nouveaux challenges vous attendent, utilisant pour certains le WiiMotion Plus, offrant plus de précision pour les mouvements de la manette. Le cadre est cette fois une île paradisiaque, sur laquelle vous allez pouvoir vous frotter au jet-ski, à de l''escrime ou encore à envoyer valser un freesbee pour que votre toutou virtuel le rattrape et vous le ramène.',
                'image/miniatureArticle/wiisportresortmini.jpg',
                'Wii'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Sonic Heroes',
                50,
                'Sonic Heroes est un jeu de plates-formes 3D disponible sur Gamecube. Cette fois-ci, Sonic ne pourra pas sauver le monde à lui seul. Rejoignez les équipes de Sonic, mais aussi la team dark, la team rose et la team chaotix. Chaque groupe est composé de trois personnages ayant chacun leur caractéristique propre, répartie en force, vitesse et vol. Il faudra les utiliser à bon escient pour terminer les niveaux.',
                'image/miniatureArticle/sonicmini.jpg',
                'GameCube'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Final Fantasy VI',
                500,
                'Final Fantasy VI sur Super Nintendo marque un tournant dans la saga des Final Fantasy avec son côté plus sombre et tragique que précédents volets. 1000 ans après une guerre terrible, la magie a presque entièrement disparu au profit de la technologie Magitek qui donne à l''Empire le plein pouvoir sur le Monde. Les Returners, un groupe de rebelles mené par le héros Lock tente de se dresser devant la puissance de l''Empire.',
                'image/miniatureArticle/ffvimini.jpg',
                'Super NES'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('The Legend of Zelda : Majora''s Mask',
                44,
                'The Legend of Zelda : Majora''s Mask est un jeu d''aventure/action sur Nintendo 64. Link se voit dépossédé de son Ocarina par un mystérieux personnage du nom de Skull Kid. Ce dernier lui a aussi dérobé le masque de Majora, une relique ancestrale maudite. Y a-t-il encore un moyen d''empêcher l''apocalypse ? Heureusement, oui ! Il vous faudra "simplement" reprendre possession du masque en l''espace de trois jours, avant que la comète n''entre en collision avec le monde de Termina.',
                'image/miniatureArticle/zeldamini.jpg',
                'Nintendo 64'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Super Mario Bros',
                8,
                'Super Mario Bros. sur Nes est un jeu de plates-formes mettant en scène le désormais célèbre plombier à moustache et salopette rouge. Traversez de nombreux niveaux, sautez sur vos ennemis pour les éliminer, ramassez des champignons pour grandir et des fleurs pour cracher du feu. Affrontez le méchant Bowser et ses sbires afin de délivrer la délicieuse princesse Peach.',
                'image/miniatureArticle/mariomini.jpg',
                'NES'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Mario Kart 7',
                34,
                'Mario Kart 7 est un jeu de courses sur Nintendo 3DS. Dans la continuité de la série, le titre propose des courses folles où l''utilisation d''objets a une grande importance. Grâce au nouveau deltaplane, un tas de raccourcis s''offrent au joueur. Mario Kart 7 dispose aussi d''un mode multi local ou en ligne.',
                'image/miniatureArticle/mariokartmini.jpg',
                '3DS'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Professeur Layton et l''Etrange Village',
                30,
                'Professeur Layton et l''Etrange Village est un jeu d''aventure et de réflexion sur Nintendo DS. Basé sur une histoire de meurtre bizarre, le célèbre professeur va devoir trouver la clé de l''énigme, mais pas seulement de celle-ci. Les habitants de St Mystère adorent poser des énigmes, à tel point que la moindre conversation anodine peut donner lieu à des puzzles, parfois évidents, parfois nettement plus ardus.',
                'image/miniatureArticle/laytonmini.jpg',
                'DS'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Advance Wars',
                80,
                'Advance Wars est un jeu de stratégie tactique sorti sur Gameboy Advance. Celui-ci se joue au tour par tour. Choisissez votre général avec ses capacités différentes puis bâtissez une armée afin d''anéantir vos adversaires.',
                'image/miniatureArticle/advancemini.jpg',
                'GameBoy Advance'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Pokemon Rouge',
                255,
                'Pokémon Rouge est un jeu de rôle sorti sur Gameboy. Dirigez un dresseur de Pokémons qui doit devenir le meilleur d''entre tous. Pour cela, capturez des créatures et faites-les évoluer pour qu''elles deviennent de plus en plus fortes et qu''elles puissent remporter la ligue Pokémon.',
                'image/miniatureArticle/pokerougemini.jpg',
                'GameBoy'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Pokemon Cristal',
                15,
                'Pokémon Version Cristal est un jeu de rôle sorti sur Gameboy. Dirigez un dresseur de Pokémons qui doit devenir le meilleur d''entre tous. Pour cela, capturez des créatures et faites-les évoluer pour qu''elles deviennent de plus en plus fortes afin de battre la ligue Pokémon.',
                'image/miniatureArticle/cristalmini.jpg',
                'GameBoy Color'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Pokemon Bleu',
                255,
                'Pokémon Bleu est un jeu de rôle sorti sur Gameboy. Dirigez un dresseur de Pokémons qui doit devenir le meilleur d''entre tous. Pour cela, capturez des créatures et faites-les évoluer pour qu''elles deviennent de plus en plus fortes et qu''elles puissent remporter la ligue Pokémon.',
                'image/miniatureArticle/pokebleumini.jpg',
                'GameBoy'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Tetris',
                999,
                'Tetris sur Gameboy est le célèbre puzzle-game dans lequel vous devez empiler des briques afin de constituer des lignes qui s''effaceront au fur et à mesure de votre progression. La difficulté augmente au fil de votre avancée.',
                'image/miniatureArticle/tetrismini.jpg',
                'GameBoy'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Warcraft III Reign of Chaos',
                10,
                'Warcraft III : Reign of Chaos est un jeu de stratégie sur PC qui oppose 4 factions : les morts vivants, les elfes de la nuit, les humains et les orcs. A la tête de chaque armée vous possédez 3 héros au maximum que vous pouvez faire évoluer au fur et à mesure de votre périple. Ces héros permettent d''utiliser différents sorts qui peuvent sensiblement améliorer vos chances de victoire sur le champ de bataille. Le titre permet de jouer jusqu''à 12 joueurs en ligne ou en réseau local.',
                'image/miniatureArticle/w3mini.jpg',
                'PC'
                );