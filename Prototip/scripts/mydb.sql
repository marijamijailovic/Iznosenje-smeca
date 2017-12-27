-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 27, 2017 at 04:47 PM
-- Server version: 10.1.26-MariaDB-0+deb9u1
-- PHP Version: 7.0.19-1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `AngazovaniRadnici`
--

CREATE TABLE `AngazovaniRadnici` (
  `Poslovi_Zahtev_idZahtev` int(11) NOT NULL,
  `Radnik_Zaposleni_idZaposleni` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `AngazovaniVozaci`
--

CREATE TABLE `AngazovaniVozaci` (
  `Poslovi_Zahtev_idZahtev` int(11) NOT NULL,
  `Vozac_Zaposleni_idZaposleni` int(11) NOT NULL,
  `Vozilo_idVozilo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Aukcija`
--

CREATE TABLE `Aukcija` (
  `Magacin_idArtikal` int(11) NOT NULL,
  `MenadzerProdaje_Zaposleni_idZaposleni` int(11) NOT NULL,
  `minCena` decimal(10,0) NOT NULL DEFAULT '0',
  `aukcijskaCena` varchar(45) NOT NULL DEFAULT '0',
  `Klijent_idKlijent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Aukcija`
--

INSERT INTO `Aukcija` (`Magacin_idArtikal`, `MenadzerProdaje_Zaposleni_idZaposleni`, `minCena`, `aukcijskaCena`, `Klijent_idKlijent`) VALUES
(1, 2, '20000', '20000', 1),
(2, 2, '15500', '15700', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Dispecer`
--

CREATE TABLE `Dispecer` (
  `Zaposleni_idZaposleni` int(11) NOT NULL,
  `aktivan` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Dispecer`
--

INSERT INTO `Dispecer` (`Zaposleni_idZaposleni`, `aktivan`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Klijent`
--

CREATE TABLE `Klijent` (
  `idKlijent` int(11) NOT NULL,
  `ime` varchar(45) NOT NULL,
  `prezime` varchar(45) NOT NULL,
  `adresa` varchar(45) NOT NULL,
  `brojTelefona` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Klijent`
--

INSERT INTO `Klijent` (`idKlijent`, `ime`, `prezime`, `adresa`, `brojTelefona`, `email`) VALUES
(1, 'Pera', 'Peric', 'Padinska skela 18', '0645896145', 'pera@gmail.com'),
(2, 'Mika', 'Mikic', 'kovilovo bb', '0645896145', 'mika@gmail.com'),
(3, 'Filip', 'Jovanovic', 'Ovca bb', '064875324', 'filipj@hotmail.com'),
(4, 'Lenka', 'Pavlovic', 'Padinska skela 18', '0117854125', 'lenka@hotmail.com'),
(5, 'Radoslav', 'Jaksic', 'Vladimirovci bb', '069875142', 'radoslavjaksic@morava.com');

-- --------------------------------------------------------

--
-- Table structure for table `Koordinator`
--

CREATE TABLE `Koordinator` (
  `Zaposleni_idZaposleni` int(11) NOT NULL,
  `TipOtpada_idTipOtpada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Magacin`
--

CREATE TABLE `Magacin` (
  `idArtikal` int(11) NOT NULL,
  `ime` varchar(20) NOT NULL,
  `opis` varchar(45) DEFAULT NULL,
  `Magacioner_Zaposleni_idZaposleni` int(11) NOT NULL,
  `kolicina` varchar(45) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Magacin`
--

INSERT INTO `Magacin` (`idArtikal`, `ime`, `opis`, `Magacioner_Zaposleni_idZaposleni`, `kolicina`) VALUES
(1, 'Laptop Toshiba', 'godina 2015, male ogrebotine, ocuvan', 2, '1'),
(2, 'Stampac HP', 'godina 2010, ocuvan ,koriscen 2 puta', 2, '1');

-- --------------------------------------------------------

--
-- Table structure for table `Magacioner`
--

CREATE TABLE `Magacioner` (
  `Zaposleni_idZaposleni` int(11) NOT NULL,
  `lokacijaMagacina` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Magacioner`
--

INSERT INTO `Magacioner` (`Zaposleni_idZaposleni`, `lokacijaMagacina`) VALUES
(2, 'podrum');

-- --------------------------------------------------------

--
-- Table structure for table `MenadzerProdaje`
--

CREATE TABLE `MenadzerProdaje` (
  `Zaposleni_idZaposleni` int(11) NOT NULL,
  `aktivan` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `MenadzerProdaje`
--

INSERT INTO `MenadzerProdaje` (`Zaposleni_idZaposleni`, `aktivan`) VALUES
(2, 0),
(3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Poslovi`
--

CREATE TABLE `Poslovi` (
  `Dispecer_Zaposleni_idZaposleni` int(11) NOT NULL,
  `Koordinator_Zaposleni_idZaposleni` int(11) NOT NULL,
  `Zahtev_idZahtev` int(11) NOT NULL,
  `odgovorKoordinatora` varchar(1000) DEFAULT NULL,
  `statusPosla` tinyint(1) NOT NULL DEFAULT '0',
  `datumPlaniranogZavrsetka` varchar(45) NOT NULL,
  `lokacijaDostaveOtpada` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Radnik`
--

CREATE TABLE `Radnik` (
  `Zaposleni_idZaposleni` int(11) NOT NULL,
  `zauzet` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Suspendovani`
--

CREATE TABLE `Suspendovani` (
  `Zaposleni_idZaposleni` int(11) NOT NULL,
  `Upravnik_Zaposleni_idZaposleni` int(11) NOT NULL,
  `razlog` varchar(500) DEFAULT NULL,
  `datumSuspendovanja` date NOT NULL,
  `datumIstekaSusp` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `Suspendovani`
--
DELIMITER $$
CREATE TRIGGER `Suspendovani_BEFORE_INSERT` BEFORE INSERT ON `Suspendovani` FOR EACH ROW BEGIN
	DECLARE msg VARCHAR(255);
	IF EXISTS(SELECT * 
			  FROM Upravnik u
			  WHERE u.Zaposleni_idZaposleni = new.Zaposleni_idZaposleni) 
		AND NOT new.Zaposleni_idZaposleni = new.Upravnik_Zaposleni_idZaposleni
	THEN
		SET msg='Greska: Ne mozete upravnik suspendovati drugog upravnika';
		SIGNAL sqlstate '45000' SET message_text= msg;
	END IF;
        
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `TipOtpada`
--

CREATE TABLE `TipOtpada` (
  `idTipOtpada` int(11) NOT NULL,
  `Ime` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TipOtpada`
--

INSERT INTO `TipOtpada` (`idTipOtpada`, `Ime`) VALUES
(0, 'opasan'),
(1, 'reciklazni'),
(2, 'kabasti'),
(3, 'elektricni'),
(4, 'gradjevin');

-- --------------------------------------------------------

--
-- Table structure for table `Upravnik`
--

CREATE TABLE `Upravnik` (
  `Zaposleni_idZaposleni` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Vozac`
--

CREATE TABLE `Vozac` (
  `Zaposleni_idZaposleni` int(11) NOT NULL,
  `godineIskustva` int(11) DEFAULT NULL,
  `zauzet` tinyint(1) NOT NULL DEFAULT '0',
  `vozackaDozvola` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Vozilo`
--

CREATE TABLE `Vozilo` (
  `idVozilo` int(11) NOT NULL,
  `zauzet` tinyint(1) NOT NULL DEFAULT '0',
  `tipVozila` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Zahtev`
--

CREATE TABLE `Zahtev` (
  `idZahtev` int(11) NOT NULL,
  `Dispecer_Zaposleni_idZaposleni` int(11) DEFAULT NULL,
  `tekstZahteva` varchar(1000) DEFAULT NULL,
  `ocekivanDatumIznosenja` date NOT NULL,
  `odgovorDispecera` varchar(1000) DEFAULT NULL,
  `lokacijaOtpada` varchar(20) NOT NULL,
  `MenadzerProdaje_Zaposleni_idZaposleni` int(11) DEFAULT NULL,
  `ProcenjenaVrednost` decimal(10,0) DEFAULT '0',
  `Klijent_idKlijent` int(11) NOT NULL,
  `TipOtpada_idTipOtpada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Zahtev`
--

INSERT INTO `Zahtev` (`idZahtev`, `Dispecer_Zaposleni_idZaposleni`, `tekstZahteva`, `ocekivanDatumIznosenja`, `odgovorDispecera`, `lokacijaOtpada`, `MenadzerProdaje_Zaposleni_idZaposleni`, `ProcenjenaVrednost`, `Klijent_idKlijent`, `TipOtpada_idTipOtpada`) VALUES
(1, 1, 'medicinski', '2017-12-20', 'neki odgovor', 'Padinska skela 18', NULL, '0', 1, 0),
(2, 1, 'Radioaktivne boce', '2017-12-03', 'neki odgovor', 'kovilovo bb', NULL, '0', 2, 0),
(3, 1, 'hemikalije ', '2017-05-08', 'neki odgovor', 'Ovca bb', NULL, '0', 3, 0),
(4, 1, 'Ormari, dvosedi, trosedi', '2017-05-07', 'zahtev je primljen na obradjivanje', 'Vladimirovci bb', NULL, '0', 5, 2);

--
-- Triggers `Zahtev`
--
DELIMITER $$
CREATE TRIGGER `Zahtev_BEFORE_INSERT` BEFORE INSERT ON `Zahtev` FOR EACH ROW BEGIN
	DECLARE msg VARCHAR(255);
    IF NOT EXISTS(SELECT *
				  FROM Dispecer d
                  WHERE d.Zaposleni_idZaposleni = new.Dispecer_Zaposleni_idZaposleni
                  AND d.aktivan = 0)
	THEN
		SET msg='Greska: Ovaj dispecer nije na duznosti!';
        SIGNAL sqlstate '45000' SET message_text= msg;
	END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Zahtev_BEFORE_UPDATE` BEFORE UPDATE ON `Zahtev` FOR EACH ROW BEGIN
	DECLARE msg VARCHAR(255);
    IF NOT EXISTS(SELECT *
				  FROM Dispecer d
                  WHERE d.Zaposleni_idZaposleni = new.Dispecer_Zaposleni_idZaposleni
                  AND d.aktivan = 0)
	THEN
		SET msg='Greska: Ovaj dispecer nije na duznosti!';
        SIGNAL sqlstate '45000' SET message_text= msg;
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ZahtevZaOdmorom`
--

CREATE TABLE `ZahtevZaOdmorom` (
  `Zaposleni_idZaposleni` int(11) NOT NULL,
  `Upravnik_Zaposleni_idZaposleni` int(11) NOT NULL,
  `DatumPocetka` date NOT NULL,
  `DatumZavrsetka` date NOT NULL,
  `razlog` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Zaposleni`
--

CREATE TABLE `Zaposleni` (
  `idZaposleni` int(11) NOT NULL,
  `ime` varchar(20) NOT NULL,
  `prezime` varchar(20) NOT NULL,
  `plata` varchar(45) NOT NULL,
  `brojRadnihDana` varchar(45) NOT NULL,
  `brojSlobodnihDana` varchar(45) NOT NULL,
  `datumZaposljavanja` varchar(45) NOT NULL,
  `sifra` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Zaposleni`
--

INSERT INTO `Zaposleni` (`idZaposleni`, `ime`, `prezime`, `plata`, `brojRadnihDana`, `brojSlobodnihDana`, `datumZaposljavanja`, `sifra`) VALUES
(1, 'zika', 'zikic', '25000', '125', '15', '2017-07-07', '1'),
(2, 'Dusan', 'Perovic', '25000', '752', '140', '2016-10-10', 'sifra2'),
(3, 'Marina', 'Jevtovic', '45000', '45', '5', '2017-10-10', 'sifra3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AngazovaniRadnici`
--
ALTER TABLE `AngazovaniRadnici`
  ADD PRIMARY KEY (`Poslovi_Zahtev_idZahtev`,`Radnik_Zaposleni_idZaposleni`),
  ADD KEY `fk_Poslovi_has_Radnik_Radnik1_idx` (`Radnik_Zaposleni_idZaposleni`),
  ADD KEY `fk_Poslovi_has_Radnik_Poslovi1_idx` (`Poslovi_Zahtev_idZahtev`);

--
-- Indexes for table `AngazovaniVozaci`
--
ALTER TABLE `AngazovaniVozaci`
  ADD PRIMARY KEY (`Poslovi_Zahtev_idZahtev`,`Vozac_Zaposleni_idZaposleni`),
  ADD KEY `fk_Poslovi_has_Vozac_Vozac1_idx` (`Vozac_Zaposleni_idZaposleni`),
  ADD KEY `fk_Poslovi_has_Vozac_Poslovi1_idx` (`Poslovi_Zahtev_idZahtev`),
  ADD KEY `fk_Poslovi_has_Vozac_Vozilo1_idx` (`Vozilo_idVozilo`);

--
-- Indexes for table `Aukcija`
--
ALTER TABLE `Aukcija`
  ADD PRIMARY KEY (`Magacin_idArtikal`),
  ADD KEY `fk_Aukcija_MenadzerProdaje1_idx` (`MenadzerProdaje_Zaposleni_idZaposleni`),
  ADD KEY `fk_Aukcija_Klijent1_idx` (`Klijent_idKlijent`);

--
-- Indexes for table `Dispecer`
--
ALTER TABLE `Dispecer`
  ADD PRIMARY KEY (`Zaposleni_idZaposleni`);

--
-- Indexes for table `Klijent`
--
ALTER TABLE `Klijent`
  ADD PRIMARY KEY (`idKlijent`);

--
-- Indexes for table `Koordinator`
--
ALTER TABLE `Koordinator`
  ADD PRIMARY KEY (`Zaposleni_idZaposleni`),
  ADD KEY `fk_Koordinator_TipOtpada1_idx` (`TipOtpada_idTipOtpada`);

--
-- Indexes for table `Magacin`
--
ALTER TABLE `Magacin`
  ADD PRIMARY KEY (`idArtikal`),
  ADD KEY `fk_Artikal_Magacioner1_idx` (`Magacioner_Zaposleni_idZaposleni`);

--
-- Indexes for table `Magacioner`
--
ALTER TABLE `Magacioner`
  ADD PRIMARY KEY (`Zaposleni_idZaposleni`);

--
-- Indexes for table `MenadzerProdaje`
--
ALTER TABLE `MenadzerProdaje`
  ADD PRIMARY KEY (`Zaposleni_idZaposleni`);

--
-- Indexes for table `Poslovi`
--
ALTER TABLE `Poslovi`
  ADD PRIMARY KEY (`Zahtev_idZahtev`),
  ADD KEY `fk_Dispecer_has_Koordinator_Koordinator1_idx` (`Koordinator_Zaposleni_idZaposleni`),
  ADD KEY `fk_Dispecer_has_Koordinator_Dispecer1_idx` (`Dispecer_Zaposleni_idZaposleni`),
  ADD KEY `fk_Poslovi_Zahtev1_idx` (`Zahtev_idZahtev`);

--
-- Indexes for table `Radnik`
--
ALTER TABLE `Radnik`
  ADD PRIMARY KEY (`Zaposleni_idZaposleni`);

--
-- Indexes for table `Suspendovani`
--
ALTER TABLE `Suspendovani`
  ADD PRIMARY KEY (`Zaposleni_idZaposleni`,`Upravnik_Zaposleni_idZaposleni`),
  ADD KEY `fk_table1_Upravnik1_idx` (`Upravnik_Zaposleni_idZaposleni`);

--
-- Indexes for table `TipOtpada`
--
ALTER TABLE `TipOtpada`
  ADD PRIMARY KEY (`idTipOtpada`);

--
-- Indexes for table `Upravnik`
--
ALTER TABLE `Upravnik`
  ADD PRIMARY KEY (`Zaposleni_idZaposleni`);

--
-- Indexes for table `Vozac`
--
ALTER TABLE `Vozac`
  ADD PRIMARY KEY (`Zaposleni_idZaposleni`);

--
-- Indexes for table `Vozilo`
--
ALTER TABLE `Vozilo`
  ADD PRIMARY KEY (`idVozilo`);

--
-- Indexes for table `Zahtev`
--
ALTER TABLE `Zahtev`
  ADD PRIMARY KEY (`idZahtev`,`Klijent_idKlijent`),
  ADD KEY `fk_Zahtev_Dispecer1_idx` (`Dispecer_Zaposleni_idZaposleni`),
  ADD KEY `fk_Zahtev_MenadzerProdaje1_idx` (`MenadzerProdaje_Zaposleni_idZaposleni`),
  ADD KEY `fk_Zahtev_Klijent1_idx` (`Klijent_idKlijent`),
  ADD KEY `fk_Zahtev_TipOtpada1_idx` (`TipOtpada_idTipOtpada`);

--
-- Indexes for table `ZahtevZaOdmorom`
--
ALTER TABLE `ZahtevZaOdmorom`
  ADD PRIMARY KEY (`Zaposleni_idZaposleni`,`Upravnik_Zaposleni_idZaposleni`),
  ADD KEY `fk_ZahtevZaOdmorom_Upravnik1_idx` (`Upravnik_Zaposleni_idZaposleni`);

--
-- Indexes for table `Zaposleni`
--
ALTER TABLE `Zaposleni`
  ADD PRIMARY KEY (`idZaposleni`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `AngazovaniRadnici`
--
ALTER TABLE `AngazovaniRadnici`
  ADD CONSTRAINT `fk_Poslovi_has_Radnik_Poslovi1` FOREIGN KEY (`Poslovi_Zahtev_idZahtev`) REFERENCES `Poslovi` (`Zahtev_idZahtev`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Poslovi_has_Radnik_Radnik1` FOREIGN KEY (`Radnik_Zaposleni_idZaposleni`) REFERENCES `Radnik` (`Zaposleni_idZaposleni`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `AngazovaniVozaci`
--
ALTER TABLE `AngazovaniVozaci`
  ADD CONSTRAINT `fk_Poslovi_has_Vozac_Poslovi1` FOREIGN KEY (`Poslovi_Zahtev_idZahtev`) REFERENCES `Poslovi` (`Zahtev_idZahtev`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Poslovi_has_Vozac_Vozac1` FOREIGN KEY (`Vozac_Zaposleni_idZaposleni`) REFERENCES `Vozac` (`Zaposleni_idZaposleni`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Poslovi_has_Vozac_Vozilo1` FOREIGN KEY (`Vozilo_idVozilo`) REFERENCES `Vozilo` (`idVozilo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Aukcija`
--
ALTER TABLE `Aukcija`
  ADD CONSTRAINT `fk_Aukcija_Klijent1` FOREIGN KEY (`Klijent_idKlijent`) REFERENCES `Klijent` (`idKlijent`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Aukcija_Magacin1` FOREIGN KEY (`Magacin_idArtikal`) REFERENCES `Magacin` (`idArtikal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Aukcija_MenadzerProdaje1` FOREIGN KEY (`MenadzerProdaje_Zaposleni_idZaposleni`) REFERENCES `MenadzerProdaje` (`Zaposleni_idZaposleni`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Dispecer`
--
ALTER TABLE `Dispecer`
  ADD CONSTRAINT `fk_Dispecer_Zaposleni` FOREIGN KEY (`Zaposleni_idZaposleni`) REFERENCES `Zaposleni` (`idZaposleni`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Koordinator`
--
ALTER TABLE `Koordinator`
  ADD CONSTRAINT `fk_Koordinator_TipOtpada1` FOREIGN KEY (`TipOtpada_idTipOtpada`) REFERENCES `TipOtpada` (`idTipOtpada`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_table1_Zaposleni1` FOREIGN KEY (`Zaposleni_idZaposleni`) REFERENCES `Zaposleni` (`idZaposleni`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Magacin`
--
ALTER TABLE `Magacin`
  ADD CONSTRAINT `fk_Artikal_Magacioner1` FOREIGN KEY (`Magacioner_Zaposleni_idZaposleni`) REFERENCES `Magacioner` (`Zaposleni_idZaposleni`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Magacioner`
--
ALTER TABLE `Magacioner`
  ADD CONSTRAINT `fk_Magacioner_Zaposleni1` FOREIGN KEY (`Zaposleni_idZaposleni`) REFERENCES `Zaposleni` (`idZaposleni`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `MenadzerProdaje`
--
ALTER TABLE `MenadzerProdaje`
  ADD CONSTRAINT `fk_MenadzerProdaje_Zaposleni1` FOREIGN KEY (`Zaposleni_idZaposleni`) REFERENCES `Zaposleni` (`idZaposleni`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Poslovi`
--
ALTER TABLE `Poslovi`
  ADD CONSTRAINT `fk_Dispecer_has_Koordinator_Dispecer1` FOREIGN KEY (`Dispecer_Zaposleni_idZaposleni`) REFERENCES `Dispecer` (`Zaposleni_idZaposleni`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Dispecer_has_Koordinator_Koordinator1` FOREIGN KEY (`Koordinator_Zaposleni_idZaposleni`) REFERENCES `Koordinator` (`Zaposleni_idZaposleni`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Poslovi_Zahtev1` FOREIGN KEY (`Zahtev_idZahtev`) REFERENCES `Zahtev` (`idZahtev`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Radnik`
--
ALTER TABLE `Radnik`
  ADD CONSTRAINT `fk_Radnik_Zaposleni1` FOREIGN KEY (`Zaposleni_idZaposleni`) REFERENCES `Zaposleni` (`idZaposleni`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Suspendovani`
--
ALTER TABLE `Suspendovani`
  ADD CONSTRAINT `fk_table1_Upravnik1` FOREIGN KEY (`Upravnik_Zaposleni_idZaposleni`) REFERENCES `Upravnik` (`Zaposleni_idZaposleni`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_table1_Zaposleni2` FOREIGN KEY (`Zaposleni_idZaposleni`) REFERENCES `Zaposleni` (`idZaposleni`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Upravnik`
--
ALTER TABLE `Upravnik`
  ADD CONSTRAINT `fk_Upravnik_Zaposleni1` FOREIGN KEY (`Zaposleni_idZaposleni`) REFERENCES `Zaposleni` (`idZaposleni`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Vozac`
--
ALTER TABLE `Vozac`
  ADD CONSTRAINT `fk_Vozac_Zaposleni1` FOREIGN KEY (`Zaposleni_idZaposleni`) REFERENCES `Zaposleni` (`idZaposleni`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Zahtev`
--
ALTER TABLE `Zahtev`
  ADD CONSTRAINT `fk_Zahtev_Dispecer1` FOREIGN KEY (`Dispecer_Zaposleni_idZaposleni`) REFERENCES `Dispecer` (`Zaposleni_idZaposleni`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Zahtev_Klijent1` FOREIGN KEY (`Klijent_idKlijent`) REFERENCES `Klijent` (`idKlijent`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Zahtev_MenadzerProdaje1` FOREIGN KEY (`MenadzerProdaje_Zaposleni_idZaposleni`) REFERENCES `MenadzerProdaje` (`Zaposleni_idZaposleni`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Zahtev_TipOtpada1` FOREIGN KEY (`TipOtpada_idTipOtpada`) REFERENCES `TipOtpada` (`idTipOtpada`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ZahtevZaOdmorom`
--
ALTER TABLE `ZahtevZaOdmorom`
  ADD CONSTRAINT `fk_ZahtevZaOdmorom_Upravnik1` FOREIGN KEY (`Upravnik_Zaposleni_idZaposleni`) REFERENCES `Upravnik` (`Zaposleni_idZaposleni`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ZahtevZaOdmorom_Zaposleni1` FOREIGN KEY (`Zaposleni_idZaposleni`) REFERENCES `Zaposleni` (`idZaposleni`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
