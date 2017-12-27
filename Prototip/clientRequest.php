<?php

	include("biblioteka.php");
	konektujSe();

	$ime = $_GET['ime'];
	$prezime = $_GET['prezime'];
	$telefon = $_GET['telefon'];
	$mejl = $_GET['mejl'];
	$lokacija = $_GET['lokacija'];
	$opis = $_GET['opis'];
	$vrsta = $_GET['vrsta'];
	$datum = $_GET['datum'];

	$upit = "select idKlijent from Klijent where ime = '$ime' and prezime = '$prezime' and email = '$mejl' and brojTelefona = '$telefon'";
	$rezultat=mysqli_query($veza,$upit) or die("greska1");

	if(mysqli_num_rows($rezultat)==0){
		$upit= "select max(idKlijent) as maxId from Klijent";
		$rezultat=mysqli_query($veza,$upit) or die("greska2");
		$red = mysqli_fetch_assoc($rezultat);
		$id = $red['maxId'] + 1;
		$upit = "insert into Klijent values($id, '$ime', '$prezime', '$lokacija', '$telefon', '$mejl')";
		mysqli_query($veza,$upit) or die("greska3");
	}
	else{
		$red = mysqli_fetch_assoc($rezultat);
		$id = $red['idKlijent'];
	}


	$upit= "select max(idZahtev) as maxId from Zahtev";
	$rezultat=mysqli_query($veza,$upit) or die("greska4");
	$red = mysqli_fetch_assoc($rezultat);
	$idZahtev = $red['maxId'] + 1;

	$upit = "insert into
						Zahtev(idZahtev,Dispecer_Zaposleni_idZaposleni,tekstZahteva,ocekivanDatumIznosenja,
										odgovorDispecera,lokacijaOtpada,Klijent_idKlijent,TipOtpada_idTipOtpada)
						values($idZahtev, 1,'$opis','$datum','zahtev je primljen na obradjivanje', '$lokacija', $id,$vrsta)";

	mysqli_query($veza,$upit) or die("greska 5");
	echo "Uspesno predat zahtev";

	diskonektujSe();
?>
