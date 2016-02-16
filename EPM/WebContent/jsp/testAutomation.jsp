<%@page import="org.apache.catalina.connector.InputBuffer"%>
<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*"  %>
<%@ page import="java.io.FileReader"  %>
    
    
    
    
 

<%


	File f = new File("F:\\Avekshaa Technologies\\Rel_Jio\\Utilities\\Java_Utilities\\scripts.txt");
	BufferedReader readScriptNames = new BufferedReader(new FileReader(f));
	String line ;
	ArrayList<String> list = new ArrayList<String>();
	
	while ((line = readScriptNames.readLine()) != null)
	{	
		//System.out.println (line);
		list.add(line);
	}
	readScriptNames.close();



  // Create an ArrayList with test data
  
    pageContext.setAttribute("test_list", list);
  
  
  
  int listLength = list.size();
  System.out.println("JSP Size:"+listLength);
  //request.setAttribute("scriptListLength",listLength);
 // session.setAttribute("listLength",list.size());
 

  
%>




<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles/layout.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

<title>testAutomation</title>
<script>


function test(arr)
{
	
	// alert("in Function");
	
	
	//NUll validation;
	
	var testName=document.forms["schedulerInput"]["testNameTxt"].value;
	var vUser=document.forms["schedulerInput"]["virtualUserTxt"].value;
	var arrRate=document.forms["schedulerInput"]["arrivalRateTxt"].value;
	
	var HH=document.forms["schedulerInput"]["testDurationHH"].value;
	var MM=document.forms["schedulerInput"]["testDurationMM"].value;
	var SS=document.forms["schedulerInput"]["testDurationSS"].value;
	
	
	
	if (testName==null||testName==""||vUser==null||vUser==""||arrRate==null||arrRate==""||HH==null||HH==""||MM==null||MM==""||SS==null||SS=="")
	{
	
	alert("*Mandate field can't be left blank!!");
	
	}
	else 
		{
			 if (vUser != /0-9/ )
			{
				alert("Invalid vUser!!");	 
			}
			 
			if (HH != /0-9/) 
			 {
				 alert("Invalid Duration!!");
			
			 } 
			
			if (MM != /0-9/) 
			 {
				 alert("Invalid Duration!!");
			
			 } 
			
			if (SS != /0-9/) 
			 {
				 alert("Invalid Duration!!");
			
			 } 
			 
			if (arrRate != /0-9/) 
			 {
				 alert("Invalid Arrival Rate !!");
			
			 } 
				 
		
		
		}
	
	
	
	
	var arrchecked=[];
	var checkbx = document.getElementsByName("testScriptsName");
	
	for (var i=0;i<checkbx.length;i++)
		{
		
			if (checkbx[i].checked)
				{
				
					//alert(checkbx[i].value);
					arrchecked.push(checkbx[i].value);
				
				}
		
		
		}
	
	
	var preString = "prob";
	var probTotal = 0;
	
	
	if (arrchecked.length > 0)
	
	{
		
	
	for (var j=0;j<arrchecked.length;j++)
	{
			
		
			var perc_txBx_checked = preString.concat(arrchecked[j]);
			perc_txtbxValue = document.forms["schedulerInput"][perc_txBx_checked].value;
			
			probTotal = +probTotal + +perc_txtbxValue;
		
		
	}
	
	
	if (probTotal != 100)
	{
				
		alert("Kindly,Assign valid users-probability");	
		
	}
	
	}else 
		{
		
		alert("*Mandate field can't be left blank!!")	
		
		}
	
	
	
//	$("[name = 'testScriptsName']").each(function(){ alert(this.value) });
	
	
	
	
}

</script>



</head>
<body>

<!--  <h3>Oops, Page Is Under-Construction </h3> -->
<div class="automation_align_left" >


</div>


<div align="center" style="margin-top: 50px; margin-left: 100px">
<h1> Test-Automation </h1> 
</div>

<div style="width:80%; float:right">
<h3> Test-Scenario  </h3>
<hr size="2" color="grey"></hr>   
</div>



<form name="schedulerInput"  action="../Scheduler"  method="post" onsubmit="return(test())" >

<div class="automation_align_right">


 <input type="hidden" name="listLength" value="<%=listLength%>"> 
	 
		
	 		
	<table style="width:70%" >
	<tr>
	
	<td>
		Test Name : <input type="Text"  class="round_txtflds"  name="testNameTxt" placeholder="Enter Test Name " style="text-align: center" />
	</td>
	
	<td>
		Virtual User/Load : <input type="Text"  class="round_txtflds" name="virtualUserTxt" value="" placeholder="Total Vusers " style="text-align: center" />
	</td>
	
	</tr>
	
	<tr>
	</tr>
	<tr>
	
	
	<td>
		<label>Duration :&nbsp&nbsp&nbsp&nbsp</label> 
		<input type="number" class="round_txtflds" name="testDurationHH" min="00" max="12" style="width:40px;" placeholder="HH"> 
		:&nbsp<input type="number" class="round_txtflds" name="testDurationMM" min="00" max="59" style="width:40px;" placeholder="MM">
		:&nbsp<input type="number" class="round_txtflds" name="testDurationSS" min="00" max="59" style="width:40px;" placeholder="SS">
	</td>
	
	<td >
		 Arrival Rate(/sec)  : <input type="Text" class="round_txtflds" name="arrivalRateTxt" placeholder="Ex:5" style="text-align: center"/>
	</td>
	
	
	</tr>
		
		</table>
	
	</div>	


<div class=automation_align_right>
	<table style="width:65%" border="1" >
	<tr>
		<th>#</th>
		<th>Test-Scripts</th>
		<th>Users-Probability</th>
	</tr>	
	
	
<%
			
            ArrayList <String> scripts = (ArrayList<String>) pageContext.getAttribute("test_list");

            for (String scriptName : scripts) 
            {
  			%>
  			<tr>
  			 
  			   <td colspan="1"> <div align="center"> <input type="checkbox" class="round_txtflds chkbxFetch" name="testScriptsName" value="<%=scriptName%>" /> </div> </td>
				<td colspan="1"> <div align="center"><%=scriptName%> </div> </td>
  			   <td> <div align="center"><input type ="text" class="round_txtflds"  name="prob<%=scriptName%>"/> </div> 
  			    
  			  	
  			  
  			  </td>
  			  
  			 </tr>
          <%
          		
            }
          
          %>
          
        </table>
        
        
      </div>  
          
          
 	<div class="automation_align_controls"> 
 	
 	<table style="width:80%" >
 
 	<tr>
 	</tr>
 	<tr>
 	</tr>
 	<tr>
 	<tr>
	</tr>
	<tr>
		
		<td width="25%">
			</td>
			
		  <td width="25%" align="right">
         
          		<input class="myButton" type="submit" value="Submit" name="submit"> 
          		
			</td>
		
			<td width="25%" align="left">
			<input class="myButton" type="reset" value="Reset" name="reset">
			</td>
		
		
			<td width="25%">
		
			</td>
		
 	    
			
			


		</tr>
		</table>	
			          		
          
  			
	</div>






</form>


<!--     
<% 
if(request.getParameter("submit") != null)
{	
	
	
//System.out.println("val: "+request.getParameterValues("testScriptsName"));
	String chkbxSelected[] = request.getParameterValues("testScriptsName");	
	if (chkbxSelected!=null)
	{
	
		for(int i=0;i<chkbxSelected.length;i++)
		{
			System.out.println(chkbxSelected[i]);	

		}

	}
	else 
	{
		
		System.out.println("chkbxSelected is null");
	}

}

%>

-->

</div>

</body>
</html>