<?php
class Conexion{

	private string $host;
	private string $user;
	private string $password;
	private string $db;
	private string $charset;

	private $conexion;
	private $product =array();
			 
	public function __construct(){
		$this->host= 'localhost';
		$this->user= 'root';
		$this->password= '1234';
		$this->db= 'dbvapinc';
		$this->charset= 'utf8';
	}

	public function getConectar(){
		$cadena = 'mysql:host='.$this->host.';dbname='.$this->db.";charset=".$this->charset;
		try{

			$this->conexion = @new PDO($cadena,$this->user,$this->password);
			
			$this->conexion->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
			
			return $this->conexion;

		}catch(Exception $e){
			echo sprintf('Error %s exceptions: %s', get_class($e), $e->getMessage()) . PHP_EOL;
			return "error";
		}
	}

	public function Close(){

		$this->conexion->close();
	}
}

?>