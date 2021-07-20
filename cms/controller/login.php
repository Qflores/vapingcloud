<?php
require "../models/Person.php";$user = $_POST['user'];$pass = $_POST['pass'];if ($user != "" && $pass !=  "") {$person = new Person();$resp = $person->login($user,$pass);if (is_array($resp)) {echo json_encode("1");}else{echo json_encode("User or Password broken, verify please");}}else{echo json_encode("The fields are empty , input your user and password");}
?>