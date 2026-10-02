<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="csc.Controller,java.sql.*"  errorPage="../errorpage.jsp"%><html>
<head>
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<script src="../css/pro_drop_1/stuHover.js" type="text/javascript"></script>
 <link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
 
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

<title>Welcome To CSC : School Master</title>
<script type="text/javascript">
	function dis(v)
	{
		var scode=document.getElementById("scode"+v).value;
		var sname=document.getElementById("sname"+v).value;
		var areav=document.getElementById("scity"+v).value;
		document.getElementById("scname").value=sname;
		document.getElementById("sccode").value=scode;
		var area=document.getElementById("area");
		var len=area.options.length; ;

		for (var i=0;i<len;i++)
			{
			
			var va=document.getElementById("area").options[i].value;
			if (va==areav)
			{
			
			document.getElementById("area").options[i].selected=true;
			 
			}
		}   
		   
		
		
		
	}
</script>
</head>
  
<body>   
 <%
 		Controller obj=new Controller();
 		Connection con=obj.con();
 		PreparedStatement ps =con.prepareStatement("select * from School");
 		ResultSet rs=ps.executeQuery();
 		String area=obj.combo_box("area","select * from area","Area","Area","","");
 %>
<table align="center" border="0" width="892" class="newtab">
	<tr>
		<td><%@ include file="../head1.jsp"%>
		</td>
	</tr>
</table>
			<table   cellspacing="1"  width="872"  cellpadding="3" align="center" border="1" style="vertical-align: top;">
				<tr>
					<td colspan="3" align="center">
						School Master
					</td>
				</tr>
				<tr>
					<td> School Name </td>
					<td> <input type=text id="scname" name="scname" class="tb6" size="70"></td>
				</tr>
				<tr>
					<td> School Code </td>
					<td> <input type=text id="sccode" name="sccode" class="tb1"></td>
				</tr>
				<tr>
					<td> Area Name </td>
					<td> <%=area%></td>
				</tr>
			</table>
     
			<table summary="Search form" cellspacing="1"  width="872"  cellpadding="5" align="center" border="1" style="vertical-align: top;">
				<tr>
					<td>
						School Code
					</td>
					<td>
						School Name
					</td>
					<td>
						Area Name
					</td>
				</tr>
				
		 	
 <%
 	int row=0;
 		while (rs.next())
 		{
 				row++;
 			String sc=rs.getString("schoolcode");
 			String sn=rs.getString("schoolname");
 			String ar=rs.getString("area");
 			%>
 			
 			<tr>
 				<input type="hidden" id="scode<%=row%>" name="scode<%=row%>" value="<%=sc%>">
 				<input type="hidden" id="sname<%=row%>" name="sname<%=row%>" value="<%=sn%>">
 				<input type="hidden" id="scity<%=row%>" name="scity<%=row%>" value="<%=ar%>">
 				<td><a href="javascript:dis(<%=row%>)"><%=sc%></a></td><td><%=sn%></td><td><%=ar%></td></tr>
 			<% 		
 			 
 		}
 	
 
 
 %>
  
 	</table>
 
</body>
</html>