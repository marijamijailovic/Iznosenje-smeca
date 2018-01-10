<?php
   include("biblioteka.php");
   konektujSe();

   $upit = "select Zahtev_idZahtev from Poslovi";
 	 $rezultat=mysqli_query($veza,$upit) or die("greska1");
   while($red = mysqli_fetch_assoc($rezultat)){
     $poslovi[] = $red['Zahtev_idZahtev'];
   }

   $upit="select * from Zahtev";
   $rezultat=mysqli_query($veza, $upit) or die("Problem prilikom izvrsavanja upita");

   $za_slanje="";
   $zahtevi=array();

   while(($red=mysqli_fetch_assoc($rezultat))){
  		$zahtev=new stdClass();

  		$zahtev->idZahtev=$red['idZahtev'];
      if (!in_array($zahtev->idZahtev, $poslovi)) {
    		$zahtev->tekstZahteva=$red['tekstZahteva'];
    		$zahtev->ocekivanDatum=$red['ocekivanDatumIznosenja'];
        $zahtev->lokacijaOtpada=$red['lokacijaOtpada'];

    		array_push($zahtevi, $zahtev);
      }
   }

	 $za_slanje=json_encode($zahtevi);

   echo "$za_slanje";
?>
