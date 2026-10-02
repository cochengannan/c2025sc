var http = createObject();
   
function createObject()
{	    
	try
	{
		var xmlhttp;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		return xmlhttp;

	}catch(e)
	{
		alert("XML Object Not Created\n--------------------------")
	}
	
}
function by_batch(batchname1, seatno)
{
		
		var batchname=document.getElementById(batchname1).value;
		url = "../process/awardajax.jsp?process=1&batchname='" + batchname + "'&seatno=" + seatno.value;
		
		http.open("GET", url, true);	 
		http.onreadystatechange = function()
		{
			by_batchprocess();
		}
		http.send(null);  
	 
}    

function by_batchprocess()
{
	try {
		 
		if (xmlobj.readyState == 4) {
		 
			if (xmlobj.status == 200) {

				results = xmlobj.responseText.split("|");
				var count=results[0];
				
				 if (count==1)      
				 {
						var type = results[5];
						var cont = "<table align='left' border=1 cellpadding='0' width='100%' style='border-color: skyblue; border-collapse: collapse'><tr>";
						var sc = results[4]; 
						var class_ = results[18];
						if (type=="Q")   
						{  
		
							cont += "<td  class='tdText' width='15%'>&nbsp;School : </td>";
							cont += "<td class='tdText'>" + sc + "</td>";
							cont += "<td  class='tdText' width='15%'>&nbsp;Class : </td>";
							cont += "<td class='tdText'>" + class_ + "</td>";
							 
						} else {  
							cont += "<td  class='tdText' width='5%'>Type:</td>";
							cont += "<td class='tdText' width='5%'>" + type + "</td>";
							cont += "<td  class='tdText' width='15%'>&nbsp;Qualification : </td>";
							cont += "<td class='tdText' width='15%'>" + class_ + "</td>";
		
						}    
						cont+= "</tr></table>";
						
						document.getElementById("sexd").innerHTML=results[3]; 
						document.getElementById("row").innerHTML=cont;
						document.getElementById("sname").innerHTML=results[1];
						document.getElementById("fname").innerHTML=results[2];
						document.getElementById("address").innerHTML=results[6]+","+results[7]+","+results[8]+"-"+results[9];
						document.getElementById("contact").innerHTML=results[11]+"-"+results[12]+"-"+results[13];
						try
						 {
							 document.getElementById("flag").value=0;
							     
							 
							 document.getElementById('savebutton').focus();
						 }catch(e) {  }  
						
						
				 } else
				 {
					 alert("Data Not Found");
					 	document.getElementById("sexd").innerHTML=""; 
						document.getElementById("row").innerHTML="";
						document.getElementById("sname").innerHTML="";
						document.getElementById("fname").innerHTML="";
						document.getElementById("address").innerHTML="";
						document.getElementById("contact").innerHTML=""; 
						 
						 document.getElementById('htno').focus();
						 document.getElementById('htno').value="";
						
						 try
						 {
							 document.getElementById("st").innerHTML="";	
							 document.getElementById("flag").value=1;
							 
						 }catch(e) {}
				 }
			} 	
						
						
						
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
			}
		 
	}catch(e) 
	{
		
		
		
	}
	
}
 