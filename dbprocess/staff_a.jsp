 <%@page import="csc.Controller"%>
 <%@page import="java.util.Hashtable,java.sql.Connection"%>
 
 <%
 
 
 try 
 {
 	Controller obj=new Controller();
 	Connection con=obj.con();  
 	obj.createStatement(con); 
 
 	String clist=obj.setValue("clist",request,1);
	String stfname=obj.setValue("stfname",request,1); 
	String stffname=obj.setValue("stffname",request,1);
	String sex=obj.setValue("sex",request,1);
	String dob=obj.setValue("dob",request,1);
	String doj=obj.setValue("doj",request,1);
	String qualtype=obj.setValue("qualtype",request,1);
	String qual=obj.setValue("qual",request,1);
	String RC=obj.setValue("RC",request,1);
	String Community=obj.setValue("Community",request,1);
	String landline=obj.setValue("landline",request,1);
	String pin=obj.setValue("pin",request,1);
	String ptime=obj.setValue("ptime",request,1);
	String ftime =obj.setValue("ftime",request,1);
	String addr1=obj.setValue("addr1",request,1);
	String addr2=obj.setValue("addr2",request,1);
	String addr3=obj.setValue("addr3",request,1);
	String addr4=obj.setValue("addr4",request,1);
	String city=obj.setValue("city",request,1);
	String phone=obj.setValue("phone",request,1); 
	
	String uname=obj.setValue("uname",request,1);  
	String pwd=obj.setValue("pwd",request,1);
	
	
	String sub=obj.setValue("b1",request,1);
	
	out.println(addr1);
	out.println(addr3);
	
	out.println(phone);
	
	int staffmax=obj.getMax("Staff","staffsno","");
	out.println("TEST" + staffmax);
	
		Hashtable ht=new Hashtable();
	
			ht.put("staffsno",staffmax);
			ht.put("name",stfname); 
			ht.put("fname",stffname);
			ht.put("qual",qual);
			ht.put("qualtype",qualtype);
		//	ht.put("Timings",sex);
			ht.put("sex",sex);
			ht.put("community",Community);			
			ht.put("landline",landline);
			ht.put("religion",RC);
			ht.put("pincode",pin);
			ht.put("mobile1",phone);
			ht.put("Type",ptime+""+ftime);		 
			ht.put("dob",dob);
			ht.put("doj",doj);			 
			ht.put("add1",addr1);
			ht.put("add2",addr2);  
			ht.put("add3",addr3);
			ht.put("area",addr4); 
			ht.put("city",city);
			ht.put("username",uname);
			ht.put("password",pwd);
			ht.put("ccode",clist);	  
		
			
			String msg="Subject update  Successfully";
			
			int res=obj.recordSave(ht,"Staff",con);
		
			
			if (res > 0 )
			{         
				
				 response.sendRedirect("../success.jsp?file=master/staff.jsp&msg="+msg);
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