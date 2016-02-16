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
		var numbers = /^[0-9]+$/;
		var epmenginenumber = /^[1-2]+$/;
		if (document.EndPointCreationForm.epid.value == "") {
			alert("Ep Id can not be blank");
			document.EndPointCreationForm.epid.focus();
			return false;
		}
		if(!document.EndPointCreationForm.epid.value.match(numbers))
		{
			   alert('End Point Id should be numeric characters only');  
			   document.EndPointCreationForm.epid.focus();  
			   return false;  

		}

		if (document.EndPointCreationForm.epdesc.value == "") {
			alert("End point description can not be blank");
			document.EndPointCreationForm.epdesc.focus();
			return false;
		}
		
		if (document.EndPointCreationForm.ipaddress.value == "") {
			alert("IP Address can not be blank");
			document.EndPointCreationForm.ipaddress.focus();
			return false;
		}
		if (document.EndPointCreationForm.port.value == "") {
			alert("Port can not be blank");
			document.EndPointCreationForm.port.focus();
			return false;
		}

		if(!document.EndPointCreationForm.port.value.match(numbers))
		{
			   alert('Port should be numeric characters only');  
			   document.EndPointCreationForm.port.focus();  
			   return false;  

		}

		if (document.EndPointCreationForm.type.value == "") {
			alert("Type can not be blank");
			document.EndPointCreationForm.type.focus();
			return false;
		}

		if(!document.EndPointCreationForm.type.value.match(numbers))
		{
			   alert('Type should be numeric characters only');  
			   document.EndPointCreationForm.type.focus();  
			   return false;  

		}

		if (document.EndPointCreationForm.status.value == "") {
			alert("Status can not be blank");
			document.EndPointCreationForm.status.focus();
			return false;
		}

		if(!document.EndPointCreationForm.status.value.match(epmenginenumber))
		{
			   alert('Status value should be either 1 or 2. 1: Enable, 2: Disable');  
			   document.EndPointCreationForm.status.focus();  
			   return false;  
		}
		
		else {
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
		<h2>Enter End Point Details</h2>
	</div>
	<jsp:include page="LogoutLink.jsp"/>
	<br>
	<br>
<!-- 	<br>
	<br>
 -->
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
	<form name="EndPointCreationForm" onsubmit="return validateForm();"
		action="../CreateEndPointServlet">


<table>
<tr height="50">
<td width="300">
<td>Ep Id</td><td>&nbsp;&nbsp;: <input type="text" name="epid" maxlength="15" /></td><td width="40"></td>
<td>Description</td><td>&nbsp;&nbsp;: <input type="text" name="epdesc" maxlength="20" /></td>
</tr>
<tr height="50">
<td width="300">
<td>IP Address</td><td>&nbsp;&nbsp;: <input type="text" name="ipaddress" maxlength="20" /></td><td width="40"></td>
<td>Port</td><td>&nbsp;&nbsp;: <input type="text"
				name="port" maxlength="15" /></td>
</tr>
<tr height="50">
<td width="300">
<td>Type</td><td>&nbsp;&nbsp;: <input type="text" name="type" maxlength="15" /></td><td width="40"></td>
<td>Status</td><td>&nbsp;&nbsp;: <input type="text" name="status" maxlength="15" /></td>
</tr>

</table>

<!-- 		<center>
			Ep Id &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <input type="text"
				name="epid" maxlength="15" /><br>
		</center>
		<br>

		<center>
			Description &nbsp;&nbsp;: <input type="text" name="epdesc" maxlength="20" /><br>
		</center>
		<br>
		<center>
			IP Address &nbsp;&nbsp;: <input type="text" name="ipaddress" maxlength="20" />
		</center>
		<br>

		<center>
			Port &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <input type="text"
				name="port" maxlength="15" /><br>
		</center>
		<br>

		<center>
			Type &nbsp;&nbsp;: <input type="text" name="type" maxlength="15" /><br>
		</center>
		<br>
		<center>
			Status &nbsp;&nbsp;: <input type="text" name="status" maxlength="15" />
		</center>
 -->
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


