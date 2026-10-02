<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="csc.Controller,java.sql.*"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />

<style type="text/css">
 #container 
 {
	margin-top:5px;
	margin-left:10%;
	margin-right:auto;
	vertical-align:top;
	
	margin-bottom:20px;
	border: 1px solid 000000;
} 
</style>
<title>Welcome To CSC : Area Master</title>
<script type="text/javascript">
function sel(a)
{
	document.getElementById("updatevalue").value=a;
	document.getElementById("arname").value=document.getElementById("lbl"+a).innerHTML;
	document.getElementById("b1").disabled=true;
}
function cls()
{
	document.getElementById("b1").disabled=false;
}
</script>
</head><body> 
  <form action="../dbprocess/area_a.jsp" method="post"  onsubmit="return value_process('arname','Area')">
  
  
  <%
 		Controller obj=new Controller();
 		Connection con=obj.con();
 		PreparedStatement ps =con.prepareStatement("select * from  Area");
 		ResultSet rs=ps.executeQuery();
 		String City = obj.combo_box("City", "select distinct City from Area",
				"City", "City", 0, "", "City",
				"class='select'");
 		HttpSession session2 = request.getSession(true);
 		String uname1 = obj.isNull((String) session2.getAttribute("uname"),1);
 		if (uname1.equals("0")   )
 		{
 			con.close();
 			response.sendRedirect("../logout.jsp");
 		}	
 		
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
	<table bordercolor="skyblue" cellspacing="0" width="872" cellpadding="0" align="center" border="1" style="border-collapse: collapse;">
				<tr>
					<td colspan="3" align="center">
						<font color='black' size='2'><b>Area Master</b></font>
					</td>
				</tr>
				<tr>
					<td  align="left"> <font color='black' size='2'><b>Area Name </b></font></td>
					<td  align="left"> <input type=text id="arname" name="arname" ></td>
				</tr>
				<tr>
					<td  align="left"><font color='black' size='2'><b>City</b></font></td>
					<td  align="left"><%=City%></td>
				</tr>
					<tr>
					<td  align="left"> <font color='black' size='2'><b>Pincode</b></font> </td>
					<td  align="left"> <input type=text id="pcode" name="pcode"> 
			<input type="text" class="tb0" id="updatevalue" name="updatevalue" value="0" readonly>
			<input type="Submit" value="Submit" name="b1" id="b1"   class="fb2">  
			<input type="Submit" value="Delete" name="b3" id="b3"  class="fb2">  
			<input type="Reset" value="Clear"   class="fb2" onclick="cls()">
			<font size=1>There is no Edit Option here.... </font>
		 </td>
		`
	</tr>
			</table>
 	<table summary="Search form" cellspacing="1" width="872" class="newtab" cellpadding="3" align="center" border="1">
				 
				<tr>
					<td colspan="3"  align="center" valign="top">
					<div id='scroll_clipper' style='position:  relative; vertical-align: top; width: 872; border-height: 1px; height: 370px; overflow: auto; white-space: nowrap;'>
					<table  style="border-collapse: collapse;vertical-align: top;" bordercolor="skyblue" cellspacing="0" width="872" cellpadding="3" border="1" align="center">
 					<%
			 		int row=0;
 					String selrow="";
			 		while (rs.next())  
			 		{
			 			String sc=rs.getString("Area");
			 			 selrow = rs.getString("sno");
			 			String cty=rs.getString("City");
			 			String pincode=rs.getString("PinCode");
			 			  sc = "<label id='lbl"+selrow+"'>"+sc+"</label>";
		 			%>
		 			<input type="hidden" id="area<%=row%>" name="area<%=row%>" value="<%=sc%>"/>
		 			<input type=hidden id="cty<%=row%>"  name="cty<%=row%>" value="<%=cty%>"/>
		 			<input type=hidden id="pincode<%=row%>"  name="pincode<%=row%>"  value="<%=pincode%>"/>
		 			<tr>
		 				<td align="left"><font color='black' size='1'><a href="javascript:sel(<%=selrow%>)" style="text-decoration: none"><b><%=sc%></b></a></font></</td>
		 				<td align="left"><font color='black' size='1'><b><%=cty%></b></font></td>
		 				<td align="left"><font color='black' size='1'><b><%=pincode%></b></font></td>
		 			</tr>
		 			<% 		
 				}
				 %>
				</table>
				</div>
		</td>
	</tr>
</table></div>
<%
 try
 {
	con.close();
 }catch(Exception e)
 {
	 
 }
%>
 
</form></body>
 

</html>