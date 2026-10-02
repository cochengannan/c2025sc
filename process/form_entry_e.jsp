<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  errorPage="../errorpage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="csc.Controller"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%><html>
<%@page import="java.util.*,java.sql.*"%>
<head>
 <link href="../css/menu.css" rel="stylesheet" media="screen"/>
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">
function ps1()
{
	  
	 document.location.href="./entry_r.jsp";
}
function ps()
{
	 document.getElementById("but").focus();
}
</script>

 
</head>
<body onload="ps()"> 
<%
	String no="";
 	PreparedStatement ps1=null;
	int row=0;
	try
	{	
		String sc=(String)session.getAttribute("school_name");
		String sb=(String)session.getAttribute("subject_name");
		String sc_code=(String)session.getAttribute("school_code");
		String sb_code=(String)session.getAttribute("subject_code");
		 
		String sbt2 = (String) session.getAttribute("time");
		Controller obj=null;
		obj=new Controller();
		Connection con=obj.con();
		out.println("TEST");
		String no1=obj.setValue("no1",request).toUpperCase();
		String no2=obj.setValue("no2",request).toUpperCase();
		String name1=obj.setValue("name",request).toUpperCase();
		String name2=obj.setValue("name2",request).toUpperCase();
		String sex=obj.setValue("sex",request).toUpperCase();
		String day=obj.setValue("day",request).toUpperCase();
		String month=obj.setValue("month",request);
		String monincome=obj.setValue("monincome",request);
		String year=obj.setValue("year",request);
		String class_s=obj.setValue("class_s",request).toUpperCase();
		String fname0=obj.setValue("fname0",request).toUpperCase();
		String fname1=obj.setValue("fname1",request).toUpperCase();
		String foccup=obj.setValue("foccup",request).toUpperCase();
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
		String sb_c=obj.setValue("sb_c",request).toUpperCase();
		   no=no1+no2;
		  
		 Calendar cal = Calendar.getInstance();
		 int cy=cal.get(Calendar.YEAR);
		 
		 int age=cy-Integer.parseInt(year);
		 
		
		 
		 int count=obj.getCount("QAData"," where htno='"+no+"'");
		 out.println("count");
		 if (count!=0)
		 {
		 String qry="update QAData set "+
		    " name=?"+
		    ",qual=?"+
		    ",qualtype=?"+
		    ",sex=?"+
		    ",age=?"+
		    ",fname=?"+
		    ",occ=?"+
		    ",add1=?"+
		    ",add2=?"+
		    ",area=?"+
		    ",city=?"+
		    ",pincode=?"+
		    ",landline=?"+
		    ", mobile1=?"+
		    ",mobile2=?"+
		    ",religion=?"+
		    ",community=?"+
		    ",school=?"+
		    ",subject=?"+
		    ",medium=?"+
		     ",dob=?, monincome=? " +
		    		" where htno=?";
		 
		 
		 
		 String res1=sb_c;
		 
		 String db=day+"/"+month+"/"+year;
	
		   ps1=con.prepareStatement(qry);
		 ps1.setString(1,name1+"."+name2);
		 String qual="";
		 String qualtype="";
		 if (class_s.equalsIgnoreCase("+2")) qual="12TH"; else qual="10TH";
		 if (class_s.equalsIgnoreCase("+2")) qualtype="XII"; else qualtype="X"; 
		 
		 ps1.setString(2,qual);
		 ps1.setString(3,qualtype);
		 ps1.setString(4,sex);
		 ps1.setString(5,Integer.toString(age));
		 ps1.setString(6,fname0+"."+fname1);
		 ps1.setString(7,foccup);
		 ps1.setString(8,addr1);
		 ps1.setString(9,addr2); 
		 ps1.setString(10,addr3);
		 ps1.setString(11,addr4);
		 ps1.setString(12,pincode); 
		 ps1.setString(13,phone);
		 ps1.setString(14,mobile1);
		 ps1.setString(15,mobile2);
		 ps1.setString(16,Religion);
		 ps1.setString(17,Community);
		 ps1.setString(18,sc_code+"-"+sc);
		 ps1.setString(19,sb_code);
		 ps1.setString(20,sb_c);
		 ps1.setString(21,db);
		 
		 ps1.setString(22,monincome);
		 ps1.setString(23,no);
		 
		   row=ps1.executeUpdate();
		   out.println("rows sdfsf"+row);
		   ps1=con.prepareStatement("delete from QARelation where htno=?");
		 ps1.setString(1,no);
		 row=ps1.executeUpdate();
		 out.println("row"+row);
		 /*	
		 
		 
		 int crow= Integer.parseInt(obj.setValue("crow",request));
		 
		 
		 
		 for (int i=1;i<=crow;i++)
		 {
		 	qry="update  QARelation set "+ 
		 	" name=?"+
		 	",rname=?"+
		 	",rqual=?"+
		 	",rqualtype=?"+
		 	",rsex=?"+
		 	",rage=?"+
		 	",fname=?"+
		 	",occ=?"+
		 	",add1=?"+
		 	",add2=?"+
		 	",area=?"+
		 	",city=?"+
		 	",pincode=?"+
		 	",landline=?"+
		 	", mobile1=?"+
		 	",mobile2=?"+
		 	",religion=?"+
		 	",community=?"+
		 	" where htno=?";
		 
		    ps1=con.prepareStatement(qry);
		    
		    
		    ps1.setString(1,name1+"."+name2);
		   
		    String ssname=obj.setValue("ssname"+i,request).toUpperCase();
		    
		    if (!ssname.equalsIgnoreCase(""))
		    {
		    String ssage=obj.setValue("ssage"+i,request).toUpperCase();
		    String sssex=obj.setValue("sssex"+i,request).toUpperCase();
		    String ssscholl=obj.setValue("ssscholl"+i,request).toUpperCase();
		    String ssqtype=obj.setValue("ssqtype"+i,request).toUpperCase();
		     
		 
		      
		    
		    ps1.setString(2,ssname);
		    ps1.setString(4,ssqtype);
		    ps1.setString(3,ssscholl);
		    ps1.setString(5,sssex);
		    ps1.setString(6,ssage);
		    
		    
		    ps1.setString(7,fname0+"."+fname1);
		    ps1.setString(8,foccup);
			ps1.setString(9,addr1);
			ps1.setString(10,addr2);
			ps1.setString(11,addr3);
			ps1.setString(12,addr4);
			ps1.setString(13,pincode);
			ps1.setString(14,phone); 
			ps1.setString(15,mobile1);
			ps1.setString(16,mobile2);
			ps1.setString(17,Religion);
			ps1.setString(18,Community);
			ps1.setString(19,no);
			row=ps1.executeUpdate();
		    }
		 }
		 
		 */
		 out.println("row"+count);
		 int r_r=0;
		 if (count!=0)
		 {
		 int crow=Integer.parseInt(obj.setValue("crow",request));
		 for (int i=1;i<=crow;i++)
		 {
		 	qry="insert into QARelation (htno,name,rname,rqual,rqualtype,rsex,rage,fname,occ,add1,add2,area,city,pincode,landline, mobile1,mobile2,religion,community)";
		 	qry+="values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? )";
		    ps1=con.prepareStatement(qry);
		    
		    ps1.setString(1,no);
		    ps1.setString(2,name1+"."+name2);
		   
		    String ssname=obj.isNull(request.getParameter("ssname"+i),3).toUpperCase().trim();
		    
		    if (ssname.length() > 0  )
		    {
		    String ssage=obj.setValue("ssage"+i,request).toUpperCase();
		    String sssex=obj.setValue("sssex"+i,request).toUpperCase();
		    String ssscholl="";
		    String ssqtype=obj.setValue("ssqtype"+i,request).toUpperCase();
		    ssscholl=obj.getValue("Qualification","qualtype","where qual='"+ssqtype+"'");
		 
		        
		    
		    ps1.setString(3,ssname);
		    ps1.setString(4,ssqtype);
		    ps1.setString(5,ssscholl);
		    ps1.setString(6,sssex);
		    ps1.setString(7,ssage);
		    
		    
		    ps1.setString(8,fname0+"."+fname1);ps1.setString(9,foccup);
			ps1.setString(10,addr1);ps1.setString(11,addr2); ps1.setString(12,addr3);ps1.setString(13,addr4);
			ps1.setString(14,pincode); ps1.setString(15,phone); ps1.setString(16,mobile1);ps1.setString(17,mobile2);
			ps1.setString(18,Religion);ps1.setString(19,Community);
			
			r_r=ps1.executeUpdate();
		    }
		 }  
		 
		 
		 out.println("row  sdfs " +row);
		 %>
		  <table width="75%" align="center"  cellpadding="5" cellspacing="0" border="0" style="border-collapse: collapse;">
		 		<tr> <Td class="tdText" align="center"><font size=4> Entry
		Status </font> </Td> </tr> 
		 
		 
		 <% 
		 
		 
		 if (row!=0)  
		 {
			 
			 %>
			  
				
		 		 <tr bgcolor='green'> 
			 
			 <Td class="tdText" align="center">  <b>Successfully Stored </b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="but" onclick="ps1()" value="Press Enter" class="fb2"></Td> </tr>
			 

			    
			 
		   <%		 
		 }
		 else
			 
		 {%>
			 <tr bgcolor='red'> 
			  <Td class="tdText" align="center">
			 
			   <b>Not</b> Successfully Stored  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="but"   value="Press Enter"  onclick="ps1()"  class="fb2"></Td> </tr>
			 
			 
		 <%}
		 
		 
		 }
		 else
		 {
			 %>
			 
			 
		   <%	
			 
		 }
		 }
	 
	}catch(Exception e)
	{
		out.println(e);
	}
		
		


%>
</table>


</body>
</html>