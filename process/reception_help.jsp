<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script language="JavaScript" src="../js/cellcreate.js"></script>
<script language="JavaScript" src="../js/entry_help.js"></script>
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
</head>
<body>
<%@ include file="../head.jsp"%>
<table align="center" width="85%" border="1" cellpadding="0" cellspacing="0" bordercolor="skyblue" style="border-collapse: collapse;">
<Tr>
		<td colspan="2">Student Details Quick Search
		</td>
		</Tr>
	<tr> 
		<td width="10%">Name</td>
		<td align="left"><input type="text" id="ename" name="ename"
			onkeyup="help(9,'ename','studname');"><input type="button"
			value="X" onclick="vis('stuname_div', 1);"></td>
		 
	</tr>
	<Tr>
		<td colspan="2">

		<table border=0 width="892">
			<tr>
				<td valign="top" align="left" width="892">
				<div id="stuname_div"
					style="position: relative; border: 0; left: 0px; top: 0px; width: 0; height: 140; list-style: none;">
				<select id="studname" class="select2" name="studname"
					multiple="multiple" style="border: 0em;">
					<option value="0"></option>
				</select></div>
				</td>
			</tr>
		</table>
		</td>
	</Tr>
</table>
</body>
</html>