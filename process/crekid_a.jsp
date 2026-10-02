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
 <link href="../css/menu.css" rel="stylesheet" media="screen"/>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function ps1(a)
{
	 document.location.href="./cre-kid.jsp?flagtype="+a;
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
		sc = obj.isNull((String) session.getAttribute("school_name"),1);
		if (entrytype.equalsIgnoreCase("1")||entrytype.equalsIgnoreCase("2"))
		{
		  sc_code=obj.isNull((String)session.getAttribute("school_code"),1);
		  source="Q";
		}else if (entrytype.equalsIgnoreCase("3"))
		{
			source="D";
			
		}else if (entrytype.equalsIgnoreCase("4"))
		{
			source="C";
			
		}
			
				
		
		  
		
		
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
	String sex=obj.setValue("sex",request).toUpperCase();
		String no1=obj.setValue("no1",request).toUpperCase();
		String no2=obj.setValue("no2",request).toUpperCase();
		String name1=obj.setValue("name",request).toUpperCase();
		String name2=obj.setValue("name2",request).toUpperCase();
		String month=obj.setValue("month",request);
		String year=obj.setValue("year",request);
		String class_s=obj.setValue("class_s",request).toUpperCase();
		String fname0=obj.setValue("fname0",request).toUpperCase();
		String fname1=obj.setValue("fname1",request).toUpperCase();
		String addfirst=obj.setValue("addfirst",request).toUpperCase();
		String qual=obj.setValue("qual",request);
		String btc=obj.setValue("btc",request);
		
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
		String Religion=obj.setValue("Religion",request).toUpperCase();
		String Community=obj.setValue("Community",request).toUpperCase();
		
		int no_find=Integer.parseInt(no2);
	   
		
		if (no2.length()==1) 
			no2="00"+no2;
		if (no2.length()==2) 
			no2="0"+no2;  
		
		 String no=no1+no2;
		 
		 Calendar cal = Calendar.getInstance();
		 int cy=cal.get(Calendar.YEAR);
		 
		 int age=cy-Integer.parseInt(year);
		 
		 int count=obj.getCount("crekid"," where rfno='"+no+"'");
	 		int r=0;
	 
						 if (count==0)
						 {
						 String qry="insert into crekid (rfno,name,sex,  add1,add2,area,city,pincode,landline, mobile1,mobile2,religion,community,school,standard,section,fname)";
						 qry+="values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";//17
						 
						 PreparedStatement ps=con.prepareStatement(qry);  
						 ps.setString(1,no);ps.setString(2,name1+" ."+name2);
						 
						 ps.setString(3,sex);
						 ps.setString(4,addr1);
						 ps.setString(5,addr2);
						 ps.setString(6,addr3);
						 ps.setString(7,addr4);
						 ps.setString(8,pincode); 
						 ps.setString(9,phone); 
						 ps.setString(10,mobile1);
						 ps.setString(11,mobile2);
						 ps.setString(12,Religion);
						 ps.setString(13,Community);
						 ps.setString(14,sc);
						 ps.setString(15,qual);
						 ps.setString(16,btc);
						 ps.setString(17, fname0 + "." + fname1);
						 int count2=obj.getCount("crekid"," where rfno='"+no+"'");  
						 if (count2==0)
						 {
							 try 
							 {
								r=0;
							    row=ps.executeUpdate();
							      
							    
							    int resf=0;
							    int oldstudcount=obj.getCount("stud"," where name='"+name1+"'");  
							    
							    
							    if (oldstudcount==0)
							    {
							    	Hashtable ht=new Hashtable();  
							    	ht.put("name","'"+name1+"'");  
							    	ht.put("htno","0");
							    	//resf=obj.recordSave(ht,"stud",con);   	
							    }
							    int oldfathercount=obj.getCount("father"," where fname='"+fname0+"'");
							   
							    if (oldfathercount==0)
							    {
							    	int fmax=obj.getMax("father","sno","");
							    	Hashtable ht=new Hashtable();  
							    	ht.put("fname","'"+fname0+"'");
							    	ht.put("sno",fmax);
							    //	resf=obj.recordSave(ht,"father",con);   	
							    }
							    int oldstreetcount=obj.getCount("street"," where street='"+addr1+"'");
							   
							    if (oldstreetcount==0)
							    {
							    	 
							    	Hashtable ht=new Hashtable();
							    	ht.put("street","'"+addr1+"'");
							    	 
							    	//resf=obj.recordSave(ht,"street",con);   	
							    }
							    int oldnagarcount=obj.getCount("nagar"," where sname='"+addr2+"'");
							   
							    if (oldnagarcount==0)
							    {
							    	 
							    	Hashtable ht=new Hashtable();
							    	ht.put("sname","'"+addr2+"'");
							    	 
							    	//resf=obj.recordSave(ht,"nagar",con);   	
							    }
							      
							    
							    
							    
							    
							    
							    
							    
							    
							    
							    
							    
							    
							    
							    
							    
							    
							    
							    
							    
							    
							 }catch(Exception e ) {
								 out.println(e);
							 }
						 }
						 else
						 {
							 r=1;
						 }
						 int crow=Integer.parseInt(obj.setValue("crow",request)); 
						 
						 
						   
		 
		 %>
				
		 		<tr> <Td class="tdText" align="center"><font size=4> Entry Status </font> </Td> </tr> 
		 <%
		 if (row!=0)    
		 { 
			  response.sendRedirect("./success.jsp?row="+row+"&flagtype="+entrytype+"&file="+"./cre-kid.jsp?flagtype="+entrytype+"")	 ;
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
			<tr bgcolor='red'> <Td bgcolor='red'> <img src='../image/err1.jpg'> <font color='white'>Sorry Information Not Stored ,<a href="./cre-kid.jsp">Click </a><img src='../image/err2.gif'></</font></Td> </tr>
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