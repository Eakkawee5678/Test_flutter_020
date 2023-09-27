<?php

include('connectDB.php');

// $fullname = $_POST['fullname'];
$username = $_POST['username'];
// $password = $_POST['password'];

// $username = 'asa';
$sql = "delete from users  WHERE username = '" . $username . "'";
// echo $sql;
if ($con->query($sql)) {
	echo json_encode('Success');
} else {
	echo json_encode('Error');
}
?>