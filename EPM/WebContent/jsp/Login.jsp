<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">



<html>
<head>
<link rel="stylesheet" type="text/css" href="styles/index.css" />
<title>End Point Monitor Login</title>
<script>
	function validateLogin() {
		//alert("Page is loaded");
		if (document.LoginForm.un.value == "") {
			alert("Please Enter User Name");
			document.LoginForm.un.focus();
			return false;
		}
		if (document.LoginForm.pw.value == "") {
			alert("Please Enter Password");
			document.LoginForm.pw.focus();
			return false;
		} else {
			return true;
		}
	}
</script>


</head>
<body bgcolor="whitesmoke">

	<div class="header">
		<br>
	</div>
	<div style="text-align: center">
		<center>
			<H1>End Point Monitor</H1>
		</center>

		<!-- <img  src="images/CITitle.png" alt="CITitle" width="400px"style=""/> -->
	</div>
	<div class="seprator" style="text-align: center">
		<h2>Please Enter Login Details</h2>
	</div>
	<br>
	<br>
	<br>
	<br>
	
	<%-- <form name="LoginForm" onsubmit="return validateLogin();" --%>
		<form name="LoginForm" action="../LoginServlet">

 		<center>
			Username : <input type="text" value = "Avekshaa" name="un"/><br>
		</center>
		<br>
		<center>
			Password :&nbsp; <input type="password" name="pw" value="Avekshaa123"/>
		</center>
		<br>
		<center>
 
 			<input type="submit" value="Login">
		</center>
	</form>
		
	
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="footer">
		<br>
	</div>



</body>
</html>
