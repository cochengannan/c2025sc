<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="csc.Controller,java.sql.*"  errorPage="../errorpage.jsp"%><html>
<head>
<link rel="stylesheet" type="text/css" href="../css/csccss.css" />
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />

<script language="JavaScript" src="../js/csc.js"></script>

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
	PreparedStatement ps = con.prepareStatement("select * from School order by sno");
	ResultSet rs = ps.executeQuery();

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
 

		<%
			while (rs.next())
			{
				String sc = rs.getString("schoolcode");
				String sn = rs.getString("schoolname");
				String ar = rs.getString("area");
		%>
		<div id="div31"><a href="./std.jsp?School=<%=sc%>"  style="height:   124px;">
				 <br />
       			 <br />
			<%=sn%>
		</a></div>
			
			<%
				}
			%>

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