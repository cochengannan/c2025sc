<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/txtbox.css" />
<script type="text/javascript"> 
function rld(a)
{
	document.location.href=""+a+"";
	  
}    

</script>
</head>


<body onload="javascript:document.getElementById('but').focus();">
<form  name="su">

<%  
	String file=request.getParameter("file");
	String msg=request.getParameter("msg");
	
%><table align="center" width="75%" cellpadding="40" border="1" cellspacing="0"  background="./image/i3.jpg"; style="border-collapse: collapse;border-color: skyblue;">
<tr>
	<td align="center" > CSC Computer Education </td>
</tr>
<tr bgcolor="red"> 
	<td align="center" valign="top"> <font color='white' size=5>Sorry You have Error.....</font> </td>
</tr>
<tr>
	<td align="center" >
		<font color='red' size=4><%=msg%></font>
	</td>
</tr>
<tr>
	<td align="center" >
		<input type="button" id="but" onclick="rld('<%=file%>')" value="Press">
	</td>
</tr>
</table>
 
 </form>
</body>
</html>