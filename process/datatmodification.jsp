<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  errorPage="../errorpage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="csc.Controller,java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<script language="JavaScript" src="../js/csc.js"></script>
<script type="text/javascript">
function rld()
{
	 var entrytype=document.getElementById("entrytype").value;
	 window.location.href =  "datatmodification.jsp?entrytype="+entrytype;
}
function view()
{
	 		var htno=document.getElementById("htno").value;
			window.location.href =  "entry_r.jsp?process=6&HCode="+htno;
}
</script>
<title>Data Modification Area..</title>    
</head>
<body>
	<form action="datamodification_a.jsp" method="post">
	<%
			HttpSession session2 = request.getSession(false);  
			Controller obj = new Controller();
			Connection con = obj.con();	 
			String uname1 = (String) session2.getAttribute("uname");
			uname1=uname1.replaceAll("'","");
			String entrytype=obj.setValue("entrytype",request);
			String std="";
			if (entrytype.trim().equalsIgnoreCase("Q12"))
			{
				std="and qualtype='XII' and source='Q' ";
			}
			else if (entrytype.trim().equalsIgnoreCase("Q10"))
			{
				std="and qualtype='X' and source='Q'   ";
			}	else if (entrytype.trim().equalsIgnoreCase("D"))
			{
				std=" and source='D'   ";
			}else
			{
				std="";
			}
			String htno = obj.combo_box("htno", "select  htno   from QAData where NickName='"+uname1+"'  "+std,
					"htno", "htno", 0, "", "htno", "multiple style='height: 10pc;width : 10pc' class='select2' ");
			con.close();
	%>
	<div>
	 <%@ include file="../head.jsp"%>
	</div> 
	<div id="inner">
		<table bordercolor="skyblue" cellspacing="0" width="872" cellpadding="5" align="center" border="1" class="dvfont">
			<tr><td colspan="2" align="center">Data Correction</td></tr>
			<tr>
			
				<td> Data Correction in..</td>
				<td>
						<select id="entrytype" name="entrytype" class="select2" onchange=rld()>
							<option value="0">Select</option>
							<option value="Q12" <% if (entrytype.equalsIgnoreCase("Q12")) out.println("selected"); else out.println("");%>>Q/A Data Entry of 12th Std </option>
							<option value="Q10"  <% if (entrytype.equalsIgnoreCase("Q10")) out.println("selected"); else out.println("");%>>Q/A Data Entry of 10th Std </option>
							<option value="D"  <% if (entrytype.equalsIgnoreCase("D")) out.println("selected"); else out.println("");%>>Direct </option>
						</select>
				</td>
			</tr>
			<tr>
				<td> Select No </td>
				<td><%=htno%></td>
			</tr>
			<tr>
				<td>
				<input type="button" id="b1" name="b1" value="Edit" class="fb1"  onclick="view()">
				<input type="submit" id="b2" name="b2" value="Delete"  class="fb1">
				<input type="button" id="b3" name="b3" value="View"  class="fb1" onclick="view()">  
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><font size="3" color="red">There is no enter key option here ....Just using mouse click </font> </td>
			</tr>
		</table>
	</div>
	<%
	 con.close();
	%>
	</form>
</body>
</html>