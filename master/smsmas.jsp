<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="csc.Controller,java.sql.*"  errorPage="../errorpage.jsp"%><html>
<head>
 <title>Welcome To CSC : Place Master</title>
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<script type="text/javascript">
function ld()
{  
window.reload();
}
function cls()
{
	document.getElementById("b1").disabled=false;
}
function sel(a)
{
	document.getElementById("updatevalue").value=a;
	document.getElementById("sname").value=document.getElementById("lbl"+a).innerHTML;
	document.getElementById("b1").disabled=true;
}
function sub()
{
	 var flag=document.getElementById("flag").value;
	  var sname=document.getElementById("sname").value;
	   var b1=document.getElementById("b1").value;
		if (parseInt(flag)==0)
		 { 
			 try 
			 {  
			     var s =confirm("Are You Sure");
			     if (s==true)
				 	{
					 	document.location.href="../dbprocess/smsmas_a.jsp?sms="+sname+"&b1="+b1;
				 	} 
			  }catch(e)
			 {
				 alert(e) ;
				    
			 }
		}else
		{
			 
		}  

		 
}



 
</script>
</head>  
<body onload="vis('nagar_div',1);javascript:document.getElementById('sname').focus();">   
<form action="../dbprocess/smsmas_a.jsp" method="post" name="sub_frm"  onsubmit="return value_process('sname','Place Name')">
 <center> <div id="inner"  class="newcls">
<%
	Controller obj = new Controller();
	Connection con = obj.con();
	PreparedStatement ps = con.prepareStatement("select * from smsmas  order by sno ");
	ResultSet rs = ps.executeQuery();
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
<table bordercolor="skyblue" cellspacing="0" width="872" cellpadding="5" align="center" border="1" style="border-collapse: collapse;">
	<tr>
		<td colspan="4" align="center"><font color='black' size='2'><b>SMS Master</b></font></td>
	</tr>
	<tr>  
		<td><font color='black' size='2'><b>SMS Desc</b></font></td>  
		<td  colspan="2" align="left">
					<input type=text id="sms" name="sms" class="tb6"style="color: red;font-weight: bold;"   onKeyUp="help(2,'sname','nagar');vis('nagar_div',2);toUpper(this);"  onKeyDown="key_pass(event,'sname','b1')">
					<input type="text" class="tb0" id="updatevalue" name="updatevalue" value="0" readonly>
					<input type="Submit" value="Submit" name="b1" id="b1"   class="fb2">  
					<input type="Submit" value="Update" name="b1" id="b1"  class="fb2">
					<input type="Submit" value="Delete" name="b1" id="b1"  class="fb2">  
					<input type="Reset" value="Clear"   class="fb2" onclick="cls()">
		
		</td>
	</tr>
	<tr>
	<td  colspan="4">
	<table  style="border-collapse: collapse;position: static" bordercolor="skyblue" cellspacing="0" width="572" cellpadding="3" border="1" align="center">
		<tr>
			<td width="5%">Sl.No</td>
			<td>SMS Description</td>
		</tr>	
	</table><div style='position: relative; vertical-align: top; width: 872; border-height: 1px; height: 420px; overflow: auto; white-space: nowrap;'>
		<div id='scroll_text'>
		
		<table  style="border-collapse: collapse;"
			bordercolor="skyblue" cellspacing="0" width="572" cellpadding="3"
			border="1" align="center">		<%
			int row=0;
			String selrow="";
		 	while (rs.next())
		 	{  
			 	row++;
			 	selrow = rs.getString("sno");
				String sname = "<label id='lbl"+selrow+"'>"+rs.getString("smsdesc")+"</label>";
			%>
			<tr> <td width="5%"><%=row %></td> 
				<td align="left"  ><font color='black' size='1'><b><a href="javascript:sel(<%=selrow%>)" style="text-decoration: none"><%=sname%></a></b></font></td>
			</tr>
			<%
			}
			%>
		</table>
		</div>
		</div>
 </td>
 </tr>
 </table>
<input type="hidden" id="flag" name="flag" value="1"> 

<div  id="nagar_div" style="position: absolute; border: 1;left:829px;   width:0; height:140;list-style:none;">    
				<select id="nagar" class="select2" name="nagar" multiple="multiple" style="border: 0em; " onclick="select_value('nagar','sname','b1',event,'nagar_div')"><option value="0"></option> </select>
				</div>  
<%
 try
 {
	con.close();
 }catch(Exception e)
 {
	 
 }
%></div></div></center>
</form>
</body>  
</html>