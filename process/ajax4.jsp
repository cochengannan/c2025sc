 
<%@ page language="java"  errorPage="../errorpage.jsp" 
	import="csc.*,java.sql.*,java.io.*,java.text.*,java.util.Date,java.util.Calendar,java.lang.System,java.util.*"%>


<%
    String htno = "", sc = "", sb = "", sbcode = "", sc_code = "", med = "", sb_code = "", class_ = "" ;

	String name1 = "", sexd = "", name2 = "", addr1 = "", type = "" ;
	
	String addr2 = "", addr3 = "", addr4 = "", pincode = "", phone = "", mobile1 = "";
	
	String mobile2 = "", Religiond = "", Communityd = "", occ = "", doorno = "" ;
	
	

	String satyear=(String)session.getAttribute("satyear");
	String satype=(String)session.getAttribute("sattype"); 
	 
 
	response.setContentType("text/xml");
	response.setHeader("Cache-Control", "no-cache");
	Connection con = null;
	Controller obj = new Controller();
	
	con = obj.con();
	String process="0";
	String value_return="";
	try
	{
		
		  process=obj.setValue("process",request);
		
	
	
	 if (process.equalsIgnoreCase("12"))
	{
		String btc=obj.setValue("btc",request);
		String sno=obj.setValue("sno",request);
		int c=obj.getCount("Reception", " where Bname='"+btc+"' and SeatNo="+sno+ " and  satyear="+satyear+" and sattype="+satype); 
		value_return=""+c;
	 
		 
			  htno=obj.getValue("Reception","htno", " where Bname='"+btc+"' and SeatNo="+sno+ " and  satyear="+satyear+" and sattype="+satype);
		
		
			if (!htno.equalsIgnoreCase("0"))   
			{
				String cond = " where htno='" + htno + "'";
				int count = obj.getCount("QAData", cond) ;
				  value_return=""+count; // 0
				name1 = obj.getValue("QAData", "name", cond).toUpperCase();
				value_return+="|"+name1; //1
				
				name2 = obj.getValue("QAData", "fname", cond).toUpperCase();
				value_return+="|"+name2;//2
				
				
				sexd = obj.getValue("QAData", "sex", cond).toUpperCase();
				value_return+="|"+sexd;//3
				
				sc = obj.getValue("QAData", "school", cond).toUpperCase();
				value_return+="|"+sc;//4
				
				type = obj.getValue("QAData", "source", cond).toUpperCase();
				value_return+="|"+type;//5
				
				addr1 = obj.getValue("QAData", "add1", cond).toUpperCase();
				value_return+="|"+addr1;//6
				
				addr2 = obj.getValue("QAData", "add2", cond).toUpperCase();
				value_return+="|"+addr2;//7
				
				addr3 = obj.getValue("QAData", "area", cond).toUpperCase();
				value_return+="|"+addr3;//8
				
				addr4 = obj.getValue("QAData", "city", cond).toUpperCase();
				value_return+="|"+addr4;//9
				
				pincode = obj.getValue("QAData", "pincode", cond).toUpperCase();
				value_return+="|"+pincode;//10
				
				phone = obj.getValue("QAData", "landline", cond).toUpperCase();
				value_return+="|"+phone;//11
				
				mobile1 = obj.getValue("QAData", "mobile1", cond).toUpperCase();
				value_return+="|"+mobile1;//12
				
				mobile2 = obj.getValue("QAData", "mobile2", cond).toUpperCase();
				value_return+="|"+mobile2;//13
				
				Religiond = obj.getValue("QAData", "religion", cond).toUpperCase();
				value_return+="|"+Religiond;//14
				
				Communityd = obj.getValue("QAData", "community", cond).toUpperCase();
				value_return+="|"+Communityd;//15
				
				occ = obj.getValue("QAData", "occ", cond).toUpperCase();
				value_return+="|"+occ;//16
				
				doorno = obj.getValue("QAData", "doorno", cond).toUpperCase();
				value_return+="|"+doorno;//17
				class_ = obj.getValue("QAData", "qual", cond).toUpperCase();
				value_return+="|"+class_+"|"+count+"|"+htno;//18
		   }
		else 
		{
			value_return="text|"+c;
		}
			 con.close();
	}		
	}catch(Exception e) {}
			 
	
			response.getWriter().write(value_return);
	
%>