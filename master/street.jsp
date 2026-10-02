<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"  errorPage="../errorpage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="csc.Controller,java.sql.*"%><html>
<head>
 <title>Welcome To CSC : Street Master</title>
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<script language="JavaScript" src="../js/csc.js"></script>
<script language="JavaScript" src="../js/entry_help.js"></script>  
<script language="JavaScript" src="../js/cellcreate.js"></script>
<script type="text/javascript">
function ld()
{  
window.reload();
}

function cls()
{
	document.getElementById("b1").disabled=false;
}
function sub()
{
	 var flag=document.getElementById("flag").value;
	  var strname=document.getElementById("strname").value;
	   var b1=document.getElementById("b1").value;
		if (parseInt(flag)==0)
		 { 
			 try 
			 {  
			     var s =confirm("Are You Sure");
				 document.location.href="../dbprocess/street_a.jsp?strname="+strname+"&b1="+b1;
			  }catch(e)
			 {
				 alert(e) ;
				    
			 }
		}else
		{
			 
		}  

		 
}
function sel(a)
{
	document.getElementById("updatevalue").value=a;
	document.getElementById("strname").value=document.getElementById("lbl"+a).innerHTML;
	document.getElementById("b1").disabled=true;
}
function update_process()
{
	
	 var flag=document.getElementById("flag").value;
	 var strname=document.getElementById("strname").value;
	 var b1=document.getElementById("b2").value;
	 var selsno=document.getElementById("updatevalue").value;
		if (parseInt(flag)==0)
		 { 
			 try 
			 {  
			     var s =confirm("Are You Sure");
				 document.location.href="../dbprocess/street_a.jsp?strname="+strname+"&b1="+b1+"&selsno="+selsno;
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
<body onload="vis('street_mas',1);javascript:document.getElementById('strname').focus();">   
<form action="../dbprocess/street_a.jsp" method="post" name="sub_frm" onsubmit="return value_process('strname','Street Name')">
 
<%
	Controller obj = new Controller();
	Connection con = obj.con();
	PreparedStatement ps = con.prepareStatement("select * from street  order by street asc ");
	ResultSet rs = ps.executeQuery();

	   
%>   
 <%@ include file="../commdiv3.jsp"%> 
 <div id="menudiv">
	<ul id="css3menu1" >
		<li><a href='../home.jsp'>Home</a></li>
		<li><a href='javascript:window.history.go(-1)'>Back</a></li>
		<li><a href="../logout.jsp" style="width:60px; height:16px;line-height:16px;">Logout</a></li>
	</ul>
</div>
 <div id="cdiv"> 
<table bordercolor="skyblue" cellspacing="0" width="872" cellpadding="5" align="center" border="1" style="border-collapse: collapse;">
	<tr>
		<td colspan="4" align="center"><font color='black' size='2'><b>Street Master</b></font></td>
	</tr>
	<tr>
		<td><font color='black' size='2'><b>Street Name</b></font></td>  
		<td  colspan="2" align="left">
		<input type=text id="strname" name="strname" class="tb6"style="color: red;font-weight: bold;"  onKeyUp="help(3,'strname','streetmas');vis('street_mas',2);toUpper(this);"  onKeyDown="key_pass(event,'strname','b1')">
		<input type="text" class="tb0" id="updatevalue" name="updatevalue" value="0" readonly> 
					<input type="Submit" value="Submit" name="b1" id="b1"   class="fb2">  
					<input type="Submit" value="Update" name="b2" id="b2"  class="fb2">
					<input type="Submit" value="Delete" name="b3" id="b3"  class="fb2">  
					<input type="Reset" value="Clear"   class="fb2" onclick="cls()">
		</td>
	</tr>
	 
	 
<tr>
	<td  colspan="4">
 
		<div  
			style='position: relative; vertical-align: top; width: 872; border-height: 1px; height: 370px; overflow: auto; white-space: nowrap;'>
		<div id='scroll_text'>
		<table  style="border-collapse: collapse;"
			bordercolor="skyblue" cellspacing="0" width="872" cellpadding="3"
			border="1" align="center">
		<%
		int row=0;
		String selrow="";
			while (rs.next()) 
			{
				row++;
				selrow = rs.getString("sno");
				String street = "<label id='lbl"+selrow+"'>"+rs.getString("street")+"</label>";
				
		%>
		   
			 <% if ((row%4)==0) { %>
			<tr>  
			<%} %>
				<td align="left" width="20%"><font color='black' size='1'><b><a href="javascript:sel(<%=selrow%>)" style="text-decoration: none"><%=street%></a></b></font></td>
			<% if ((row%4)==3)  { %> 
			</tr>
			<%} %>
			<%
			}      
			%>

		</table>
		</div>
		</div>
 </td>
 </tr>
 </table></div>
<input type="hidden" id="flag" name="flag" value="1"> 

 
<div  id="street_mas" style="position: absolute; border: 1;left:829px; top:174px; width:0; height:140;list-style:none;">   
				<select id="streetmas" class="select2" name="streetmas" multiple="multiple" style="border: 0em; "><option value="0"></option> </select>
				</div> 
		</div> 	
</form>
</body>
</html>