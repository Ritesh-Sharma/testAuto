/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
function loadIPGraph(ip,sessionId,ipType, pageNum)
{
    loadIPHeader(sessionId,ip);
    var xmlhttp;
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange=function()
    {
        if (xmlhttp.readyState==4 && xmlhttp.status==200)
        {
            document.getElementById("graph").innerHTML=xmlhttp.responseText;
            var response = document.getElementById("graph").innerHTML;
            var s1 = response.indexOf("<script id=\"plot\">")+18;
            var s2 = response.indexOf("</script>",s1)-1;
            var scr = response.substring(s1,s2);
            eval(scr);
        }
    };

    xmlhttp.open("GET","CINContents/IpGraph.jsp?id=" + sessionId+"&ip="+ip+"&ipType="+ipType+"&pageNum="+pageNum,true);
    xmlhttp.send();
}

function loadOverview(startTime, endTime, sourceEndpoint, targetEndpoint)
{
    loadIPHeader(startTime,'overview');
    var xmlhttp;
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange=function()
    {
        if (xmlhttp.readyState==4 && xmlhttp.status==200)
        {
            document.getElementById("graph").innerHTML=xmlhttp.responseText;
            var response = document.getElementById("graph").innerHTML;
            var s2 = response.indexOf("<script id=\"plot\">")+18;
            var s3 = response.indexOf("</script>",s2)-1;
            var scr = response.substring(s2,s3);
            eval(scr);
        }
    }
    if (startTime==null || startTime=="")
    {
		xmlhttp.open("GET","CINContents/Overview.jsp?startTime=" + startTime + "&endTime=" + endTime,true);
	}
	else
	{
		xmlhttp.open("GET","CINContents/Overview_Datetime_Search.jsp?startTime=" + startTime + "&endTime=" + endTime
										+ "&sourceEndpoint=" + sourceEndpoint+ "&targetEndpoint=" + targetEndpoint,true);
	}

    xmlhttp.send();
}
function loadIPHeader(sessionId,ip)
{

    var xmlhttp;
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange=function()
    {
        if (xmlhttp.readyState==4 && xmlhttp.status==200)
        {
            document.getElementById("IPHeader").innerHTML=xmlhttp.responseText;
            var response = document.getElementById("graph").innerHTML;
            var s2 = response.indexOf("<script id=\"plot\">")+18;
            var s3 = response.indexOf("</script>",s2)-1;
            var scr = response.substring(s2,s3);
            eval(scr);
        }
    }
    xmlhttp.open("GET","CINContents/IPHeader.jsp?id=" + sessionId+"&ip="+ip,true);
    xmlhttp.send();
}

$(document).ready(function() {
    // call the OverView plugin
    loadOverview(sessionId);
});