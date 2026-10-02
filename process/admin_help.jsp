<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="csc.Controller"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DatabaseMetaData"%>
<%@page import="java.sql.ResultSet"  errorPage="../errorpage.jsp"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	Controller c=new Controller();
 	Connection con=c.con();
 	
 	DatabaseMetaData md=con.getMetaData();
 	
 	String []t={"TABLE_NAME"};
 	
// 	ResultSet rs=md.getTables(md.getCatalogs(),null,null,t,null);
 	
 	
 	

%>
</body>
</html>