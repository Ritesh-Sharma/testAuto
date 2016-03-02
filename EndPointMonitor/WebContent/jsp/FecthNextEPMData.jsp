<%@page import="java.util.Iterator"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="com.avekshaa.epm.core.EPMEngine"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>    	
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style type="text/css">
            body{
                height: 100%;
                height: 100%;
                margin: 0;
                padding: 0;
                position:relative;
            }
            html{
                height: 100%;
                height: 100%;
                margin: 0;
                padding: 0;
            }
        </style>


        <title>JSP Page</title>
    </head>
    <body >
    	

        <%
		System.out.println("In FetchEPMData JSP ");
        	EPMEngine epmEngine = new EPMEngine();
        	String streamData = epmEngine.getAllResponseTimesNewLogicForStreamingGraph();
        	
        	out.print(streamData);
        	
        %>




    </body>
</html>
