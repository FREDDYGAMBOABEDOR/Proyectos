

<?php
/*$nombre = $_POST['nombre'];
$apellidos = $_POST['apellidos'];
$email = $_POST['email'];
$numero = $_POST['numero']; */
$Nombres = isset($_POST['nombre']) ? $_POST['nombre'] : '-';
$Apellidos= isset($_POST['apellidos']) ? $_POST['apellidos'] : '-';
$Correo_Electronico=isset($_POST['email']) ? $_POST['email'] : '-';
$Telefono=isset($_POST['telefono']) ? $_POST['telefono'] : '-';
$Id_Pais=isset($_POST['selectPaises']) ? $_POST['selectPaises'] : '-';
$Detalle_Pais=isset($_POST['apellidos']) ? $_POST['apellidos'] : '-';
$Id_Estado=isset($_POST['apellidos']) ? $_POST['apellidos'] : '-';
$Detalle_Estado=isset($_POST['apellidos']) ? $_POST['apellidos'] : '-';
$Id_Cuidad=isset($_POST['apellidos']) ? $_POST['apellidos'] : '-';
$Detalle_Ciudad=isset($_POST['apellidos']) ? $_POST['apellidos'] : '-';
$Comentarios=isset($_POST['apellidos']) ? $_POST['apellidos'] : '-';
$Comprobación_poliza=isset($_POST['apellidos']) ? $_POST['apellidos'] : '-';
$area=isset($_POST['apellidos']) ? $_POST['apellidos'] : '-';
$programa=isset($_POST['apellidos']) ? $_POST['apellidos'] : '-';

echo"<h2>Informacion recibida desde PHP</h2>";
echo "El nombre recibido es :". $Nombres. "<br/>";

	require_once("conexion-db.php");
    $connexion = new Conexion();  
	$rspta=$connexion->registrar($Nombres, $Apellidos, $Correo_Electronico, $Telefono, $Id_Pais, $Detalle_Pais,
$Id_Estado, $Detalle_Estado, $Id_Cuidad,
$Detalle_Ciudad, $Comentarios, $Comprobación_poliza, $area, $programa);
	  print_r($rspta);
  

?>
