
<%@ page language="java"  errorPage="../errorpage.jsp" 
	import="csc.*,java.sql.*,java.io.*,java.text.*,java.util.Date,java.util.Calendar,java.lang.System,java.util.*"%>


<%
String htno = "", sc = "", sb = "", sbcode = "", sc_code = "", med = "", sb_code = "", class_ = "" ;
String name1 = "", sexd = "", name2 = "", addr1 = "", type = "" ;
String addr2 = "", addr3 = "", addr4 = "", pincode = "", phone = "", mobile1 = "";
String mobile2 = "", Religiond = "", Communityd = "", occ = "", doorno = "" ;

response.setContentType("text/xml");
response.setHeader("Cache-Control", "no-cache");
Connection con = null;
Controller obj = new Controller();

con = obj.con();
String process="0";
String value_return="";

String satyear="0" ,sattype="0",sdesc="0";
try
{
  satyear = (String) session.getAttribute("satyear");
  sattype = (String) session.getAttribute("sattype");
  sdesc = (String) session.getAttribute("sdesc");
  
}catch(Exception e )
{
	response.sendRedirect("./satsetting.jsp");
}
 if (satyear.equalsIgnoreCase("0") || sattype.equalsIgnoreCase("0") || sdesc.equalsIgnoreCase("0"))
 {
	 response.sendRedirect("./satsetting.jsp");
	 
 }
try
{
	
	  process=obj.setValue("process",request);
	
	
}catch(Exception e) {}
System.out.println("process " + process);  

htno=obj.setValue("htno",request);
if (process.equalsIgnoreCase("1"))   
{
	String Bname=obj.setValue("Bname",request);
	String SeatNo=obj.setValue("SeatNo",request);
	htno=obj.getValue("Reception", "htno", "where satyear="+satyear +" and sattype="+sattype +" and Bname='"+Bname+"' and SeatNo="+SeatNo  ) ;
} 

	
		 
			
			String cond = " where htno='" + htno + "'";
			int count = obj.getCount("QAData", cond) ;
			  value_return=""+count; // 0
			if (count > 0)
			{
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
				value_return+="|"+class_+"|"+count;//18
			}
    		con.close();
			response.getWriter().write(value_return);
%>
