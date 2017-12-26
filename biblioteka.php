<?php
	function konektujSe(){
		global $veza;
		$veza=mysqli_connect("localhost","root","","mydb");
		if(mysqli_connect_errno($veza))
			die("Neuspela konekcija");
	}

	function diskonektujSe(){
		global $veza;
		mysqli_close($veza);
	}



?>