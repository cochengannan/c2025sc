<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  errorPage="../errorpage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="csc.*" %>
 <%@page import="java.util.*,java.sql.*"%>
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<head>
<script type="text/javascript">
document.onkeydown = function (event){
    var s=event.srcElement ||   event.target;
    var sn=s.tagName.toUpperCase();
    if (sn=="HTML")
        return false;
    else
        return true;  
};
</script>  
 <link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<title>Reports - Condition  </title>
<script type="text/javascript">
function rld(c)
{
   

	var sch=document.getElementById("sch");
	var sflag=0;
	if (sch.checked)
	{
		var sch_code =document.getElementById("school").value;
		sflag=1;
	}

	 
	if (c==1)
	{
		var school=document.getElementById("school").value;
	 
		var s=window.open("entry_r.jsp?process=1&school="+school+"&sch_code="+sch_code+"&sflag="+sflag,"","","");
		 
	}else if (c==2)
	{
		var subject=document.getElementById("subject").value;
		var med=document.getElementById("med").value;
		var s=window.open("entry_r.jsp?process=2&subject="+subject+"&med="+med,"","","");
	 
	}else if (c==5)
	{
		var staff=document.getElementById("staff").value;
		 
		var s=window.open("entry_r.jsp?process=5&staff="+staff,"","","");
	}
	else if (c==6)
	{
		var HCode=document.getElementById("HCode").value;
		 
		window.open("entry_r.jsp?process=6&HCode="+HCode,"","","");
	}
	else if (c==7)
	{
		var chr=document.getElementById("chr").value;
		 
		window.open("entry_r.jsp?process=7&chr="+chr,"","","");
	}
	else if (c==9)
	{ 
		var school=document.getElementById("school").value;
		var subject=document.getElementById("subject").value;
		if (school==0)
		{alert("Select School Name");}else
		{
		var smsdesc=document.getElementById("smsmas").value;
		 
		 window.open("smsset.jsp?process=c&smsdesc="+smsdesc+"&school="+school+"&subject="+subject,"","","");
		}
	}
}
function rld_new(c)
{
		var school=document.getElementById("school").value;
		var subject=document.getElementById("subject").value;
		var med=document.getElementById("med").value;
		if (school==0)
		{alert("Select School Name");}else
		{var smsdesc=document.getElementById("smsmas").value;
		 
		alert(smsdesc); 
		 window.open("smsset.jsp?process=c&med="+med+"&smsdesc="+smsdesc+"&school="+school+"&subject="+subject,"","","");
		}
} 
 
</script>
</head>
<%
String school_name="",sub_="",Time="",Staff="",Al_ht="",smsmas="";

try
{
	Connection cn=null;
	Controller obj=new Controller();
	cn=obj.con();
	HttpSession session2=request.getSession(true);
	String report_type=(String)session2.getAttribute("report_type");
	
	  school_name=obj.combo_box("school","select schoolcode,schoolname from School order by schoolname  ","schoolname","schoolcode","","class=select2 ");
	  sub_=obj.combo_box("subject","select distinct SubjectName   from SubjectCode order by SubjectName","SubjectName","SubjectName","","class=select2  ");
	  Time=obj.combo_box("time","select * from [Exam Time]","ExamTime","ExamTime","","class=select2 onChange=load()");
	  Staff=obj.combo_box("staff","select * from Staff order by name 	","name","name","","class=select2");
	  smsmas=obj.combo_box("smsmas","select sno,smsdesc from smsmas order by sno 	","smsdesc","sno","","class=select2");
	  if (report_type==null)
	  {
		  %>
		  	<script type="text/javascript">
		  		alert("Report Setting Not Yet to be done");
		  	</script>
		  <%	 
		  response.sendRedirect("report_set.jsp");
	  }else
	  {
		  if (Integer.parseInt(report_type)==2) 
		   Al_ht= obj.combo_box("HCode", "select * from QAData   order by htno ASC","htno", "htno", " ",
					" class='select2' multiple style='height: 225px; width: 150px;' onchange=rld(6)");
		  else
			  Al_ht= obj.combo_box("HCode", "select * from QA_Data_SMS   order by htno ASC","htno", "htno", " ",
				" class='select2' multiple style='height: 225px; width: 150px;' onchange=rld(6)");
	  }
}catch(Exception e)
{	 out.println(e); 
}  
%>
<body> 
 <center> 
<%@ include file="../commdiv3.jsp"%>
<div id="menudiv"><ul id="css3menu1" style="width: 100%" >
				<li><a href='../home.jsp'>Home</a></li>
				<li> <a href='../reports/rprt.jsp'>Report</a></li>
				<li><a href="../logout.jsp">Logout</a></li>
			</ul>
	 </div> <br><br><br><br><br><br><br><br>
<div id="inner"  class="newcls">
 <div id="searchbox" style="vertical-align: middle;">
<table width="872" align="center" style="border-collapse:collapse; " cellpadding="0" bordercolor="skyblue" border=0>
<tr><td><table    align="center" style="border-collapse:collapse; " width="872"  cellpadding="5" bordercolor="skyblue" border=1>
			<tr>
				<td colspan="3" align="center" class="tdText">&nbsp;<font size='2'><b>Report Settings</b></font>&nbsp;&nbsp;&nbsp;</td>	
			</tr>		
			<tr>
				<td class="tdText" width="15%"  align="left">&nbsp;<font size='2'><b>School</b></font>&nbsp;&nbsp;&nbsp;</td>
				<td align="left" width="15%"><%=school_name%></td><td align="left"><input type="button" onclick="rld(1)" value="View">Message Setting &nbsp;&nbsp;<%=smsmas%><input type="button" onclick="rld_new()" value="View"></td>				
			</tr>			
			<tr>  
				<td class="tdText" align="left"> &nbsp;<font size='2'><b>Subject</b></font>&nbsp;&nbsp;&nbsp;</td>
				<td align="left">&nbsp;&nbsp;<%=sub_%>&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" id='sch' name='sch'>&nbsp;&nbsp;<font size='2'><b>Medium</b></font>&nbsp;&nbsp;<select class="select2" id="med" name="med" >
					<option value="0">Select</option>
					<option value="TAMIL">Tamil</option>
					<option value="ENGLISH">English</option>
				</select>&nbsp;&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;With School</td><td align="left"><input type="button" onclick="rld(2)" value="Medium View"> </td>							
			</tr>					 
			<tr>  
				<td class="tdText" align="left">&nbsp;<font size='2'><b>Staff</b></font>&nbsp;&nbsp;&nbsp;</td>
				<td align="left"><%=Staff%></td><td align="left"><input type="button" onclick="rld(5)" value="View"></td>
			</tr>
			<tr>
				<td class="tdText" align="left">&nbsp;<font size='2'><b>Number</b></font> &nbsp;&nbsp;&nbsp;</td>
				<td align="left" colspan="2"><%=Al_ht%><Br><br><input type=text id='chr' name='chr' class=tb5>&nbsp;<input type="button" value="View" onclick="rld(7)" class="fb2"></td>		
			</tr>			 
		</table>
			</tD>		 
	</tr>
	<tr>
			<td align="center" align="left"><input type="button" value="Close"
			onclick="javascript:window.close()"  class="fb2"></td>
	</tr>
	<tr>
		<td><a href="record_missing.jsp">Record Missing</a></td>
	</tr>
	 
	
</table>
</div>
</div></center>
  </body>
</html>