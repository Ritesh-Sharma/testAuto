<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.TreeMap"%>
<%@page import="com.avekshaa.epm.core.EPMEngine"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="styles/treeMenu.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="styles/EPMReport.css" rel="stylesheet" type="text/css"/>
        <script type='text/javascript' src='scripts/jquery.js'></script>
        <script type='text/javascript' src='scripts/treeMenu.js'></script>
        <script type='text/javascript' src='scripts/EPMReportAjax.js'></script>
        <SCRIPT LANGUAGE="Javascript" SRC="scripts/FusionCharts.js"></SCRIPT>

        <title>EPM Search</title>
    </head>
    <body>
        <%
        
        	//Thread.sleep(2000);
            //response.setIntHeader("Refresh", 5);
            String sessionId = request.getParameter("id");
            String startTime = request.getParameter("startTime");
            String endTime = request.getParameter("endTime");
            
            startTime = startTime == null ? "" : startTime;
            endTime = endTime == null ? "" : endTime;
            
            String sourceEndpoint = request.getParameter("sourceEndpoint");
            String targetEndpoint = request.getParameter("targetEndpoint");
            
            System.out.println("In EPMSearchResult "+ startTime);
            System.out.println("In EPMSearchResult " + endTime);
                        
            Boolean isOverviewLinkClicked=false;

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
                    <ul id="treeMenu"  style="margin-left: 20px; margin-top: 20px">
                    	<form action="EPMSearch.jsp" method="post">
				        <br/>Start Time(01-Jan-2000 11:44:55):<input type="text" name="startTime" value="<%=startTime%>">
            				<br/><br/>End Time(01-Jan-2000 11:44:55):<input type="text" name="endTime" value="<%=endTime%>">
            				<br/><br/>Source Endpoint
            				<select name="sourceEndpoint">
            				  <option value="All">All</option>
            				  <%
						    EPMEngine epmEngine = new EPMEngine();

						    TreeMap alertData = epmEngine.getEndpointDetails();

						    for (Iterator iterator = alertData.keySet().iterator(); iterator
											.hasNext();) {
							Long endpointId = (Long) iterator.next();
							String endpointDesc = (String) alertData.get(endpointId);
							
					%>
						<option value="<%=endpointId%>"><%=endpointDesc%></option>			
					<%
						    }
					%>
					
					</select>
					  
					<br/><br/>Target Endpoint
						<select name="targetEndpoint">
						  <option value="All">All</option>
						  <%
							    EPMEngine epmEngine2 = new EPMEngine();

							    TreeMap alertData2 = epmEngine2.getEndpointDetails();

							    for (Iterator iterator = alertData2.keySet().iterator(); iterator
												.hasNext();) {
								Long endpointId = (Long) iterator.next();
								String endpointDesc = (String) alertData2.get(endpointId);

							%>
								<option value="<%=endpointId%>"><%=endpointDesc%></option>			
							<%
								    }
						    %>
						</select>
            				<br/><input type="submit" value="Submit">
            				</form>

                        <%
                        
                        %>
                        
                    </ul> <!-- END TREE MENU -->
                </div>

                <div id="IPHeader">

                </div>
               
                 
                <div id="graph">
          
                </div>
                               

            </div>
        </div>
        <div id="footer">
            &nbsp;
            	    <b>EPM Search</b>
            	    
        </div>
        <jsp:include page="Back.jsp"/>
        <p id="results">
	</p>
        
        <pre>
        </pre>
	
	<pre>
	
	</pre>
            
	<script>
		    	loadOverview('<%=startTime%>', '<%=endTime%>', '<%=sourceEndpoint%>', '<%=targetEndpoint%>');		    	
        </script>
        
        
        
            	<script src="http://localhost:8080/EPMWebapp/boomerang-rt-0.9.1302304593.js" type="text/javascript"></script>
		    	    <script type='text/javascript'>
		    	    BOOMR.init({
		    	    		user_ip: 'localhost',
		    	    		beacon_url: "http://localhost:8080/EPMWebapp/jsp/BoomerangBeacon.jsp",
		    	    		BW: {
						base_url: 'http://localhost/'				
					}	    	    		
		    	    	});
		    	    	
	    	</script>
	   	

        
    </body>
    
    
</html>
