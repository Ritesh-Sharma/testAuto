<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256" import="epmLogin.UserBean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
   "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<link rel="stylesheet" type="text/css" href="styles/index.css">
<title>End Point Monitor Home</title>
</head>

<body bgcolor="whitesmoke">
	<div class="header">
		<br>
	</div>
	<center>
		<H1>End Point Monitor</H1>
	</center>
	<div class="seprator">
		<br>
	</div>
	<jsp:include page="LogoutLink.jsp"/>

	<br>
	<br>
	<br>
	<br>
	<div class="buttonDiv">
		<table>
			<tr>
				<td width="300"></td>

				<td width="250"><input class="buttons" id="EPMButton"
					type="button" name="EPM Report" value="EPM Report"
					onclick="location.href=&#39;EPMReport.jsp&#39;"></td>
				<td width="500"><input class="buttons" id="EPMButton"
					type="button" name="EPM Search" value="EPM Search"
					onclick="location.href=&#39;EPMSearch.jsp&#39;"></td>
				<td width="200"></td>
			</tr>
		</table>
		<table>
			<tr height="50">
			</tr>
			<tr>
				<!-- <td width="1230">
            <input class="buttons" id="EPMButton" type="button" name="EPM Alerts" value="EPM Alerts" onclick="location.href=&#39;Alerts.jsp&#39;">
    </td>
 -->

				<td width="300"></td>

				<td width="250"><input class="buttons" id="EPMButton"
					type="button" name="EPM Alerts" value="EPM Alerts"
					onclick="location.href=&#39;Alerts.jsp&#39;"></td>
				<td width="500"><input class="buttons" id="EPMButton"
					type="button" name="EPM User" value="User Master"
					onclick="location.href=&#39;UserMasterForm.jsp&#39;"></td>
				<td width="200"></td>

			</tr>
			<!-- <input class="buttons" id="EPMButton" type="button" name="Trace Network" value="Analyze Tracert" onclick="location.href=&#39;CIRIndex.jsp&#39;">
            
            <input class="buttons" id="EPMButton" type="button" name="Connection Leak Detector" value="Connection Leak Detector" onclick="location.href=&#39;CICLDIndex.jsp&#39;"> -->
		</table>
	</div>

</body>

</html>
