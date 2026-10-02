<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="csc.Controller,java.sql.*,java.io.*"%>  
<%@page import="java.text.DecimalFormat"%>  
<%@page import="csc.excel2"%><html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"  %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../../../../../css/pmsSchemeStyle.css" rel="stylesheet"media="screen" />
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />

<title> </title>
<script type="text/javascript" src="./serv.js"></script>

<script type="text/javascript">
	function del()
	{ 
		document.location.href="excelUpload.jsp?del=delete";
	}
	
</script>
</head>
<body>    
<form action="upload.jsp" method="POST" enctype="multipart/form-data">
<%
String userid="0",Office_id="",Office_Name="",table_heading="",table_column="",table_header="",html="";
 csc.Controller obj=new csc.Controller(); 
 Connection con=obj.con();
 obj.createStatement(con);
 
 DecimalFormat df=new DecimalFormat();
 
 String delete=obj.setValue("del",request);
 
 userid = (String) session.getAttribute("UserId");
 if (userid==null) userid="0";
 
Office_id = obj.getValue("HRM_EMP_CURRENT_POSTING", "OFFICE_ID","where EMPLOYEE_ID in ( select EMPLOYEE_ID	 from SEC_MST_USERS where USER_ID='"+ userid + "')");
if (Office_id.equals("")) Office_id="0";
  Office_Name=obj.getValue("com_mst_all_offices_view", "OFFICE_NAME","where OFFICE_ID="+Office_id+ "  ");

%>
<table align="center" width="85%" border="1" cellpadding="5">

<tr  class = "tdH">
	<td align="center">Upload Design and Pumped Qty - <%=Office_Name%></td>
</tr>
<tr>
<td>
  Select Excel File <input type="file" id="filename" name="filename" >
  <input type="submit" value="Upload">
  <input type="button" value="Delete" onclick="del()">
    <input type="button" value="Exit" onclick="javascript:window.close()">
  
 
 </td>  
</tr> 
<tr  class = "tdH"><td>Uploaded Data </td></tr> 
 <tr><td>
 
</td></tr></table>
 

 </form>
</body>
</html>