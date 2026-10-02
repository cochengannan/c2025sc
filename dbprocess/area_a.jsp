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
	String arname=obj.setValue("arname",request,1);
	String City=obj.setValue("City",request,1);
	String pcode=obj.setValue("pcode",request,1);
	String msg="";
	int maxsno=0;
	int res=0;
	 String b1=obj.setValue("b1",request);
	 String b3=obj.setValue("b3",request);
 
	 System.out.println(b1);
	Hashtable ht=new Hashtable();
	Hashtable ht1=new Hashtable();  
	// Insert Process 
	if (b1.equalsIgnoreCase("Submit"))
	{
			 maxsno=obj.getMax("Area","sno","");	
		 	ht.put("sno",maxsno);
			ht.put("Area",arname.toUpperCase());
			ht.put("City",City.toUpperCase());
			ht.put("Pincode",pcode);
			 res=obj.recordSave(ht,"Area",con);  
			  msg="Area Stored  Successfully";
	}
	 
	if (b3.equalsIgnoreCase("Delete"))
	{
		 
			res=obj.delRecord("Area","where sno="+obj.setValue("updatevalue",request),con);  
			 msg="Area Delete Successfully";
	}
	 
	 
  
	if (res > 0 )    
	{       
		
		 response.sendRedirect("../success.jsp?file=master/area.jsp&msg="+msg);
	}
	else  
	{  
		 response.sendRedirect("../error.jsp?file=master/area.jsp&msg="+msg);
	}
	
}catch(Exception e)   
{
	 response.sendRedirect("../error.jsp?file=master/area.jsp&msg=Area Not Process...Error");
	out.println(e);
}

%>


</body>
</html>