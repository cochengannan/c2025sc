<%@page import="csc.*"%>
<%@page import="java.util.*,java.sql.*"%>
<%
	String entrytype = "", sc = "", sb = "", sbcode = "", sc_code = "", med = "", sb_code = "", class_ = "";
	String name1 = "", sexd = "", name2 = "", addr1 = "", type = "";
	String addr2 = "", addr3 = "", addr4 = "", pincode = "", phone = "", mobile1 = "", mobile2 = "", Religiond = "", Communityd = "", occ = "", doorno = "";
	try {
		Controller obj = new Controller();
		Connection con = obj.con();
		String htno = obj.setValue("htno", request);
		String condvalue = obj.setValue("btc", request);
		String slno = obj.setValue("slno", request);
		String sno = obj.setValue("sno", request);
		String yes = obj.setValue("yes", request);
		String cond=" where htno='"+htno+"'";
		name1 = obj.getValue("QAData", "name", cond).toUpperCase();

		name2 = obj.getValue("QAData", "fname", cond).toUpperCase();
		sexd = obj.getValue("QAData", "sex", cond).toUpperCase();
		String savebutton = obj.setValue("cmd", request);
		out.println(savebutton);  
		String msg="";  
		  if (savebutton.equalsIgnoreCase("Save"))
		  {
			  
			  String  examdate=obj.setValue("edate",request,3);
			  String  exatt=obj.setValue("yes",request);
			  out.println(exatt);
			  if (exatt.equalsIgnoreCase("on")) exatt="'Y'"; else exatt="'N'";
			  Hashtable ht=new Hashtable();
			  
			 ht.put("htno","'"+htno+"'");
			 ht.put("name","'"+name1+"'");
			 ht.put("sex","'"+sexd+"'");
			 ht.put("AttDate","'"+examdate+"'");
			 ht.put("sno",slno);
			 ht.put("Bname","'"+condvalue+"'");
			 ht.put("SeatNo",sno);
			 ht.put("exatt",exatt);   
			 int r=obj.recordSave(ht,"Reception",con);
			 if (r >0 )
			 {
			 
				 response.sendRedirect("../process/reception.jsp?btc="+condvalue);
				 //response.sendRedirect("../success.jsp?file='./process/reception.jsp?btc="+condvalue+"'&msg="+msg);
			 }
		  }
		  con=null;
	} catch (Exception e) 
	{
		out.println(e);
		response.sendRedirect("../logout.jsp");
	}
%>