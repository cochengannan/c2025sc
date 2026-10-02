<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"  errorPage="../errorpage.jsp"%>
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
	String flagv="";
	 
	if (flag.equalsIgnoreCase("1")) 
		flagv="XII"; 
	else if (flag.equalsIgnoreCase("2")) 
		flagv="X";
	else
		flagv="D";
	
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
  <tr bgcolor="#f8FAAF" class="tdText"><td colspan="6" align="center"><font size='2'><b>School - Subject Wise Report</b></font></td>
	</tr>  
</table>
<div id="inner">
<table bordercolor="skyblue" cellspacing="0" width="892" cellpadding="0"  
	align="center" border="1" class="tdText2">
	<tr><td width="20%"> School Name </td>
		<%=html%>
		<td bgcolor='skyblue'>School Total</td>
	</tr>
	<%
	
		int i=0;
			String scode="0",temp="0";
			ResultSet rs2=null;
			int nettot1=0;
			int nettot2=0;
			while (rs.next())
			{
				double d=Math.random()*10; 
				String sc = rs.getString("schoolcode");
				String sn = rs.getString("schoolname");
				String ar = rs.getString("area");   
				 out.println("<tr ><td bgcolor='#f"+d+"1'>"+sn+"</td>");
				 scode=sc;
				PreparedStatement ps1 = con.prepareStatement("select * from SubjectCode where class='"+flagv+"'  order by SubjectName");
				ResultSet rs1 = ps1.executeQuery();
				int total=0;	
				while (rs1.next())
				{
					String SubjectCode = rs1.getString("SubjectCode");
					 int count=obj.getCount("QAData","where htno like ('"+sc+"%') and subject='"+SubjectCode+"'");
					 total=total+count;
					 if (count==0) {
					 out.println(" <td align='center'><font color='#f"+d+"1'><b>&nbsp;</b></td>");
					 }
					 else
					 { 
						 out.println(" <td align='center'><a href='../process/entry_r.jsp?process=8&htno="+sc+SubjectCode+"'><b>"+count+"</b></td>");	 
					 }
				}   
				temp=sc;
				nettot1+=total;
		%>
			<td align="center"> <a href="../process/entry_r.jsp?process=8&htno=<%=sc%>"><%=total%></a> </td>
		<%  
				out.println("</tr> ");
			}
			out.println(" <tr><td bgcolor='skyblue'> Subject Total </td>");
			PreparedStatement ps1 = con.prepareStatement("select * from SubjectCode where class='"+flagv+"' order by SubjectName");
			rs2=ps1.executeQuery();
		 		while (rs2.next())		 		
				{  
		 			String SubjectCode = rs2.getString("SubjectCode");
		 			int c=obj.getCount("QAData","where subject='"+SubjectCode+"'");
		 			nettot2+=c;
					%>
					<td align="center"> <a href="../process/event_entry.jsp?process=9&sub_v=<%=SubjectCode%>"><%=c%></a> </td>
				<%		
					
				}  
			
			%>  
			<td align="center"> <%=nettot1%>/<%=nettot2%> </td>
			
			<%
	}catch(Exception e) { 
		
		out.println(e);
	//	response.sendRedirect("../index.jsp"); 
		
	} 
	%> 
</table>
</div></div></center>
</body>
</html>