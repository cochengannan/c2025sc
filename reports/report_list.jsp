<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"  errorPage="../errorpage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="csc.Controller,java.sql.*"%><html>
<head>
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<script language="JavaScript" src="../js/csc.js"></script>
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
</head>
<body> <center>
<%@ include file="../commdiv.jsp"%> 
 <div id="inner"  class="newcls">
<br><br><br><br><br><br><br><br><br>
<div id="menudiv"><ul id="css3menu1" style="width: 100%" >
				<li><a href='../home.jsp'>Home</a></li>
				<li> <a href='../reports/rprt.jsp'>Report</a></li>
				<li><a href="../logout.jsp">Logout</a></li>
			</ul>
	 </div>
 
<table align="center" border="1" width="890" class="newtab">
	 <tr>	
		<td align="left"><a href="excel_report_gen.jsp?flag=1">Exam Attend List</a> </td>
	</tr>
	<tr>	
		<td align="left"><a href="excel_report_gen.jsp?flag=2">+2 Record (OverAll)</a> </td>
	</tr>
	<tr>	
		<td align="left"><a href="excel_report_gen.jsp?flag=3">10th Record (OverAll) - </a> </td>
	</tr>
	<tr>	
		<td align="left"><a href="excel_report_gen.jsp?flag=4">Direct</a> </td>
	</tr>
	<tr>	
		<td align="left"><a href="excel_report_gen.jsp?flag=7">Scholarship</a> </td>
	</tr>
	<tr>	
		<td align="left"><a href="excel_report_gen.jsp?flag=8">Exam Time </a> </td>
	</tr>
		<tr>	
		<td align="left"><a href="excel_report_gen.jsp?flag=9">75% </a> </td>
	</tr>
		<tr>	
		<td align="left"><a href="excel_report_gen.jsp?flag=10">60%</a> </td>
	</tr>
	<tr>	
		<td align="left"><a href="excel_report_gen.jsp?flag=11">50% </a> </td>
	</tr>
	<tr>	
		<td align="left"><a href="excel_report_gen.jsp?flag=12">Direct (for sms) </a> </td>
	</tr>
	<tr>	
		<td align="left"><a href="excel_report_gen.jsp?flag=13">Cscian (for sms) </a> </td>
	</tr>
	<tr>	
		<td align="left"><a href="excel_report_gen.jsp?flag=15">Paper (for sms) </a> </td>
	</tr>
	<tr>	
		<td align="left"><a href="excel_report_gen.jsp?flag=16">Others (for sms) </a> </td>
	</tr>
	<tr>	
		<td align="left"><a href="excel_report_gen.jsp?flag=17">Enquiry (for sms) </a> </td>
	</tr>
</table>  
</div></center>
</body>
</html>