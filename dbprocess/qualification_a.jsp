<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="csc.Controller"%>
<%@page import="java.util.Hashtable,java.sql.Connection"%><html>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <body> 

<%

try
{
	Controller obj=new Controller();
	Connection con=obj.con();  
	obj.createStatement(con); 
	String qual=obj.setValue("qual",request,1);
	String qualtype=obj.setValue("qualtype",request,1);
	 
	 
	String msg="";
	int maxsno=0;
	int res=0;
	 String b1=obj.setValue("b1",request,1);
	 String b2=obj.setValue("b2",request,1);
	 String b3=obj.setValue("b3",request,1);
	Hashtable ht=new Hashtable();
	Hashtable ht1=new Hashtable();  
	// Insert Process 
	if (b1.equalsIgnoreCase("'Submit'"))
	{
			maxsno=obj.getMax("Qualification","sno","");	
			ht.put("sno",maxsno);
			ht.put("qual",qual.toUpperCase());
			ht.put("qualtype",qualtype.toUpperCase());
		 
			     res=obj.recordSave(ht,"Qualification",con);  
			    msg="Subject update  Successfully";
			    out.println(msg);
	}
	// Update PRocess 
	 if (b2.equalsIgnoreCase("Update"))
	{
			 
			 
			ht.put("Qualification",qual.toUpperCase());
			ht.put("qualtype",qualtype.toUpperCase());
			ht1.put("sno",obj.setValue("updatevalue",request));
			res=obj.recordSave(ht,ht1,"Occupation",con);  
			 msg="Occupation update  Successfully";
	}
	if (b3.equalsIgnoreCase("Delete"))
	{
		 
			res=obj.delRecord("Occupation","where sno="+obj.setValue("updatevalue",request),con);  
			 msg="Place Delete Successfully";
	}
	 
  
	if (res > 0 )    
	{       
		
		 response.sendRedirect("../success.jsp?file=master/qualification.jsp&msg="+msg);
	}
	else  
	{  
		// response.sendRedirect("../error.jsp?file=master/qualification.jsp&msg="+msg);
	}
	
}catch(Exception e)   
{
	
	out.println(e);
}

%>


</body>
</html>