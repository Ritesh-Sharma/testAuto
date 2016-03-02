<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">



<html>
<head>
<link rel="stylesheet" type="text/css" href="styles/index.css" />
<title>EPM Configuration Master</title>
<script>

             function isThresholdSelected(obj) {
            	 //alert(obj.name)
            	 if(obj.name == "Search")
            		 {
            		 	if(document.EPMConfigurationListingForm.tid.value == "")
            		 		{
            		 		alert("Please enter threshold interaction id");
            		 		document.EndPointListingForm.tid.focus();  
            		 		return false; 
            		 		}
            		 	document.EPMConfigurationListingForm.action = "../SearchThresholdServlet";
            		 	return true;
            		 }
            	 if(obj.name == "Disable")
            		 document.EPMConfigurationListingForm.action = "../DeleteThresholdServlet";
            	} 
             

             function addModifyConfiguration(obj) {
            	 if(obj.value  == "Modify Default Config")
            		 {
            	 		alert("Modifying default configuration will update all existing record")
            		 }
            	 document.EPMConfigurationListingForm.action = "../ThresholdConfigurationServlet";
    		 	return true;
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
		<h2>End Point Master</h2>
	</div>
	<jsp:include page="LogoutLink.jsp"/>
	<br>
	<br>

	<%--      <div>
    <%
    //String msg = "";
    String responseMsg = (String)session.getAttribute("userCreationStatus");
    if(responseMsg == null || responseMsg.equals(""))
    out.println("");
    else
    out.println(responseMsg);
    %>
    </div>
 --%>

	<!-- <form name="EPMConfigurationListingForm" onsubmit="return isThresholdSelected(this);" action="../deletethresholdServlet"> -->
	<form name="EPMConfigurationListingForm" onsubmit="return isThresholdSelected(this);"
		action="">
		<table border="0">
			<tr>
				<td width="110"></td>
				<td width="350">Threshold Interaction &nbsp;&nbsp;: <input type="text"
					name="tid" /></td>
				<td width="200"><input type="submit" name="Search"
					value="Search" onClick="return isThresholdSelected(this);"></td>
			</tr>
		</table>

		<%
			String record = "";
			ArrayList epmInfo = (ArrayList) session.getAttribute("thresholdInfo");
			//out.println(userInfo);
			if (epmInfo != null)
				record = epmInfo.toString();
			record = record.replace("[", "");
			record = record.replace("]", "");
			if (epmInfo != null) {
		%>

		 <div>
			<br>
			<center>
				<table border="0">
					<tr bgcolor="Gray">
						<td>Sr No</td>
						<td width="140">Threshold Interaction</td>
						<td width="130">Response Time</td>
						<td width="180">Default Response Time</td>
						<td width="140">Average Criterion</td>
						<td width="160">Time Window Length</td>
						<td width="150">Number Of Samples</td>
						<td width="160">Enable EPM Engine</td>
						<td width="60">Status</td>
					</tr>

 					<%
						StringTokenizer st = new StringTokenizer(record, ",");
							while (st.hasMoreElements()) {
								String threshold = (String) st.nextElement();
					%>
					
					<tr bgcolor="lightgray">
						<td width="60"><input type="radio" name="deletethreshold" value=<%=threshold%> checked="checked"></input></td>
						<td width="20"><%=threshold%></td>
 						<td width="50"><%=st.nextElement()%></td>
						<td width="50"><%=st.nextElement()%></td>
						<td width="50"><%=st.nextElement()%></td>
						<td width="50"><%=st.nextElement()%></td>
						<td width="50"><%=st.nextElement()%></td>
						<td width="50"><%=st.nextElement()%></td>
						<td width="50"><%=st.nextElement()%></td>
					</tr>
					<%
						}
					%>
				</table>

				<br>
				<!-- <input class="buttons" id="EPMButton" type="button" name="AddUser" value="Add User" onclick="location.href=&#39;CreateUser.jsp&#39;"> -->
				<table>
					<tr>
						<td width="600"></td>
						<td><input type="submit" name="btnaction" value="Add Threshold"
							onclick="return addModifyConfiguration(this);"></td>
						<td width="13"></td>
						<td><input type="submit" name="Disable" value="Delete Threshold"
							onClick="return isThresholdSelected(this);"></td>
						<td width="13"></td>
						<td><input type="submit" name="btnaction" value="Modify Default Config"
							onclick="return addModifyConfiguration(this);"></td>
						<td width="13"></td>
						<td><input type="button" width="100" value="Back"
					onclick="history.go(-1);return false;" /></td>
					</tr>
				</table>


			</center>
		</div>
			<%
			}
		%>
	</form>



	<%-- <jsp:include page="Back.jsp"/>
    <br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br>
 --%>
	<br>
	<br>
	<!-- <div class="footer" ><br></div> -->



</body>
</html>
