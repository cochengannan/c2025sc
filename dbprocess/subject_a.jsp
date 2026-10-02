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
	String SubjectName=obj.setValue("subname",request,2);
	String SubjectCode=obj.setValue("subcode",request,2);
	String class_name=obj.setValue("class_name",request,1);
	String Medium=obj.setValue("Medium",request,1);  
	SubjectCode="'"+SubjectCode+""+Medium.toUpperCase().charAt(1)+"'";
	SubjectName="'"+SubjectName+"'";  
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
			maxsno=obj.getMax("SubjectCode","sno","");	
			ht.put("sno",maxsno);
			
			int cc=obj.getCount("SubjectCode","where SubjectCode="+SubjectCode.toUpperCase()+"");
			
			ht.put("SubjectName",SubjectName.toUpperCase());
			ht.put("SubjectCode",SubjectCode.toUpperCase());
			ht.put("Medium",Medium.toUpperCase());
			ht.put("class",class_name);
			  
			
			  if (cc==0)
			  {
				  res=obj.recordSave(ht,"SubjectCode",con);
				  msg="Subject update  Successfully";
			  }else
			  {
				  
				  res=0;
				  msg="Record Already Present";
			  }
			   
	}
	// Update PRocess 
	if (b2.equalsIgnoreCase("Update"))
	{
		String processkey=obj.setValue("processkey",request);
		String processsno=obj.setValue("processsno",request);
		 
		ht.put("SubjectName",SubjectName.toUpperCase());
		ht.put("SubjectCode",SubjectCode.toUpperCase());
		ht.put("Medium",Medium.toUpperCase());
		ht.put("class",class_name);
		/*
			to be test Q/A Table After finalize
		*/
		  
	   
		ht1.put("SubjectCode",processkey);
		ht1.put("sno",processsno);
		
		res=obj.recordSave(ht,ht1,"SubjectCode",con);
		  msg="Subject update  Successfully";
	}  
    
	if (res > 0 )
	{       
		
		 response.sendRedirect("../success.jsp?file=master/subject.jsp&msg="+msg);
	}
	else  
	{
		 response.sendRedirect("../error.jsp?file=master/subject.jsp&msg="+msg);
	}
	
}catch(Exception e)   
{
	
	out.println(e);
}

%>


</body>
</html>