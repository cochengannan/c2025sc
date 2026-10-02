<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"  errorPage="../errorpage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="csc.Controller,java.sql.*"%><html>
<head>
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<script language="JavaScript" src="../js/csc.js"></script>
<title>Staff - Count</title>
</head>
<body bgcolor="white">
<%
	
try
{
	HttpSession session2=request.getSession(true);
	Controller obj=new Controller();
	Connection con=obj.con();
	obj.createStatement(con);
	String report_type="0";
	
		report_type=(String)session2.getAttribute("report_type");;
	
	if (report_type==null)
	{
		report_type="0";
	}
	String table="";
	String stage_msg="";
	if (report_type.equalsIgnoreCase("1"))
	{
		table=" [QA_Data_SMS] ";
		stage_msg="Stage 1";
	}
	else
	{
		table=" [QAData] ";
		stage_msg="Regular";
	}
	ResultSet rs=obj.getRS("select count(*) as a,NickName from "+table+" group by NickName order by count(*)  desc");


%> <center>  
<%@ include file="../commdiv3.jsp"%> 
<div id="inner" style=" overflow: scroll; height:790px; ">&nbsp;
<br><br><br><br><br><br><br><br><br>
<div id="menudiv"><ul id="css3menu1" style="width: 100%" >
				<li><a href='../home.jsp'>Home</a></li>
				<li><a href='javascript:window.history.go(-1)'>Back</a></li>
				<li> <a href='../reports/rprt.jsp'>Report</a></li>
				<li><a href="../logout.jsp">Logout</a></li>
			</ul>
	 </div>
<table bordercolor="skyblue" cellspacing="0" width="900"  cellpadding="10"  align="center" border="1" style="border-color:skyblue; background-position: top;border-collapse: collapse;"   >
<tr bgcolor="skyblue" class="tdText">
			<td colspan="3" align="center"> Staff Wise Entry Status - <%=stage_msg %> </td>
	</tr>	
    <tr bgcolor="#f8FAAF" class="tdText">
			<td align='center'> Staff Name  </td>
			<td align='center'> Total Record  </td>
			<td align='center'> Remarks  </td>
	</tr>
	<%
		String name="";
		String count="0"; 
		String color="";
		String msg="";
		int sum=0;
		while (rs.next())
		{
			name=rs.getString("NickName");
			
			count=rs.getString("a");;//obj.getCount("QAData","where NickName like '%"+name+"%'");
			if (Integer.parseInt(count) >=500)
			{
				color=" size=3 color=green";
				msg="<img src='../images/superjob.jpg' width='50' height='30'>";
			}else 
			if (Integer.parseInt(count) >=300 && Integer.parseInt(count) <500)
			{
				color=" size=3 color=green";
				msg="<img src='../images/gjob.jpg' width='50' height='30'>";
			}else if (Integer.parseInt(count) >=250 && Integer.parseInt(count) <300)
			{
				color=" size=3 color=green";
				msg="<img src='../images/welldone.jpg' width='50' height='30'>";

			}else if (Integer.parseInt(count) > 200 && Integer.parseInt(count) <= 250)
			{
				color=" size=3 color=green";
				msg="<img src='../images/goodjob.jpg' width='50' height='30'>";
			}else if (Integer.parseInt(count) >=100 )
			{
				color=" size=3 color=red";  
				msg="<img src='../images/keepgo.jpg' width='50' height='30'>.";
			}
			else
			{
				msg="<img src='../images/improve.jpg' width='50' height='30'>.";
				color="color='red'";	
			}
			sum=sum+Integer.parseInt(count);
			if (Integer.parseInt(count)!=0)
			{
		%>
		<tr>
			<td align="left" class="tdText"> <b><%=name%></b> </td><td align="center" class="tdText"><font <%=color%>><b> <%=count%></b> </font>  </td>
			<td class="tdText" align='center'><font <%=color%>><b><%=msg %></b></font></td>
		</tr>	
		<%  
			}
			}
	%>
	  <tr bgcolor="#f8FAAF" style='font-size:12pt'>
		<td>
			<b>Total </b>
		</td>
		<td align='center'>
			<b><%=sum %></b>
		</td>
		<td>
			   <font size=1>
			     >500 - super job
			     >300 - great
			     >250  < 300 - well done
   			     >200  < 250 - good job
   			     >100  < 200 - keep going
			     < 100  -- improve

			  
			    </font>
			   
		</td>
	</tr>
</table>
</div> </center>
<%
}catch(Exception e) 
{
	out.println(e);	
}
%>
</body>
</html>