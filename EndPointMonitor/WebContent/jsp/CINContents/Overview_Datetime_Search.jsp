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
        <SCRIPT LANGUAGE="Javascript" SRC="../scripts/FusionCharts.js"></SCRIPT> 
        <script type='text/javascript' src='../scripts/jquery.js'></script>
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

		response.setIntHeader("Refresh", 3);
		String startTime = request.getParameter("startTime");
            	String endTime = request.getParameter("endTime");
            	
            	String sourceEndpoint = request.getParameter("sourceEndpoint");
            	String targetEndpoint = request.getParameter("targetEndpoint");
            	
            	System.out.println("In Overview "+startTime);
            	System.out.println("In Overview "+endTime);
		
        	
            String graphHead = "<chart  "
		+ " caption='Endpoint Response Times (" + startTime + " - " + endTime + ")'"
		+ " yAxisName='Response Time'  "
		+ " bgColor='F7F7F7, E9E9E9'  "
		+ " numVDivLines='10'  "
		+ " divLineAlpha='30'   "
		+ " labelPadding ='10'  "
		+ " yAxisValuesPadding ='10'  "
		+ " showValues='0'  "
		+ " rotateValues='1'   "
		+ " yAxisMinValue='0' "
		+ " yAxisMaxValue='10000' "
		+ " valuePosition='Below'  "
		+ " connectNullData='1'  "		
		+ " canvaspadding='10'> ";

	    EPMEngine epmEngine = new EPMEngine();
            Map allResponsTimes = epmEngine.getAllResponseTimesNewLogic(startTime,endTime,sourceEndpoint,targetEndpoint);
	    Map mapOfInteractionAndStats = epmEngine.getStatsInPlotFormat();
	    
	    List tsList = (List) allResponsTimes.get("pointsInXAxis");
			
            String categories = " <categories> ";
            for (int l = 0; l < tsList.size(); l++) {
                categories += " <category label='" + tsList.get(l) + "' />";

            }
            categories += " </categories> ";

            String data = "";
            
            for (Iterator itr = allResponsTimes.keySet().iterator(); itr.hasNext() ; ) {
                String key = (String) itr.next();
                List rtList = ((List) allResponsTimes.get(key));
                String color = (String) rtList.get(0);
                if(key.startsWith("EP_")){
                	data += " <dataset "
                            + " seriesName='"+key+"' "
                            + " color='#"+color+"' >";    	
                	
	                for (int l = 0; l < rtList.size()-1; l++) {
	                    String rt = (String) rtList.get(l+1);
	                    data += " <set value='" + rt + "' />";	                    
	                }
	
			data += " </dataset> ";
			//TODO: pcapca Add stats as toolText.......
			/*
			data += " <dataset "
				    + " seriesName='"+key+"' "
				    + " color='#"+color+"' >";    	
				String stats = (String) mapOfInteractionAndStats.get(key);
				for (int l = 0; l < rtList.size()-1; l++) {
				    data += " <set toolText='" + stats + "' />";                   
				}

			data += " </dataset> ";
			*/
                }
            }

            
            
            data += " </chart> ";
            
            //System.out.println(graphHead + categories + data);

        %>

        <div id="chart1div" style="width: 100%; height: 100%;">
            Chart Data Corrupted
        </div>

        <script id="plot">
            
            <%
                out.println("var strXML =\"" + graphHead + categories + data + "\"");
            %>
                var chart1 = new FusionCharts("Charts/MSLine.swf", "chart1Id", "100%", "100%");
                chart1.setDataXML(strXML);
                chart1.render("chart1div");
        </script>



    </body>
</html>
