<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.Iterator"%>
<%@page import="epmLogin.UserMasterBean"%>
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

             function isUserSelected(obj) {
            	 //alert(obj.name)
            	 if(obj.name == "Search")
            		 {
            		 	if(document.UserListingForm.un.value == "")
            		 		{
            		 		alert("Please Enter Username");  
            		 		document.UserListingForm.un.focus();  
            		 		return false; 
            		 		}
            		 	document.UserListingForm.action = "../SearchUserServlet";
            		 	return true;
            		 }
            	 if(obj.name == "Disable")
            		 document.UserListingForm.action = "../DeleteUserServlet";
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
		<h2>User Master</h2>
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

	<!-- <form name="UserListingForm" onsubmit="return isUserSelected(this);" action="../DeleteUserServlet"> -->
	<form name="UserListingForm" onsubmit="return isUserSelected(this);"
		action="">
		<table border="0">
			<tr>
				<td width="192"></td>
				<td width="255">Username &nbsp;&nbsp;: <input type="text"
					name="un" /></td>
				<td width="200"><input type="submit" name="Search"
					value="Search" onClick="return isUserSelected(this);"></td>
			</tr>
		</table>

		<!-- Username :		
			<input type="text" name="un"/><br>		
		</center>
 
<br>
			<center>
			<input type="submit" value="Search">			
 -->
		<%
			String record = "";
			ArrayList userInfo = (ArrayList) session.getAttribute("UserInfo");
			//out.println(userInfo);
			if (userInfo != null)
				record = userInfo.toString();
			record = record.replace("[", "");
			record = record.replace("]", "");
			//out.println(record);
			if (userInfo != null) {
		%>

		<div>
			<br>
			<center>
				<table border="0">
					<tr bgcolor="Gray">
						<td width="10">Sr No</td>
						<td width="200">User Name</td>
						<td width="200">User Type</td>
						<td width="200">Status</td>
					</tr>

					<%
						StringTokenizer st = new StringTokenizer(record, ",");
							while (st.hasMoreElements()) {
								String userName = (String) st.nextElement();
					%>
					<tr bgcolor="lightgray">
						<td width="80"><input type="radio" name="deleteuser"
							value=<%=userName%> checked="checked"></input></td>
						<td width="255"><%=userName%></td>
						<td width="255"><%=st.nextElement()%></td>
						<td width="260"><%=st.nextElement()%></td>
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
						<td><input type="button" value="Add User"
							onclick="location.href=&#39;CreateUser.jsp&#39;"></td>
						<td width="13"></td>
						<td><input type="submit" name="Disable" value="Delete User"
							onClick="return isUserSelected(this);"></td>
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
