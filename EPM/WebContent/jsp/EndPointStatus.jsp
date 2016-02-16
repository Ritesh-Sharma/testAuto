<%@page import="epmLogin.UserMasterBean"%>
<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">



<html>
<head>
<link rel="stylesheet" type="text/css" href="styles/index.css" />
<title>Status</title>
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
		<h2>User Master</h2>
	</div>
	<jsp:include page="LogoutLink.jsp"/>
	<%
		String msg = (String) session.getAttribute("endPointStatus");
	%>

	<br>
	<center>
		<h4>
			<%
				out.println(msg);
			%>
		</h4>
	</center>
	<br>
<center>
		<input type="button" value="Back"
			onclick="location.href=&#39;EndPointMasterForm.jsp&#39;">
	</center>
	
	<%-- <jsp:include page="Back.jsp"/> --%>
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