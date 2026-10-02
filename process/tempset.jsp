<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="csc.*"%>
<%@page import="java.util.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Connection con = null;
try {
	Controller obj = new Controller();
	con = obj.con();
	obj.createStatement(con);
			String sty=obj.setValue("satyear",request);
			String satype=obj.setValue("satype",request);
			
			String sv="";
			 if (Integer.parseInt(satype)==1)
			 {
				 sv="12th SAT";
			 }else if (Integer.parseInt(satype)==2)
			 {
				 sv="10th SAT";
			 }else 
			 {
				 sv="Middle SAT "+satype ;
			 } 
				 
			 PreparedStatement ps=con.prepareStatement("delete from satset");
			 ps.executeUpdate();
			 Hashtable htc =new Hashtable();
			 htc.put("satyear",sty);
			 htc.put("sattype",satype);
			 htc.put("satdesc","'"+sv+"'");
			 int r2=obj.recordSave(htc,"satset",con);
				 session.setAttribute("satyear",sty);
				session.setAttribute("sattype",satype);
				session.setAttribute("sdesc",sv);
				
				
				
				response.sendRedirect("reception.jsp?satyear="+sty+"&satype="+satype); 
}catch(Exception e)
{
	
}

%>
</body>
</html>