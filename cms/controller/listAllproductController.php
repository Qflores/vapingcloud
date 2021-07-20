
<?php

	require "../models/Product.php";

	$product = new Product();

	$res = $product->getAllProduct();

	echo json_encode($res);
?>