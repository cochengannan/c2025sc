<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.Date"  errorPage="../errorpage.jsp"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Basic Information</title>
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<script language="JavaScript" src="../js/csc.js"></script>     

<script language="JavaScript" src="../js/entry_help.js"></script>  
<script language="JavaScript" src="../js/cellcreate.js"></script>
 
</head>
 
<body>
<%@ include file="../head.jsp"%>
<div id="inner">
<table align="center" border=1 width="872" cellpadding="4" cellspacing="0" bordercolor="skyblue" style="border-collapse: collapse;">  
<tr  bgcolor="skyblue"> 
   
		<td align="center" colspan="2">
			 
				 
					<p align="center"><font color=black>Basic Information </font></p>
			 
			 
		</td> 
		</tr> 
		<tr>
</tr>
 <tr>
	<td valign="top" align="left" colspan="2"><a href="javascript:history.go(-1)"><font size=2 color='red'>Back</font></a></td>
</tr>
<tr>
	<td>&nbsp;</td><td valign="top" align="left">1.<font size=3 color='red'><b>if No DOB Give - 1/1/2012</b></font></td>
</tr>
<tr>
	<td width=10%>&nbsp;</td><td valign="top" align="left">2.<font size=3 color='red'><b>Don't add ',' in door Filed of Information Sheet</b></font></td>
</tr>

<tr>
	<td>&nbsp;</td><td valign="top" align="left">3.<font size=3 color='red'><b>if Entered Student Name ,Father Name,Street Name ,Nagar Not in Filter List,it will Add Automatically 
	if you want reflect please restart your Web Server... 
	</b></font></td> 
</tr> <tr>
	<td valign="top" align="left" colspan="2"><a href="javascript:history.go(-1)"><font size=2 color='red'>Back</font></a></td>
</tr>
</table>
</div>
		  

</body>
</html>