<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.Calendar,java.util.Date"%> 
<%@page import="java.text.SimpleDateFormat"%><html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
 <style type="text/css">
 
#theadn1
{
	position:absolute;
	left:110px;
	top:120px;
	width:100%;
	height:110px;
	z-index:3;
}
   #apDiv5 {
	left:10px;
	top:110px;
	height:110px; 
} 
  #apDiv61 { 
	 	position:absolute;
 		z-index:3;
	top:755px;
	width:101%; 
	height:100%; 
	
} #apDiv612 { 
	 	position:absolute;
	top:275px;
	width:101%; 
	left:190px;  
	
}
#theadn2
{
	position:absolute;
	left:210px;
	top:120px;
	width:100%;
	height:110px;
	z-index:3;
}
#thead {
	position:absolute;
	left:50px;
	top:120px;
	width:100%;
	height:120px;
	z-index:3;
}#thead2 { 
	position:absolute;
	left:50px;
	top:230px;
	width:100%;
	height:510px;
	z-index:3;
}
 .rounded-corners {
     -moz-border-radius: 10px;
    -webkit-border-radius: 10px;
    -khtml-border-radius: 10px;
    border-radius: 10px;
}
 </style>
 <link rel="stylesheet" type="text/css" href="./css/home.css" />
<link rel="stylesheet" type="text/css" href="./css/txtbox.css" />
<script type="text/javascript" src="./js/login.js"></script>
 <script type="text/javascript" src="js/cellcreate.js"></script>
<script type="text/javascript">

function set()
{
	
}
function txthide()
{
	document.getElementById("uname").value="";
}
function txthide3()
{
	 document.getElementById("password").value="";
	 
}
function txthide1()
{
	
	var v=document.getElementById("uname").value;
	if (v=="")
	document.getElementById("uname").value="Enter Your User Name";
}
function txthide2()
{
 	replaceT2(document.getElementById("password"))
  
try
{	
	var v=document.getElementById("password").value;
	var newO=document.getElementById("password");
	 
	if (v=="")    
	{
    	if (newO.type=="password")
		{
	    		document.getElementById("ps").innerHTML="";
				var txt="<input type='text'  class='tb_long' id='password' name='password' onblur='txthide2()' onclick='txthide3()'>";		
				document.getElementById("ps").innerHTML=txt;
		}
	document.getElementById("password").value="Enter Your Password";
	}
}catch(e) 
{
	 
}
}

function fls()
{  
   			document.getElementById("ps").innerHTML="";
			var txt="<input type='password' size='34'  class='tb_long' id='password'  name='password'  onblur='txthide2()' onclick='txthide3()'>";		
			document.getElementById("ps").innerHTML=txt;
			document.getElementById("password").focus=true;
	 

}
function textshow()
{
	document.getElementById("uname").value="Enter Your User Name";
	document.getElementById("password").value="Enter Your Password";
}
function cls()
{
	document.getElementById("uname").value="";
	document.getElementById("password").value="";

}
</script>
<script language="JavaScript">

function replaceT(obj) 
{
	try
	{
        var newO = document.createElement("input");
        newO.setAttribute('type', 'password');     
        newO.setAttribute('id', 'password');  
        newO.setAttribute('onblur', 'txthide2()');                   
        newO.setAttribute('onclick', 'txthide3()');
        obj.parentNode.replaceChild(newO, obj);
     }catch(e) {
     	 
     }     
    } 
function replaceT2(obj) 
{
 		  if (newO.type!="password")
        {  
			var txt=" <input type='text' class='tb_long'  id='password' name='password' onblur='txthide2()' "+"/>";		 
			document.getElementById("ps").innerHTML="";
			document.getElementById("ps").innerHTML=txt;
		}  
    }   


function cls2(a)
{
	a.value="";
}
</script>
</head> 
 
<body onload="textshow()" topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0"  >
 <%
	Calendar cal = Calendar.getInstance();
	int mm = cal.get(Calendar.MONTH) + 1;
	int dd = cal.get(Calendar.DAY_OF_MONTH);
	int yy = cal.get(Calendar.YEAR);
	String date = dd + "/" + mm + "/" + yy;
	
	SimpleDateFormat d=new SimpleDateFormat("dd/MM/yyyy HH:MM:SS");
	
 %>
<div id="apDiv5">
<table width="100%"   border="0" align="center"   >
<tr>
                    <td width="144"    ><h2 align="left"><img src="./images/CSC Logo.PNG" border="0" width="141" height="75" alt="" /></h2>
                    </td>
        <td width="100%"  ><h2 align="right">CSC Computer Education (P) Ltd</h2>
                      <p align="right"><font size="2">
                        <!-- #BeginDate format:En2a --><%=d.format( new Date())%><!-- #EndDate -->
                        </font>
        </p></td>
      </tr>
</table>
</div  > 
<div id="thead"  >
	 <Br>
	 <bR> Charity will made the poor poorest. Only Education and Employment brings them out of poverty.
			<br><strong> - T.Iyamperumal</strong><Br><sub>Founder CSC Computer Education (P) Ltd.</sub> 
</div>
 

<div id="thead2"   > <strong>About CSC:</strong> 
	<div align="center" id="list2">
		<ol id="listv">	
		
			<li><p><em>CSC is the one and only institute in the IT training industry to have completed 30 Years</em></p></li>
			<li><p><em>CSC is active in the field of Computer Literacy ,IT Training Sector,Software Development,Web Development and Placement Services.It is an ISO 9001-2008 certified company</em></p></li>
			<li><p><em>Training Partner (Various Govt Depts)</em></p> <br> 
			 <ul>
			 	<li >TAHDCO ,BSNL</li>
			 	<li>ITCOT,ICDS,MORD</li>
			 	<li>TAMCO,BC & MBC Welfare Dept</li>
			 	<li>SJARY ,PMKVY</li>
			 	<li>DDUGKY</li>
			 </ul></li>
			<li><p><em> 100% Placement Assistance*-When a student completes his/her course successfully ,CSC Computer Education's Placement Cell helps him/her with a job major software companies</em></p></li>
			<li><p><em> Largest Network in India & Abroad So far 40 Lakhs Students are benefit through CSC BrandCSC is the one and only institute in the IT training industry to have completed 30 Years</em></p></li>
		</ol>  
	</div>  
</div>
<div id="divB"  >   
   
    <div id="login"> 
      <div class="title"><h2>  LOGIN</h2> </div>
      <div class="thead"> <br><br>
                     <input type="text"  class="user" name="uname" id="uname" onclick="cls2(this)"> 
                        <input type="password"  name="password" id="password" class="pass"  onclick="cls2(this)"> 
           		<div> <button class="metal radial" onclick="login()" name="play_button" id="play_button"><i class="icon-lock"></i><font size=3>Click</font></button>
           		<div id="apDiv612"> <a href="./master/staff.jsp"> <font size=1><b><img border=0 height="15" src="./images/reghere.jpg"></b></font></a></div>
           		</div>
				
					
        </div>
      </div>
</div>

<div id="apDiv61">
				<table width="100%"   border="0" align="center"   >
                  <tr>
                   <td height="10%"  colspan="2"  >
                   <h6 align="center">Copyright © <%=yy %> iteducation.com, All Rights Reserved.<br />
                    (Pallavaram, Pammal, Chromepet)</h6>
                    </td>
             	</tr>     
</table>
</div>              
 
</body>
 
</html>