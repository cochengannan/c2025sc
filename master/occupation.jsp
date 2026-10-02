<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="csc.Controller,java.sql.*" errorPage="../errorpage.jsp"%><html>
<head>
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<script language="JavaScript" src="../js/csc.js"></script>     
<script language="JavaScript" src="../js/entry_help.js"></script>  
<script language="JavaScript" src="../js/cellcreate.js"></script>
<title>Welcome To CSC : Occupation Master</title>
<script type="text/javascript">
function cls()
{
	document.getElementById("b1").disabled=false;
}
function sel(a)
{
	document.getElementById("updatevalue").value=a;
	document.getElementById("occupname").value=document.getElementById("lbl"+a).innerHTML;
	document.getElementById("b1").disabled=true;
}
</script>
</head>

<body>
<form action="../dbprocess/occupation_a.jsp" method="post"  onsubmit="return value_process('occupname','Occupation')">
 <%@ include file="../commdiv3.jsp"%> 
<%
	Controller obj = new Controller();
	Connection con = obj.con();
	PreparedStatement ps = con.prepareStatement("select * from Occupation order by Occupation asc ");
	ResultSet rs = ps.executeQuery();
	HttpSession session2 = request.getSession(true);
	String uname1 = obj.isNull((String) session2.getAttribute("uname"),1);
	if (uname1.equals("0")   )
	{
		
		con.close();
		response.sendRedirect("../logout.jsp");
	}	
	
%>
<div id="menudiv">
	<ul id="css3menu1" >
		<li><a href='../home.jsp'>Home</a></li>
		<li><a href='javascript:window.history.go(-1)'>Back</a></li>
		<li><a href="../logout.jsp" style="width:60px; height:16px;line-height:16px;">Logout</a></li>
	</ul>
</div>
 <div id="cdiv"> 
<table bordercolor="skyblue" cellspacing="0" width="872" cellpadding="5" align="center" border="1" style="border-collapse: collapse;">
	<tr>
		<td colspan="3" align="center"><font color='black' size='2'><b>Occupation Master</b></font></td>
	</tr>
	<tr>
		<td align="left"><font color='black' size='2'><b>Occupation Name</b></font></td>
		<td align="left">
			<input type=text id="occupname" name="occupname" class="tblong"  onKeyUp="toUpper(this);">
			<input type="text" class="tb0" id="updatevalue" name="updatevalue" value="0" readonly>
			<input type="Submit" value="Submit" name="b1" id="b1"   class="fb2">  
			<input type="Submit" value="Update" name="b2" id="b2"  class="fb2">
			<input type="Submit" value="Delete" name="b3" id="b3"  class="fb2">  
			<input type="Reset" value="Clear"   class="fb2" onclick="cls()">
		 </td>
		 
	</tr>
 <tr>
 <td colspan="3">
		<div id='scroll_clipper'
			style='position: relative; vertical-align: top; width: 872; border-height: 1px; height: 370px; overflow: auto; white-space: nowrap;'>
		<div id='scroll_text'>
		<table style="border-collapse: collapse;"
			bordercolor="skyblue" cellspacing="0" width="872" cellpadding="3"
			border="1" align="center">
		<%
			int row=0;
			String selrow="";
			while (rs.next()) {
				 row++;
				 selrow = rs.getString("sno");
				String sc = "<label id='lbl"+selrow+"'>"+rs.getString("Occupation")+"</label>";
		%>
		<% if ((row%4)==0) { %>
			<tr>  
			<%} %>
				<td align="left" width="20%"><font color='black' size='1'><b><a href="javascript:sel(<%=selrow%>)" style="text-decoration: none"><%=sc%></a></b></font></td>
			<% if ((row%4)==3)  { %> 
			</tr>
			<%} %>
			<%
			}
			%>



		</table>
		</div>
		</div>
		 
 </td>
 </tr>
 </table>
<table bordercolor="skyblue" cellspacing="0" width="872" cellpadding="3"
	align="center">
	<tr>
		<td colspan="4" align="center"></td>
	</tr>
</table>
 </div>
 <%
 try
 {
	con.close();
 }catch(Exception e)
 {
	 
 }
%>
</form>
</body>
</html>