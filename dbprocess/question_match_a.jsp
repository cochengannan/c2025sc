<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="csc.Controller"%>
<%@page import="java.util.Hashtable,java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%><html>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <body> 

<%

try
{
	Controller obj=new Controller();
	Connection con=obj.con();  
	obj.createStatement(con); 
	 
	 
	 
	 
	String msg="",ans="";
	int maxsno=0;
	int res=0;
	 
	 String code=obj.setValue("qcode",request);
	 
	 
	  PreparedStatement ps=con.prepareStatement("delete from questionans where qcode='"+code.toUpperCase()+"'");
	  ps.executeUpdate();
	  
			Hashtable ht=new Hashtable();
	 
	// Insert Process   
	 for (int i=1;i<=20;i++)  
		{
			
		 		code=obj.setValue("qcode",request,1);
		 		ans=obj.setValue("t"+i,request);
				maxsno=obj.getMax("questionans","sno","");	
				ht.put("sno",maxsno);
				ht.put("qcode",code.toUpperCase());
				ht.put("qno",i);
				ht.put("ans",ans);
				 res+=obj.recordSave(ht,"questionans",con);  
		}
			
			
			
			
		 
			    
			    msg="Subject update  Successfully";
	 
	// Update PRocess 
	 
  
	if (res > 0 )    
	{       
		
		 response.sendRedirect("../success.jsp?file=process/question_match.jsp&msg="+msg);
	}
	else  
	{  
		//response.sendRedirect("../error.jsp");
	}
	
}catch(Exception e)   
{
	
	out.println(e);
}

%>


</body>
</html>