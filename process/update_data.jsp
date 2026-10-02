<%@page import="csc.update_java"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		update_java p=new update_java();
		p.update_q();
%>
<table>
	<tr>
		<td> <a href="../home.jsp">Home</a></td>
	</tr>
</table>

</body>
</html>