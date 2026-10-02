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
	String strname=obj.setValue("strname",request,1);
	 
	 
	String msg="";
	int maxsno=0;
	int res=0;
	 
	 
	 String b1=obj.setValue("b1",request);
	 String b2=obj.setValue("b2",request);
	 String b3=obj.setValue("b3",request);
	 
	Hashtable ht=new Hashtable();
	Hashtable ht1=new Hashtable();  
	// Insert Process 
	if (b1.equalsIgnoreCase("Submit"))
	{
		 
			ht.put("street",strname.toUpperCase());
			ht.put("sno",obj.getMax("street","sno","")); 
			res=obj.recordSave(ht,"street",con);  
			
			 msg="Street Name Stored  Successfully";
	}
	// Update PRocess 
	if (b2.equalsIgnoreCase("Update"))
	{
			 
			 
			ht.put("street",strname.toUpperCase());
			ht1.put("sno",obj.setValue("updatevalue",request));
			res=obj.recordSave(ht,ht1,"street",con);  
			 msg="Street Name update  Successfully";
	}
	if (b3.equalsIgnoreCase("Delete"))
	{
		 
			res=obj.delRecord("street","where sno="+obj.setValue("updatevalue",request),con);  
			 msg="Street Name Delete Successfully";
	}
	if (res > 0 )
	{       
		
		 response.sendRedirect("../success.jsp?file=master/street.jsp&msg="+msg);
	}
	else    
	{
	//	 response.sendRedirect("../error.jsp");
	}
	
}catch(Exception e)   
{	   
	 response.sendRedirect("../error.jsp?file=master/street.jsp&msg=Street Name Not Process...Error");
}

%>


</body>
</html>