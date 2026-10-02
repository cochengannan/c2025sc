<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"  errorPage="../errorpage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="csc.*"%>
<%@page import="java.util.*,java.sql.*"%>
<script language="JavaScript" src="../script.js"></script>
<script language="JavaScript" src="../js/csc.js"></script>
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<script language="JavaScript" src="../js/cellcreate.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Report List</title>
</head>
<body> 
<%String qry_cond="";
	String html = "";
	String msg="";
	String temp="";
	String report_type="";
	//try {
		Controller obj = new Controller();
		Connection con = obj.con();
		obj.createStatement(con);
		int  process=Integer.parseInt(obj.setValue("process",request));
		HttpSession session2=request.getSession(true);
		report_type=(String)session2.getAttribute("report_type");;
		String flagv=(String)session2.getAttribute("std");; 
		  temp=flagv;
		 if (report_type==null) report_type="0";
		 if (flagv==null) flagv="";
		 flagv="";
		if (process==5)
		{
			String staff=obj.setValue("staff",request);		
			qry_cond=" where NickName='"+staff+"'";
			msg=" <font color='#7D1B7E' size='3'>Staff Name  : " +staff+"</font>";
		}
		if (process==1)
		{
			String school=obj.setValue("school",request);			 
			qry_cond=" where   school like ('"+school+"%')";
			msg=" <font color='#7D1B7E'>Scholl Name :</font>"+obj.getValue("School","schoolname"," where schoolcode='"+school+"'");
		}
		else if (process==2)
		{
			String sub=obj.setValue("subject",request);		
			String Medium=obj.setValue("med",request);
			String sub_v=obj.getValue("SubjectCode","SubjectCode"," where SubjectName='"+sub+"' and Medium='"+Medium+"'"  );
			qry_cond="  where  subject like ('"+sub_v+"%')";
			msg=" <font color='#7D1B7E'>Subject Code:</font>"+sub+" <font color='#7E2217' > Medium : </font>"+Medium;
		}
		else if (process==6)
		{
			String HCode=obj.setValue("HCode",request);
			qry_cond=" where htno='"+HCode+"'";
			msg=" <font color='#7D1B7E'>HCode :</font><b>"+HCode+"</b>";
		}
		else if (process==7)
		{
			String chr=obj.setValue("chr",request);
			qry_cond=" where htno like ('"+chr+"%') ";
			msg=" <font color='#7D1B7E'>Selected Characters:</font><b>"+chr+"</b>";
		} else if (process==8)
		{
			String htno=obj.setValue("htno",request);
			qry_cond=" where htno like ('"+htno+"%')"; 
			msg="";
		} else if (process==9)
		{
		
			String sub_v=obj.setValue("sub_v",request);
			qry_cond="  where  subject like ('"+sub_v+"%')";
			msg="";
		}
		String qry ="", table_column="",table_header="" ;
		
	 if (report_type.equalsIgnoreCase("2"))
	 {
			if (process==10)
			{
			 	 qry = "select htno,name,doorno,add1,add2,area,city,pincode,landline,mobile1,EntryDate from crekid    "+qry_cond+"  "+flagv+" order by htno,EntryDate";
			 	 table_column = "htno,name,doorno,add1,add2,area,city,landline,mobile1,EntryDate";
			 	 table_header = "HTNO,Stduent Name,Doorno,Address1,Address2,Area,City,LandLine,Mobile1,Entry Date  ";
			}
			else
			{
				 out.println(flagv);
		 		 qry = "select htno,name,doorno,add1,add2,area,city,pincode,landline,mobile1,EntryDate,etime from QAData    "+qry_cond+"  "+flagv+" order by htno,EntryDate";
		 		 table_column = "htno,name,doorno,add1,add2,area,city,landline,mobile1,EntryDate,etime";
		 		 table_header = "HTNO,Stduent Name,Doorno,Address1,Address2,Area,City,LandLine,Mobile1,Entry Date,Exam time  ";	
			}
			  
			String table_heading = "<center>Information Sheet  </center>";
			String tab = "cellspacing='0' align=center cellpadding='3' width='100%' style='BORDER-COLLAPSE: collapse' border='1' borderColor='#92c2d8'";
			html = obj.genReport(qry, table_header, table_column, tab,table_heading, "htno", 0,"form_entry_ed.jsp");
	 }else
	 {
	 
		
		 		 if (temp.equalsIgnoreCase("XII")) temp=" and qual='12TH'"; else temp=" and qual='10TH'";
		 		 qry = "select htno,sname, phone1,phone2,phone3,school,subject,qual from QA_Data_SMS    "+qry_cond+"  "+temp+" order by htno ";
		 		 table_column = "htno,sname,phone1,phone2,phone3,school,subject,qual";
		 		 table_header = "HTNO,Stduent Name, LandLine,Mobile1, Mobile2,School,Subject,Qualification  ";	
			 
			  
			String table_heading = "<center>Information Sheet  </center>";
			String tab = "cellspacing='0' align=center cellpadding='3' width='100%' style='BORDER-COLLAPSE: collapse' border='1' borderColor='#92c2d8'";
			html = obj.genReport(qry, table_header, table_column, tab,table_heading, "htno", 1,"");
		 
	 }
	 	
		con.close();
	
%>
<div>
<div>	<%@ include file="../commdiv3.jsp"%></div> 

	<div id="menudiv" style="top:102px;"><ul id="css3menu1" style="width: 100%" >
				<li><a href='../home.jsp'>Home</a></li>
				<li><a href='javascript:window.history.go(-1)'>Back</a></li>
				 	<li> <a href='../reports/rprt.jsp'>Report</a></li>
				<li><a href="./logout.jsp">Logout</a></li>
			</ul>
	 
	</div>
	<Br><Br><Br>
	<div id="inner"  style="overflow: scroll; height:760px;top:30px; ">  
		<table   width="100%" align="left" bgcolor="#ADDFFF"  bordercolor="#ADFFFA" >
			
			<tr style="text-align: center;">
				<td class="tdText"><font size="4">Data of  <%=report_type.equalsIgnoreCase("1")?"Stage I":"Regular"%> </font> </td>
			</tr>
			<tr style="text-align: center;">
				<td class="tdText"> <%=msg%>  </td>
			</tr>    
			<tr>
				<td align="center"><%=html%></td>
			</tr>
			<tr>
				<td align="center"><a href="../reports/excel_report_gen.jsp?flag=6&qry_cond=<%=qry_cond%>">Excel </a><input type="button" value="Close"
					onclick="javascript:window.close()"  class="fb2">
				</td>
			</tr>  
		</table>
	</div>
</div>
</body>
<% 
	/* } catch (Exception e)  
	{
		out.println(e);
	 	// response.sendRedirect("./report_cond.jsp");
	} */

%>
</html>