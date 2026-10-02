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
	String report_type=(String)session2.getAttribute("report_type");;
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
	String html = obj.genReport2(qry, table_header, table_column, tab,table_heading, "", 1, "","M,F");  
	PreparedStatement ps = con.prepareStatement("select * from School order by sno");
	ResultSet rs = ps.executeQuery();
%> <center>
<%@ include file="../commdiv3.jsp"%>
<div style=" overflow: scroll; height:790px; ">
<table><tr>
<Td>
<div id="menudiv" style="top:110px;"><ul id="css3menu1" style="width: 100%" >
				<li><a href='../home.jsp'>Home</a></li>
				<li><a href='javascript:window.history.go(-1)'>Back</a></li>
				<li> <a href='../reports/rprt.jsp'>Report</a></li>
				<li><a href="../logout.jsp">Logout</a></li>
			</ul>
	 </div>  
  <br><br>
 
<table bordercolor="skyblue" cellspacing="0" width="892" cellpadding="0" bgcolor="skyblue"  style="border-collapse: collapse;" 
	align="center" border="1">
  <tr bgcolor="#f8FAAF" class="tdText"><td colspan="6" align="center"><font size='2'><b>School - Subject Wise Report</b></font></td>
	</tr>  
</table>

<Br>
<table bordercolor="skyblue" cellspacing="0" width="992" cellpadding="0"  
	align="center" border="1" class="tdText2">
	<tr bgcolor="skyblue"><td align="center"><font class="sans-serif">School Name</font></td>
		 <%=html%> 
		<td width='10%' bgcolor='skyblue'>School Total</td>
	</tr>
	 
	<%
	
		int i=0;
			String scode="0",temp="0";
			ResultSet rs2=null;
			int nettot1=0;
			int nettot2=0;
			while (rs.next())
			{
				double d1=Math.random()*10; 
				String sc = rs.getString("schoolcode");
				String sn = rs.getString("schoolname");
				String ar = rs.getString("area");   
				 out.println("<tr ><td   width='20%'   bgcolor='#f"+d1+"1' >"+sn+"</td>");
				 scode=sc;
				PreparedStatement ps1 = con.prepareStatement("select * from SubjectCode where class='"+flagv+"'  order by SubjectName");
				ResultSet rs1 = ps1.executeQuery();
				int total=0;	
				String html2="";
				while (rs1.next())
				{
					 String SubjectCode = rs1.getString("SubjectCode");
					 int count=obj.getCount("QAData","where school like ('"+sc+"%') and subject='"+SubjectCode+"'");
					 int mc=obj.getCount("QAData","where school like ('"+sc+"%') and subject='"+SubjectCode+"' and sex='M'");
					 int fc=obj.getCount("QAData","where school like ('"+sc+"%') and subject='"+SubjectCode+"' and sex='F'");
					 total=total+count;
					 if (count==0) {
						 html2=html2+"  <td  width='1%'><font color='#f"+d1+"1'><b> </b></td><td   width='1%' > </td><td    width='1%'></td> ";
					 }
					 else
					 { 
						 html2=html2+"  <td align='center'  width='2%'><a href='../process/entry_r.jsp?process=8&htno="+sc+SubjectCode+"'><b>"+count+"</b></td><td width='1%' align='center'>"+mc+"</td><td align='center' width='1%'>"+fc+"</td> ";	 
					 }
				}    
				out.println(html2);
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
			nettot2=0;
		 		while (rs2.next())		 		
				{    
		 			String SubjectCode = rs2.getString("SubjectCode");
		 			int c=obj.getCount("QAData","where subject='"+SubjectCode+"'");
		 			nettot2+=c;
					%>
					<td align="center"><font class="sans-serif"> <a href="../process/entry_r.jsp?process=9&sub_v=<%=SubjectCode%>"><%=c%></a></font></td>
					<td></td><td></td>
				<%		
					
				}  
			
			%>  
			<td align="center"> <%=nettot1%>/<%=nettot2%> </td>
			
			<%
	}catch(Exception e) { 
		
		out.println(e);
 		response.sendRedirect("../process/report_set.jsp"); 
		
	} 
	%> 
</table><a href="schoolmedium.jsp">Medium Wise</a></Td></tr> </table>

</div> </center>
</body>
</html>