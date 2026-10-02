<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"  errorPage="../errorpage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="csc.Controller,java.sql.*"%><html>
<head>
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<script language="JavaScript" src="../js/csc.js"></script>
<%@ include file="../head.jsp"%>
</head>
<body>
<form action="smsset_a.jsp" method="post">
  <center> 
<%
String smsdesc="0";
try
{
	Controller obj = new Controller();
	Connection con = obj.con();
	obj.createStatement(con);
	
	HttpSession session2=request.getSession(true);
	String report_type=(String)session2.getAttribute("report_type");
	  
	 
	 
	 
	String qry_cond="",qString="",msg="";
	String school=obj.setValue("school",request);
	String subject=obj.setValue("subject",request);
	  smsdesc=obj.setValue("smsdesc",request);
	String sub=obj.setValue("subject",request);		
	String Medium=obj.setValue("med",request); 
	out.println("<input type=hidden name='school' value="+school+">");
	 out.println("<input type=hidden name='subject' value="+subject+">");
	 out.println("<input type=hidden name='med' value="+Medium+">");
	 out.println("<input type=hidden name='smsdesc' value="+smsdesc+">");
	 
	String sub_v=obj.getValue("SubjectCode","SubjectCode"," where SubjectName='"+sub+"' and Medium='"+Medium+"'"  );
	String smsmessage=obj.getValue("smsmas","smsdesc"," where sno="+smsdesc+""  );
	msg="";
 
		qry_cond = "select htno,sname,phone1,phone2,phone3 from QA_Data_SMS ";
		if (!school.equalsIgnoreCase("0") && subject.equalsIgnoreCase("0"))
		{
			qry_cond+="  where school like ('"+school+"%') ";
			
			msg=" <font color='white'>Scholl Name :</font><font color='blue'>"+obj.getValue("School","schoolname"," where schoolcode='"+school+"'");	
		} 
		else if (school.equalsIgnoreCase("0") && !subject.equalsIgnoreCase("0"))
		{
			qry_cond+="  where subject like ('"+sub_v+"%') ";
			msg=" <font color='white'>Subject Code:</font><font color='blue'>"+sub+" <font color='white' > Medium : </font><font color='blue'>"+Medium+"</font>";
			msg+=" <font color='white'>Scholl Name :</font><font color='blue'>"+obj.getValue("School","schoolname"," where schoolcode='"+school+"'")+"</font>";
		}
		else 
		{
			qry_cond+=" where school like ('"+school+"%') and  subject like ('"+sub_v+"%')";
			msg=" <font color='white'>Subject Code:</font><font color='blue'>"+sub+"</font> <font color='white' > Medium : </font><font color='blue'>"+Medium+"</font>";
			msg+=" <font color='white'>Scholl Name :</font><font color='blue'>"+obj.getValue("School","schoolname"," where schoolcode='"+school+"'")+"</font>";
		}  
		
	//	qry_cond+=" or (1=1) and  smssno not in ("+smsdesc+" )";
		//msg=" <font color='white'>Scholl Name :</font>"+obj.getValue("School","schoolname"," where schoolcode='"+school+"'");
		 
	PreparedStatement ps1 = con.prepareStatement(qry_cond.toString());
	ResultSet rs1 = ps1.executeQuery();
	int total=0;
	int row=0; 
	
	String back="<td>"+smsmessage+"</td><td  width='5%'><input type=button id='bk' value='<--' onclick='javascript:window.close()'></td> ";
	StringBuffer bf1=new StringBuffer("<table cellspacing='0' align=center cellpadding='3' width='70%' style='BORDER-COLLAPSE: collapse' border='1' borderColor='#92c2d8'><tr style='text-align: center; color: white;' bgcolor='#929513'><td width='5%'>Sl.No</td><td  width='10%'>Ht.No</td><td  width='45%'>Student Name</td><td>Phone1</td><td>Phone2</td><td>Phone3</td>"+back+"</tr><tr><tr style='text-align: center; color: white;' bgcolor='#f9bff1'><td colspan=6>"+msg+"</td><td><input type=button value='All'></td></tr></table>");
	out.println(qry_cond);
	out.println(bf1.toString());
	StringBuffer bf=new StringBuffer("");
	%> 
		<div id='scroll_clipper'
			style='position: relative; vertical-align: top; width: 472; border-height: 1px; height: 400px; overflow: auto; white-space: nowrap;'>
		<div id='scroll_text'>
			<table class="dvfont" style="border-collapse: collapse;"
			bordercolor="skyblue" cellspacing="0" width="472" cellpadding="3"
			border="1" align="center">
	 
	<%
	bf.append("<table cellspacing='0' align=center cellpadding='3' width='70%' style='BORDER-COLLAPSE: collapse' border='1' borderColor='#92c2d8'></tr>");
	String htno="";
	
	 while (rs1.next())   
	{
		 htno=rs1.getString("htno");
		bf.append("<tr><td align='center'>"+(++row)+"</td><td align='left'>"+htno+"</td><td align='left'>"+rs1.getString("sname")+"</td><td align='left'>"+rs1.getString(3)+"</td><td>"+rs1.getString(4)+"</td><td>"+rs1.getString(5)+"</td><td><input type='checkbox' id='c"+row+"' name='c"+row+"' value='"+htno+"'></td> </tr>");		
	} 
	%>
	
	<%
	bf.append("</table></div></div></div></table>");   
	out.println(bf.toString());
	 
}catch(Exception e)
{
	out.println(e);	
}%><input type=submit value='Click'></table></div></div></center>
<input type=hidden name="smssno" id="smssno" value="<%=smsdesc%>"> </form></body>
</html>