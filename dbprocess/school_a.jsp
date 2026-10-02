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
	String schname=obj.setValue("schname",request,1);
	String schcode=obj.setValue("schcode",request,1);
	String area=obj.setValue("area",request,1);  
	out.println(area);
	int maxsno=obj.getMax("School","sno","");
	
	
	out.println(maxsno);  
	String pincode=obj.getValue("Area","Pincode"," where area="+area+"",1);
	String city=obj.getValue("Area","City"," where area="+area+"",1);
	
	Hashtable ht=new Hashtable();  
	
	ht.put("sno",maxsno);
	ht.put("schoolcode",schcode.toUpperCase());
	ht.put("schoolname",schname.toUpperCase());
	ht.put("area",area);
	ht.put("pincode",pincode);
	
	int res=obj.recordSave(ht,"School",con);
  
	if (res > 0 )
	{   
		String msg="Subject Add Successfully";
		response.sendRedirect("../success.jsp?file=master/school.jsp&msg="+msg);
		response.sendRedirect("../master/school.jsp");
	}
	else  
	{
		response.sendRedirect("./error.jsp");
	}
	
}catch(Exception e)   
{
	
	out.println(e);
}

%>


</body>
</html>