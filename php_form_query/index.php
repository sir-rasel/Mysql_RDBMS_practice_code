<!DOCTYPE html>
<html>
<head>
	<title>Database insert</title>
</head>
<body>

	<h2>Insert into Account table</h2>
	<form  method="post" action="insert.php">
		Account number: 
		<input type="text" name="accountNumber" required="true"> *required</br></br>
		Branch Name:
		<input type="text" name="branchName"></br></br>
		Balance:
		<input type="text" name="balance"></br></br>
		<input type="submit" name="submit">
	</form>

</body>
</html>