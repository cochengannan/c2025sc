<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="csc.Controller"%>
<%@page import="java.util.Hashtable,java.sql.Connection"%><html>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CSC COMPUTER EDUCATION</title>
 <body> 

<%

try 
{
	Controller obj=new Controller();
	Connection con=obj.con();  
	obj.createStatement(con); 
	String sname=obj.setValue("time",request,1);
	 
	 
	String msg="";
	int maxsno=0;
	int res=0;
	 
	 
	 String b1=obj.setValue("b1",request);
	 String b2=obj.setValue("b2",request);
	 String b3=obj.setValue("b3",request);
	 
	Hashtable ht=new Hashtable();
	Hashtable ht1=new Hashtable();  
	// Insert Process 
	out.println(b1);
	if (b1.equalsIgnoreCase("Store"))
	{
			   
			 
				ht.put("ExamTime",sname.toUpperCase());
			 
			  res=obj.recordSave(ht,"[Exam Time]",con);    
			    msg="Exame Time Stored Successfully";
	}  
	// Update PRocess 
	 
    
	if (res > 0 )
	{       
		
		 response.sendRedirect("../success.jsp?file=master/time.jsp&msg="+msg);
	}
	else    
	{
		 // response.sendRedirect("../error.jsp");
	}
	
}catch(Exception e)   
{
	
	out.println(e);
}

%>


</body>
</html>