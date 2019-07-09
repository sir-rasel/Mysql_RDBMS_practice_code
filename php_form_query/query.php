<!DOCTYPE html>
<html>
<head>
	<title>Query Result</title>
</head>
<body>
	<h2>Account Table</h2>
	<?php 
		include 'conn.php';
		if(!$conn) echo "Not Connected";
		else{
			$sql = "SELECT * FROM account;";
			$result = mysqli_query($conn,$sql);
			if(!$result) echo "ERROR";
			else{
				$rows = mysqli_num_rows($result);
				if ($rows>0) {
					echo "Account Number". " "."Branch Name". " ". "Balance"."</br>";
					while($row_result=mysqli_fetch_assoc($result)){
						echo $row_result['accountNumber']." " .$row_result['branchName']." ".$row_result['balance']."</br>";
					}
				}
			}
		}
 ?>
</body>
</html>