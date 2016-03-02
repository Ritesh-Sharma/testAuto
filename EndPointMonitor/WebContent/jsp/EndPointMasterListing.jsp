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
<title>EPM User Master</title>
<script>

             function isEPSelected(obj) {
            	 if(obj.name == "Search")
            		 {
            		 	if(document.EndPointListingForm.ep.value == "")
            		 		{
            		 		alert("Please enter end point id");  
            		 		document.EndPointListingForm.ep.focus();  
            		 		return false; 
            		 		}
            		 	document.EndPointListingForm.action = "../SearchEndPointServlet";
            		 	return true;
            		 }
            	 if(obj.name == "Disable")
            		 {
	            	   var btns = EndPointListingForm.deleteendpoint;
    	        	   for (var i=0; el=btns[i]; i++) 
    	        	   {
    	        		   if (el.checked){
            	     		document.EndPointListingForm.action = "../DeleteEndPointServlet";
            	     		return true;
            	     	}
            	   }
            	   alert('Please select end point to delete');
            	   return false;
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

	<!-- <form name="EndPointListingForm" onsubmit="return isEPSelected(this);" action="../DeleteEndPointServlet"> -->
	<form name="EndPointListingForm" onsubmit="return isEPSelected(this);"
		action="">
		<table border="0">
			<tr>
				<td width="192"></td>
				<td width="255">Ep Id &nbsp;&nbsp;: <input type="text"
					name="ep" /></td>
				<td width="200"><input type="submit" name="Search"
					value="Search" onClick="return isEPSelected(this);"></td>
			</tr>
		</table>

		<!-- Username :		
			<input type="text" name="ep"/><br>		
		</center>
 
<br>
			<center>
			<input type="submit" value="Search">			
 -->
		<%
			String record = "";
			ArrayList epmInfo = (ArrayList) session.getAttribute("EPMInfo");
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
						<td width="10">Sr No</td>
						<td width="150">Ep Id</td>
						<td width="150">Description</td>
						<td width="150">IP Address</td>
						<td width="150">Port</td>
						<td width="150">Type</td>
						<td width="150">Status</td>
					</tr>

 					<%
						StringTokenizer st = new StringTokenizer(record, ",");
							while (st.hasMoreElements()) {
								String epid = (String) st.nextElement();
					%>
					
					<tr bgcolor="lightgray">
						<td width="60"><input type="radio" name="deleteendpoint" value=<%=epid%>></input></td>
						<td width="20"><%=epid%></td>
 						<td width="300"><%=st.nextElement()%></td>
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
						<td><input type="button" value="Add EP"
							onclick="location.href=&#39;CreateEndPoint.jsp&#39;"></td>
						<td width="13"></td>
						<td><input type="submit" name="Disable" value="Delete EP"
							onClick="return isEPSelected(this);"></td>
						<td width="13"></td>
						<td><input type="button" width="100" value="Back"
					onclick="history.go(-2);return false;" /></td>
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
