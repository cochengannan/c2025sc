<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"  errorPage="../errorpage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="csc.Controller,java.sql.*"%><html>
<head>
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<script language="JavaScript" src="../js/csc.js"></script>
    
<style type="text/css">
#container {
	margin-top: 5px;
	margin-left: 10%;
	margin-right: auto;
	vertical-align: top;
	margin-bottom: 20px;
	border: 1px solid 000000;
}
</style>
<script type="text/javascript">
 
</script>
<title>Welcome To CSC : Exam Time</title>
</head>

<body   onload="ld()">  
<form >  
<%  
	 

	
%>  
<%@ include file="../head.jsp"%>
<div id="inner">
<table bordercolor="skyblue" cellspacing="0" width="872" cellpadding="5"   
	align="center" border="1" class="dvfont">
	<tr>
		<td colspan="4" align="center"> Exam Time</td>
	</tr>
	 
</table>
</div>
 
<input type="hidden" id="flag" name="flag" value="0"> 
</form>
</body>
</html>