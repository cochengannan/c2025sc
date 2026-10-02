<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="csc.Controller,java.sql.*"  errorPage="../errorpage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
		<head>
		 <title>Welcome To CSC : Question Match</title>
		<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
		<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
		<script language="JavaScript" src="../js/csc.js"></script>
		<script language="JavaScript" src="../js/cellcreate.js"></script>
		</head>
<body>

<form action="../dbprocess/question_match_a.jsp" method="post" >
<%@ include file="../head.jsp"%>
<div id="inner">
<table bordercolor="skyblue" cellspacing="0" width="872" cellpadding="5"
	align="center" border="1" class="dvfont">
	<tr>
		<td colspan="6" align="center">Subject Master</td>
	</tr>
	<tr> <td width="20%">Question Code </td><td><input type="Text" id="qcode" name="qcode" class="tb0"></td> </tr>
	<tr>
	<td colspan="2">
	<table border=1>
	<%
		int r=0;
		for (int i=1;i<=4;i++)
		{
			
			out.println("<tr>");
			for (int j=1;j<=5;j++)
			{
				r++;
				out.println("<td>"+r+"</td><td><input type='text' name='t"+r+"' class='tb0' maxlength='1' onKeyDown=key_pass(event,'t"+r+"','t"+(r+1)+"')></tr>");
				
			}
			out.println("</tr>");  
		}
	%> 
	<tr>
	<td colspan="5"><input type="Submit" class="fb2" value="Submit"> </td>
	</tr>
	</table>
	</td>
	 
	</tr>  
</table>
</div>
 
 <input type="hidden" id="flag" name="flag" value="0">
</form>

<%



%>
</body>
</html>