<?php

	include("biblioteka.php");
	konektujSe();


	$redniBrZahteva = $_GET['redniBrZahteva'];


	$upit = "select Zaposleni_idZaposleni from Koordinator";
	$rezultat=mysqli_query($veza,$upit) or die("greska1");
	$red = mysqli_fetch_assoc($rezultat);
	$idKoor = $red['Zaposleni_idZaposleni'];

	$upit = "select Zaposleni_idZaposleni from Dispecer";
	$rezultat=mysqli_query($veza,$upit) or die("greska1");
	$red = mysqli_fetch_assoc($rezultat);
	$idDisp = $red['Zaposleni_idZaposleni'];



	$upit = "select lokacijaOtpada from Zahtev where idZahtev = $redniBrZahteva";
	$rezultat = mysqli_query($veza,$upit) or die("greska1");
	$red = mysqli_fetch_assoc($rezultat);
	$lokacijaOtpada = $red['lokacijaOtpada'];
	
	$brKamiona = $_GET['brKamiona'];
	$brRadnika = $_GET['brRadnika'];
	$tipKamiona = $_GET['radio'];
	
	$upit = "select count(*) as broj from Vozilo where tipVozila = '$tipKamiona' and zauzet = 0";
	$rezultat = mysqli_query($veza,$upit) or die("greska");
	$red = mysqli_fetch_assoc($rezultat);
	$brojSlobodnihKamiona = $red['broj'];
	
	$upit = "select count(*) as broj from Radnik where zauzet = 0";
	$rezultat = mysqli_query($veza,$upit) or die("greska");
	$red = mysqli_fetch_assoc($rezultat);
	$brojSlobodnihRadnika = $red['broj'];
	
	if ($brojSlobodnihKamiona < $brKamiona or $brojSlobodnihRadnika < $brRadnika)
		die("trenutno nemamo dovoljno resursa da izvrsimo posao");


	$upit = "insert into
					Poslovi(Dispecer_Zaposleni_idZaposleni, Koordinator_Zaposleni_idZaposleni, Zahtev_idZahtev,
					lokacijaDostaveOtpada) values($idDisp, $idKoor,$redniBrZahteva, '$lokacijaOtpada')";
	mysqli_query($veza,$upit) or die("greska 5");
	echo "Uspesno kreiran radni nalog";

	diskonektujSe();
?>
