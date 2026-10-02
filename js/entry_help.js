
function help2(flag, id,input_value)
{
	  
	var http = "";
	var input_char = document.getElementById("bat").value;
	http = createObject();
	var url = "./../entry_help?input_char=" + input_char + "&option=" + flag;
	http.open("GET", url, true);	             
	http.onreadystatechange = function()
    { 
		help_process(http, flag,input_value);
	}
	http.send(null);
}

function help(flag, id,input_value)
{
	  

	var input_char = document.getElementById(id).value;
	var http2 = createObject();
	var url = "./../entry_help?input_char=" + input_char + "&option=" + flag;
	http2.open("GET", url, true);	             
	http2.onreadystatechange = function()
    { 
		help_process(http2, flag,input_value);
	}
	http2.send(null); 
}

function help_process(xmlobj, proc,input_value) { 

	if (xmlobj.readyState == 4) {

		if (xmlobj.status == 200) 
		{
			help_result(xmlobj,proc,input_value);
		}
	}
}  
function store(slno,process)
{
	var flag=0;
	
	var http4 = createObject();
	
	
	if (process==110)
	{ 
		 
		var ach=document.getElementById("ach"+slno).checked;
		var examatt=document.getElementById("examtatt"+slno).value;
		 
		var eno=document.getElementById("eno"+slno).value;
		var ech=document.getElementById("ech"+slno).checked;
		
		var ht=document.getElementById("ht"+slno).value; 
		if (eno=="" && ach==false && ech==false)
		{
			alert("Please Check the data ?");
			flag=1;
		}else
		{
			if (ech==true ) 
			{
				if (eno=="")
				{
					alert("Enter the Entrollment Number !");
					flag=1;
					ech=document.getElementById("ech"+slno).checked=false;
				}
			}
			
			var url = "./../entry_help?option="+process+"&ht="+ht+"&examatt="+examatt+"&ach="+ach+"&eno="+eno+"&ech="+ech+"";
		}
	}
	
	if (flag==0)
	{
		http4.open("GET", url, true);	             
		http4.onreadystatechange = function()
	    { 
			store_process(http4, slno,process);
		}
		http4.send(null);
	}
}
function store_process(xmlobj,row,process)
{
	var bR = xmlobj.responseXML.getElementsByTagName("response")[0];
	if (process==110)
	{
		var upsrow = bR.getElementsByTagName("upsrow")[0].firstChild.nodeValue;
		if (upsrow==1)
			document.getElementById("row"+row).style.backgroundColor='#11f1f1';
	}  

}

function help_result(xmlobj,proc,input_value)
{
	var bR = xmlobj.responseXML.getElementsByTagName("response")[0];
	if (proc==1)
	{
			var len = bR.getElementsByTagName("oldname").length;
			var hgt1 = len*15+"px";       
			document.getElementById(input_value).style.height=hgt1;    
			document.getElementById(input_value).options.length = 0;
			for (var i = 0; i < len; i++) { 
				var htno = bR.getElementsByTagName("htno")[i].firstChild.nodeValue;
				var oldname = bR.getElementsByTagName("oldname")[i].firstChild.nodeValue;
				addOption(document.getElementById(input_value), oldname, htno)
			}
	}else if (proc==2)
	{
		var len2 = bR.getElementsByTagName("nname").length;
		var hgt2 = len2*20+"px";   
		document.getElementById(input_value).style.height=hgt2;    
		document.getElementById(input_value).options.length = 0;
		for (var j = 0; j < len2; j++) 
		{ 			 
			var nname = bR.getElementsByTagName("nname")[j].firstChild.nodeValue;
			addOption(document.getElementById(input_value), nname, nname);
		}       
	}else
	if (proc==3) 
	{  
		var len3 = bR.getElementsByTagName("street").length;  
		var hgt3 = len3*20+"px"; 
		document.getElementById(input_value).style.height=hgt3;       
		document.getElementById(input_value).options.length = 0;
		for (var s = 0; s < len3; s++) 
		{   
			var street = bR.getElementsByTagName("street")[s].firstChild.nodeValue; 
			addOption(document.getElementById(input_value), street, street)  ;  
		} 
	}else
	if (proc==4) 
	{  
		var len4 = bR.getElementsByTagName("oldname").length;  
		var hgt4 = len4*20+"px"; 
		document.getElementById(input_value).style.height=hgt4;       
		document.getElementById(input_value).options.length = 0;
		for (var s1 = 0; s1 < len4; s1++)
		{   
			var oldname = bR.getElementsByTagName("oldname")[s1].firstChild.nodeValue; 
			addOption(document.getElementById(input_value), oldname, oldname)  ;    
		}   
	} else    
	if (proc==9)     
	{    
		vis('stuname_div',0);    
		var len5 = bR.getElementsByTagName("name").length;  
		var hgt4 = len5*20+"px";   
		document.getElementById(input_value).style.height=hgt4;       
		document.getElementById(input_value).options.length = 0;  
		for (var s1 = 0; s1 < len5; s1++)
		{   
			var fname = bR.getElementsByTagName("name")[s1].firstChild.nodeValue; 
			addOption(document.getElementById(input_value), fname, fname)  ;    
		} 
	}else if (proc==99)     
	{   
		
		var len4 = bR.getElementsByTagName("sname").length;
		var v="<table  border=1 bordercolor='skyblue' cellpadding='0' cellspacing='0' style='border-collapse: collapse' width='100%'>"
		v=v+"<tr  bgcolor='#ADDFFF' style='font-size: 12;font-weight: bold;text-align: center;'><td>H.T No</td><td>S.Name</td><td>F.Name</td><td>Mobile1,Mobile2</td><td>Address</td><td>Reception</td><td>Exam Attend</td><td>Award Collection</td><td>Entrolled</td><td>E.No</td></tr>";
		var Entno="",examatt="",enrolled="",award="",reception="",htno="";
		
		for (var s1 = 0; s1 < len4; s1++)
		{
			
			Entno=bR.getElementsByTagName("Entno")[s1].firstChild.nodeValue;
			reception=bR.getElementsByTagName("reception")[s1].firstChild.nodeValue;
			
			if (Entno=="0") Entno=""; 
			
			if (reception=="Y") reception=" Yes"; else reception="No";
			
			
			examatt=new String(bR.getElementsByTagName("examatt")[s1].firstChild.nodeValue);
			if (examatt=="Y") examatt="Yes"; else examatt="No";
			
			
			
			award=bR.getElementsByTagName("award")[s1].firstChild.nodeValue;
			if (award=="Y") award=" checked"; else award="";
			

			enrolled=bR.getElementsByTagName("enrolled")[s1].firstChild.nodeValue;
			if (enrolled=="Y") enrolled=" checked"; else enrolled="";
			
			htno=bR.getElementsByTagName("htno")[s1].firstChild.nodeValue;
			if (s1%2==0)
			v=v+"<tr bgcolor='gray' class='tdText2' style='color: white;font-weight: bold;' id='row"+s1+"'>";
			else
			v=v+"<tr  class='tdText2' style='font-weight: bold;' id='row"+s1+"'>";
		
			v=v+"<td width='5%'><input type=hidden id='ht"+s1+"' value='"+htno+"'><font size='2'>"+htno+"</font></td>";
			v=v+"<td width='15%'><font size='2'>"+bR.getElementsByTagName("sname")[s1].firstChild.nodeValue+"</font></td>";
			v=v+"<td width='15%'>"+bR.getElementsByTagName("fname")[s1].firstChild.nodeValue+"</td>";
			v=v+"<td width='5%'>"+bR.getElementsByTagName("mobile1")[s1].firstChild.nodeValue+"";
			v=v+"&nbsp;,&nbsp;"+bR.getElementsByTagName("mobile2")[s1].firstChild.nodeValue+"</td><td>";
			v=v+bR.getElementsByTagName("doorno")[s1].firstChild.nodeValue+",";
			v=v+" "+bR.getElementsByTagName("add1")[s1].firstChild.nodeValue+",";
			v=v+","+bR.getElementsByTagName("add2")[s1].firstChild.nodeValue+"";
			v=v+","+bR.getElementsByTagName("area")[s1].firstChild.nodeValue+"</td>";
			v=v+"<td align='center'>"+reception+"</td><td align='center'><input type=hidden id='examtatt"+s1+"' value="+examatt+">"+examatt+"</td><td  align='center'><input type=checkbox id='ach"+s1+"' "+award+"></td><td  align='center'><input type=checkbox id='ech"+s1+"' "+enrolled+"></td><td  align='center'><input class='tb2' maxlength=4 type=text id='eno"+s1+"' value="+Entno+"></td><td  align='center'><input class='tb2' value='Store' maxlength=4 type=button id='sub"+s1+"' onclick='store("+s1+",110)'></td>"
			v=v+"</tr>";
			
			
		}
		v+="</table>"
		document.getElementById("stuname_div").innerHTML=v; 
	}else if (proc==101)     
	{   
		
		var len4 = bR.getElementsByTagName("sname").length;
		var v="<table  border=1 bordercolor='skyblue' cellpadding='0' cellspacing='0' style='border-collapse: collapse' width='100%'>"
		v=v+"<tr  bgcolor='#ADDFFF' style='font-size: 12;font-weight: bold;text-align: center;'><td>H.T No</td><td>S.Name</td><td>F.Name</td><td>Mobile1,Mobile2</td><td>Address</td><td>Reception</td><td>Exam Attend</td><td>Award Collection</td><td>Entrolled</td><td>E.No</td></tr>";
		var Entno="",examatt="",enrolled="",award="",reception="",htno="";
		
		for (var s1 = 0; s1 < len4; s1++)
		{
			
			Entno=bR.getElementsByTagName("Entno")[s1].firstChild.nodeValue;
			reception=bR.getElementsByTagName("reception")[s1].firstChild.nodeValue;
			
			if (Entno=="0") Entno=""; 
			
			if (reception=="Y") reception=" Yes"; else reception="No";
			
			
			examatt=new String(bR.getElementsByTagName("examatt")[s1].firstChild.nodeValue);
			if (examatt=="Y") examatt="Yes"; else examatt="No";
			
			
			
			award=bR.getElementsByTagName("award")[s1].firstChild.nodeValue;
			if (award=="Y") award=" checked"; else award="";
			

			enrolled=bR.getElementsByTagName("enrolled")[s1].firstChild.nodeValue;
			if (enrolled=="Y") enrolled=" checked"; else enrolled="";
			
			htno=bR.getElementsByTagName("htno")[s1].firstChild.nodeValue;
			if (s1%2==0)
			v=v+"<tr bgcolor='gray' class='tdText2' style='color: white;font-weight: bold;' id='row"+s1+"'>";
			else
			v=v+"<tr  class='tdText2' style='color: white;font-weight: bold;' id='row"+s1+"'>";
		
			v=v+"<td width='5%'><input type=hidden id='ht"+s1+"' value='"+htno+"'><font size='2'>"+htno+"</font></td>";
			v=v+"<td width='15%'><font size='2'>"+bR.getElementsByTagName("sname")[s1].firstChild.nodeValue+"</font></td>";
			v=v+"<td width='15%'>"+bR.getElementsByTagName("fname")[s1].firstChild.nodeValue+"</td>";
			v=v+"<td width='5%'>"+bR.getElementsByTagName("mobile1")[s1].firstChild.nodeValue+"";
			v=v+"&nbsp;,&nbsp;"+bR.getElementsByTagName("mobile2")[s1].firstChild.nodeValue+"</td><td>";
			v=v+bR.getElementsByTagName("doorno")[s1].firstChild.nodeValue+",";
			v=v+" "+bR.getElementsByTagName("add1")[s1].firstChild.nodeValue+",";
			v=v+","+bR.getElementsByTagName("add2")[s1].firstChild.nodeValue+"";
			v=v+","+bR.getElementsByTagName("area")[s1].firstChild.nodeValue+"</td>";
			v=v+"<td align='center'>"+reception+"</td><td align='center'>"+examatt+"</td><td  align='center'><input type=checkbox id='ach"+s1+"' "+award+"></td><td  align='center'><input type=checkbox id='ech"+s1+"' "+enrolled+"></td><td  align='center'><input class='tb2' maxlength=4 type=text id='eno"+s1+"' value="+Entno+"></td><td  align='center'><input class='tb2' value='Store' maxlength=4 type=button id='sub"+s1+"' onclick='store("+s1+",110)'></td>"
			v=v+"</tr>";
		}
		v+="</table>"
		document.getElementById("stuname_div").innerHTML=v; 
	}else if (proc==100)     
	{   
		
		var len4 = bR.getElementsByTagName("sname").length;
		var v="<table  border=1 bordercolor='skyblue' cellpadding='0' cellspacing='0' style='border-collapse: collapse' width='100%'>"
		v=v+"<tr  bgcolor='#ADDFFF' style='font-size: 12;font-weight: bold;text-align: center;'><td>H.T No</td><td>S.Name</td><td>F.Name</td><td>Mobile1,Mobile2</td><td>Address</td><td>Reception</td><td>Exam Attend</td><td>Award Collection</td><td>Entrolled</td><td>E.No</td></tr>";
		var Entno="",examatt="",enrolled="",award="",reception="",htno="";
		
		for (var s1 = 0; s1 < len4; s1++)
		{
			
			Entno=bR.getElementsByTagName("Entno")[s1].firstChild.nodeValue;
			reception=bR.getElementsByTagName("reception")[s1].firstChild.nodeValue;
			
			if (Entno=="0") Entno=""; 
			
			if (reception=="Y") reception=" Yes"; else reception="No";
			
			
			examatt=new String(bR.getElementsByTagName("examatt")[s1].firstChild.nodeValue);
			if (examatt=="Y") examatt="Yes"; else examatt="No";
			
			
			
			award=bR.getElementsByTagName("award")[s1].firstChild.nodeValue;
			if (award=="Y") award=" checked"; else award="";
			

			enrolled=bR.getElementsByTagName("enrolled")[s1].firstChild.nodeValue;
			if (enrolled=="Y") enrolled=" checked"; else enrolled="";
			
			htno=bR.getElementsByTagName("htno")[s1].firstChild.nodeValue;
			if (s1%2==0)
			v=v+"<tr bgcolor='gray' class='tdText2' style='color: white;font-weight: bold;' id='row"+s1+"'>";
			else
			v=v+"<tr  class='tdText2' style='color: white;font-weight: bold;' id='row"+s1+"'>";
		
			v=v+"<td width='5%'><input type=hidden id='ht"+s1+"' value='"+htno+"'><font size='2'>"+htno+"</font></td>";
			v=v+"<td width='15%'><font size='2'>"+bR.getElementsByTagName("sname")[s1].firstChild.nodeValue+"</font></td>";
			v=v+"<td width='15%'>"+bR.getElementsByTagName("fname")[s1].firstChild.nodeValue+"</td>";
			v=v+"<td width='5%'>"+bR.getElementsByTagName("mobile1")[s1].firstChild.nodeValue+"";
			v=v+"&nbsp;,&nbsp;"+bR.getElementsByTagName("mobile2")[s1].firstChild.nodeValue+"</td><td>";
			v=v+bR.getElementsByTagName("doorno")[s1].firstChild.nodeValue+",";
			v=v+" "+bR.getElementsByTagName("add1")[s1].firstChild.nodeValue+",";
			v=v+","+bR.getElementsByTagName("add2")[s1].firstChild.nodeValue+"";
			v=v+","+bR.getElementsByTagName("area")[s1].firstChild.nodeValue+"</td>";
			v=v+"<td align='center'>"+reception+"</td><td align='center'>"+examatt+"</td><td  align='center'><input type=checkbox id='ach"+s1+"' "+award+"></td><td  align='center'><input type=checkbox id='ech"+s1+"' "+enrolled+"></td><td  align='center'><input class='tb2' maxlength=4 type=text id='eno"+s1+"' value="+Entno+"></td><td  align='center'><input class='tb2' value='Store' maxlength=4 type=button id='sub"+s1+"' onclick='store("+s1+",100)'></td>"
			v=v+"</tr>";
		}
		v+="</table>"
		document.getElementById("stuname_div").innerHTML=v; 
	}else
	if (proc==999)     
	{   
		
		var len4 = bR.getElementsByTagName("sname").length;
		var v="<table  border=1 bordercolor='skyblue' cellpadding='0' cellspacing='0' style='border-collapse: collapse' width='100%'>"
		v=v+"<tr  bgcolor='#ADDFFF' style='font-size: 12;font-weight: bold;text-align: center;'><td>H.T No</td><td>S.Name</td><td>F.Name</td><td>Mobile1,Mobile2</td><td>Address</td><td>Reception</td><td>Exam Attend</td><td>Award Collection</td><td>Entrolled</td><td>E.No</td></tr>";
		var Entno="",examatt="",enrolled="",award="",reception="",htno="";
		
		for (var s1 = 0; s1 < len4; s1++)
		{
			
			Entno=bR.getElementsByTagName("Entno")[s1].firstChild.nodeValue;
			reception=bR.getElementsByTagName("reception")[s1].firstChild.nodeValue;
			
			if (Entno=="0") Entno=""; 
			
			if (reception=="Y") reception=" Yes"; else reception="No";
			
			
			examatt=new String(bR.getElementsByTagName("examatt")[s1].firstChild.nodeValue);
			if (examatt=="Y") examatt="Yes"; else examatt="No";
			
			
			
			award=bR.getElementsByTagName("award")[s1].firstChild.nodeValue;
			if (award=="Y") award=" checked"; else award="";
			

			enrolled=bR.getElementsByTagName("enrolled")[s1].firstChild.nodeValue;
			if (enrolled=="Y") enrolled=" checked"; else enrolled="";
			
			htno=bR.getElementsByTagName("htno")[s1].firstChild.nodeValue;
			v=v+"<tr class='tdText2' id='row"+s1+"'>";
			v=v+"<td width='5%'><input type=hidden id='ht"+s1+"' value='"+htno+"'><font color='red' size='3'>"+htno+"</font></td>";
			v=v+"<td width='15%'>"+bR.getElementsByTagName("sname")[s1].firstChild.nodeValue+"</td>";
			v=v+"<td width='15%'>"+bR.getElementsByTagName("fname")[s1].firstChild.nodeValue+"</td>";
			v=v+"<td width='5%'>"+bR.getElementsByTagName("mobile1")[s1].firstChild.nodeValue+"";
			v=v+"&nbsp;,&nbsp;"+bR.getElementsByTagName("mobile2")[s1].firstChild.nodeValue+"</td><td>";
			v=v+bR.getElementsByTagName("doorno")[s1].firstChild.nodeValue+",";
			v=v+" "+bR.getElementsByTagName("add1")[s1].firstChild.nodeValue+",";
			v=v+","+bR.getElementsByTagName("add2")[s1].firstChild.nodeValue+"";
			v=v+","+bR.getElementsByTagName("area")[s1].firstChild.nodeValue+"</td>";
			v=v+"<td align='center'>"+reception+"</td><td align='center'>"+examatt+"</td><td  align='center'><input type=checkbox id='ach"+s1+"' "+award+"></td><td  align='center'><input type=checkbox id='ech"+s1+"' "+enrolled+"></td><td  align='center'><input class='tb2' maxlength=4 type=text id='eno"+s1+"' value="+Entno+"></td><td  align='center'><input class='tb2' value='Store' maxlength=4 type=button id='sub"+s1+"' onclick='store("+s1+",100)'></td>"
			v=v+"</tr>";
		}
		v+="</table>"
		document.getElementById("stuname_div").innerHTML=v; 
	}
} 

function vis(id,flag) 
{      
	try  
	{
		if (flag==1)  
		document.getElementById(id).style.visibility = 'hidden';
		else
		document.getElementById(id).style.visibility = 'visible';
	}catch(e) {}  
}
  function sel(event,nextid)
  {
	  	 var s = event.keyCode;  
		 if (s==38 || s==40 )
		 {   
			  
			 	document.getElementById(nextid).focus();      
		 }
  }
function prv(event,inputid,resultid,nextid,divid)
{
	var s = event.keyCode;
	 
	 if (s==13   )    
	 {  
		 select_value(inputid,resultid,nextid,event,divid)
	 }
}  

function select_value(inputid,resultid,nextid,event,divid)
{
	 
	var ck = 0;
	
			var val=document.getElementById(inputid).value;  
			document.getElementById(resultid).value=val;  
			vis(divid,1);  
			document.getElementById('flag').value=0;
			document.getElementById(nextid).focus();    
	  
}