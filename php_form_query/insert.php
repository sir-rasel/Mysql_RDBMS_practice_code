<?php 

	include 'conn.php';
	if (!$conn) echo "Connection failed";
	else{

		$sql = "INSERT INTO account(accountNumber,balance) VALUES ('$_POST[accountNumber]','$_POST[balance]');";

		if (!mysqli_query($conn, $sql)) echo "ERROR OCCURED";
		else echo "New record created successfully";

		mysqli_close($conn);
	}	

?>