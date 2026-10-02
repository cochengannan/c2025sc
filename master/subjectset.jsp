<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"  errorPage="../errorpage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="csc.Controller,java.sql.*"%><html>
<head>
 <title>Welcome To CSC : Subject Master</title>
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<script language="JavaScript" src="../js/csc.js"></script>
<script language="JavaScript" src="../js/cellcreate.js"></script>
<script type="text/javascript">
function ld()
{  

window.reload();

}

function sub()
{
	 var flag=document.getElementById("flag").value;
	 
		if (parseInt(flag)==0)
		 { 
	  	  document.sub_frm.submit();
		}else
		{
		alert("Check All Field");
		}  
		
}
</script>
</head>

<body onload="javascript:document.getElementById('subname').focus();">
<form action="../dbprocess/subject_a.jsp" method="post" name="sub_frm">

 <center> <div id="inner"  class="newcls">
<%
	Controller obj = new Controller();
	Connection con = obj.con();
	PreparedStatement ps = con.prepareStatement("select * from SubjectCode  order by SubjectCode ");
	ResultSet rs = ps.executeQuery();
   
	String SubjectCode = obj.combo_box("SubjectCode", "select  SubjectName +'   ' +Medium as sub,SubjectCode,SubjectName   from SubjectCode ",
			"sub", "SubjectCode", 0, "", "SubjectCode", " multiple class='select' onKeyDown=key_pass(event,'SubjectCode','b1',1)");
	
	
	String School = obj.combo_box("SubjectCode", "select schoolcode,schoolname  from School ",
			"schoolname", "schoolcode", 0, "", "schoolcode", "   class='select' onKeyDown=key_pass(event,'SubjectCode','b1',1)");
	HttpSession session2 = request.getSession(true);
	String uname1 = obj.isNull((String) session2.getAttribute("uname"),1);
	if (uname1.equals("0")   )
	{
		con.close();
		response.sendRedirect("../logout.jsp");
	}	
	
%>   
<table align="center" border="0" width="892" class="newtab">
	<tr>
		<td><%@ include file="../head1.jsp"%>
		</td>
	</tr>
</table>
<div id="inner">
<table bordercolor="skyblue" cellspacing="0" width="872" cellpadding="5"
	align="center" border="1" class="dvfont">
	<tr>
		<td colspan="4" align="center">Subject Master</td>
	</tr>
	<tr>
		<td>School Name </td>  
		<td  colspan="2"><%=School %></td>
	</tr>
	<tr>
		<td>Subject Code</td>
		<td colspan="2"><input type=text id="subcode" name="subcode"  class="tb0" onKeyDown="key_pass(event,'subcode','Medium');" onKeyUp="CharOnly('subcode',9,event);"  maxlength="3"/></td>
	</tr>
	</table>
	</div>
	  </div></center>
</form>

</body>
</html>