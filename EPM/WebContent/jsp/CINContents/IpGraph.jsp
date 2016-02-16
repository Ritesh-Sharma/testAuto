<%-- 
    Document   : IpGraph
    Created on : Dec 4, 2012, 3:10:58 PM
    Author     : Nitin Anuj
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.List"%>
<%@page import="com.avekshaa.net.NetAnalyzer"%>
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


        <title>Overview</title>
    </head>
    <body >
    	    	
        <%
        String pageNum ="";
        int maxNumberOfPages = 0;
        String graphHead = "";
        String ip = "";
        String sessionId = "";
        String ipType = "";
        StringBuilder categories = null;
        StringBuilder data = null;
        String styles = "";
        
        
        try{
            Class.forName("com.mysql.jdbc.Driver");//load driver

            sessionId = request.getParameter("id");
            System.out.println("Sid at IPGraph : " + sessionId);
            ip = request.getParameter("ip");
            System.out.println("IP at IPGraph : " + ip);
            ipType = request.getParameter("ipType");
            System.out.println("IPType at IPGraph : " + ipType);
            
            pageNum = request.getParameter("pageNum");
            //System.out.println("Page Number " + pageNum);

            NetAnalyzer na = NetAnalyzer.getInstance(sessionId);
            String[] states = na.getStates();
            List<String> tsList = na.getTimeStamps(sessionId, pageNum);
            maxNumberOfPages = na.getMaxNumberOfPages();
            String[] colors = na.getColors();
            graphHead = "<chart "
                    + "bgColor='E9E9E9' "
                    + " canvasBgColor ='333333'"
                    + "outCnvBaseFontColor='666666' "
                    + "caption='No. of Connections '  "
                    + "xAxisName='Time' "
                    + "yAxisName='Connections' "
                    + "numberPrefix='#' "
                    + "showLabels='1' "
                    + "showValues='0' "
                    + "plotFillAlpha='70' "
                    + "numVDivLines='10' "
                    + "showAlternateVGridColor='1' "
                    + "AlternateVGridColor='e1f5ff' "
                    + "divLineColor='e1f5ff' "
                    + "vdivLineColor='e1f5ff'  "
                    + "baseFontColor='666666' "
                    + "canvasBorderThickness='1' "
                    + "showPlotBorder='0' "
                    + "plotBorderThickness='0' "
                    + "startAngX='7' "
                    + "endAngX='7' "
                    + "startAngY='-18' "
                    + "endAngY='-18' "
                    + "zgapplot='20' "
                    + "zdepth='60' "
                    + "exeTime='2'>";


            styles = "<styles>"
                    + "<definition>"
                    + "<style name='captionFont' type='font' size='15' />"
                    + "</definition>"
                    + "<application>"
                    + "<apply toObject='caption' styles='captionfont' />"
                    + "</application>"
                    + "</styles>"
                    + "</chart>";

            categories = new StringBuilder("<categories>");
            
            for (int l = 0; l < tsList.size(); l++) {            	
            	StringBuilder categoriesLabelStartConstant = new StringBuilder("<category label='");
                StringBuilder labelEndConstant = new StringBuilder("' />");                
                categories.append(categoriesLabelStartConstant.append(tsList.get(l))).append(labelEndConstant);
                //System.out.println("pcapca-> IpGraph JSP inside categories loop ....." + tsList.get(l));

            }
            categories.append("</categories>");

            data = new StringBuilder("");

            LinkedHashMap totalConnMap = na.getTimeConnMap(ip, "total", ipType);
            data.append("<dataset "
                    + "seriesName='Total Connections' "
                    + "color='#99ccff' "
                    + "plotBorderColor='#99ccff' "
                    + "renderAs='line'>");
            for (int l = 0; l < tsList.size(); l++) {
            	StringBuilder dataLabelStartConstant = new StringBuilder("<set value='");
                StringBuilder labelEndConstant = new StringBuilder("' />");
                String conn = String.valueOf(totalConnMap.get(tsList.get(l)));
                conn = (null == conn) ? "": conn;
                //System.out.println("Total count "+ tsList.get(l) + "   :    " + conn);
				//System.out.println("pcapca-> IpGraph JSP inside dataset-TOTAL loop ....."+ conn);
                data.append(new StringBuilder("<set value='")).append( new StringBuilder(conn )) .append(  new StringBuilder("' />"));

            }
            data.append("</dataset>");

            for (int st = 0; st < states.length; st++) {
                LinkedHashMap timeConnMap = na.getTimeConnMap(ip, states[st], ipType);
                data .append( "<dataset ")
                .append( new StringBuilder("seriesName='")) .append( new StringBuilder(states[st])) .append( new StringBuilder("' "))
                .append( new StringBuilder("color='")) .append( new StringBuilder(colors[st])) .append( new StringBuilder("' "))
                .append( new StringBuilder("plotBorderColor='")) .append( new StringBuilder(colors[st])) .append( new StringBuilder("' "))
                .append( new StringBuilder("renderAs='line'>"));
                for (int l = 0; l < tsList.size(); l++) {
                    String conn = String.valueOf(timeConnMap.get(tsList.get(l)));
                    conn = (null == conn) ? "": conn;
                    //System.out.println(states[st] + " " + tsList.get(l) + "   :    " + conn);
					//System.out.println("pcapca-> IpGraph JSP inside dataset-STATE loop ....." + tsList.get(l) + "__" +conn);
                    data.append(new StringBuilder("<set value='")).append( new StringBuilder(conn )) .append(  new StringBuilder("' />"));

                }
                data .append( "</dataset>" );
            }
        }catch(Throwable ex){
        	ex.printStackTrace();    	
        }

        %>

        <div id="chart1div" style="width: 100%; height: 95%;">
            Chart Data Corrupted
        </div>
        
        
        <div id="pagination" style="width: 100%; height: 5%;">
           
           <%
					           		
                  if(Integer.valueOf(pageNum) == 1){
                  	out.println("<A>" + "&lt;&lt;Previous" + "</A>");
                  }else{
                  	out.println("<b><A href=\"#\" color=\"blue\" style=\"text-decoration:none;\" onclick=\"loadIPGraph('" + ip + "','" + sessionId + "','" + ipType + "','" + (Integer.valueOf(pageNum) - 1) + "')\">" + "&lt;&lt;Previous" + "</A></b>");
                  }
                  
                  if(Integer.valueOf(pageNum) == maxNumberOfPages){
		                    	out.println("<A>" + "Next>>" + "</A>");
		                    }else{
		                    	out.println("<b><A href=\"#\" color=\"blue\" style=\"text-decoration:none;\" onclick=\"loadIPGraph('" + ip + "','" + sessionId + "','" + ipType + "','" + (Integer.valueOf(pageNum) + 1) + "')\">" + "Next>>" + "</A></b>");
                  }
	           
            %>
           
            
        </div>
       

        <script id="plot">
            <%
                out.println("var strXML =\"" + graphHead + categories + data + styles + "\"");
            %>
                var chart1 = new FusionCharts("Charts/MSLine.swf", "chart1Id", "100%", "100%");
                chart1.setDataXML("<chart caption='Endpoint Response Times' yAxisName='Response Time' bgColor='F7F7F7, E9E9E9' numVDivLines='10' divLineAlpha='30'  labelPadding ='10' yAxisValuesPadding ='10' showValues='1' rotateValues='1'  valuePosition='Below' canvaspadding='10'> <categories> <category label='2006' /> <category label='2007' /> <category label='2008' /> <category label='2009' /> <category label='2010' /> <category label='2011' /> </categories> <dataset seriesName='Endpoint 1-2' color='A66EDD' > <set value='35' /> <set value='42' /> <set value='31' /> <set value='28' /> <set value='34' /> <set value='30' /> </dataset> <dataset seriesName='Endpoint 1-3' color='F6BD0F'> <set value='22' /> <set value='25' /> <set value='18' /> <set value='22' /> <set value='17' /> <set value='16' /> </dataset> </chart>");
                chart1.render("chart1div");
        </script>



    </body>
</html>
