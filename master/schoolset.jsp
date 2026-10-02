<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="csc.Controller,java.sql.*"  errorPage="../errorpage.jsp"%><html>
<head>
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<script language="JavaScript" src="../js/csc.js"></script>

<script type="text/javascript">
function ld()
{
	 var schcode=document.getElementById("schcode").value;
	  
	 window.location.href = "schoolset.jsp?schcode="+schcode;

}

function sub()
{
	  var schcode=document.getElementById("schcode").value;
	  if (schcode==0)
	  {
		  alert("Select School Name ");
	  }
	  else
	  {  
	  document.sch_frm.submit();
	  }  
		
}
</script>
<title>Welcome To CSC : School Master</title>
</head>

<body onload="javascript:document.getElementById('schname').focus();">

<%@ include file="../commdiv3.jsp"%>
<div id="menudiv"><ul id="css3menu1" >
				<li><a href='../home.jsp'>Home</a></li>
				<li><a href='javascript:window.history.go(-1)'>Back</a></li>
				<li><a href="../logout.jsp" style="width:60px; height:16px;line-height:16px;">Logout</a></li>
			</ul>
	 
			</div>
<form action="../dbprocess/schoolset_a.jsp" method="post" name="sch_frm" >
  <center> <div id="inner"  class="newcls">
<%
	Controller obj = new Controller();
	Connection con = obj.con(); 
	PreparedStatement ps = con.prepareStatement("select * from School order by sno");
	ResultSet rs = ps.executeQuery();
	String schcode=obj.setValue("schcode",request);
	String school = obj.combo_box("schcode", "select *  from School ",
			"schoolname", "schoolcode", 0, schcode, "schoolname", "class='select2' onKeyDown=key_pass(event,'area','b1') onChange=ld()");
	String subject = obj.combo_box("subset", "select  SubjectCode,SubjectName+'-'+medium   as  s1  from SubjectCode   ",
			"s1", "SubjectCode", 0, "", "SubjectName", " multiple class='select2'  style='height: 20pc'  onKeyDown=key_pass(event,'area','b1')");
	
	
	String qry = "select b.subjectcode as sbode , b.schoolcode as sccode , a.SubjectName as subname, a.SubjectCode,a.Medium  as med  from SubjectCode a,subjectset b    where b.schoolcode='"+schcode+"' and a.SubjectCode=b.SubjectCode ";	 
	String table_column = "sbode,subname,med";
	String table_header = "Subject Code,Subject Name,Medium ";
	String table_heading = " ";
	String tab = "cellspacing='0' align=center cellpadding='3' width='100%' style='BORDER-COLLAPSE: collapse' border='1' borderColor='#92c2d8'";
	String html = obj.genReport(qry, table_header, table_column, tab,table_heading, "", 1,"");
	HttpSession session2 = request.getSession(true);
	String uname1 = obj.isNull((String) session2.getAttribute("uname"),1);
	if (uname1.equals("0")   )
	{
		con.close();
		response.sendRedirect("../logout.jsp");
	}	
	
%>  
 <BR><BR><BR><BR><BR><BR><BR><BR>
<div id="inner">
<table bordercolor="skyblue" cellspacing="0" width="872" cellpadding="5"
	align="center" border="1" class="dvfont">
	<tr>
		<td colspan="6" align="center">School Vs Subject  Master</td>
	</tr>
  
	<tr>
		<td>School Name</td>
		<td><%=school%></td>
	</tr>
	<tr>
		<td><%=subject%></td>
		<td valign="top"><table>  
					<tr>    
				<td valign="top">  
					<input type="button" value="Store" name="b1" id="b1"  class="fb1" onclick="sub()">
					<input type="button" value="Update" name="b2" id="b2" class="fb1">
					<input type="button" value="Delete" name="b3" id="b3"  class="fb1">
				</td>
			</tr>
			</table>
		</td>
		<td valign="top">
		<%=html%>
		</td>
	</tr>   
</table>
</div>
 
<input type="hidden" id="flag" name="flag" value="0"> </div></center>
</form>
</body>
</html>