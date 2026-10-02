<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

 <%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%><html>
<%@page import="java.util.*,java.sql.*"%>
<%@ page language="java"
	import="csc.*,java.sql.*,java.io.*,java.text.*,java.util.Date,java.util.Calendar,java.lang.System,java.util.*"%>
<head>
<link href="../css/txtbox.css" rel="stylesheet" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function ps1(a)
{
	 document.location.href="./enq_entry.jsp?flagtype="+a;
}
function ps()
{
	 document.getElementById("but").focus();
}
</script>

</head>

<body onload="ps()">
<br>
<br><br><br><br><br> 
 <table width="75%" align="center"  cellpadding="5" cellspacing="0" border="1" style="border-collapse: collapse;">
 
<%
int row=0;
	try
	{	
		
		Controller obj=null;
		obj=new Controller();
		Connection con=obj.con();
		
		obj.createStatement(con);
		String sc="",sb="",sc_code="",sb_code="",sel_med="";
		String entrytype=obj.setValue("entrytype",request);
		String source="";
		 
		  
		
		
		String ent_uname=obj.isNull((String)session.getAttribute("uname"),1);
		String sbt2 = obj.isNull((String) session.getAttribute("time"),1);
		String uname= obj.isNull((String) session.getAttribute("uname"),1);
		String med_sh="";
		if (sel_med.equalsIgnoreCase("ENGLISH"))
		{
			med_sh="E";
		}
		else
		{
			med_sh="T";			
		}
		  
		java.util.Date sysDate=new java.util.Date(System.currentTimeMillis());
		SimpleDateFormat sdf=new SimpleDateFormat("d/M/yyyy");
		SimpleDateFormat sdfM=new SimpleDateFormat("hh:mm:ss aa"); 
		String date_=sdf.format(sysDate);
	
		String no2=obj.setValue("no2",request).toUpperCase();
		String name1=obj.setValue("name",request).toUpperCase();
		String name2=obj.setValue("name2",request).toUpperCase();
		String sex=obj.setValue("sex",request).toUpperCase();
		//String day=obj.setValue("day",request).toUpperCase();
		//String month=obj.setValue("month",request);
		//String year=obj.setValue("year",request);
		String class_s=obj.setValue("class_s",request).toUpperCase();
		//String fname0=obj.setValue("fname0",request).toUpperCase();
		//String fname1=obj.setValue("fname1",request).toUpperCase();
		//String foccup=obj.setValue("foccup",request).toUpperCase();
		String addfirst=obj.setValue("addfirst",request).toUpperCase();
		
		if (addfirst.equalsIgnoreCase("None")) addfirst=""; 
		
		String doorno=addfirst+" "+obj.setValue("doorno",request).toUpperCase()+",";
		String addr1=obj.setValue("addr1",request).toUpperCase();
		String addr2=obj.setValue("addr2",request).toUpperCase();
		String addr3=obj.setValue("addr3",request).toUpperCase();
		String addr4=obj.setValue("addr4",request).toUpperCase();
		String pincode=obj.setValue("pincode",request);
		String phone=obj.setValue("phone",request);
 		String mobile1=obj.setValue("mobile1",request);
 		String mobile2=obj.setValue("mobile2",request);
		 
		int no_find=Integer.parseInt(no2);
		String  Staff=obj.setValue("Staff",request,3);
		String  BatchTime=obj.setValue("BatchTime",request);
		String  idate=obj.setValue("idate",request,3);
		String  remarks=obj.setValue("remarks",request);
		String  CourseName=obj.setValue("CourseName",request);
		Staff=obj.setValue("Staff",request);
		 String no=no2;
		 Calendar cal = Calendar.getInstance();
		 int count=obj.getCount("Enquiry"," where rfno="+Integer.parseInt(no)+"");
		  out.println("count");
	 		int r=0;
	   
						 if (count==0)
						 { 
						 String qry="insert into Enquiry (rfno,name,qual,sex,doorno, add1,add2,area,city,pincode,landline, mobile1,mobile2, Counsellarname,CDate,Remarks,Courseprf,Timepreferred)";
						 qry+="values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";//22 
						 
						 PreparedStatement ps=con.prepareStatement(qry);
						 ps.setInt(1,Integer.parseInt(no));ps.setString(2,name1+" ."+name2);
						 String qual=class_s;
						 ps.setString(3,qual);  
						 ps.setString(4,sex);
						 ps.setString(5,doorno);
						 ps.setString(6,addr1);
						 ps.setString(7,addr2);
						 ps.setString(8,addr3);
						 ps.setString(9,addr4);
						 ps.setString(10,pincode); 
						 ps.setString(11,phone); 
						 ps.setString(12,mobile1);
						 ps.setString(13,mobile2);
						 ps.setString(14,Staff);
						 ps.setString(15,idate);
						 ps.setString(16,remarks);
						 ps.setString(17,CourseName);  
						 ps.setString(18,BatchTime);
						 
						     
						 int count2=obj.getCount("Enquiry"," where rfno="+no+"");
						 out.println("count2---->" + count2  );
						 if (count2==0)
						 {
							 try 
							 {
								r=0;
							    row=ps.executeUpdate();
							    
							 }catch(Exception e )
							 {
								 
								 out.println(e);
							 }
						 }
						 else
						 {
							 r=1;
						 }
						 int crow=Integer.parseInt(obj.setValue("crow",request)); 
						 con=null;
		 %>
				
		 		<tr> <Td class="tdText" align="center"><font size=4> Entry Status </font> </Td> </tr> 
		 <%
				 if (row!=0)    
				 { 
			  	 response.sendRedirect("./success.jsp?row="+row+"&flagtype="+entrytype+"&file="+"./enq_entry.jsp?flagtype="+entrytype)	 ;
				 }else
				 {
					 
					 %>
					  <tr bgcolor='red'> 
					  <Td class="tdText" align="center">
					 
					   <b>Not</b> Successfully Stored  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="but" onclick="ps(<%=entrytype%>)" value="Press Enter"  onclick="ps1()"  class="fb2"></Td> </tr>
					   <%		 
				 }
			 	   
		 }  
		 else
		 {  
			 %>
			<tr bgcolor='red'> <Td bgcolor='red'> <img src='../image/err1.jpg'> <font color='white'>Sorry Information Not Stored ,<a href="./form_entry.jsp">Click </a><img src='../image/err2.gif'></</font></Td> </tr>
			 <%	  		 
		 }
	 %>
	 		</table>
	 
	 <%
	}catch(Exception e)
	{
		out.println(e);
	}
		
		


%>



</body>
</html>