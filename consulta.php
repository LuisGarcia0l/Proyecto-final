<?php include('conexion.php')
$matricula=$_GET["matricula"];

if($resultset=getSQLResultSet("SELECT *FROM `registro` WHERE matricula='$matricula'")){
	while($row = $resultset->fetch_array(MYSQLI_NUM)){
		echo json_encode($row);
	}
}
?>