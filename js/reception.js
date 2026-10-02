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
function fetch(a, value) {
   
		var htno = document.getElementById('htno').value;
		if (htno!="" && htno!=0)
		{  
			var url = "../process/ajax3.jsp?htno="+htno;
			http.open("GET", url, true);
	 		http.onreadystatechange = function() {
			fetch_process(http, a);
	 		}
	 		http.send(null);
		}
    
} 
function dview(process,event)     
{
	 
	var flag=document.getElementById("btc").value;
	var http2=createObject();    
	var btc=document.getElementById("btc").value;
	var htno="0"; 
	try
	{
		htno = document.getElementById('htno').value;
		
	}catch(e) {}
	 
	 
	
	
	var flag_2=0;
	var url = "./../viewserv?no=0&option=" + process+"&btc="+btc+"&htno="+htno+"&a="+Math.random();
	 
	if (process==6 && htno!="" && htno!="0")
	{
		var flag = document.getElementById('flag').value;
		var slno = document.getElementById('slno').value;
		var sno = document.getElementById('sno').value;
		var yes = document.getElementById('yes').value;
		var cmd = document.getElementById('savebutton').value;
		var edate= document.getElementById('edate').value;
		url+="&slno="+slno+"&sno="+sno+"&yes="+yes+"&cmd="+cmd+"&edate="+edate;   
		
		var conf=new Boolean(confirm("Confirm to Save ? "));
		if (conf==true)
		{
			flag_2=1;	
		}
		
		 
	}   
	if (process==6)
	{
		if (flag_2==1 && flag==0)
		{
			var btc_v = document.getElementById('btc').value;  
			document.getElementById("btc_v").innerHTML=btc_v;  
			http2.onreadystatechange = function() {     
			view_process(http2, htno,event,process);
			}  
			http2.open("GET", url, true);  
			http2.send(null);
	  }
	}else
	{
		var btc_v = document.getElementById('btc').value;  
		document.getElementById("btc_v").innerHTML=btc_v;  
		http2.onreadystatechange = function() {     
		view_process(http2, htno,event,process);
		}  
		http2.open("GET", url, true);  
		http2.send(null);
		
	}
}
function view_process(xmlobj,htno,event,process)
{
		var row = 0;
		try {
			 
			if (xmlobj.readyState == 4) 
			{
			 
				if (xmlobj.status == 200) 
				{
					viewfinal(xmlobj,process);

					  
				}
			}
		}catch(e) {}  
}
		
function viewfinal(xmlobj,process)
{ 
	if (process==6)
	{
		
		var bR = xmlobj.responseXML.getElementsByTagName("response")[0];
		var	msg = bR.getElementsByTagName("msg")[0].firstChild.nodeValue;
		var row = bR.getElementsByTagName("row")[0].firstChild.nodeValue;
		
		document.getElementById("sexd").innerHTML=""; 
		document.getElementById("row").innerHTML="";
		document.getElementById("sname").innerHTML="";
		document.getElementById("fname").innerHTML="";
		document.getElementById("address").innerHTML="";
		document.getElementById("contact").innerHTML=""; 
		document.getElementById('sno').value="";
		alert(msg); 
		dview(7)  ;
		try {  
		document.getElementById('htno').value="";	  
		document.getElementById('htno').focus();  
		}catch(e) {}
	}else  (process==7)
	{
	  var tbody = document.getElementById("recp");       
	  var t=0;  
	  var bR = xmlobj.responseXML.getElementsByTagName("response")[0];
	  var len = bR.getElementsByTagName("htno").length;
	 // document.getElementById('nstno').innerHTML="";
	  
	  for(t=tbody.rows.length-1;t>=0;t--){tbody.deleteRow(0);}
	  var i=0;
	  var hnew_row =  cell("TR", "", "", "mrow" + (i + 1), (i + 1), 2, "","", "", "", "", "");
	  var hhtno1_cell = cell("TD", "label", "", "","H.T No", 7, "tdText", "", "", "", "center", "", "");
	  var hname_cell = cell("TD", "label", "", "","Name", 7, "tdText", "", "", "", "center", "", "");
	  var hBname_cell = cell("TD", "label", "", "","Batch", 7, "tdText", "", "", "", "center", "", "");
	  var hSeatNo_cell = cell("TD", "label", "", "","Seat No", 7, "tdText", "", "", "", "center", "", ""); 
	  try
	  { 
	  hnew_row.appendChild(hhtno1_cell);
	  hnew_row.appendChild(hname_cell);
	  hnew_row.appendChild(hBname_cell);
	  hnew_row.appendChild(hSeatNo_cell);
	  tbody.appendChild(hnew_row);
	  var SeatNo=bR.getElementsByTagName("maxSeatNo")[0].firstChild.nodeValue;
	 // document.getElementById('nstno').innerHTML=SeatNo;  
	    
	  
	  document.getElementById('sno').value=parseInt(SeatNo);  
	  }catch(e){} 
	 
	  for (i = 0; i < len; i++) 
	  {  
			var new_row = cell("TR", "", "", "mrow" + (i + 1), (i + 1), 2, "","", "", "", "", "");
			var	htno1 = bR.getElementsByTagName("htno")[i].firstChild.nodeValue;
			var htno1_cell = cell("TD", "label", "", "",htno1, 7, "tdText", "", "", "", "left", "", "");

			var	name = bR.getElementsByTagName("name")[i].firstChild.nodeValue;
			var name_cell = cell("TD", "label", "", "",name, 7, "tdText", "", "", "", "left", "", "");

			 
			var	Bname = bR.getElementsByTagName("Bname")[i].firstChild.nodeValue;
			var Bname_cell = cell("TD", "label", "", "",Bname, 7, "tdText", "", "", "", "center", "", "");

			var	SeatNo = bR.getElementsByTagName("SeatNo")[i].firstChild.nodeValue;
			var SeatNo_cell = cell("TD", "label", "", "",SeatNo, 7, "tdText", "", "", "", "center", "", "");

			new_row.appendChild(htno1_cell);
			new_row.appendChild(name_cell);
			new_row.appendChild(Bname_cell); 
			new_row.appendChild(SeatNo_cell);   
			tbody.appendChild(new_row);  
	  }
	  document.getElementById('htno').focus();
	}
}
function validate2(process, event) 
{
	var s = event.keyCode;
	 
	if (s == 13 || s==9) 
	{  
		
		var htno=new String(document.getElementById('htno').value);
		       
		if (htno!="" &&  htno!="0")
		{ 
			var url = "../process/ajax2.jsp?no=" + htno + "&process=" + process;
			http.open("GET", url, true);
			http.onreadystatechange = function() {
				validate2_process(http, htno,event);
			}
			http.send(null);
		}else
		{
			alert("Enter the HallTicket "); 
			document.getElementById('htno').focus();
			document.getElementById("st").innerHTML="";	
			document.getElementById('htno').value="";
		}
	}
	if (s == 38)
	{
		
		document.getElementById("sno").focus();
	}
} 
  
function validate2_process(xmlobj,htno,event)
{
		var row = 0;
		try {
			 
			if (xmlobj.readyState == 4) 
			{
			 
				if (xmlobj.status == 200) 
				{
						var setvalue = "";
						results = xmlobj.responseText.split("|");
						var row = results[1];
						var p=0;
						if (row >0) 
						{
								 p=1; 
								//  msgload("Data Already Exists",1);
								 alert("Data Already Exists");
								 document.getElementById("htno").value="";    
								 document.getElementById("htno").focus();  
								 document.getElementById("err_msg").innerHTML="Data Already Exists";
								 try
								 {
									 document.getElementById("flag").value=1;
									 
								 }catch(e) {}
							 
						} else
						{
							
							var btc=document.getElementById("btc").value;
							if (btc!=0)  
							{
														fetch(1,htno);
							 // document.getElementById("err_msg").innerHTML="";
							}
							else
							{
							alert("First Select Batch ");
							
							try
							 {
								 document.getElementById("flag").value=1;
								 document.getElementById('btc').focus();
								 document.getElementById("st").innerHTML="";	    
							 }catch(e) {}  
							}
						}
						  
						   
						

					}
	
			}
		 }catch(e) {}
}


function fetch_process(xmlobj, a) {

	 
	var results = 0;

	try {

		if (xmlobj.readyState == 4) {
  
			if (xmlobj.status == 200) {
				if (parseInt(a) == 1)
				{

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

		}
	} catch (e) {
	}
}
