<%@page import="java.util.ArrayList"%>
<%@page import="java.util.StringTokenizer"%>
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
		if (document.EPMConfigurationForm.thresholdinteraction.value == "") {
			alert("Response Time Interaction can not be blank");
			document.EPMConfigurationForm.thresholdinteraction.focus();
			return false;
		}

		
		if (document.EPMConfigurationForm.responsetime.value == "") {
			alert("Response Time can not be blank");
			document.EPMConfigurationForm.responsetime.focus();
			return false;
		}
		
		if(!document.EPMConfigurationForm.responsetime.value.match(numbers))
		{
			   alert('Response Time should be numeric characters only');  
			   document.EPMConfigurationForm.responsetime.focus();  
			   return false;  

		}
		
		if (document.EPMConfigurationForm.defaultresponsetime.value == "") {
			alert("Default Response Time can not be blank");
			document.EPMConfigurationForm.defaultresponsetime.focus();
			return false;
		}
		
		if(!document.EPMConfigurationForm.defaultresponsetime.value.match(numbers))
		{
			   alert('Default Response Time should be numeric characters only');  
			   document.EPMConfigurationForm.defaultresponsetime.focus();  
			   return false;  
		}

		if (document.EPMConfigurationForm.averagecreation.value == "") {
			alert("Average Creation can not be blank");
			document.EPMConfigurationForm.averagecreation.focus();
			return false;
		}

		if (document.EPMConfigurationForm.timewindowlength.value == "") {
			alert("Time Window Length can not be blank");
			document.EPMConfigurationForm.timewindowlength.focus();
			return false;
		}

		if(!document.EPMConfigurationForm.timewindowlength.value.match(numbers))
		{
			   alert('Time Window Length should be numeric characters only');  
			   document.EPMConfigurationForm.timewindowlength.focus();  
			   return false;  
		}

	
		if (document.EPMConfigurationForm.noofsamples.value == "") {
			alert("Number of Samples can not be blank");
			document.EPMConfigurationForm.noofsamples.focus();
			return false;
		}

		if(!document.EPMConfigurationForm.noofsamples.value.match(numbers))
		{
			   alert('Number of Samples should be numeric characters only');  
			   document.EPMConfigurationForm.noofsamples.focus();  
			   return false;  
		}

		
		if (document.EPMConfigurationForm.enableepmengine.value == "") {
			alert("Enable EPM Engine can not be blank");
			document.EPMConfigurationForm.enableepmengine.focus();
			return false;
		}
		
		if(!document.EPMConfigurationForm.enableepmengine.value.match(epmenginenumber))
		{
			   alert('Enable EPM Engine value should be either 1 or 2. 1: Enable, 2: Disable');  
			   document.EPMConfigurationForm.enableepmengine.focus();  
			   return false;  
		}

		
/* 		if (document.EPMConfigurationForm.status.value == "") {
			alert("Status can not be blank");
			document.EPMConfigurationForm.status.focus();
			return false;
		}
 */		
		
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
		<h2>EPM Configuration Master</h2>
	</div>
	<jsp:include page="LogoutLink.jsp"/>
	<br>
	<br>
<div>
		<%
			String record = "";
			ArrayList epmInfo = (ArrayList) session.getAttribute("EPMInfo");
			
			if (epmInfo != null)
			{
				//out.println(epmInfo);
				record = epmInfo.toString();
			record = record.replace("[", "");
			record = record.replace("]", "");
			record = record.replace(" ", "");
			//out.println(record);
			}	
		
			

		%>
</div>
	<form name="EPMConfigurationForm" onsubmit="return validateForm();"
		action="../CreateThresholdServlet">

					<%
					if (epmInfo != null && epmInfo.size()>0) {
					StringTokenizer st = new StringTokenizer(record, ",");
							while (st.hasMoreElements()) {
					%>
<table>
<tr height="50">
<td width="200">
<td>Threshold Response Time Interaction</td><td>&nbsp;&nbsp;: <input type="text" name="thresholdinteraction" maxlength="15" /></td><td width="40"></td>
<td>Response Time</td><td>&nbsp;&nbsp;: <input type="text" name="responsetime" maxlength="20" /></td>
</tr>
<tr height="50">
<td width="200">
<td>Default Response Time</td><td>&nbsp;&nbsp;: <input type="text" name="defaultresponsetime" maxlength="20" value="<%=st.nextElement()%>" readonly="readonly" /></td><td width="40"></td>
<td>Average Criterion</td><td>&nbsp;&nbsp;: <input type="text"
				name="averagecreation" maxlength="15" value="<%=st.nextElement()%>" readonly="readonly"/></td>
</tr>
<tr height="50">
<td width="200">
<td>Time Window Length In Seconds</td><td>&nbsp;&nbsp;: <input type="text" name="timewindowlength" maxlength="15" value="<%=st.nextElement()%>" readonly="readonly"/></td><td width="40"></td>
<td>Number Of Samples</td><td>&nbsp;&nbsp;: <input type="text" name="noofsamples" maxlength="15" value="<%=st.nextElement()%>" readonly="readonly"/></td>
</tr>
<tr height="50">
<td width="200">
<td>Enable EPM Engine</td><td>&nbsp;&nbsp;: <input type="text" name="enableepmengine" maxlength="1" value="<%=st.nextElement()%>" readonly="readonly"/></td><td width="40"></td>
<!-- <td>Status</td><td>&nbsp;&nbsp;: <input type="text" name="status" maxlength="15" /></td> -->
</tr>
</table>

		<%
			}
		}
		else
		{
		%>
<table>
<tr height="50">
<td width="200">
<td>Threshold Response Time Interaction</td><td>&nbsp;&nbsp;: <input type="text" name="thresholdinteraction" maxlength="15" /></td><td width="40"></td>
<td>Response Time</td><td>&nbsp;&nbsp;: <input type="text" name="responsetime" maxlength="20" /></td>
</tr>
<tr height="50">
<td width="200">
<td>Default Response Time</td><td>&nbsp;&nbsp;: <input type="text" name="defaultresponsetime" maxlength="20"/></td><td width="40"></td>
<td>Average Criterion</td><td>&nbsp;&nbsp;: <input type="text"
				name="averagecreation" maxlength="15" /></td>
</tr>
<tr height="50">
<td width="200">
<td>Time Window Length In Seconds</td><td>&nbsp;&nbsp;: <input type="text" name="timewindowlength" maxlength="15" /></td><td width="40"></td>
<td>Number Of Samples</td><td>&nbsp;&nbsp;: <input type="text" name="noofsamples" maxlength="15" /></td>
</tr>
<tr height="50">
<td width="200">
<td>Enable EPM Engine</td><td>&nbsp;&nbsp;: <input type="text" name="enableepmengine" maxlength="1" /></td><td width="40"></td>
<!-- <td>Status</td><td>&nbsp;&nbsp;: <input type="text" name="status" maxlength="15" /></td> -->
</tr>
</table>

		<%
			}
		%>



<table>
<tr height="80">
<td width="550">
<td><input type="submit" value="Add"></td>
<td width="40"></td>
<td><input type="button" value="Back"
			onclick="location.href=&#39;EPMConfigurationMasterForm.jsp&#39;"></td>
			<td></td>
</tr>


</table>


<!--  		<br>
		<center>
			<input type="submit" value="Add">
		</center>
		
		
				<input type="button" value="Back"
			onclick="location.href=&#39;EPMConfigurationMasterForm.jsp&#39;">
		
 -->
 
 	</form>
	</div>

	<%-- <jsp:include page="Back.jsp" /> --%>

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


