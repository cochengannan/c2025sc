<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="csc.Controller"%>
<%@page import="java.util.Hashtable,java.sql.Connection"%><html>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <body> 

<%

String msg="";
try
{  
	Controller obj=new Controller();
	Connection con=obj.con();  
	obj.createStatement(con);
	
	String schcode=obj.setValue("schcode",request,1);
	
	System.out.println(schcode);
	String []sub=request.getParameterValues("subset");
	int row=0,res=0;
	for (row=0;row< sub.length;row++)
	{
		String subvalue=sub[row];
		System.out.println(subvalue);
	}

	for (row=0;row< sub.length;row++)
	{
		int maxsno=obj.getMax("subjectset","sno","");
		
		Hashtable ht=new Hashtable();    
		String subvalue=sub[row];
		 
		ht.put("sno",maxsno); 
		ht.put("schoolcode",schcode.toUpperCase());	
		ht.put("subjectcode","'"+sub[row].toUpperCase()+"'");
		
		int count=obj.getCount("subjectset"," where schoolcode="+schcode.toUpperCase()+" and subjectcode='"+sub[row].toUpperCase()+"'");
		if (count==0)
		{
			res+=obj.recordSave(ht,"subjectset",con);
		}
		
	}  
	if (res > 0 )  
	{   
		  msg=res + " Subject Added Successfully  to This School";	 
		response.sendRedirect("../success.jsp?file=master/schoolset.jsp&msg="+msg);
	}
	else  
	{
		msg=res + " Already Subject Added to This School ";	 
		response.sendRedirect("../error.jsp?file=master/schoolset.jsp&msg="+msg);
	}
	
}catch(Exception e)   
{
	msg=" Please Select Values .......First School and then subject ";
	response.sendRedirect("../error.jsp?file=master/schoolset.jsp&msg="+msg);
	out.println(e);
}

%>


</body>
</html>