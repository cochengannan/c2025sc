<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%><html>
<%@page import="java.util.*,java.sql.*"%>
<%@ page language="java" import="csc.*,java.sql.*,java.io.*,java.text.*,java.util.Date,java.util.Calendar,java.lang.System,java.util.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Follow up History</title>
<style type="text/css">
#apDiv5 {
	position: absolute;
	left: 0px;
	top: 0px;
	width: 75%;
	height: 10%;
}

#apDiv6 {
	position: absolute;
	z-index: 3;
	top: 835px;
	width: 75%;
	left: 120px;
}

#thead {
	position: absolute;
	left: 50px;
	top: 120px;
	width: 75%;
	height: 110px;
	z-index: 3;
}

.box-shadow {
	font-family: cursive, sans-serif;
	padding: 2px;
	border-radius: 4px;
	box-shadow: 2px 2px 20px 23px #7AC5CD;
}

body {
	background-repeat: no-repeat;
	background-size: 1600px 900px;
	background-image: url('../sky2.jpg');
}
</style>
</head>
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<link rel="stylesheet" type="text/css" href="../css/new.css" />
<body>

<%
try {

	Controller obj = null;
	obj = new Controller();
	Connection con = obj.con();
	obj.createStatement(con);
	String htno = obj.setValue("htno", request).toUpperCase();
	
	PreparedStatement ps_loc = con.prepareStatement("select * from StudentFollowup where htno='"+htno+"' order by seqno desc");
	String name = obj.getValue("QAData", "name"," where htno='"+htno+"'");
	ResultSet rs = ps_loc.executeQuery();
	%>
	
	<table bordercolor="skyblue" cellspacing="0" width="1000" cellpadding="10"   align="center" border="1" class="tdText2">
	<tr><td colspan="6" align="center">Call History of <b><%=name %></b> -  <%=htno %></td>
	<tr  bgcolor="white"align="center"><td width="5%" width="2%">E.Date</td>		
		<td width="25%" >Source</td>
		<td width="15%" >Response</td>
		<td width="25%" >Comments</td>
		<td width="15%" >Comments By</td>
	</tr>
	<%
	while (rs.next())
	{
		String seqno = rs.getString("seqno");
		String source = rs.getString("source");
		String res = rs.getString("reason");
		String cmts = rs.getString("cmts");
		String edate = rs.getString("edate");   
		String by = rs.getString("by");  
		 out.println("<tr ><td width='5%' align='center'>"+edate+"</td> <td>"+source+"</td><td>"+res+"</td><td>"+cmts+"</td><td  width='10%'>"+by+"</td></tr>");
	}
	
} catch (Exception e)
{
	e.printStackTrace();
}

%>
</table>
</body>
</html>