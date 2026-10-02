<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"  errorPage="../errorpage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*,csc.*,java.util.*,csc.excel2"%><html>  
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="./css/txtbox.css" />
<link rel="stylesheet" href="./menu/menunew_files/css3menu1/style.css" type="text/css" />
 

<body onload="textshow()" topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" bgcolor="#ffff00" onload="FP_preloadImgs(/*url*/'button29.jpg', /*url*/'button2A.jpg', /*url*/'button2C.jpg', /*url*/'button2D.jpg')">

<form action="db.jsp" method="get">
  <center> <div id="inner"  class="newcls">
	<br> 
	<br><br>
		<table border=1 align="center" width="892"  style="border-collapse:collapse; " cellpadding="0" bordercolor="skyblue" >
		<tr>
		<td colspan="2" align="center"><font size='4'>Excel Reports</font></td>
		</tr>
		<tr>
		<td colspan="2" align="right"><a href="./home.jsp">Home</a></td>
		</tr>
<%

			 try   
			{
			java.io.File fl=new java.io.File (application.getRealPath("/excel"));
	  
			if (fl.isDirectory())
			{
				
				String []ls=fl.list();    
			 
				int i=0;
				int len=ls.length;
				while (i<len)
				{%>
				<tr>
					<td  align="left"><a href="<%=request.getContextPath()%>/excel/<%=ls[i]%>"><%=ls[i]%></a> </td><td  align="left"> <a href="javascript:filedelete('<%=ls[i]%>')">Delete</td>
				</tr>		
					
				<%  
				i++;  
				}    
			}
			
			}catch(Exception e) {}	
		%>
		</table></div></center>
		</form>
</body>
</html>