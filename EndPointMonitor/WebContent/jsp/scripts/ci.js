/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function popup(){
    window.open("", "mywindow1", "status=1,width=350,height=150").document.write('<p>HIIIIIIIIIIIIIIII</p>'); 
}

function changeText(id, txt){
    var a=id.firstChild.data;   
    id.firstChild.data=txt;    
    id.onclick =  function onclick() { changeText(this, a);}
    return false;
}
$(document).ready(function() { 
    // call the tablesorter plugin 
    $("#myTable").tablesorter({ 
        // sort on the first column and third column, order asc 
        sortList: [[1,1]] 
    }); 
     $("#myTable2").tablesorter({ 
        // sort on the first column and third column, order asc 
        sortList: [[1,1]] 
    }); 
        $(".slidingDiv").hide();
	$(".show_hide").show();
        $("#threadView").show();
        $('#loadingMask').fadeOut();
        
}); 




function displayDiv(id){
    
	
        if(id==threadView){
            
            $("#threadView").show();
            $("#functionView").hide();
        }
        else if(id==functionView){
            $("#threadView").hide();
            $("#functionView").show();
        }
        else{
        $(id).slideToggle();
        }
    }
