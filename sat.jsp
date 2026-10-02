<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="csc.*"%>
<%@page import="java.util.*,java.sql.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<head>
<script type="text/javascript">
document.onkeydown = function (event){
    var s=event.srcElement ||   event.target;
    var sn=s.tagName.toUpperCase();
    if (sn=="HTML")
        return false;
    else
        return true;  
};
</script>
<link rel="stylesheet" type="text/css" href="./css/txtbox.css" />
<link rel="stylesheet" href="./menu/menunew_files/css3menu1/style.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="./css/tooltip.css" />  
<link rel="stylesheet" type="text/css" href="./css/csccss.css" />
</head>
<body>
<form>  
 <%@ include file="./commdiv1.jsp"%> 
	<div id="menudiv"><ul id="css3menu1" style="width: 100%" >
				<li><a href='./home.jsp'>Home</a></li>
				<li><a href="./logout.jsp">Logout</a></li>
			</ul>
	 </div>
    <div id="cdiv"> 
 	 			
				<div id="div5"><br /><br /><a href="./process/direct_entry.jsp?flagtype=3"><b>Direct Entry</b></a></div>
				<div id="div5"><br /><br /><a href="./process/direct_entry.jsp?flagtype=4"><b>Cscian Entry</b></a></div>
				<div id="div5"><br /><br /><a href="./process/direct_entry.jsp?flagtype=5"><b>Others</b></a></div>
				<div id="div5"><br /><br /><a href="./process/direct_entry.jsp?flagtype=6"><b>Paper</b></a></div>
				<div id="div5"><br /><br /><a href="./process/cre_kidentry_set.jsp?flagtype=4"><b>CRE-KID</b></a></div>	
				<div id="div5"><br /><br /><a href="./process/satsetting.jsp"><b>SAT SET</b><font color='red'>**</font></a></div>
				<div id="div5"><br /><br /><a href="./process/reception.jsp"><b>Reception</b></a></div>
				<div id="div5"><br /><br /><a href="./process/mark_entry.jsp"><b>Mark Entry</b></a></div>
				<div id="div5"><br /><br /><a href="./process/sch.jsp"><b>Scholarship</b></a></div>
	 
 
 </div>
 </form>
 
</body>
</html>