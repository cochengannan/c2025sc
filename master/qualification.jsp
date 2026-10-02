<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="csc.Controller,java.sql.*"  %><html>
<head>
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<title>Welcome To CSC : Qualification Master</title>
</head>
<body>
<%
	Controller obj = new Controller();
	Connection con = obj.con();  
	PreparedStatement ps = con.prepareStatement("select sno,	 qual,qualtype from Qualification  [order by  sno]");
	ResultSet rs = ps.executeQuery();
    
	HttpSession session2 = request.getSession(true);
	String uname1 = obj.isNull((String) session2.getAttribute("uname"),1);
	if (uname1.equals("0")   )
	{
		con.close();
		response.sendRedirect("../logout.jsp");
	}	
	
%>
<form action="../dbprocess/qualification_a.jsp" method="get"  onsubmit="return value_process('qual','Qualification')">
 <%@ include file="../commdiv3.jsp"%> 
 <div id="menudiv">
	<ul id="css3menu1" >
		<li><a href='../home.jsp'>Home</a></li>
		<li><a href='javascript:window.history.go(-1)'>Back</a></li>
		<li><a href="../logout.jsp" style="width:60px; height:16px;line-height:16px;">Logout</a></li>
	</ul>
</div>
 <div id="cdiv"> 
<div id="inner">
<table bordercolor="skyblue" cellspacing="0" width="872" cellpadding="5" align="center" border="1" style="border-collapse: collapse;">
	<tr>
		<td colspan="3" align="center"><font color='black' size='1'><b>Qualification Master</b></font></td>
	</tr>
	<tr>
		<td align="left"><font color='black' size='1'><b>Qualification Name</b></font></td>
		<td align="left"><input type=text id="qual" name="qual" class="tblong"></td>
	</tr>
	<tr>
		<td align="left"><font color='black' size='1'><b>Qualification Type</b></font></td>
		<td align="left"><input type=text id="qualtype" name="qualtype"  class="tb5"></td>
	</tr>
	 
</table>
</div>

<div id="inner">

<table cellspacing="0" width="872" cellpadding="3"
	style="border-collapse: collapse;" bordercolor="skyblue" align="center"
	border="1" class="dvfont">
	<tr bgcolor="#c0ccc0" class="dvfont">
		 <td width="5%"><font color='black' size='1'><b>Sl.No</b></font></td>
		<td width="20%" ><font color='black' size='2' ><b>Qualification Name</b></font></td>
		<td  ><font color='black' size='1'><b>Qualification Type</b></font></td>
	</tr>
</table>
<br>
</div>
 
		<div id='scroll_clipper'
			style='position: relative; vertical-align: top; width: 872; border-height: 1px; height: 270px; overflow: auto; white-space: nowrap;'>
		<div id='scroll_text'>
			<table class="dvfont" style="border-collapse: collapse;"
			bordercolor="skyblue" cellspacing="0" width="872" cellpadding="3"
			border="1" align="center">
		<%
			int row=0;
		String selrow="";
			while (rs.next()) {
				String sc = rs.getString("qual");
				String sn = rs.getString("qualtype");
				row++;
				 selrow = rs.getString("sno");
					  sc = "<label id='lbl"+selrow+"'>"+sc+"</label>";
		%>
			<tr>
				<td  width="5%"><%=row %></td>
				<td width="20%" align="left"><font color='black' size='1'><b><%=sc%></b></font></td>
				<td align="left"><font color='black' size='1'><b><%=sn%></b></font></td>
				 
			</tr>
			<%  
				}
			%>
		</table>
		</div>
		</div>
		 
 
<table bordercolor="skyblue" cellspacing="0" width="872" cellpadding="3"
	align="center">
	<tr>
		<td colspan="4" align="center">
		<input type="text" class="tb0" id="updatevalue" name="updatevalue" value="0" readonly>
		<input type="Submit" value="Submit" name="b1" id="b1"   class="fb2">  
			<input type="Submit" value="Update" name="b2" id="b2"  class="fb2">
			<input type="Submit" value="Delete" name="b3" id="b3"  class="fb2">  
			<input type="Reset" value="Clear"   class="fb2" onclick="cls()">
			</td>
	</tr>
</table></div> 
 </form>
 <%
 try
 {
	con.close();
 }catch(Exception e)
 {
	 
 }
%>
</body>
</html>