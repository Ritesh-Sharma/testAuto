<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">



<html>
<head>
<link rel="stylesheet" type="text/css" href="styles/index.css" />
<title>End Point Monitor Login</title>
<script>
	function validateForm() {

		if (document.UserCreationForm.uid.value == "") {
			alert("User ID can not be blank");
			document.UserCreationForm.uid.focus();
			return false;
		}

		if (document.UserCreationForm.un.value == "") {
			alert("User Name can not be blank");
			document.UserCreationForm.un.focus();
			return false;
		}
		if (document.UserCreationForm.pw.value == "") {
			alert("Password can not be blank");
			document.UserCreationForm.pw.focus();
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
		<h2>Enter User Details</h2>
	</div>
	<jsp:include page="LogoutLink.jsp"/>
	<br>
	<br>
	<br>
	<br>

	<%--     <div>
    <center><h4>
    <%
    //String msg = "";
    String responseMsg = (String)session.getAttribute("userCreationStatus");
    if(responseMsg == null || responseMsg.equals(""))
    out.println("");
    else
    out.println(responseMsg);
    %></h4>
    </center>
    </div>
 --%>
	<form name="UserCreationForm" onsubmit="return validateForm();"
		action="../UserMasterServlet">

		<center>
			UserId &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <input type="text"
				name="uid" maxlength="15" /><br>
		</center>
		<br>

		<center>
			Username &nbsp;&nbsp;: <input type="text" name="un" maxlength="15" /><br>
		</center>
		<br>
		<center>
			Password &nbsp;&nbsp;: <input type="text" name="pw" maxlength="15" />
		</center>
		<br>
		<center>
			<input type="submit" value="Add">
		</center>
	</form>
	</div>

	<jsp:include page="Back.jsp" />

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


