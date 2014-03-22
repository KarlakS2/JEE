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
                'Metal Gear Solid est un jeu dinfiltration sorti sur PlayStation. Dans cet opus, Solid Snake doit infiltrer Shadow Moses, une base militaire en Alaska, afin de sauver des otages. Le joueur trouve tout au long de laventure de nouvelles armes et nouveaux �quipements tout en alternant dialogues, s�quences dinfiltration et combats contre les boss. Le sc�nario hollywoodien alli� � de nombreuses cin�matiques en font un jeu tr�s cin�matographique.',
                'image/miniatureArticle/mgs1mini.jpg',
                'playstation'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('TEKKEN',
                44,
                'Tekken est un jeu de combat sur Playstation qui propose diff�rents personnages poss�dant tous un style de combat diff�rent du jeet kune do au karat� en passant par le muay thai. C�t� modes de jeu on retrouve l''Arcade, l''Histoire, le Contre-la-montre, le mode Survie ainsi que deux nouveaux totalement in�dits, le Tekken Force mode et le combat en �quipe. Vous avez aussi la possibilit� daffronter un ami via le mode Versus.',
                'image/miniatureArticle/tekkenmini.jpg',
                'playstation'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Final Fantasy IX',
                149,
                'Final Fantasy IX est un jeu de r�le sur Playstation. Neuvi�me volet de la s�rie, il se distingue de ses pr�d�cesseurs par de nouveaux graphismes plus jolis, des cin�matiques � couper le souffle et un univers pittoresque. Parcourez le vaste monde du titre pour d�couvrir une histoire riche en rebondissements et en magie.',
                'image/miniatureArticle/ffixmini.jpg',
                'playstation'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Crash Bandicoot',
                80,
                'Crash Bandicoot sur Playstation est un jeu de plates-formes dans lequel vous incarnez un animal peu commun et compl�tement loufoque. L''ami Crash, c''est son petit nom, va devoir traverser 32 niveaux r�partis en trois �les pour lutter contre l''inf�me Dr Neo Cortex. Affrontez les ennemis en tournoyant sur vous-m�me comme une toupie et ramassez les diamants de chaque tableau.',
                'image/miniatureArticle/bandicootmini.jpg',
                'playstation'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Metal Gear Solid 2',
                51,
                'MGS2 : Sons of Liberty est un jeu dinfiltration/action sorti sur PS2. Dans cet opus le joueur incarne Snake puis Raiden dans une lutte contre la prolif�ration du Metal Gear. Equip� de divers armes et gadgets, il doit sinfiltrer pour arriver au but, mais libre � lui dutiliser la mani�re forte. Sencha�nent alors phases dinfiltration, daction, de boss. Le sc�nario dense comte de nombreuses cin�matiques pour un jeu tr�s proche du 7�me art.',
                'image/miniatureArticle/mgs2mini.jpg',
                'playstation 2'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Kingdom Hearts',
                70,
                'Kingdom Hearts sur Playstation 2 est un jeu de r�le/action qui se d�roule dans un univers o� fusionnent Square Enix et Disney. Vous incarnez Sora, un jeune gar�on, accompagn� de Donald et Dingo, � la recherche de votre amie enlev�e ainsi que du roi Mickey. Pour cela, vous allez traverser une multitude de niveaux reprenant les classiques de Walt Disney et les succ�s de Squaresoft, dont Final Fantasy.',
                'image/miniatureArticle/kingdommini.jpg',
                'playstation 2'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Kingdom Hearts 2',
                20,
                'Kingdom Hearts II sur PS2 fait suite au premier opus et garde l''ambiance action/aventure de son pr�d�cesseur. Incarnez Roxas et Sora, toujours accompagn� de Donald et Dingo et levez le myst�re sur l''Organisation XIII et la disparition du roi Mickey. Rencontrez les personnages des dessins anim�s de Walt Disney et des jeux de Squaresoft (notamment Final Fantasy) dans une aventure pleine de po�sie.',
                'image/miniatureArticle/kingdom2mini.jpg',
                'playstation 2'
                );
INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Final Fantasy X',
                55,
                'Final Fantasy X est un jeu de r�le sorti sur Playstation 2. Le monde de Spira vit dans la crainte d''une entit� mal�fique nomm�e Sin. Vous incarnez une �quipe men�e par le jeune Tidus dans une qu�te pour lib�rer la terre de l''oppression, uniquement possible au prix d''une invocation finale...',
                'image/miniatureArticle/ffxmini.jpg',
                'playstation 2'
                );
INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Final Fantasy X-2',
                60,
                'Final Fantasy X-2 est un jeu de r�le sur PS2 dans lequel vous �voluez dans un sc�nario sous forme de missions. Alors que le monde de Spira est en plein bouleversements, vous allez devoir faire face � de nouveaux dangers. Suite de Final Fantasy X, d�couvrez les myst�res qui se cachent derri�re l''histoire de Yuna.',
                'image/miniatureArticle/ffx2mini.jpg',
                'playstation 2'
                );
INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Grand Theft Auto San Andreas',
                12,
                'GTA : San Andreas sur PS2 est un jeu d''action dans lequel vous dirigez Carl Johnson, une petite frappe revenue dans sa ville natale. Vous d�couvrez que la dure loi des gangs r�gne et il vous faut vous cr�er un nom et une r�putation pour gagner en respect. La zone de jeu est immense et se compose de trois grandes villes pour accomplir des missions. Meurtres, corruption, vols, trahison... Trouvez votre place � Los Santos !',
                'image/miniatureArticle/gtasamini.jpg',
                'playstation 2'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Metal Gear Solid 3',
                51,
                'MGS3 sorti sur PS2 se d�roule avant les autres �pisodes de la saga. Sur fond de guerre froide, le joueur y incarne Naked Snake et doit infiltrer le territoire russe pour rapatrier un scientifique. Explorant la jungle, les montagnes et autres complexes militaires, Snake a � sa disposition tout un panel darmes et de gadgets. Outre ces phases dinfiltration/action, le travail et la pr�sence des sc�naristes rel�vent des plus grandes montures hollywoodiennes.',
                'image/miniatureArticle/mgs3mini.jpg',
                'playstation 2'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Metal Gear Solid 4',
                51,
                'Quatri�me �pisode de la saga Metal Gear Solid, Guns of the Patriots reprend sur PS3 les m�canismes des anciens opus en m�langeant action et infiltration. R�pondant � toutes les questions laiss�es en suspens, cet ultime segment fait une fois de plus la part belle aux cin�matiques hollywoodiennes mettant en avant un casting haut de gamme.',
                'image/miniatureArticle/mgs3mini.jpg',
                'playstation 3'
                );


 INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Heavy Rain',
                19,
                'Heavy Rain sur Playstation 3 est un jeu d''aventure. Vous incarnez 4 personnages diff�rents ayant tous un lien avec le tueur � l''Origami. Chacun tente d''enqu�ter sur l''identit� du criminel. Le jeu se pr�sente sous la forme de phases d''exploration et d''actions durant lesquelles le joueur doit r�aliser des actions contextuelles pour effectuer ses actions. Le titre autorise un choix cons�quent d''actions ce qui permet quasiment d''agir dans le jeu comme dans la r�alit�.',
                'image/miniatureArticle/heavyrainmini.jpg',
                'playstation 3'
                );

 INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Grand Theft Auto V',
                37,
                'Dans Grand Theft Auto V sur PS3, jeu en monde ouvert, le joueur encha�ne braquages et missions en incarnant alternativement ou simultan�ment 3 personnages pour la premi�re fois dans l''histoire de la s�rie : Michael, Trevor et Franklin. L''histoire se passe � Los Santos, l''une des villes de la r�gion de San Andreas. Le jeu propose aussi un mode multijoueur en univers persistant pouvant accueillir jusqu''� 16 utilisateurs dans des modes coop�ratifs ou comp�titifs.',
                'image/miniatureArticle/gtavmini.jpg',
                'playstation 3'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Watch Dogs',
                60,
                'Watch Dogs est un jeu d''action � la troisi�me personne sur PS4. Dans un univers moderne et ouvert o� tout est connect� � un syst�me de contr�le central appartenant � des soci�t�s priv�es, le joueur incarne un groupe de hackeurs et d''assassins capables de manipuler et de pirater les syst�mes �lectroniques.',
                'image/miniatureArticle/watchdogmini.jpg',
                'playstation 4'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Metal Gear Solid V',
                20,
                'MGS V - Ground Zeroes sur PlayStation 4 est le prologue de The Phantom Pain. Le titre est vendu s�par�ment et plonge le joueur dans l''introduction du 5�me �pisode de la saga. En plus de la mission principale sc�naris�e, on retrouve 5 missions annexes visant � faire d�couvrir aux joueurs les subtilit�s du gameplay.',
                'image/miniatureArticle/mgs5mini.jpg',
                'playstation 4'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Titanfall',
                46,
                'Titanfall sur Xbox One est un FPS multijoueur mettant en sc�ne l''affrontement entre de puissants mechas et une infanterie lourdement arm�e dans un univers science-fiction. Les joueurs peuvent � tout moment b�n�ficier de l�appuie de leur propre titan ou "au sol" en profitant d''un gameplay ax� parkour ultra-dynamique.',
                'image/miniatureArticle/titalfall.jpg',
                'Xbox One'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Plantes contre Zombies : Garden Warfare',
                25,
                'Plantes contre Zombies : Garden Warfare est un jeu de tir � la premi�re personne disponible sur Xbox 360. Le joueur y choisit son camp (les plantes ou les zombies) et s''engage dans des combats d�lirants et dr�les pouvant m�ler jusqu''� 24 personnes.',
                'image/miniatureArticle/plantvszombimini.jpg',
                'Xbox 360'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Halo',
                50,
                'Halo sur Xbox est un jeu de tir � la premi�re personne dont l''action se d�roule dans un contexte futuriste. Confront�e � une alliance extraterrestre d�termin�e � l''�radiquer, l''humanit� lance dans la bataille le dernier repr�sentant d''une section de soldats g�n�tiquement modifi�s : le Master Chief. Contraint de prendre la fuite apr�s une d�faite, un petit contingent d''humains, accompagn� du Master Chief, �choue sur un �trange monde artificiel en forme d''anneau..',
                'image/miniatureArticle/halomini.jpg',
                'Xbox'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('ZombiU',
                12,
                'ZombiU est un jeu de tir � la premi�re personne sur Wii U. Dans une ambiance survival-horror, le joueur est un des rares rescap�s d''une infection qui transforme les gens en zombie. A chaque mort, un changement de personnage s''op�re. L''ancien avatar maintenant devenu un infect� peut ainsi �tre crois� dans les rues de Londres, cadre de l''aventure. Le GamePad est utilis� pour diverses fonctions : comme un radar, un sonar ou encore comme inventaire.',
                'image/miniatureArticle/zombiumini.jpg',
                'Wii U'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Wii Sport Resort',
                25,
                'Wii Sports Resort sur Wii est une nouvelle version du jeu vendu traditionnellement avec la console. Une s�rie de nouveaux challenges vous attendent, utilisant pour certains le WiiMotion Plus, offrant plus de pr�cision pour les mouvements de la manette. Le cadre est cette fois une �le paradisiaque, sur laquelle vous allez pouvoir vous frotter au jet-ski, � de l''escrime ou encore � envoyer valser un freesbee pour que votre toutou virtuel le rattrape et vous le ram�ne.',
                'image/miniatureArticle/wiisportresortmini.jpg',
                'Wii'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Sonic Heroes',
                50,
                'Sonic Heroes est un jeu de plates-formes 3D disponible sur Gamecube. Cette fois-ci, Sonic ne pourra pas sauver le monde � lui seul. Rejoignez les �quipes de Sonic, mais aussi la team dark, la team rose et la team chaotix. Chaque groupe est compos� de trois personnages ayant chacun leur caract�ristique propre, r�partie en force, vitesse et vol. Il faudra les utiliser � bon escient pour terminer les niveaux.',
                'image/miniatureArticle/sonicmini.jpg',
                'GameCube'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Final Fantasy VI',
                500,
                'Final Fantasy VI sur Super Nintendo marque un tournant dans la saga des Final Fantasy avec son c�t� plus sombre et tragique que pr�c�dents volets. 1000 ans apr�s une guerre terrible, la magie a presque enti�rement disparu au profit de la technologie Magitek qui donne � l''Empire le plein pouvoir sur le Monde. Les Returners, un groupe de rebelles men� par le h�ros Lock tente de se dresser devant la puissance de l''Empire.',
                'image/miniatureArticle/ffvimini.jpg',
                'Super NES'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('The Legend of Zelda : Majora''s Mask',
                44,
                'The Legend of Zelda : Majora''s Mask est un jeu d''aventure/action sur Nintendo 64. Link se voit d�poss�d� de son Ocarina par un myst�rieux personnage du nom de Skull Kid. Ce dernier lui a aussi d�rob� le masque de Majora, une relique ancestrale maudite. Y a-t-il encore un moyen d''emp�cher l''apocalypse ? Heureusement, oui ! Il vous faudra "simplement" reprendre possession du masque en l''espace de trois jours, avant que la com�te n''entre en collision avec le monde de Termina.',
                'image/miniatureArticle/zeldamini.jpg',
                'Nintendo 64'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Super Mario Bros',
                8,
                'Super Mario Bros. sur Nes est un jeu de plates-formes mettant en sc�ne le d�sormais c�l�bre plombier � moustache et salopette rouge. Traversez de nombreux niveaux, sautez sur vos ennemis pour les �liminer, ramassez des champignons pour grandir et des fleurs pour cracher du feu. Affrontez le m�chant Bowser et ses sbires afin de d�livrer la d�licieuse princesse Peach.',
                'image/miniatureArticle/mariomini.jpg',
                'NES'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Mario Kart 7',
                34,
                'Mario Kart 7 est un jeu de courses sur Nintendo 3DS. Dans la continuit� de la s�rie, le titre propose des courses folles o� l''utilisation d''objets a une grande importance. Gr�ce au nouveau deltaplane, un tas de raccourcis s''offrent au joueur. Mario Kart 7 dispose aussi d''un mode multi local ou en ligne.',
                'image/miniatureArticle/mariokartmini.jpg',
                '3DS'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Professeur Layton et l''Etrange Village',
                30,
                'Professeur Layton et l''Etrange Village est un jeu d''aventure et de r�flexion sur Nintendo DS. Bas� sur une histoire de meurtre bizarre, le c�l�bre professeur va devoir trouver la cl� de l''�nigme, mais pas seulement de celle-ci. Les habitants de St Myst�re adorent poser des �nigmes, � tel point que la moindre conversation anodine peut donner lieu � des puzzles, parfois �vidents, parfois nettement plus ardus.',
                'image/miniatureArticle/laytonmini.jpg',
                'DS'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Advance Wars',
                80,
                'Advance Wars est un jeu de strat�gie tactique sorti sur Gameboy Advance. Celui-ci se joue au tour par tour. Choisissez votre g�n�ral avec ses capacit�s diff�rentes puis b�tissez une arm�e afin d''an�antir vos adversaires.',
                'image/miniatureArticle/advancemini.jpg',
                'GameBoy Advance'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Pokemon Rouge',
                255,
                'Pok�mon Rouge est un jeu de r�le sorti sur Gameboy. Dirigez un dresseur de Pok�mons qui doit devenir le meilleur d''entre tous. Pour cela, capturez des cr�atures et faites-les �voluer pour qu''elles deviennent de plus en plus fortes et qu''elles puissent remporter la ligue Pok�mon.',
                'image/miniatureArticle/pokerougemini.jpg',
                'GameBoy'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Pokemon Cristal',
                15,
                'Pok�mon Version Cristal est un jeu de r�le sorti sur Gameboy. Dirigez un dresseur de Pok�mons qui doit devenir le meilleur d''entre tous. Pour cela, capturez des cr�atures et faites-les �voluer pour qu''elles deviennent de plus en plus fortes afin de battre la ligue Pok�mon.',
                'image/miniatureArticle/cristalmini.jpg',
                'GameBoy Color'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Pokemon Bleu',
                255,
                'Pok�mon Bleu est un jeu de r�le sorti sur Gameboy. Dirigez un dresseur de Pok�mons qui doit devenir le meilleur d''entre tous. Pour cela, capturez des cr�atures et faites-les �voluer pour qu''elles deviennent de plus en plus fortes et qu''elles puissent remporter la ligue Pok�mon.',
                'image/miniatureArticle/pokebleumini.jpg',
                'GameBoy'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Tetris',
                999,
                'Tetris sur Gameboy est le c�l�bre puzzle-game dans lequel vous devez empiler des briques afin de constituer des lignes qui s''effaceront au fur et � mesure de votre progression. La difficult� augmente au fil de votre avanc�e.',
                'image/miniatureArticle/tetrismini.jpg',
                'GameBoy'
                );

INSERT  INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE,CATEGORIE) 
        VALUES ('Warcraft III Reign of Chaos',
                10,
                'Warcraft III : Reign of Chaos est un jeu de strat�gie sur PC qui oppose 4 factions : les morts vivants, les elfes de la nuit, les humains et les orcs. A la t�te de chaque arm�e vous poss�dez 3 h�ros au maximum que vous pouvez faire �voluer au fur et � mesure de votre p�riple. Ces h�ros permettent d''utiliser diff�rents sorts qui peuvent sensiblement am�liorer vos chances de victoire sur le champ de bataille. Le titre permet de jouer jusqu''� 12 joueurs en ligne ou en r�seau local.',
                'image/miniatureArticle/w3mini.jpg',
                'PC'
                );