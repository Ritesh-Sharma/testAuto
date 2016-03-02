<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256" import="epmLogin.UserBean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
   "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<link rel="stylesheet" type="text/css" href="styles/index.css">
<title>User Master</title>
</head>

<body>
	<div class="header">
		<br>
	</div>
	<center>
		<H1>End Point Monitor</H1>
	</center>
	<div class="seprator">
		<br>
	</div>
	<br>
	<br>
	<br>
	<br>
	<div class="buttonDiv">
		<table>
			<tr>
				<td width="300"></td>

				<td width="250">
					<!-- <input class="buttons" id="EPMButton" type="button" name="AddUser" value="Add User" onclick="location.href=&#39;CreateUser.jsp&#39;"> -->
					<input class="buttons" id="EPMButton" type="button" name="AddUser"
					value="Add User" onclick="location.href=&#39;CreateUser.jsp&#39;">

				</td>
				<td width="500"><input class="buttons" id="EPMButton"
					type="button" name="DeleteUser" value="Delete User"
					onclick="location.href=&#39;UserMasterForm.jsp&#39;"></td>
				<td width="200"></td>
			</tr>
		</table>
	</div>
	<br>
	<br>
	<br>

	<jsp:include page="Back.jsp" />

</body>

</html>
