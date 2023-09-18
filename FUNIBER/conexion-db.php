<?php
 
 


define( 'DB_NAME', 'funiber' );
define( 'DB_USER', 'funiber_user' );
define( 'DB_PASSWORD', 'funiber123' );
define( 'DB_HOST', 'localhost' );
define( 'DB_CHARSET', 'utf8mb4' );



// Motrar todos los errores de PHP
error_reporting(E_ALL);

// Motrar todos los errores de PHP
ini_set('error_reporting', E_ALL);

 class Conexion{
    
      public function __construct(){ 
    }


private function conectarBase(){

$conn = mysqli_connect(DB_HOST,DB_USER, DB_PASSWORD, DB_NAME);
}

 
private function cerrarBase(){
     mysqli_close($conexion);

}


 
 


public function registrar($Nombres, $Apellidos, $Correo_Electronico, $Telefono, $Id_Pais, $Detalle_Pais,
$Id_Estado, $Detalle_Estado, $Id_Cuidad,
$Detalle_Ciudad, $Comentarios, $Comprobación_poliza, $area, $programa){
   $ret = array();
    $conn = mysqli_connect(DB_HOST,DB_USER, DB_PASSWORD, DB_NAME);
      if (!$conn) {

        die("Connection failed: " . mysqli_connect_error());

    }

    else{
 

    $sql = "INSERT INTO `usuario`(`Nombres`, `Apellidos`, `Correo_Electronico`, `Telefono`, `Id_Pais`, `Detalle_Pais`, `Id_Estado`, `Detalle_Estado`, `Id_Cuidad`, `Detalle_Ciudad`, `Comentarios`, `Comprobación_poliza`,`area`, `programa`) VALUES ('".$Nombres."','".$Apellidos."','".$Correo_Electronico."','".$Telefono."','".$Id_Pais."','".$Detalle_Pais."','".$Id_Estado."','".$Detalle_Estado."','".$Id_Cuidad."','".$Detalle_Ciudad."','".$Comentarios."','".$Comprobación_poliza."','".$area."','".$programa."')";		
    echo $sql;					 					
  $result = mysqli_query($conn, $sql);

    

  
//mysqli_close($conn);

 
} 
return $result;
}



 


}


?>