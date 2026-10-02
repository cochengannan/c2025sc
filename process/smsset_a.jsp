
<%@page import="csc.Controller"%> 
 <%@page import="java.util.*" %>
 <%@page import="java.sql.*" %>
 <%
	Hashtable ht=new Hashtable();
	Hashtable ht1=new Hashtable();  
 	Enumeration er=request.getParameterNames();
 	int res=0;
 	String smsdesc=request.getParameter("smssno");
 	Controller obj=new Controller();
	
 	Connection con=obj.con();
 	obj.createStatement(con);
 	String msg="";
 	String school=obj.setValue("school",request);
	String subject=obj.setValue("subject",request);
 	
	String Medium=obj.setValue("med",request); 
 	while(er.hasMoreElements())
 	{
 		Object s=er.nextElement();
 		String value=request.getParameter(s.toString());
 		System.out.println(s.toString()+" ---" + value);
 		if (!s.toString().equalsIgnoreCase("smsdesc") && !s.toString().equalsIgnoreCase("smssno") && !s.toString().equalsIgnoreCase("subject")
 		&& !s.toString().equalsIgnoreCase("school")
 		&& !s.toString().equalsIgnoreCase("med"))
 		{   
			ht.put("smssno",Integer.parseInt(smsdesc));
			ht1.put("htno","'"+value+"'");
			res=obj.recordSave(ht,ht1,"QA_Data_SMS",con);
		 	msg="SMS Set update  Successfully";
		}
 	}
 	  
	    if (res > 0 )
		{       
				
		 response.sendRedirect("../process/smsset.jsp?msg="+msg+"&school="+school+"&subject="+subject+"&med="+Medium+"&smsdesc="+smsdesc);
		}
		else  
		{
			 response.sendRedirect("../error.jsp?file='process/smsset.jsp?msg="+msg+"&school="+school+"&subject="+subject+"&med="+Medium+"&smsdesc="+smsdesc);
		}
 %>