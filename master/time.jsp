<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"  errorPage="../errorpage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<%@page import="csc.Controller,java.sql.*"%><html>
<head>
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<script language="JavaScript" src="../js/csc.js"></script>
<title>Welcome To CSC : Exam Time</title>
</head>
<body   onload="ld()">  
<form  action="../dbprocess/time_a.jsp" method="get" name="sch_frm">  
<%  
	Controller obj = new Controller();  
	Connection con = obj.con();
	PreparedStatement ps = con.prepareStatement("select * from [Exam Time] order by ExamTime	");
	ResultSet rs = ps.executeQuery();
	HttpSession session2 = request.getSession(true);
	String uname1 = obj.isNull((String) session2.getAttribute("uname"),1);
	if (uname1.equals("0")   )
	{
		con.close();
		response.sendRedirect("../logout.jsp");
	}	
	
%>  
<%@ include file="../commdiv3.jsp"%> 
 <div id="menudiv">
	<ul id="css3menu1" >
		<li><a href='../home.jsp'>Home</a></li>
		<li><a href='javascript:window.history.go(-1)'>Back</a></li>
		<li><a href="../logout.jsp" style="width:60px; height:16px;line-height:16px;">Logout</a></li>
	</ul>
</div>
 <div id="cdiv"> 
<table bordercolor="skyblue" cellspacing="0" width="892" cellpadding="5"   
	align="center" border="1" class="dvfont">
	<tr>
		<td colspan="4" align="center" width="20%"><font color='black' size='2'><b>Exam Time</b></font></td>
	</tr>
	<tr>
		<td align="left" width="20%"><font color='black' size='2'><b>Exam Time</b></font></td>
		<td  colspan="2"><input type=text id="time" name="time" class="tblong" onKeyDown="key_pass(event,'time','b1')"></td>
	 
		<td><table>  
					<tr>    
				<td>  
					<input type="submit" value="Store" name="b1" id="b1"  class="fb2">					
				 
				</td>
			</tr>  
			</table>  
			</td>  
	</tr>
</table>
 

<table cellspacing="0" width="892" cellpadding="3"
	style="border-collapse: collapse;" bordercolor="skyblue" align="center"
	border="1" class="dvfont">
	<tr bgcolor="#c0ccc0" class="dvfont">
		<td> Select</td>
		<td> Exam Time</td>
		 
	</tr>
	
</table>
 
<table align="center">
	<tr>
		<td>
		<div id='scroll_clipper'
			style='position: relative; vertical-align: top; width: 872; border-height: 1px; height: 370px; overflow: auto; white-space: nowrap;'>
		<div id='scroll_text'>
		<%
		int r=0;
			while (rs.next()) 
			
			{
				r++;
				String ExamTime = rs.getString("ExamTime");
				 
		%>
		<table class="dvfont" style="border-collapse: collapse;"
			bordercolor="skyblue" cellspacing="0" width="892" cellpadding="3"
			border="1" align="center">
			<tr>
				<td width="20%" align="center"><input type="checkbox" name="ch<%=r%>"/></td>
				<td align="left"><%=ExamTime%></td>
				 
			</tr>

 					
			<%
				}
			%>



		</table>
		</div>
		</div>
		</td>
	</tr>
</table>
 
<input type="hidden" id="flag" name="flag" value="0"> </div> 
</form>
</body>
</html>