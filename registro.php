<?php include('conexion.php');
$matricula=$_GET['matricula']
$nombreU=$_GET['nombreU']
$correo=$_GET['correo']
$contraseña =$_GET['contraseña']

ejecutarSQLCommand("INSERT INTO `registro` (matricula,nombreU,correo,contraseña)
	VALUE(
	'$matricula',' $nombreU','$correo','$contraseña','$Estado')

	ON DUPLICATE KEY UPDATE `matricula=$matricula`,
	`nombreU=$nombreU`,
	`correo=$correo`,
	`contraseña=$contraseña`;");
?>

