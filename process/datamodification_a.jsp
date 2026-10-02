<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  errorPage="../errorpage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="csc.Controller"%>
<%@page import="java.util.Hashtable,java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%><html>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CSC COMPUTER EDUCATION</title>
 <body> 

<%

try 
{
	Controller obj=new Controller();
	Connection con=obj.con();  
	obj.createStatement(con); 
	String htno=obj.setValue("htno",request,1);
	HttpSession session2 = request.getSession(false);  
	String uname1 = (String) session2.getAttribute("uname");
	uname1=uname1.replaceAll("'","");
	String msg="";
	int maxsno=0;
	int res=0,res1=0;
	 
	 
	 String b1=obj.setValue("b1",request);
	 String b2=obj.setValue("b2",request);
	 String b3=obj.setValue("b3",request);
	 
	Hashtable ht=new Hashtable();
	Hashtable ht1=new Hashtable();  
	// Insert Process 
	if (b2.equalsIgnoreCase("Delete"))
	{
			 
		
		 
		PreparedStatement ps=con.prepareStatement("delete from QAData where htno="+htno+ " and NickName='"+uname1+"'");
		res=ps.executeUpdate();
		 
		PreparedStatement ps1=con.prepareStatement("delete from QARelation where htno="+htno+ " ");
		  res1=ps1.executeUpdate();    
		 
		if ( (res+res1 ) > 0)
			    msg="Record Successfully Delete ";
	}
	// Update PRocess 
	 
    
	if ((res+res1) > 0 )
	{       
		
		 response.sendRedirect("../success.jsp?file=./process/datatmodification.jsp&msg="+msg);
	}
	else    
	{
		 response.sendRedirect("../error.jsp");
	}
	
}catch(Exception e)   
{
	
	out.println(e);
}

%>


</body>
</html>