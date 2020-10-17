-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: kidsgerman
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.17.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `fos_user`
--

DROP TABLE IF EXISTS `fos_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fos_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `street` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `streetNumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_957A6479C05FB297` (`confirmation_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fos_user`
--

LOCK TABLES `fos_user` WRITE;
/*!40000 ALTER TABLE `fos_user` DISABLE KEYS */;
INSERT INTO `fos_user` VALUES (1,'sacha','sacha','pierre.koerber@gmail.com','pierre.koerber@gmail.com',0,NULL,'password',NULL,NULL,NULL,'a:0:{}','Sacha','Körber','Route des Rappes','56','1921','Martigny-Croix',NULL,'079 948 25 48',0,0);
/*!40000 ALTER TABLE `fos_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson`
--

DROP TABLE IF EXISTS `lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `translation` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson`
--

LOCK TABLES `lesson` WRITE;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
INSERT INTO `lesson` VALUES (1,'Mensch, Familie','L\'homme, la famille'),(2,'Gesellschafsleben','Relations sociales'),(3,'Max der Grüne','Max le vert'),(4,'Zahlen','Compter'),(5,'1. Darf ich ... ? Danke','1. Puis-je ... ? Merci'),(6,'2. In der Sonnenstrasse 13','2. Dans la rue Sonnenstrasse 13'),(7,'3. Ich spiele gern...','3. J\'aime jouer'),(8,'4. Buch, Heft, Kuli','4. Livre, cahier, stylo'),(9,'7. Hund, Katze, Hamster',NULL),(10,'2019-01 Es ist schon halb acht !','2019-01 Il est déjà sept heure et demie'),(11,'2019-02 Um halb fünf habe ich Zeit','2019-02 A quatre heure et demie j\'ai du temps'),(12,'lecon3',NULL),(13,'1. Das ist Deutsch','1. C\'est l\'allemand'),(14,'2. Guten Tag, guten Abend','2. Bonjour, bonsoir');
/*!40000 ALTER TABLE `lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `name`
--

DROP TABLE IF EXISTS `name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `name` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `plural` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lesson_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5E237E06CDF80196` (`lesson_id`),
  CONSTRAINT `FK_5E237E06CDF80196` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=399 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `name`
--

LOCK TABLES `name` WRITE;
/*!40000 ALTER TABLE `name` DISABLE KEYS */;
INSERT INTO `name` VALUES (1,'der','Mensch','en,en','l\'homme (sens général)','nom',1),(2,NULL,'menschlich',NULL,'humain','adjectif',1),(3,'die','Leute',NULL,'les gens','nom',1),(4,'die','Menge','n','la foule','nom',1),(5,'die','Person','en','la personne','nom',1),(6,NULL,'persönlich',NULL,'personnel','adjectif',1),(7,NULL,'privat',NULL,'privé','adjectif',1),(8,'der','Herr','n, en','le monsieur, le seigneur','nom',1),(9,'die','Dame','n','la dame','nom',1),(10,NULL,'männlich',NULL,'masculin, viril','adjectif',1),(11,'die','Frau','en','la femme, l\'épouse','nom',1),(12,'die','Hausfrau','en','la maîtresse de maison, la ménagère','nom',1),(13,NULL,'weiblich',NULL,'féminin','adjectif',1),(14,'das','Fräulein','-','la demoiselle','nom',1),(15,'das','Mädchen','-','la jeune fille, la fillette','nom',1),(16,'das','Kind','er','l\'enfant','nom',1),(17,NULL,'treffen, trifft, traf, hat getroffen',NULL,'rencontrer, atteindre','verbe',2),(18,'der','Kerl','e','le gars, le gaillard','nom',1),(19,NULL,'erwachsen',NULL,'adulte','adjectif',1),(20,'die','Erwachsenen',NULL,'les adultes','nom',1),(21,NULL,'wer',NULL,'qui','préposition',1),(22,NULL,'jemand',NULL,'quelqu\'un','préposition indéfinie',1),(23,NULL,'jemand anders',NULL,'quelqu\'un d\'autre','préposition indéfinie',1),(24,NULL,'niemand',NULL,'ne...personne','préposition indéfinie',1),(25,NULL,'niemand anders',NULL,'personne d\'autre','préposition indéfinie',1),(26,NULL,'man',NULL,'on','pronom indéfini',1),(27,NULL,'selber',NULL,'soi-même','pronom',1),(28,NULL,'heissen, heisst, hiess, hat geheissen',NULL,'s\'appeler','verbe',1),(29,NULL,'nennent, nennt, nannte, hat genannt',NULL,'nommer, appeler, dire','verbe',1),(30,'der','Name','ns, n','le nom','nom',1),(31,'der','Vorname','ns, n','le prénom','nom',1),(32,NULL,'heiraten',NULL,'épouser','verbe',1),(33,NULL,'verheiratet',NULL,'marié','verbe',1),(34,'die','Familie','n','la famille','nom',1),(35,NULL,'erziehen, erzieht, erzog, hat erzogen',NULL,'éduquer','verbe',1),(36,'die','Eltern',NULL,'les parents','nom',1),(37,'die','Mutter','¨,-','la mère','nom',1),(38,'der','Vater','¨,-','le père','nom',1),(39,'die','Grossmutter','¨,-','la grand-mère','nom',1),(40,'der','Grossvater','¨,-','le grand-père','nom',1),(41,'die','Tochter','¨,-','la fille','nom',1),(42,'der','Sohn','¨,e','le fils','nom',1),(45,NULL,'jetzt',NULL,'maintenant','préposition',3),(46,'das','Wort','¨,er','le mot','nom',3),(47,NULL,'finden',NULL,'trouver','verbe',3),(48,NULL,'zu zweit',NULL,'pour deux','nom',3),(49,NULL,'später',NULL,'plus tard','adverbe',3),(50,NULL,'malen',NULL,'peindre','verbe',3),(51,NULL,'spielen',NULL,'jouer','verbe',3),(52,NULL,'noch einmal',NULL,'encore une fois','expression',3),(53,'das','Satz','¨,e','la phrase','nom',3),(54,'das','Klassenplakat',NULL,'l\'affiche de classe','nom',3),(55,'die','Arbeitbuch',NULL,'le classeur','nom',3),(56,'die','Ahnung',NULL,'l\'idée','nom',3),(57,'das','Kind','er','l\'enfant','nom',3),(58,NULL,'fragen',NULL,'demander','verber',5),(59,NULL,'bitten, ich bitte',NULL,'prier (de faire quelque chose)','verbe',5),(60,NULL,'in der Klasse',NULL,'en classe','expression',5),(61,NULL,'Hört zu',NULL,'Ecoutez','verbe',5),(62,NULL,'Seht die Bilder an',NULL,'Regardez les images','verbe',5),(63,NULL,'das Bild','die Bilder','l\'image','nom',5),(64,NULL,'Lest laut',NULL,'Lisez à haute voix','expression',5),(65,NULL,'laut',NULL,'à voix haut, fort','expression',5),(66,'der','Dialog','die Dialoge','le dialogue','nom',5),(67,'die','Situation','die Situationen','la situation','nom',5),(68,NULL,'Entschuldigung...',NULL,'Excusez-moi, pardon','expression',5),(69,NULL,'Darf ich..., bitte',NULL,'Est-ce que je peux, s\'il vous plaît ?','expression',5),(70,NULL,'Darf ich auf die Toilette, bitte ?',NULL,'Est-ce que je peux aller aux toilettes ?','expression',5),(71,'die','Toilette',NULL,'les toilettes','nom',5),(72,NULL,'Ja, natürlich',NULL,'Oui, bien sûr','expression',5),(73,NULL,'Darf ich nach Hause ?',NULL,'Est-ce que je peux rentrer à la maison ?','expression',5),(74,NULL,'Nein, jetzt nicht',NULL,'Non, pas maintenant','expression',5),(75,NULL,'Noch einmal bitte !',NULL,'Encore une fois, s\'il vous plaît !','expression',5),(76,'die','Übung','die Übungen','l\'exercice','nom',5),(77,'die','Hausaufgaben','die Hausaufgaben','le devoir à la maison','nom',5),(78,NULL,'Also',NULL,'Alors','préposition',5),(79,NULL,'Wie bitte ?',NULL,'Comment ? Pardon ?','expression',5),(80,NULL,'Ach so !',NULL,'Ah bon !','exp',5),(81,'','O.k.',NULL,'OK','expression',5),(82,'','Wie heisst das auf Deutsch ?',NULL,'Comment dit-on cela en allemand ?','expression',5),(83,'','Das heisst ...',NULL,'On dit... / Ca se dit...','expression',5),(84,'','Ich weiss nicht.',NULL,'Je ne sais pas.','expression',5),(85,'','Keine Ahnung !',NULL,'Aucune idée !','expression',5),(86,'das','Heft','die Hefte','le cahier','nom',5),(87,'','Frage-Antwort-Spiele',NULL,'des jeux de questions-réponses','expression',5),(88,'','üben',NULL,'s\'exercer, s\'entraîner','verbe',5),(89,'die','Seite','die Seiten','la page','nom',5),(90,'','in kleinen Gruppen',NULL,'en petits groupes','expression',5),(91,'','das Fenster öffnen',NULL,'ouvrir la fenêtre','expression',5),(92,'das','Fenster','die Fendster','la fenêtre','nom',5),(93,'','öffnen',NULL,'ouvrir','verbe',5),(94,'der','Papierkorb','die Papierkörbe','la corbeille à papier','nom',5),(95,'','Wie fragt ihr ?',NULL,'Comment demandez-vous ?','expression',5),(96,'','Wie antwortet ihr ?',NULL,'Comment réponsez-vous ?','expression',5),(97,'','antworten',NULL,'répondre','verbe',5),(98,'','unsere Klassensprache',NULL,'notre langage en classe','expression',5),(99,'die','Klassenspache',NULL,'le langage en classe','nom',5),(100,'das','Klassenzimmer',NULL,'la salle de classe','nom',5),(101,'','Macht ein Plakat',NULL,'Faites un poster','expression',5),(102,'','Hängt es auf.',NULL,'Accrochez-le','expression',5),(103,'die','Einladung','die Einladungen','l\'invitation','nom',6),(104,'','Lest dein Texte.',NULL,'Lisez le texte','expression',6),(105,'','Was macht Samuel ?',NULL,'Que fait Samuel ?','expression',6),(106,'','machen','ich mache','faire','verbe',6),(107,'die','Party','Partys','la party, la soirée, la fête','nom',6),(108,'','zu meiner Party',NULL,'à ma fête','expression',6),(109,'die','Zahl','Zahlen','le nombre','nom',6),(110,'','von... bis...',NULL,'de... à...','préposition',6),(111,'','dreinzehn',NULL,'treize','nom',6),(112,'','vierzehn',NULL,'quatorze','nom',6),(113,'','fünfzehn',NULL,'quinze','nom',6),(114,'','sechzehn',NULL,'seize','nom',6),(115,'','siebzehn',NULL,'dix-sept','nom',6),(116,'','achtzehn',NULL,'dix-huit','nom',6),(117,'','neunzehn',NULL,'dix-neuf','nom',6),(118,'das','Kind','Kinder','l\'enfant','nom',6),(119,'','Notiert im Heft.',NULL,'Notez dans votre cahier.','expression',6),(120,'','Wer wohnt wo ?',NULL,'Qui habite où ?','expression',6),(121,'die','Aufgabe','Aufgaben','l\'activité, l\'exercice','nom',6),(122,'','Er wohnt in der Sonnenstrasse 13.',NULL,'Il habite au numéro 13 de la rue du soleil.','expression',6),(123,'','zwanzig',NULL,'vingt','nom',6),(124,'','einundzwanzig',NULL,'vingt-et-un','nom',6),(125,'','zweiundzwanzig',NULL,'vingt-deux','nom',6),(126,'','dreiundzwanzig',NULL,'vingt-trois','nom',6),(127,'','vierundzwanzig',NULL,'vingt-quatre','nom',6),(128,'','fünfundzwanzig',NULL,'vingt-cinq','nom',6),(129,'','Wie geht es weiter ?',NULL,'Comment est-ce que cela continue ?','expression',6),(130,'','Sprecht die Zahlen laut.',NULL,'Dites les nombres à voix haute.','expression',6),(131,'','Sprecht nach.',NULL,'Répétez.','expression',6),(132,'','zwanzig',NULL,'vingt','nom',6),(133,'','dreissig',NULL,'trente','nom',6),(134,'','vierzig',NULL,'quarante','nom',6),(135,'','fünfzig',NULL,'cinquante','nom',6),(136,'','sechzig',NULL,'soixante','nom',6),(137,'','achtzig',NULL,'huitante, quatre-vingt','nom',6),(138,'','siebzig',NULL,'septante','nom',6),(139,'','neunzig',NULL,'nonante','nom',6),(140,'','achtundartzig',NULL,'huitante-huit','nom',6),(141,'','hundert, einhundert',NULL,'cent, cent-un','nom',6),(142,'','So geht es weiter...',NULL,'Voilà comment cela continue.','expression',6),(143,'','einunddreissig',NULL,'trente et un','nom',6),(144,'','Macht einen Kreis.',NULL,'Formez un cercle.','expression',6),(145,'','Spielt wie im Beispiel.',NULL,'Jouez comme dans l\'exemple.','expression',6),(146,'','So frage ich ?',NULL,'Je demande comme cela.','expression',6),(147,'','Wo wohnst du ?',NULL,'Où habites-tu ?','expression',6),(148,'','Wie ist deine Adresse ?',NULL,'Quelle est ton adresse ?','expression',6),(149,'die','Adresse','die Adressen','l\'adresse','nom',6),(150,'','So antworte ich:',NULL,'Je réponds comme cela :','expression',6),(151,'','(Ich wohne) in der Sonnenstrasse 13.',NULL,'(J\'habite) à la Sonnenstrasse, au numéro 13.','expression',6),(152,'','Sonnenstrasse 13',NULL,'Sonnenstrasse numér 13.','nom',6),(153,'','Und die Hausnummer ?',NULL,'Et le numéro ?','expression',6),(154,'die','Hausnummer','die Hausnummern','le numéro de la maison','nom',6),(155,'das','Haus','die Haüser','la maison','nom',6),(156,'die','Nummer','die Nummern','le numéro','nom',6),(157,'','hunderteinundzwanzig',NULL,'cent vingt et un','nom',6),(158,'','Wer wohnt in der Mozartstrasse ?',NULL,'Qui habite à la Mozartstrasse ?','expression',6),(159,'','in der gleichen Strasse',NULL,'dans la même rue','expression',6),(160,'','auch',NULL,'aussi','préposition',6),(161,'','in anderen Sprachen',NULL,'dans d\'autres langues','expression',6),(162,'','Fragt Eltern und Freunde.',NULL,'Demandez à vos parents ou amis.','expression',6),(163,'der','Rechenspass',NULL,'le plaisir de calculer','nom',6),(164,'die','Rechenaufgabe','die Rechenaufgaben','l\'exercice de calcul','nom',6),(165,'das','Ergebnis','die Ergebnisse','le résultat','nom',6),(166,'','Wie alt seid ihr ?',NULL,'Quel âge avez-vous ?','expression',6),(167,'','zusammen',NULL,'ensemble','expression',6),(168,'der','Steckbrief','die Steckbriefe','la fiche signalétique','nom',6),(169,'','Welche Zahlen ..?',NULL,'Quels nombres ... ?','expression',6),(170,'','Kreuze an.',NULL,'Coche.','expression',6),(171,'','Wechselt ab.',NULL,'Alternez, changer de rôle.','expression',6),(172,'der','Zahlenrap','die Zahlenraps','le rap des nombres','nom',6),(173,'das','Kästchen','die Kästchen','la case','nom',6),(174,'die','Person','die Personen','la personne','nom',6),(175,'die','Stadt','die Städte','la ville','nom',6),(176,'die','Information','die Informationen','l\'information','nom',6),(177,'','die richtige Antwort',NULL,'la bonne réponse','expression',6),(178,'die','Antwort','die Antworten','la réponse','nom',6),(179,'','schon',NULL,'déjà','préposition',6),(180,'','Ich besuche ihn gern',NULL,'J\'aime lui rendre visite.','expression',6),(181,'','Wir telefonieren viel.',NULL,'Nous nous téléphonons beaucoup.','expression',6),(182,'','telefronieren','ich telefoniere','téléphoner','verbe',6),(183,'','viel',NULL,'beaucoup','préposition',6),(184,'','Morgen besucht er uns.',NULL,'Demain, il vient nous voir.','expression',6),(185,'','Das ist schöne.',NULL,'C\'est bien ! c\'est beau.','expression',6),(186,'','Sprecht über Opa Hans.',NULL,'Parlez du grand-papa Hans.','expression',6),(187,'','Beanstwortet die Fragen.',NULL,'Répondez aux questions.','expression',6),(189,'die','Anmeldung',NULL,'l\'inscription','nom',7),(190,'','für',NULL,'pour','préposition indéfinie',7),(191,'die','Ferienfreizeit',NULL,'les loisirs de vacances','nom',7),(192,'die','Ferien',NULL,'les vacances','nom',7),(193,'','Was macht Peter gern ?',NULL,'Qu\'est-ce que Peter aime faire ?','expression',7),(194,'','Zeigt auf die Bilder.',NULL,'Montrez les images.','expression',7),(195,'','Fussball spielen',NULL,'jouer au foot','expression',7),(196,'','Ich spiele Fussball.',NULL,'Je joue au foot.','expression',7),(197,'','spielen','ich spiele, er spielt','jouer','verbe',7),(198,'','lesen','ich lese, er liest','lire','verbe',7),(199,'','malen','ich malen, er malt','peindre','verbe',7),(200,'','Musik hören','ich höre, er hört','écouter de la musique','verbe',7),(201,'','schwimmen','ich schwimme, er schwimmt','nager','verbe',7),(202,'die','Sache','die Sachen','la chose','nom',8),(203,'','Was ist denn hier los ?',NULL,'Qu\'est-ce se passe donc ici ?','expression',8),(204,'der','Bleistift','die Bleistifte','le crayon gris','nom',8),(205,'der','Farbstift','die Farbstifte','le crayon de couleur','nom',8),(206,'der','Kleber','-','la colle','nom',8),(207,'der','Kuli','die Kulis','le stylo','nom',8),(208,'der','Radiergummi','die Radiergummis','la gomme','nom',8),(209,'der','Rucksack','die Rucksäcke','le sac à dos','nom',8),(210,'der','Spitzer','die Spitzer','le taille-crayon','nom',8),(211,'das','Buch','die Bücher','le livre','nom',8),(212,'das','Heft','die Hefte','le cahier','nom',8),(213,'das','Federmäppchen','die Federmäppchen','l\'étui (la trousse)','nom',8),(214,'das','Lineal','die Lineale','la règle','nom',8),(215,'die','Brille','die Brillen','les lunettes','nom',8),(216,'die','Fahrkarte','die Fahrkarten','les billet (de bus ou de train)','nom',8),(217,'die','Mappe','die Mappen','la chemise','nom',8),(218,'die','Schere','die Scheren','les ciseaux','nom',8),(219,'die','Schultasche','die Schultaschen','le cartable, le sac d\'école','nom',8),(220,'die','Uhr','die Uhren','la montre','nom',8),(221,'','Sammelt an der Tafel.',NULL,'Rassemblez (les mots) au tableau.','expression',8),(222,'','Wem gehört der Bleischtift ?',NULL,'A qui appartient le crayon ?','expression',8),(223,'','Wem gehört das Buch ?',NULL,'A qui appartient le livre ?','expression',8),(224,'','Wem gehört die Schultasche ?',NULL,'A qui appartient le cartable ?','expression',8),(225,'','Der Bleischtift gehört Geri.',NULL,'Le crayon appartient à Geri.','expression',8),(226,'','Lern Nomen immer mit der, das, die.',NULL,'Apprends toujours les noms avec der, das, die.','expression',8),(227,'','lernen','ich lerne','apprendre','verbe',8),(228,'','Ah, das ist wie im Glossar.',NULL,'Ah, c\'est comme dans le glossaire !','expression',8),(229,'das','Glossar','die Glossare','le glossaire','nom',8),(230,'die','Lernkarte','die Lernkarten','la fiche d\'apprentissage','nom',8),(231,'','Tauscht dann die Rollen.',NULL,'Changez ensuite de rôle.','expression',8),(232,'die','Schulsachen',NULL,'les affaires d\'école','nom',8),(233,'','Suche die Wörter zu den Bildern.',NULL,'Cherche les mots correspondant aux images.','expression',8),(234,'','... was im Ruchsackt ist.',NULL,'... ce qui est dans le sac à dos.','expression',8),(235,'','Ordne die Nomen zu.',NULL,'Relie les noms.','expression',8),(236,'','Ihr kennt andere Nomen.',NULL,'Vous connaissez d\'autre noms.','expression',8),(237,'','Arbeitet mit eurem Glossar.',NULL,'Travaillez avec votre glossaire.','expression',8),(238,'','vier passende Wörter',NULL,'quatre mots qui conviennent','expression',8),(239,'die','Pantomime','die Pantomimen','le pantomime','nom',8),(240,'','singen','ich singe, er singt','chanter','verbe',7),(241,'der','Fussball',NULL,'le foot, le ballon de foot','nom',7),(245,'das','sacha sacha sacha sacha sacha sacha sacha','sachassssss','sacha sacha','expression',6),(246,'','suchen',NULL,'chercher','verbe',9),(247,'das','Hundebaby','die Hundebabys','le bébé chien','nom',9),(249,'','total',NULL,'totalement','expression',9),(250,'','lieb',NULL,'gentil-le, sage','adjectif',9),(251,'','süss',NULL,'mignon-ne','adjectif',9),(252,'der','Kopf',NULL,'la tête','nom',9),(253,'die','Schnauze',NULL,'la gueule','nom',9),(254,'der','Schwanz',NULL,'la queue','nom',9),(255,'das','Fell',NULL,'le poil, le pelage','nom',9),(256,'die','Pfote','die Pfoten','la patte','nom',9),(257,'','sein Kopf',NULL,'sa tête','expression',9),(258,'','seine Schnauze',NULL,'sa gueule','expression',9),(259,'','ganz schwarz',NULL,'tout noir','expression',9),(260,'','ganz',NULL,'tout entier','expression',9),(261,'','weich',NULL,'doux','adjectif',9),(262,'','Hilfe',NULL,'au secours, à l\'aide','nom',9),(263,'das','Thema','die Themen','le thème, le sujet','nom',9),(264,'','Er ist bei ...',NULL,'Il est chez ...','expression',9),(265,'','Wie geht die Geschichte weiter ?',NULL,'Comment l\'histoire continue-t-elle ?','expression',9),(266,'das','Ende',NULL,'la fin','nom',9),(267,'das','Haustier','die Haustiere','l\'animal domestique','nom',9),(268,'der','Fisch','die Fische','le poisson','nom',9),(269,'der','Hamster','die','le hamster','nom',9),(270,'das','Kaninchen','die Kaninchen','le lapin','nom',9),(271,'das','Meerschweinchen','die Meerschweinchen','le cochon d\'Inde','nom',9),(272,'die','Schildkröte','die Schildkröten','la tortue','nom',9),(273,'','allein oder alle zu zusammen',NULL,'seul ou tous ensemble','expression',9),(274,'','langsam',NULL,'lentement','adjectif',9),(275,'','leise',NULL,'à voix basse','adjectif',9),(276,'','Welches Tier ist das ?',NULL,'De quel animal s\'agit-il ?','expression',9),(277,'das','Tier','die Tiere','l\'animal','nom',9),(278,'','Bring ein Foto mit.',NULL,'Apporte une photo.','expression',9),(279,'','mitbringen',NULL,'apporter','verbe',9),(280,'','Das ist leicht !',NULL,'C\'est facile !','expression',9),(281,'','sacha',NULL,'sacha','nom',8),(282,'','Die Ferien sind vorbei.',NULL,'Les vacances sont finies.','expression',10),(283,'die','Ferien',NULL,'Les vacances','nom',10),(284,'der','Dialog','-e','le dialogue','nom',10),(285,'','aufstehen',NULL,'se lever','verbe',10),(287,'die','Schule','-n','l\'école','nom',10),(288,'','oh je,...',NULL,'oh là là...','expression',10),(289,'','Wie spät is es ?',NULL,'Quelle heure est-il ?','expression',10),(290,'','schnell',NULL,'vite','expression',10),(291,'','Der Bus färht um halb acht.',NULL,'Le bus part à sept heures et demie.','expression',10),(292,'der','Bus','Busse','le bus','nom',10),(293,'','Seht die Bilder an.',NULL,'Regardez les images.','expression',10),(294,'','Die anderen raten.',NULL,'Les autres devinent.','expression',10),(295,'','Zu welchen Gesichtern passt der Dialog ?',NULL,'A quels visages le dialogue correspond-il ?','expression',10),(296,'die','Uhr','-en','l\'horloge, la montre','nom',10),(297,'','Wie viele Minuten hat Sara Zeit ?',NULL,'Combien de minutes Sara a-t-elle ?','expression',10),(298,'die','Zeit',NULL,'le temps','nom',10),(299,'','noch',NULL,'encore','adverbe',10),(300,'das','Foto','-s','la photo','nom',10),(301,'','einen Moment',NULL,'un moment','expression',10),(302,'','jetzt',NULL,'maintenant','adverbe',10),(303,'','halb eins',NULL,'midi et demi','expression',10),(304,'','vergleicht die Uhrzeit',NULL,'comparez l\'heure','expression',10),(305,'die','Uhrzeit','-en','l\'heure','nom',10),(306,'','Es ist 8 Uhr.',NULL,'Il est 8 heures.','expression',10),(307,'','es ist',NULL,'il est','expression',10),(308,'','8 Uhr',NULL,'8 heures','expression',10),(309,'','5 nach 8',NULL,'8 heures 5','expression',10),(310,'','viertel nach 8',NULL,'8 heures et quart','expression',10),(311,'','halb 9',NULL,'8 heures et demie','expression',10),(312,'','viertel vor 9',NULL,'9 heures moints quart','expression',10),(313,'','5 vor 9',NULL,'9 heures moins 5','expression',10),(314,'die','Reihe','-n','la rangée','nom',10),(315,'','wer ?',NULL,'qui ?','pronom',10),(316,'','am schnellsten',NULL,'le plus rapidement','expression',10),(317,'','ohne Fehler',NULL,'sans faute','expression',10),(318,'','zu zweit',NULL,'à deux','expression',10),(319,'','zur Kontrolle',NULL,'pour contrôler','expression',10),(320,'','digital',NULL,'numérique','adjectif',10),(321,'die','Nachricht','-en','l\'information, le message, la nouvelle','nom',10),(322,'','notiert im Heft',NULL,'notez  dans le cahier','expression',10),(323,'','so',NULL,'comme cela','conjonction',10),(324,'','sammelt Beispiele',NULL,'rassemblez des exemples','expression',10),(325,'','Schreibe die Namen unter die Städte.',NULL,'Ecris les nom sous les villes.','expression',10),(326,'','Zeichne die Uhrzeiten ein.',NULL,'Inscris les heures.','expression',10),(327,'die','Recherche','-n','la recherche','nom',10),(328,'','Uhrzeit systematisch',NULL,'l\'heure de manière systèmatique','expression',10),(329,'','Ordne die Uhrzeiten. Was kommt zuerst, was dann ?',NULL,'Mets les heures dans l\'ordre. Qu\'est-ce qui vient d\'abord, qu\'est qui vient ensuite ?','expression',10),(330,'','Wie heisst das Lösungswort ? an des richtigen Stelle',NULL,'Quel est le mot-réponse ? au bon endroit','expression',10),(331,'','können','ich kann, du könnst','pouvoir','verbe',11),(332,'','wie viel',NULL,'combien','adverbe',11),(333,'','etwas',NULL,'quelque chose','pronom',11),(334,'','passieren',NULL,'se passer','verbe',11),(335,'','wie lange',NULL,'combien de temps','expression',11),(336,'','dauern',NULL,'durer','verbe',11),(337,'','wann ?',NULL,'quand ?','adverbe',11),(338,'','Für wen hat Mario Zeit ?',NULL,'Pour qui Mario a-t-il du temps ?','expression',11),(339,'','Hier ist Bernd.',NULL,'Ici Bernd.','expression',11),(340,'','Hast du Zeit ?',NULL,'As-tu du temps ?','expression',11),(341,'','Zeit haben',NULL,'avoir le temps','expression',11),(342,'','heute',NULL,'aujoud\'hui','nom',11),(343,'der','Gitarrenunterricht',NULL,'le cours de guitare','nom',11),(344,'','sorry',NULL,'désolé','expression',11),(345,'','ok',NULL,'d\'accord','expression',11),(346,'','Hi !',NULL,'Salut !','expression',11),(347,'','das geht schnell',NULL,'cela va vite','expression',11),(348,'die','Szene','-n','la scène','nom',11),(349,'','Volleyball spielen',NULL,'jouer au volleyball','expression',11),(350,'das','Fussballtraining',NULL,'l\'entraînement de foot','nom',11),(351,'','Wann hast du Schule ?',NULL,'Quand vas-tu à l\'école ?','expression',11),(352,'','um zwei',NULL,'a deux heures','expression',11),(353,'','um zwei Uhr',NULL,'a deux heures','expression',11),(354,'','um',NULL,'à','préposition',11),(355,'','keine Zeit',NULL,'pas le temps','expression',11),(356,'','Katja hat Stress.',NULL,'Katja est stressée.','expression',11),(357,'','Es gibt Abendessen.',NULL,'C\'est le souper.','expression',11),(358,'die','Aktivität','-en','l\'activité','nom',11),(359,'','Wie lange dauert der Film ?',NULL,'Combien de temps dure le film ?','expression',11),(360,'','Wie lange ... ?',NULL,'Combien de temps ... ?','expression',11),(361,'der','Film','-e','le film','nom',11),(362,'','ins Kino gehen',NULL,'aller au cinéma','expression',11),(363,'die','Stunde','-n','l\'heure','nom',11),(364,'die','Minute','-n','la minute','nom',11),(365,'die','Deutschstunde','-n','le cours d\'allemand','nom',11),(366,'die','Pause','-n','la pause, la récréation','nom',11),(368,'das','Birchermüesli',NULL,'le bircher','nom',13),(369,'das','Bonbon',NULL,'le bonbon','nom',13),(370,'die','Butter',NULL,'le beurre','nom',13),(371,'der','Joghurt',NULL,'le yogourt','nom',13),(372,'der','Käse',NULL,'le fromage','nom',13),(373,'die','Konfitüre',NULL,'la confiture','nom',13),(374,'die','Limonade',NULL,'la limonade','nom',13),(375,'die','Milch',NULL,'le lait','nom',13),(376,'das','Müesli',NULL,'le muesli, les céréales','nom',13),(377,'der','Orangesaft',NULL,'le jus d\'orange','nom',13),(378,'die','Schokolade',NULL,'le chocolat','nom',13),(379,'der','Tee',NULL,'le thé','nom',13),(380,'der','Klebstift',NULL,'le baton de colle','nom',13),(381,'das','Shampoo',NULL,'le shampoing','nom',13),(382,'die','Zahnpasta',NULL,'le dentifrice','nom',13),(383,'','ich möchte...',NULL,'j\'aimerai...','expression',13),(384,'','Bitte',NULL,'s\'il vous plaît','expression',13),(385,'','Hier bitte',NULL,'Voilà je vous en prie','expression',13),(386,'','danke',NULL,'merci','expression',13),(387,'','Guten Morgen',NULL,'Bonjour','expression',14),(388,'','Guten Abend',NULL,'bonsoir','expression',14),(389,'','Guten Tag !',NULL,'bonjour','expression',14),(390,'','Guten Morgen Fau Meier.',NULL,'Bonjour Madame Meier.','expression',14),(391,'','Guten Abend, Herr Kaiser',NULL,'Bonsoir Monsieur Kaiser','expression',14),(392,'','Auf Widersehen !',NULL,'au revoir','expression',14),(393,'','Tschüs !',NULL,'Ciao','expression',14),(394,'','Tschau',NULL,'Ciao, salut','expression',14),(395,'','Ciao',NULL,'Salut ciao','expression',14),(396,'','ja, nein',NULL,'oui, non','expression',14),(397,'','Tut mir leid !',NULL,'Je regrette, je suis désolé','expression',14),(398,'','Kein Problem !',NULL,'Pas de problème !','nom',14);
/*!40000 ALTER TABLE `name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sentence`
--

DROP TABLE IF EXISTS `sentence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sentence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `translation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `word_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9D664ED5E357438D` (`word_id`),
  CONSTRAINT `FK_9D664ED5E357438D` FOREIGN KEY (`word_id`) REFERENCES `name` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sentence`
--

LOCK TABLES `sentence` WRITE;
/*!40000 ALTER TABLE `sentence` DISABLE KEYS */;
INSERT INTO `sentence` VALUES (1,'Ich erblickte ihn in der Menge.','Je l\'ai aperçu dans la foule.',4),(2,'Ich habe ihn gestern auf der Strasse getroffen.','Je l\'ai rencontré hier dans la rue.',17),(3,'Wir treffen uns morgen um 5 Uhr.','Nous nous retrouvons demain à 5 heures.',17),(4,'Ein Stein traf ihn am Kopf.','Une pierre l\'a atteint à la tête.',17),(5,'Haben Sie jemand gesehen ?','Avez-vous vu quelqu\'un ?',22),(6,'Ich will das selber machen.','Je veux faire cela moi-même.',27),(7,'Wie heisst eigentlich dieser Herr ?','Au fait, comment s\'appelle ce monsieur ?',28),(8,'Wie wollt ihr das Kind nennen ?','Comment voulez-vous appeler l\'enfant ?',29),(9,'Er nannte seinen Namen.','Il dit son nom.',29),(10,'Wie ist Ihr Name, bitte ?','Puis-je vous demander votre nom ?',30),(11,'Sie heiratet einen Ausländer.','Elle épouse un étranger.',32),(12,'Sie haben im Juni geheiratet.','Ils se sont mariés en juin.',32),(13,'Er war damals noch nicht verheiratet.','Alors, il n\'était pas encore marié.',33);
/*!40000 ALTER TABLE `sentence` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-17  7:43:55
