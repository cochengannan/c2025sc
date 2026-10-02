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
	String msg="";
	String sms=obj.setValue("sms",request,1);
	String b1=obj.setValue("b1",request,1);
	out.println(b1);  
	int res=0;
	if (b1.equalsIgnoreCase("'Submit'"))
	{
		int maxsno=obj.getMax("smsmas","sno","");
		Hashtable ht=new Hashtable();   
		out.println(maxsno);  
		ht.put("sno",maxsno);
		ht.put("smsdesc",sms);
		
		res=obj.recordSave(ht,"smsmas",con)  ;
	}
	else if (b1.equalsIgnoreCase("Delete"))
	{
		 
		 res=obj.delRecord("smsmas","where sno="+obj.setValue("updatevalue",request),con);  
		 msg="Place Delete Successfully";
	}
	if (res > 0 )
	{   
		msg="SMS Message  Add Successfully";
		response.sendRedirect("../success.jsp?file=master/smsmas.jsp&msg="+msg);
	}
	else  
	{
	//	response.sendRedirect("./error.jsp");
	}
}catch(Exception e)   
{
	
	out.println(e);
}

%>


</body>
</html>