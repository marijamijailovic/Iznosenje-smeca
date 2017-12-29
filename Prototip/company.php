<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<title>Služba za iznošenje smeća</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="css/custom.css">


		<script id="source" language="javascript" type="text/javascript">

		  $(document).ready(function()
		  {
				$.ajax({
						url: 'request.php',
						method: 'GET',
						success: function(rezultat){
							var n=rezultat.length;

							for(var i=0; i<n; i++){
								var podaci=rezultat[i];
								var idZahtev=podaci.idZahtev;
						    var tekstZahteva=podaci.tekstZahteva;
								var ocekivanDatumIznosenja=podaci.ocekivanDatum;
						    var lokacijaOtpada=podaci.lokacijaOtpada;

								//var stavka="<option value='"+idZahtev+"'>"+ tekstZahteva +" " + ocekivanDatumIznosenja + " " + lokacijaOtpada + " </option>";
								var stavka="<tr><td>"+ idZahtev + " </td><td> " + tekstZahteva +" </td><td> " + ocekivanDatumIznosenja + " </td><td> " + lokacijaOtpada + " </td></tr>";

								$("#tabela").append(stavka);
								$("#tabela tr").click(function(){
								   $(this).css('background-color','brown').siblings().css('background-color','white');
   								 var value=$(this).find('td:first').html();
									 $("#orderNumber").val(value);
								});
							}
						},
						dataType: "json"
					});
				});

	  </script>

</head>

<body id="clientPage" data-spy="scroll" data-target=".navbar" data-offset="60">

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
					<li><a href="#order">Napravi radni nalog</a></li>
					<li><a href="#rest">Zahtev za odmor</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<h2 class="text-center"> Kreiraj radni nalog: </h2><br/>


	<form class="container" id="order" action="createOrdrer" method="get">
		<div class="form-group">
				<table class="table table-hover table-sm table-bordered">
					<thead>
						<tr>
							<th>Red.Br.</th>
							<th>Opis</th>
							<th>Ocekivan datum iznosenja</th>
							<th>Lokacija otpada</th>
						</tr>
					</thead>
					<tbody  id="tabela">
					</tbody>
				</table>

				<!-- Ovde se cuva idZahtev -->
				<input type="hidden" name="redniBrZahteva" id="orderNumber">

				<!--<label for="list">Spisak zahteva</label>
			  <select class="form-control" id='list' name="lista"></select>-->

				<label for="worker">Broj radnika</label>
				<input type="number" class="form-control" id="worker" name="brRadnika" min="1" placeholder="5" required>
				<div class="invalid-feedback">
        	Molimo unesite ispravan broj radnika
      	</div>

        <label>Tip kamiona:</label>

				<div class="form-check">
          <label class="form-check-label">
            <input class="form-check-input" type="radio" name="radio" id="radio1" value="option1" checked>
            Pikap
          </label>
        </div>

        <div class="form-check">
          <label class="form-check-label">
            <input class="form-check-input" type="radio" name="radio" id="radio2" value="option2">
            Kombi
          </label>
        </div>
        <div class="form-check">
          <label class="form-check-label">
            <input class="form-check-input" type="radio" name="radio" id="radio3" value="option3">
            Reciklazni kamion
          </label>
        </div>

        <div class="form-check">
          <label class="form-check-label">
            <input class="form-check-input" type="radio" name="radio" id="radio4" value="option4">
            Kamion tipa 1
          </label>
        </div>

        <label for="truck">Broj kamiona</label>
				<input type="number" class="form-control" id="truck" name="brKamiona" min="1" placeholder="3" required>

    </div>
		<button type="submit" class="btn btn-danger">Potvrdi</button>
	</form>

	<!--
		TODO mozda da ispisemo i radni nalog, da sadrzi:
		 			lokaciju otpada, tip otpada,
					i u bazi oznaciti u polju odgovor koordinatora ekipa je na terenu
	-->

	<hr />

	<h2 class="text-center"> Zahtev za odmor: </h2><br/>

	<form class="container" id="rest">
		<div class="form-group">
				<label for="name">Ime</label>
				<input type="text" class="form-control" id="name" name="ime" placeholder="Pera" required>

				<label for="lastName">Prezime</label>
				<input type="text" class="form-control" id="lastName" name="prezime" placeholder="Peric" required>

				<div class="row">
					<div class="col-md-6">
						<label for="startDate">Datum pocetka</label>
						<input type="date" class="form-control" id="startDate" name="pocetakOdmora" required>
					</div>
					<div class="col-md-6">
						<label for="endDate">Datum kraja</label>
						<input type="date" class="form-control" id="endDate" name="krajOdmora" required>
					</div>
				</div>

				<label for="describe">Opis</label>
				<textarea class="form-control" name="opis" id="describe" placeholder="Ako želite navedite razlog odsustva"></textarea>

		</div>
		<button type="submit" class="btn btn-danger">Pošalji zahtev</button>
	</form>

</body>

</html>
