<?php 
header('content-Type:text/html;charset=utf-8')
function ejecutarSQLCommand($commando){
	$mysqli = new mysqli("localhost","root","","Extrasmysl");
	if($mysqli->connnect_connect_errno){
		print("Connect failed: %s\n",$mysqli->connect_error):
		exit();
	}
	if($mysqli->multi_query($commando)){
		if($resultset=$mysqli->store_result()){
			while($row =$resulset->fetch_array(MYSQLI_BOTH)){

			}
			$resulset->free();
		}
	}
	$mysqli->close();
}

fuction getSQlResultSet($commando){
	$mysqli=new mysqli("localhost","root","","Extrasmysl");
	if($mysqli->connect_errno){
		printf("Connect failed: %s \n", $mysqli->connect_error);
		exit();
	}
	if($mysqli->multi_query($commando)){
		return $mysqli->store_result();
	}
}
?>
