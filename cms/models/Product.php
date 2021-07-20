<?php

	require_once 'conexion.php';

	class Product{

		private $conexion;
		private $pst;

		function __construct(){			
			$this->conexion = new Conexion();
			$this->pst =$this->conexion->getConectar();
		}


	public function getAllProduct(){
		$sql = "SELECT 	p.id, p.name, p.description, p.detalle, p.price, p.state, p.quantity, c.id as dcat, c.name as catname FROM product as p inner join category as c on p.id_category = c.id;";

		$rs = $this->pst->query($sql);
		$arreglo = array();	
		//$this->conexion->Close();	

		if($rs){			
			while ($vu= $rs->fetch(PDO::FETCH_ASSOC)) {
				$arreglo['data'][] = $vu;
				return $arreglo;
			}
		}else{				
			return 0;
		}
	}
	

	public function iuproduct(){
		$this->conexion->Close();
	}


	public function changeState(string $state, int $idstate){

		
		$this->conexion->Close();

	}

	
	
	
}
?>