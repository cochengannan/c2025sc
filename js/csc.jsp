 
 
<%@ page language="java" import="java.sql.*"%>
 
 
<%

out.println("TEST");
try {
	
	
	 response.setContentType("text/xml");
     response.setHeader("Cache-Control","no-cache");

     out.println("TEST");
	
	
	}catch(Exception e)
	{
		 
		out.println("TEST"+e);
	}
 
	response.getWriter().write("");   

%>
 