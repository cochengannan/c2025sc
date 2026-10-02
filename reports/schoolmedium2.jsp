<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 	pageEncoding="ISO-8859-1"  errorPage="../errorpage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="csc.Controller,java.sql.*"%><html>
<head>
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<script language="JavaScript" src="../js/csc.js"></script>
</head>
<body>
<%
try
{
	Controller obj = new Controller();
	Connection con = obj.con();
	obj.createStatement(con);
	String flag=obj.setValue("flag",request);
	HttpSession session2=request.getSession(true);
	String flagv="";
	
	if (flag.equalsIgnoreCase("1")) 
		flagv="XII"; 
	else if (flag.equalsIgnoreCase("2")) 
		flagv="X";
	else
		flagv="D";
	
	
	session2.setAttribute("std",flagv);
	String qry = "select a.SubjectName+'<br>'+ a.Medium  as subname, a.SubjectCode,a.Medium  as med  from SubjectCode a where class='"+flagv+"' order by SubjectName";
	String table_column = "subname";
	String table_header = "";
	String table_heading = " ";
	String tab = "cellspacing='0' align=center cellpadding='3' width='100%' style='BORDER-COLLAPSE: collapse' border='1' borderColor='#92c2d8'";
	String html = obj.genReport2(qry, table_header, table_column, tab,table_heading, "", 1, "");  
	PreparedStatement ps = con.prepareStatement("select * from School order by sno");
	ResultSet rs = ps.executeQuery();
%> <center> <div id="inner"  class="newcls">
<%@ include file="../head.jsp"%> 
<table bordercolor="skyblue" cellspacing="0" width="892" cellpadding="0" bgcolor="skyblue"  style="border-collapse: collapse;" 
	align="center" border="1">
  <tr bgcolor="#000AAF" class="tdText"><td colspan="6" align="center"><font size='2' color='white'><b>School - Subject Wise Report   </b></font></td>
	</tr>  
</table>
<div id="inner">
<table bordercolor="skyblue" cellspacing="0" width="892" cellpadding="0"  
	align="center" border="1" class="tdText2">
	 
		<tr>
			<td width="20%"  align="center" rowspan=2> School Name </td>
			<td colspan=2 align="center">Stage I</td>
			<td align="center">Total I</td>
			<td colspan=2 align="center">Stage II</td>
			<td align="center">Total II</td>
		</tr>
		<tr>
		
		<td  align="center" bgcolor='skyblue'>T</td><td  align="center" bgcolor='skyblue'>E</td>
		<td>&nbsp;</td>
		<td bgcolor='skyblue' style="color: white;" align="center">T</td><td  align="center" bgcolor='skyblue'>E</td>
	</tr>
	<%
	
		int i=0;
			String scode="0",temp="0";
			ResultSet rs2=null;
			int nettot1=0;
			int nettot2=0;
			int nettot3=0;
			int nettot4=0;
			int tot1=0;
			int tot2=0;
			int tot3=0;
			int tot4=0;
			while (rs.next())
			{
				double d=Math.random()*10; 
				String sc = rs.getString("schoolcode");
				String sn = rs.getString("schoolname");
				String ar = rs.getString("area");   
				 out.println("<tr ><td bgcolor='#f"+d+"1'>"+sn+"</td>");
				 scode=sc;
				 
				int total=0;	
				 	 
					 int stage2tcount=obj.getCount("QAData","where school like ('"+sc+"%') and medium='T'");	 
					 int stage2ecount=obj.getCount("QAData","where school like ('"+sc+"%') and medium='E'");
					 int stage1tcount=obj.getCount("QA_Data_SMS","where school like ('"+sc+"%') and subject like '%T'");	 
					 int stage1ecount=obj.getCount("QA_Data_SMS","where school like ('"+sc+"%') and subject like '%E'");
					 
					 tot1=stage1tcount+stage1ecount;
					 tot2=stage2tcount+stage2ecount;
					 tot3+=tot1;
					 tot4+=tot2;
					 nettot1+=stage1tcount;
					 nettot2+=stage1ecount;
					 nettot3+=stage2tcount;
					 nettot4+=stage2ecount;
				out.println("<td align='center'>"+stage1tcount+"</td><td align='center'>"+stage1ecount+"</td><td align='center'>"+tot1+"</td><td align='center'>"+stage2tcount+"</td><td align='center'>"+stage2ecount+"</td><td align='center'>"+tot2+"</td></tr> ");
			}
			 
			out.println("<tr bgcolor='#000AAF' style='color: white;' ><td align=center>Total</td><td align='center'>"+nettot1+"</td><td align='center'>"+nettot2+"</td><td align='center'>"+tot3+"</td><td align='center'>"+nettot3+"</td><td align='center'>"+nettot4+"</td><td align='center'>"+tot4+"</td></tr> ");
	}catch(Exception e) { 
		
		out.println(e);
	//	response.sendRedirect("../index.jsp"); 
		
	} 
	%> 
</table>
</div></div></center>
</body>
</html>