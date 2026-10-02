var http_data = "";
function help_fun(code) {
	 
	 
			this.http_data = createObject();
			var btc = document.getElementById("btc").value;
			var slno = document.getElementById("sno").value;
			var url = "./../data?process="+code+ "&btc="+btc+"&slno="+slno+"&a="+Math.random();
			
			this.http_data.open("GET", url, true);	       
			this.http_data.onreadystatechange = function() {   
				help_process_fun(http_data);
			}
			http_data.send(null);   
	 
}
function help_process_fun(xmlobj) {

	if (xmlobj.readyState == 4) {  

		if (xmlobj.status == 200) 
		{
			help_result_fun(xmlobj);  
		}
	}
}  

function help_result_fun(xmlobj)
{
	var bR = xmlobj.responseXML.getElementsByTagName("response")[0];
	 
	  
	var xmlobj2=xmlobj;
	var bR = xmlobj2.responseXML.getElementsByTagName("response")[0];
	  
	var count= bR.getElementsByTagName("count")[0].firstChild.nodeValue;
	 
	 if (count==1)      
	 {
			var type = bR.getElementsByTagName("type")[0].firstChild.nodeValue;
			var cont = "<table><tr>";
			var sc = bR.getElementsByTagName("sc")[0].firstChild.nodeValue;
			var class_ = bR.getElementsByTagName("class_")[0].firstChild.nodeValue;
			var aflag= bR.getElementsByTagName("aflag")[0].firstChild.nodeValue;
		     
			 
					if (type=="Q")   
					{  
		
						cont += "<td  class='tdText' width='15%'>&nbsp;School : </td>";
						cont += "<td class='tdText'>" + sc + "</td>";
						cont += "<td  class='tdText' width='15%'>&nbsp;Class : </td>";
						cont += "<td class='tdText'>" + class_ + "</td>";
						 
					} else {
						cont += "<td  class='tdText' width='15%'>&nbsp;Type : </td>";
						cont += "<td class='tdText'>" + type + "</td>";
						cont += "<td  class='tdText' width='15%'>&nbsp;Qualification : </td>";
						cont += "<td class='tdText'>" + class_ + "</td>";
		
					}   
					
			cont+= "</tr></table>";
			var hhtno= bR.getElementsByTagName("htno")[0].firstChild.nodeValue;
			document.getElementById("sexd").innerHTML= bR.getElementsByTagName("sexd")[0].firstChild.nodeValue;  
			document.getElementById("htno").innerHTML="<font color='darkred'><b>"+hhtno+"</b></font>"; 
			document.getElementById("ehtno").value=hhtno;
			document.getElementById("sname").innerHTML= "<font color='darkred'><b>"+bR.getElementsByTagName("name1")[0].firstChild.nodeValue+"</b></font>"; 
			
			document.getElementById("sexd").innerHTML= bR.getElementsByTagName("sexd")[0].firstChild.nodeValue;
			document.getElementById("fname").innerHTML= bR.getElementsByTagName("name2")[0].firstChild.nodeValue;
			document.getElementById("address").innerHTML= bR.getElementsByTagName("addr1")[0].firstChild.nodeValue+
			",<br>"+bR.getElementsByTagName("addr2")[0].firstChild.nodeValue+
			",<br>"+bR.getElementsByTagName("addr3")[0].firstChild.nodeValue+
			",<br> "+bR.getElementsByTagName("addr4")[0].firstChild.nodeValue+
			" - "+bR.getElementsByTagName("pincode")[0].firstChild.nodeValue;
			
			document.getElementById("contact").innerHTML=bR.getElementsByTagName("phone")[0].firstChild.nodeValue+
			" , "+bR.getElementsByTagName("mobile1")[0].firstChild.nodeValue+
			" , "+bR.getElementsByTagName("mobile2")[0].firstChild.nodeValue;
			 document.getElementById('mark').focus();
		 if (aflag==1)
		 {
			 alert("Mark Already Entered !........");
			 document.getElementById("mflag").value=1;
			 document.getElementById("sexd").innerHTML=""; 
			 document.getElementById("row").innerHTML="";
			 document.getElementById("sname").innerHTML="";
			 document.getElementById("fname").innerHTML="";
			 document.getElementById("address").innerHTML="";
			 document.getElementById("contact").innerHTML=""; 
			 document.getElementById('sno').focus();
			 document.getElementById('sno').value="";	  
			 try
			 {
			 document.getElementById("st").innerHTML="";	
			 document.getElementById("flag").value=1;
			 }catch(e) 
			 {
			 alert(e)
			 }  
		 }else    
		 {
				 document.getElementById("mflag").value=0;
		 }
	 }  
	 else
	 {
		     alert("Data Not Found");
		 	document.getElementById("sexd").innerHTML=""; 
			document.getElementById("row").innerHTML="";
			document.getElementById("sname").innerHTML="";
			document.getElementById("fname").innerHTML="";
			document.getElementById("address").innerHTML="";
			document.getElementById("contact").innerHTML="";		 
			document.getElementById('sno').focus();
			document.getElementById('sno').value="";			
			try
			{
				document.getElementById("st").innerHTML="";	
				document.getElementById("flag").value=1;				 
			}catch(e) {}
	 }
}
function key_pass(event, current, next) 
{
	var ck = 0;
	var s = event.keyCode;
	 if (s==38)
	 {
		 sel(event,next);
	 }else if (s == 13 || s==9) 
	 {	  
		ck = empty(current);
		if (ck == 2)  
		{ 
			 document.getElementById(current).focus();						
			 alert("Please Enter the value");
		}	
		else 
		{	
			  document.getElementById(next).focus();
		}
	 }
}
function empty(current) {
	var r = 0;
	 
	try {

		var v = document.getElementById(current).value;
 
		if (v == "" || v == "") {
			r = 2;
			document.getElementById("flag").value = 1;
		} else {
			r = 1;
			document.getElementById("flag").value = 0;
		}
	} catch (e) {
		
	}
	return r;

}
function next(e)
{
	var s = e.keyCode;
	var flag_test=1;
	
	  
	if (s == 13) 
	{  
		document.getElementById('but').focus();  
	}
}

function mark_entry_fun() {
	 
	var s = event.keyCode;
	var flag_test=1;
	
	
	if (s == 13 || s==9) 
	{  
			http_data = createObject();
		 
			var htno=document.getElementById("ehtno").value
			var url = "./../data?process=14&htno="+htno;
			http_data.open("GET", url, true);	       
			http_data.onreadystatechange = function() {   
				data_fun(http_data);
			}
			http_data.send(null);  
	}

}
function data_funl(xmlobj) {

	if (xmlobj.readyState == 4) {  

		if (xmlobj.status == 200) 
		{
			help_result_fun(xmlobj);  
		}
	}
}  


function data_store(process,event)
{
	var s = event.keyCode;
	var flag = document.getElementById("mflag").value;

	if (s == 13 || s==9) 
	{
		    
		if (flag==0)
		{
				http_data = createObject();
				var mark = document.getElementById("mark").value;
				if (mark <= 25 )
				{
						var course = document.getElementById("CourseName").value;
						var htno = document.getElementById("ehtno").value;
						var url = "./../viewserv?no=0&option=" + process+"&mark="+mark+"&course="+course+"&htno="+htno+"&a="+Math.random();
						
						http_data.open("GET", url, true);	       
						http_data.onreadystatechange = function() {   
							data_store_process_fun2(http_data);
						}
						http_data.send(null);
							alert(" Successfully stored "); 
				}
				else
				{
					 alert("Max Mark is 25 ! Sorry ");
					 document.getElementById('mark').focus();
					
				}
		}else
		{
			
			alert("Not allowed to Mark Entry");
			 document.getElementById('mark').focus();
			}
		  
	}
	
}
 

function data_store_process_fun2(xmlobj)
{
	if (xmlobj.readyState == 4) {  

		if (xmlobj.status == 200) 
		{
			data_store_process_fun_final(xmlobj);  
		}
	}

}
function data_store_process_fun_final(xmlobj)
{
	 
	var bR = xmlobj.responseXML.getElementsByTagName("response")[0];
	var	msg = bR.getElementsByTagName("msg")[0].firstChild.nodeValue;
	var row = bR.getElementsByTagName("row")[0].firstChild.nodeValue;
	 
	document.getElementById('mark').value="";
	document.getElementById("sexd").innerHTML=""; 
	document.getElementById("row").innerHTML="";
	document.getElementById("sname").innerHTML="";
	document.getElementById("fname").innerHTML="";
	document.getElementById("address").innerHTML="";
	document.getElementById("contact").innerHTML=""; 
 	document.getElementById('sno').focus();
	document.getElementById('sno').value="";
	 
		 	
	document.getElementById("flag").value=1;
	document.getElementById("mflag").value=1;  
	
	 
	 
	 markdview(11);
}