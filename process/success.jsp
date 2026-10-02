<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  errorPage="../errorpage.jsp"%>
	<%@page import="csc.*"%>
<%@page import="java.util.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<script type="text/javascript">
function ps1(a,b)
{
	 document.location.href=b;
}
function ps()
{
	 document.getElementById("but").focus();  
}
</script>
</head>
<body onload="ps()">
 
 <%@ include file="../commdiv3.jsp"%>  
<br><br><bR><br>  
 <table width="75%" align="center"  cellpadding="5" cellspacing="0" border="1" style="border-collapse: collapse;">
		 		<tr  bgcolor='green'> <Td class="tdText" align="left"><font size=5> Application Status </font> </Td> </tr> 
 <%
	try {		
		 Controller obj = new Controller();
		 Connection con=obj.con();
		 int row=Integer.parseInt(request.getParameter("row"));
		 String flagtype=request.getParameter("flagtype");
		 String no=request.getParameter("no");
		  String file=request.getParameter("file");
		  HttpSession session2 = request.getSession(true);
		  
		 uname= obj.isNull((String) session2.getAttribute("uname"),1);
		 
		Calendar c1 = Calendar.getInstance();
		int year1 = c1.get(Calendar.YEAR);
		int month1 = c1.get(Calendar.MONTH);
		int day1 =  c1.get(Calendar.DAY_OF_MONTH);
	 	String tdate1=day1 + "/"+(month1+1)+"/"+year1;
		 
		 int sub_count2=obj.getCount("QAData", "where NickName like '%"+uname+"%'");
		 int sub_count3=obj.getCount("QAData", "where NickName like '%"+uname+"%' and EntryDate='"+tdate1+"'");
		 con.close();
		 if (row!=0)    
		 {
			 %>
			 <tr> 
			 <Td class="tdText" align="center" >  <b>Successfully Stored </b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</Td> </tr>
			 <tr><td><B>Message : </B></td> 
			 <tr>
			<td align="center"  >
 				 <br><Br><font size="5"><b>HTNO : <%=no%></b></font>	 <br><Br>
 				 <input type="button" id="but" onclick="ps1(<%=flagtype%>,'<%=file%>')" value="Press Enter" class="fb2">
 				 &nbsp;&nbsp;&nbsp;<a href='../home.jsp'>Home</a> 
			</td> 
			<tr>
				<td><br><font size="4"><b>Entry by : </b></font><%=uname%>
				<br><br><font size="4"><b>Total&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<%=sub_count2%> 
				<br><font size="4"><b>Today &nbsp;&nbsp;:&nbsp;<%=sub_count3%>				
			 </tr>
		   <%		 
		 }else
		 {  
			 %>
			  <tr bgcolor='red'> 
			  <Td class="tdText" align="center">
			 
			   <b>Not</b> Successfully Stored  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="but" onclick="ps()" value="Press Enter"  onclick="ps1()"  class="fb2"></Td> </tr>
			   <%
		 }
	 %>
	 		</table>
			<%
			 }catch(Exception e)
 {
	 
	 System.out.println("e"+e);
 }  
 %>
		 
</body>
</html>