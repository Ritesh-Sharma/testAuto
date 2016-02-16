<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles/treeMenu.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="styles/EPMReport.css" rel="stylesheet" type="text/css" />
<script type='text/javascript' src='scripts/jquery.js'></script>
<script type='text/javascript' src='scripts/treeMenu.js'></script>
<script type='text/javascript' src='scripts/EPMReportAjax.js'></script>
<SCRIPT LANGUAGE="Javascript" SRC="scripts/FusionCharts.js"></SCRIPT>

<title>EPM Live Report</title>
</head>
<body>
	<%
		//response.setIntHeader("Refresh", 5);
		String sessionId = request.getParameter("id");
		Boolean isOverviewLinkClicked = false;
	%>


	<div id="header">
		<table>
			<tr>
				<td>&nbsp; <b>Endpoint Monitor</b>
				</td>
				<td width="970"></td>
				<td><input class="epmlogoutbuttons" id="EPMButton"
					type="button" name="Home" value="Home"
					onclick="location.href=&#39;Alerts.jsp&#39;"></td>
				<td><input class="epmlogoutbuttons" id="EPMButton"
					type="button" name="Logout" value="Logout"
					onclick="location.href=&#39;Logout.jsp&#39;"></td>
			</tr>
		</table>
	</div>


	<div id="wrap">


		<div id="main">

			<div id="lmenu">
				<div id="MenuHeader"></div>

				<ul id="treeMenu" style="margin-left: 20px; margin-top: 20px">
					<%
						//out.println("<li style=\" text-indent: 10px\" class=\"link\" id=\"Overview\"><A onclick=\"EPMReport.jsp?id="+sessionId+"\"><b>Overview</b></A>");
						//out.println("<li style=\" text-indent: 10px\" class=\"link\" id=\"Overview\"><A onclick=\"loadOverview('" + sessionId + "')\"><b>Overview</b></A>");
					%>

				</ul>
				<!-- END TREE MENU -->
			</div>



			<div id="IPHeader"></div>

			<div id="graph"></div>



		</div>

	</div>

	<div id="footer">
		&nbsp; <b>Enpoint Response Time Graph</b>

	</div>

	<script>
	    	loadOverview('','','All','All');
    </script>



	<jsp:include page="Back.jsp" />

</body>
</html>
