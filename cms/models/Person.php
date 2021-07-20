<?php

	require_once 'conexion.php';

	class Person{

		private $conexion;
		private $pst;

		function __construct(){			
			$this->conexion = new Conexion();
			$this->pst =$this->conexion->getConectar();
		}


	public function getAllUser($user){
		$sql = "call sp_verificar_usuario('$user');";
		$rs = $this->pst->query($sql);
		$arreglo = array();	
		$this->conexion->Close();			
		if($rs){			
			while ($vu= mysqli_fetch_array($rs)) {
				$arreglo[] = $vu;
				return $arreglo;
			}
		}else{				
			return 0;
		}
	}
	

	public function login($user,$pass){
		$sql = "SELECT email, names, role, user as usuario, password FROM persona where user = '$user' or email='$user';";
		$rs = $this->pst->query($sql);
		$arreglo = array();
		$vu;
		if($rs){				
			while($vu= $rs->fetch(PDO::FETCH_ASSOC)){
				if(password_verify($pass, $vu['password'])){
					$arreglo[1] = $vu['email'];
					$arreglo[2] = $vu['names'];
					$arreglo[3] = $vu['role'];
					$arreglo[4] = $vu['usuario'];
					return $arreglo;
				}else{
					return 0;
				}	
			}
			return -2;			
		}else{				
			return -1;
		}
	}


	public function addUser(string $names, string $user, string $pass,string $email, string $address, string $phone, string $doc, int $idloction){

		$pass = password_hash($pass, PASSWORD_DEFAULT,['cost'=>12]);
		$sql ="INSERT INTO persona (names, user, email, phone, document, address, type, state, role, password) VALUES ('$names', '$user', '$email', '$phone', '$doc', '$address', 'cliente', '1', 'cliente', '$pass');";

		$rs = $this->pst->query($sql);

		if($rs){
			$row= mysqli_fetch_array($rs);
			return  trim($row[0]);						
		}else{
			return false;
		}
		$this->conexion->Close();

	}

	
	
	
}
?>