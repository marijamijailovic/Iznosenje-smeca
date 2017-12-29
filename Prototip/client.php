<!DOCTYPE html>
<html lang="en">
<head>

  <title>Služba za iznošenje smeća</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <link rel="stylesheet" href="css/custom.css">

</head>

<body id="clientPage" data-spy="scroll" data-target=".navbar" data-offset="60">

  <!-- Navigacioni meni -->
	<nav class="navbar navbar-default navbar-fixed-top">
	  <div class="container">
	    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
	      <a class="navbar-brand" href="#clientPage">
					<img src="picture/trashFamily.png" width="80" height="40">
				</a>
	    </div>
	    <div class="collapse navbar-collapse" id="myNavbar">
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="#request">Pošaljite zahtev</a></li>
	        <li><a href="#auction">Aukcija</a></li>
	        <li><a href="#contact">Kontakt</a></li>
	      </ul>
	    </div>
	  </div>
	</nav>

  <!-- Ime kompanije i neki kratak tekst o nama -->
  <div class="jumbotron text-center">
    <h1>Kompanija MMNF</h1>
    <p>Na brz i efikasan način iznosimo Vaš otpad</p>
  </div>

  <!-- Forma za slanje zahteva za iznosenje otpada -->
  <h2 class="text-center"> Popunite zahtev za iznošenjem otpada</h2> <br />

  <form class="container" id="request" action="clientRequest.php" method="get">
	   <div class="form-group">
	      <label for="name">Ime</label>
  			<input type="text" class="form-control" id="name" name="ime" placeholder="Pera" required>

  			<label for="lastName">Prezime</label>
  			<input type="text" class="form-control" id="lastName" name="prezime" placeholder="Peric" required>

  			<label for="phone">Telefon</label>
  			<input type="text" class="form-control" id="phone" name="telefon" placeholder="064123456" required>

  			<label for="email">Email address</label>
  			<input type="email" class="form-control" id="email" name="mejl" placeholder="name@example.com" required>

  			<label for="location">Lokacija otpada</label>
  			<input type="text" class="form-control" id="location" name="lokacija" placeholder="Mokroluška 25, Beograd (Voždovac)" required>

  			<label for="garbageType">Vrsta otpada</label>
  			<select class="form-control" id="garbageType" name = "vrsta">
  				<option value = "0">Opasan otpad</option>
  				<option value = "1">Reciklažni otpad</option>
  				<option value = "2">Kabasti otpad</option>
  				<option value = "3">Električni otpad</option>
  				<option value = "4">Građevinski otpad</option>
  			</select>

  			<label for="date">Rok za iznošenje otpada</label>
  			<input type="date" class="form-control" id="date" name="datum" required>

  			<label for="describe">Opis</label>
  			<textarea class="form-control" name="opis" id="describe" placeholder="Opišite nam ukratko kakvu vrstu otpada posedujete i šta konkretno zahtevate" required></textarea>
     </div>

    <button type="submit" class="btn btn-danger">Pošalji zahtev</button>
	</form>

	<hr />

  <!-- Forma za slanje ponude za proizvod na aukciji -->

	<h2 class="text-center"> Proizvodi na aukciji </h2> <br />

	<form class="container" id="auction" action="sendBind.php" method="get">
		<div class="form-group">

      <table class="table table-hover table-sm table-bordered">
        <thead>
          <tr>
            <th>Red.Br.</th>
            <th>Ime artikla</th>
            <th>Opis</th>
            <th>Minimalna cena</th>
            <th>Aukcijska cena</th>
          </tr>
        </thead>
        <tbody  id="tabela">
        </tbody>
      </table>

      <!-- Ovde se cuva idArtikla -->
      <input type="hidden" name="redniBrUredjaja" id="articalNumber">

      <!--<label for="list">Uredjaji na aukciji</label>
  		<select class="form-control" id="list" name="lista"></select>-->

			<label for="price">Ponuda</label>
			<input type="number" class="form-control" id="price" name="ponuda" min=1 placeholder="25000" required>

    </div>

    <button type="submit" class="btn btn-danger">Pošalji ponudu</button>
  </form>

  <!-- Kontak polje -->
  <hr />

  <h2 class="text-center">Kontakt</h2><br />

  <div class="container-fluid bg-grey text-center" id="contact">
      <p>Kontaktirajte nas i dolazimo do Vas za 24h.</p>
      <p><span class="glyphicon glyphicon-map-marker"></span> Beograd, Srbija</p>
      <p><span class="glyphicon glyphicon-phone"></span> +381 64 2574896</p>
      <p><span class="glyphicon glyphicon-envelope"></span> ourcompany@trash.com</p>
  </div>


	<script>
		$(document).ready(function(){

      //za dobijanje svih uredjaja koji su na aukciji
      $.ajax({
					url: 'auctionDevices.php',
					method: 'GET',
					success: function(rezultat){
						var n=rezultat.length;

						for(var i=0; i<n; i++){
							var podaci=rezultat[i];
              var idArtikal=podaci.idArtikal;
          		var ime=podaci.ime;
          		var opis=podaci.opis;
              var minCena=podaci.minCena;
              var aukcijskaCena=podaci.aukcijskaCena;

							//var stavka="<option value='"+idArtikal+"'>"+ ime +" " + opis + " min cena: " + minCena + " aukcijska cena: " + aukcijskaCena + " </option>";

              var stavka="<tr><td>"+ idArtikal + " </td><td> " + ime +" </td><td> " + opis + " </td><td> " + minCena + " </td><td> " + aukcijskaCena + " </td></tr>";

              $("#tabela").append(stavka);
              $("#tabela tr").click(function(){
                 $(this).css('background-color','brown').siblings().css('background-color','white');
                 var value=$(this).find('td:first').html();
                 $("#articalNumber").val(value);
              });
						}
					},
					dataType: "json"

			});

      //animacija scroll-a kada se klikne na neku od mogucih navigacija
		  $(".navbar a").on('click', function(event) {

		    if (this.hash !== "") {
		      event.preventDefault();

		      var hash = this.hash;

		      $('html, body').animate({
		        scrollTop: $(hash).offset().top
		      }, 900, function(){
		        window.location.hash = hash;
		      });
		    }
		  });

      //animacija forme za Kontak
		  $(window).scroll(function() {
		    $(".slideanim").each(function(){
		      var pos = $(this).offset().top;

		      var winTop = $(window).scrollTop();
		        if (pos < winTop + 600) {
		          $(this).addClass("slide");
		        }
		    });
		  });
		})
	</script>

</body>
</html>
