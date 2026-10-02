<%@page import="csc.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*"    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
</head>
<body>

<form action="record_missing.jsp" method="get">


<%
try
{
	Connection con=null;
	Connection connew=null;
	Controller obj=new Controller();
	con=obj.con();
	
	HttpSession session2=request.getSession(true);
	String report_type=(String)session2.getAttribute("report_type");;	
	
	String s1=obj.setValue("School",request);
	String s2=obj.setValue("subject",request);
	String s3=obj.setValue("Medium",request);
	int start=Integer.parseInt(obj.setValue("from",request));
	int end=Integer.parseInt(obj.setValue("to",request));
	
	//public String combo_box(String id, String userquery, String text,String value, int set, String default_select, String defaultvalue,String fun)
	String School = obj.combo_box("School", "select * from School","schoolname", "schoolcode",0,s1,"","");
	String Medium = obj.combo_box("Medium", "select * from Medium","Medium","Medium",0,s3,"","");
	String sub_=obj.combo_box("subject","select distinct  SubjectName  from SubjectCode order by SubjectName","SubjectName","SubjectName",0,s2,"","class=select2");
	 String qry="select * from SubjectCode where SubjectName='"+s2+"' and Medium='"+s3+"' order by SubjectName";
	PreparedStatement ps1 = con.prepareStatement(qry);
	ResultSet rs2=ps1.executeQuery();
	String missing="<table align='center' border=1   cellpadding='10' cellspacing='0' bordercolor='red' style='border-collapse: collapse;>";
	missing+="<tr><td colspan=9 align=center>Missing HTNo</td></tr>";
	PreparedStatement ps2=null;
	ResultSet rs2_new=null;
	int count=0,count1=0;
 		if (rs2.next())		 		
		{  
 			String SubjectCode = rs2.getString("SubjectCode");
 			
 			for(int i=start;i<=end;i++)
 			{
 				String htno="";
 				if (i<=9)
 				 	htno=s1+SubjectCode+"00"+i;
 				else if (i>9 && i <=99)
 					htno=s1+SubjectCode+"0"+i;
 				else 					
 					htno=s1+SubjectCode+i;
 				
 				connew=obj.con();
 				ps2=null;
 				qry="select count(*) from QAData where htno='"+htno+"' and subject='"+SubjectCode+"' and medium='"+s3.charAt(0)+"' ";
 				ps2 = connew.prepareStatement(qry);
 				count=0;
 			    rs2_new=ps2.executeQuery();
 				if (rs2_new.next())
 				{
 					count=rs2_new.getInt(1);
 				}
 				if (count==0)
 				{count1++;
 					
 					   if (count1%9==0)
 						missing+="<tr>";
 					
 						if (count1%9!=0)
 						missing+="<td>"+htno+"</td>";
 						
 					if (count1%9==0)
 						missing+="</tr>"; 
 				} 
 				count=0;
 				connew.close();
 				connew=null; 
 			}
		}
 		missing+="</table>";
%>
<center> <div id="inner"  class="newcls">
<%@ include file="../head.jsp"%> 
<table bordercolor="skyblue" cellspacing="0" width="892" cellpadding="0" bgcolor="skyblue"  style="border-collapse: collapse;" align="center" border="1">
 
	<tr>
		<td>School</td>
		<td><%=School%></td>	
	</tr>
		<tr>
		<td>Subject</td>
		<td><%=sub_%><%=Medium%></td>	
	</tr>
	<tr>
		<td>Records</td>
		<td><input type=text id="from" name="from" value="<%=start%>">&nbsp;&nbsp;&nbsp;To&nbsp;&nbsp;&nbsp;<input type=text id="to" name="to"  value="<%=end%>"> </td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="Check"/>
		</td>
	</tr>
	<tr>
		<td colspan="2" align=center>
		
		<%=missing%>
		</td>
	</tr>
</table>
</div>
</center>
<%
}catch(Exception e)
{	 out.println(e); 
}

%>
</form>
</body>
</html>