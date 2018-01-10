<?php

	include("biblioteka.php");
	konektujSe();


	$ime = $_GET['ime'];
	$prezime = $_GET['prezime'];
	$opis = $_GET['opis'];
	
	$pocetakOdmora = $_GET['pocetakOdmora'];
	$krajOdmora = $_GET['krajOdmora'];
	
	$daniPocetak = substr($pocetakOdmora, 8, 2);
	$daniKraj = substr($krajOdmora, 8, 2);
	$brojDana = $daniKraj - $daniPocetak;

	$upit = "select brojSlobodnihDana, idZaposleni from Zaposleni where ime = '$ime' and prezime = '$prezime'";
	$rezultat=mysqli_query($veza,$upit) or die("greska1");
	$red = mysqli_fetch_assoc($rezultat);
	$brojPreostalihDana = $red['brojSlobodnihDana'];
	$idZaposleni = $red['idZaposleni'];
	
	if ($brojPreostalihDana < $brojDana)
		die ("trazite vise slobodnih dana nego sto vam je preostalo");
	
	$upit = "select Zaposleni_idZaposleni as id from Upravnik";
	$rezultat=mysqli_query($veza,$upit) or die("greska1");
	$red = mysqli_fetch_assoc($rezultat);
	$idUpravnika = $red['id'];
	
	
	$upit = "insert into zahtevzaodmorom values($idZaposleni, $idUpravnika, DATE '$pocetakOdmora', DATE '$krajOdmora', '$opis')";
	$rezultat=mysqli_query($veza,$upit) or die("greska insert");
	
	echo "Uspesno ste predali zahtev";

	diskonektujSe();
?>
