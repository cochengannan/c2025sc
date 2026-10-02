<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="csc.Controller,java.sql.*"  errorPage="../errorpage.jsp"%><html>
<head>
<link rel="stylesheet" type="text/css" href="../css/csccss.css" />
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />

<script language="JavaScript" src="../js/csc.js"></script>
<script language="JavaScript" src="../js/cellcreate.js"></script>
<script language="JavaScript" src="../js/entry_help.js"></script>
<script language="JavaScript" src="../js/csc.js"></script>
<script language="JavaScript" src="../js/reception.js"></script>
<script language="JavaScript" src="../js/validate.js"></script>

<style type="text/css">

.t1
{
	border-color: skyblue;
	border-collapse: collapse;
	width : 100%;
}
.select22 {    
 	font-family: Verdana, Arial, Helvetica, sans-serif;
 	width: 1010px;
  
 }
</style>
<script type="text/javascript">
function ld()
{

window.reload();

}

function sub()
{
	  document.sch_frm.submit();    
		
}
</script> 
 
<title>Welcome To CSC : School Master</title>
</head>

<body>
<form action="../dbprocess/school_a.jsp" method="post" name="sch_frm">
<%@ include file="../commdiv3.jsp"%>
<div id="menudiv">
	<ul id="css3menu1" >
		<li><a href='../home.jsp'>Home</a></li>
		<li><a href='javascript:window.history.go(-1)'>Back</a></li>
		<li><a href="../logout.jsp" style="width:60px; height:16px;line-height:16px;">Logout</a></li>
	</ul>
</div>
 
 <div id="cdiv">  
<%
	Controller obj = new Controller();
	Connection con = obj.con();
 

	String area = obj.combo_box("area", "select area  from area ",
			"area", "area", 0, "", "area", "class='select' onKeyDown=key_pass(event,'area','b1')");
	HttpSession session2 = request.getSession(true);
	String uname1 = obj.isNull((String) session2.getAttribute("uname"),1);
	if (uname1.equals("0")   )
	{
		con.close();
		response.sendRedirect("../logout.jsp");
	}	
	
%>   
  				<table border=1 width="892" style="border-color: skyblue; border-collapse: collapse">
  				<tr><td align="center"> Record Find</tr>
  				<tr><td> <font color=blue>  <input type="text" placeholder="Search By Name Here"   id="ename" name="ename" onkeyup="help(9,'ename','studname');"></font></td></tr>
  				</table>
  				<table border=1 width="892" style="border-color: skyblue; border-collapse: collapse">
  				<tr> 
				<td valign="top" align="left" width="892">
				<div  id="stuname_div" style=" border: 1;left:39px; top:200px; width:0; height:140;list-style:none;">
				<select id="studname" class="select22" name="studname" multiple="multiple" style="border: 0em; "><option value="0"></option> </select>
				</div>
				</td>
				</tr>
				</table>  
			 

</div>


  
<input type="hidden" id="flag" name="flag" value="0">  
</form>
</body>
<%
 try
 {
	con.close();
 }catch(Exception e)
 {
	 
 }
%>
</html>