<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.Calendar,java.util.Date"%> 
<%@page import="java.text.SimpleDateFormat"%> 

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <style type="text/css">
 
 #apDiv5 {
	 position:absolute;
	left:0px;
	top:0px;
	width:75%; 
	height:10%;
	 
	   
}  
  #apDiv6 {
	 	position:absolute;
 		z-index:3;
	top:835px;
	width:75%;
	left:120px;
	 
}
#thead {
	position:absolute;
	left:50px;
	top:120px;
	width:75%;
	height:110px;
	z-index:3;
}
.box-shadow {
      font-family: cursive, sans-serif;      
      
      padding: 2px;
      border-radius: 4px;
      box-shadow: 2px 2px 20px 23px #7AC5CD;
	  
    }
body {
 
    background-repeat: no-repeat;
    background-size: 1600px 900px;
    background-image: url('../sky2.jpg');
}
 </style>
</head>
<body>
 <%
	Calendar cal = Calendar.getInstance();
	int mm = cal.get(Calendar.MONTH) + 1;
	int dd = cal.get(Calendar.DAY_OF_MONTH);
	int yy = cal.get(Calendar.YEAR);
	String date = dd + "/" + mm + "/" + yy;
	
	SimpleDateFormat d=new SimpleDateFormat("dd/MM/yyyy HH:MM:SS");
	 String uname="",ccode="",ccname="";
	 try {
			csc.Controller obj2 = new csc.Controller();
			HttpSession session3 = request.getSession(true);
			
			uname= obj2.isNull((String) session3.getAttribute("uname"),1);
			ccode= obj2.isNull((String) session3.getAttribute("ccode"),1);
			
			ccname=obj2.getValue("clist","cname"," where sno="+ccode);
	 }catch(Exception e)
	 {
		 
		 System.out.println("e"+e);
	 }
 %>  
<table width="77%" class="box-shadow"   border="0" align="center" bgcolor="#FFFFFF" style='line-height: 2px'  >
<tr>
	<td width="15%"  height="50"  class="style2"  valign="middle"><h2 align="left"><img src="../images/CSC Logo.PNG" border="0" width="141" height="40" alt="" /></h2></td>
    <td  height="20%"><h3 align="right"  style="color:white">CSC Computer Education (P) Ltd</h3>
    	<p align="right"><font size="1" ><b><%=ccname%> , <%=uname %>&nbsp;&nbsp;<label id='dt'></label></font></p>
    </td>
 </tr>
</table>
</body>
<script type="text/javascript">

function date1()
{
	 
	var d=new Date();
	dt.innerHTML=d.getDay()+"/"+(d.getMonth()+1)+"/"+d.getFullYear()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
	setTimeout("date1load()",600);
}

function date1load()
{
	
	var d=new Date();
	 
	dt.innerHTML=d.getDay()+"/"+(d.getMonth()+1)+"/"+d.getFullYear()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
	 
	setTimeout("date1()",600);
}
 
 date1load() ;

</script>
</html>