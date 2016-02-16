<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.TreeMap"%>
<%@page import="com.avekshaa.epm.core.EPMAlertingEngine"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="styles/treeMenu.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="styles/EPMReport.css" rel="stylesheet" type="text/css"/>
        <script type='text/javascript' src='scripts/treeMenu.js'></script>
        
        <title>EPM Alerts</title>
    </head>
    <body>
        
    <div id="header">
		<table>
			<tr>
				<td>&nbsp; <b>Endpoint Monitor</b>
				</td>
				<td width="1023"></td>
<!-- 				<td><input class="epmlogoutbuttons" id="EPMButton"
					type="button" name="Home" value="Home"
					onclick="location.href=&#39;Alerts.jsp&#39;"></td>
 -->
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
                    <ul id="treeMenu"  style="margin-left: 20px; margin-top: 20px">

  <li><input class="buttons" id="EPMButton"
					type="button" name="EPM Report" value="EPM Report"
					onclick="location.href=&#39;EPMReport.jsp&#39;"></li>
					
  <li><input class="buttons" id="EPMButton"
					type="button" name="EPM Search" value="EPM Search"
					onclick="location.href=&#39;EPMSearch.jsp&#39;"></li>
					
  <li><input class="buttons" id="EPMButton"
					type="button" name="EPM User" value="User Master"
					onclick="location.href=&#39;UserMasterForm.jsp&#39;"></li> 
					
	<li><input class="buttons" id="EPMButton"
					type="button" name="End Point Master" value="End Point Master"
					onclick="location.href=&#39;EndPointMasterForm.jsp&#39;"></li>
					
					<li><input class="buttons" id="EPMButton"
					type="button" name="EPM Configuration Master" value="Configuration Master"
					onclick="location.href=&#39;EPMConfigurationMasterForm.jsp&#39;"></li>		
					
					<li><input class="buttons" type="button" name="testAutomation" value="Test Automation" 
					     onclick="location.href='testAutomation.jsp'" > </li>
					     
					<li><input class="buttons" type="button" name="realTimeMonitoring" value="Real Time Monitoring" 
					     onclick="location.href='testAutomation.jsp'" > </li>
					     
					 <li><input class="buttons" type="button" name="postTestOperation" value="Report/Analysis" 
					     onclick="location.href='testAutomation.jsp'" > </li> 
					
								
										
					</ul>
					 
                </div>

                <div id="IPHeader">

                </div>
               
                 
                 <div id="graph">
                	<%
				    EPMAlertingEngine epmEngine = new EPMAlertingEngine();

				    TreeMap alertData = epmEngine.getAlertData();

				    for (Iterator iterator = alertData.descendingKeySet().iterator(); iterator
									.hasNext();) {
					String startTimeEndTime = (String) iterator.next();
					String[] splitTimes = startTimeEndTime.split("-");
					SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
					String startTimeStr  = sdf.format(new Date(Long.valueOf(splitTimes[0].trim())));
					String endTimeStr  = sdf.format(new Date(Long.valueOf(splitTimes[1].trim())));
			%>	
					<a href="/EPMWebapp/jsp/EPMSearch.jsp?startTime=<%=startTimeStr%>&endTime=<%=endTimeStr%>"><b></br></br>Report for <%=startTimeStr%></br></b></a>
					
			<%
					List vals = (List) alertData.get(startTimeEndTime);

					for (Iterator iterator2 = vals.iterator(); iterator2
							.hasNext();) {
						String rowVal = (String) iterator2.next();

						String[] split = rowVal.split(",");

						String interactionType = "interaction ";

						String interactionID = "";

						if ("0".equals(split[0])) {
							interactionType = "target endpoint ";
							interactionID = (String) split[1];
						}else if ("0".equals(split[1])) {
							interactionType = "source endpoint ";
							interactionID = (String) split[0];
						}else{
							interactionID = split[0] + "~" + split[1];
						}

						%>

						Average for <%=interactionType%> <%=interactionID%> is above threshold. Avg is <%=split[2]%> milliseconds. 
								Threshold is <%=split[3]%>.</br>
						<%		


					}


				}

			%>      
                </div>
                               
 
            </div>
        </div>
        <div id="footer">
            &nbsp;
            	    <b>EPM Alerts</b>
            	    
        </div>
        
        <p id="results">
	</p>
        
        <pre>
        </pre>
	
	<pre>
	
	</pre>
            
        

<%-- 		<jsp:include page="Back.jsp"/> --%>        
    </body>
    
    
</html>
