<?php
   include("biblioteka.php");
   konektujSe();

   $upit="select m.idArtikal,m.ime,m.opis,a.minCena,a.aukcijskaCena
          from Magacin m join Aukcija a on
            m.idArtikal = a.Magacin_idArtikal";
   $rezultat=mysqli_query($veza, $upit) or die("Problem prilikom izvrsavanja upita");

   $za_slanje="";
   $uredjaji=array();

   while(($red=mysqli_fetch_assoc($rezultat))){
  		$uredjaj=new stdClass();

  		$uredjaj->idArtikal=$red['idArtikal'];
  		$uredjaj->ime=$red['ime'];
  		$uredjaj->opis=$red['opis'];
      $uredjaj->minCena=$red['minCena'];
      $uredjaj->aukcijskaCena=$red['aukcijskaCena'];

  		array_push($uredjaji, $uredjaj);
   }

	 $za_slanje=json_encode($uredjaji);

   echo "$za_slanje";
?>
