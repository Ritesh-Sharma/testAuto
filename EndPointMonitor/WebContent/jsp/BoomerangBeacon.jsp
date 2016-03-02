<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    	
        <title>Beacon Report</title>
    </head>
    <body onload="extract_boomerang_data()">
        
        <div id="wrap">
            <div id="header">
                &nbsp;
                <b>Endpoint Monitor</b>
            </div>
        </div>
        
        <%
        	String startTime = request.getParameter("t_done");
        	System.out.println("beacon load time is "+startTime);
        %>
            
             
        <p id="results">
	</p>
        
           	
	
        
    </body>
    
    
</html>
