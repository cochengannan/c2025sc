<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" errorPage="../errorpage.jsp"%>
 <%@page import="java.util.*,java.sql.*" %>
 <%@page import="csc.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>  
<link rel="stylesheet" href="./menu/menunew_files/css3menu1/style.css" type="text/css" />
<script type="text/javascript"></script>
<title>Welcome To CSC</title>  
<script language="JavaScript" src="./js/csc.js"></script>
<script language="JavaScript" src="../js/cellcreate.js"></script>
 <script language="JavaScript" src="../js/validate.js"></script>
<script language="JavaScript" src="../js/entry_help.js"></script>  
<script language="JavaScript" src="../js/csc.js"></script>
<script language="JavaScript" src="../js/menu1.js"></script>
<script src="../admin/jquery.min.js" type="text/javascript"></script>
<script language="JavaScript" src="../js/rowadd.js"></script>
<style type="text/css">
  #apDiv6 {
	 	position:absolute;
 		z-index:3;
	top:600px;
	width:101%;
	height:100%; 
	
} 
body {
 
    background-repeat: no-repeat;
   background-size: 1600px 900px;
}
</style>
 
</head>  
<link rel="stylesheet" type="text/css" href="./css/txtbox.css" />
<link rel="stylesheet" href="./menu/menunew_files/css3menu1/style.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="./css/tooltip.css" />  
<link rel="stylesheet" type="text/css" href="./css/csccss.css" />
<body>
  
 <%
	 
	 
 
Connection con = null;  
String entrytype="",sc="",sb="",sbcode="",sc_code="",med="",sb_code="",scholltype="";
try {
	Controller obj = new Controller();
	con = obj.con();
	HttpSession session2 = request.getSession(true);
String uname1 = obj.isNull((String) session2.getAttribute("uname"),1);
//String sb_code = (String) session.getAttribute("subject_code");
session2.setAttribute("report_type","2");
if (uname1.equals("0") || med.equals("0") || sb_code.equals("0")    ||
		 sc.equals("0") || sb.equals("0")  || sbcode.equals("0")  || sc_code.equals("0") )
{
	con.close();
	response.sendRedirect("../logout.jsp");
}		  

%>
<%@ include file="./commdiv1.jsp"%>
   
 <div id="menudiv"><ul id="css3menu1"   >
				<li><a href="./logout.jsp">Logout</a></li>
			</ul>
	 </div>   
<div id="cdiv" style="">   
	<div id="div31"><br /><br /><br/><a href="./admin.jsp" style="height:124px;">ADMIN</a></div>
	<div id="div31"><br /><br /><br/><a href="./sat.jsp" style="height:   124px;">SAT</a></div>
	<div id="div31"><br /><br /><BR/><a href="./master/school.jsp" style="height:   124px;">Q/A</a></div>
	<div id="div31"><br /><br /><BR/><a href="./reports/rprt.jsp" style="height:   124px;">REPORT</a></div>
	<div id="div31"><br /><br /><BR/><a href="./process/support.jsp" style="height:   124px;">SUPPORT</a></div>
	<div id="div31"><br /><br /><BR/><a href="./process/PhoneFollowup.jsp" style="height:   124px;">Phone Call</a></div>
 </div>
 
 
 <%  
}catch(Exception e)
{}
 %>
</body>
</html>