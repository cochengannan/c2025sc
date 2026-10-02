<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="csc.Controller"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />

<script type="text/javascript">
function c1()
{
 
 document.getElementById("t1").style.color="#595454";  

 
 setTimeout("c2()",500);
}
   
function c2()
{
	document.getElementById("t1").style.color="#F6358A"
	//document.getElementById("test").value=2;
	setTimeout("c1()",500);
}


</script>
</head>
 
<%
String msg="";
Controller obj=null;
try {
	String report_type="";
	obj = new Controller();
	HttpSession session2=request.getSession(true);
	session2.setMaxInactiveInterval(36000); 
	report_type=obj.setValue("report_type",request);
	
	
	 String report_type_temp="0";
	 try
	 {
		 report_type_temp=(String)session2.getAttribute("report_type");;
	 }catch(Exception e)
	 {
		 report_type_temp="0";
			
	 }
	if (report_type_temp==null) report_type_temp="0";
	 if (report_type_temp.equals("1")) msg="Stage1"; else  if (report_type_temp.equals("2")) msg="Regular";
	 else
		 msg="<font color=red>Setting Not yet</b>";
	String sub=obj.setValue("sub",request);
	if (!sub.equalsIgnoreCase("0"))
	{
		
		session2.setAttribute("report_type",report_type);
		{
			  
			  if (!report_type.equalsIgnoreCase("0"))
				  {
				  report_type=(String)session2.getAttribute("report_type");;
				  if (report_type.equals("1")) msg="Report Setting Now in Stage1 ,Please click report menu and after view report"; else msg="Report Setting Now in Regular,Please click report menu and after view report";					  
					  
				  %>
				  	<script type="text/javascript">
				  	///	alert("Setting Done <%=msg%>");
				  	</script>
				  <%				  
				  }
		}
	}
	
}catch(Exception e)
{
	out.println(e);	
}


%>
<body onload="c1()">   
<%@ include file="../commdiv.jsp"%>
<form action="report_set.jsp" method="get">
<center> 

<div   >  
 
	<div id="menudiv"><ul id="css3menu1" style="width: 100%" >
				<li><a href='../home.jsp'>Home</a></li>
				<li> <a href='../reports/rprt.jsp'>Report</a></li>
				<li><a href="../logout.jsp">Logout</a></li>
			</ul>  
	 </div> <br><br><br><br><br><br><br>
	<table align="center" width="70%" border="1" style="border-collapse: collapse; height:102px" cellpadding="15"  cellspacing="0">
		  
			<tr>
				<td colspan="2" align="center"><font face="arial" size=5><b>Report Setting</font></td>
			</tr>
			<tr>
				<td align="center">
					Data Type
				</td>
				<td> 
					<select id='report_type' name='report_type'>
							<option value="0">select</option>
							<option value="1">Stage1</option>
							<option value="2">Regular</option>
					</select>
				</td>
			</tr>
			 
			<tr>
				<td colspan="2" align="center">
					<input type="submit" name="sub" value="Submit">
				</td>
			</tr>
			<tr>
				<td id="t1" colspan="2" align="center"><font size='3'>    <b><%=msg%></b></font></td>
			</tr>
			<tr>
			<td colspan="2" align="left"><a href="../reports/report_filter.jsp">Report Query Click</a></td>
	 		</tr>
		
		
	</table>
	</div></center>
	
</form>




</body>
</html>