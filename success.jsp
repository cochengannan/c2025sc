<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  errorPage="../errorpage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

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
	System.out.println(file);
	System.out.println(msg); 
	
%><table align="center" cellpadding="20" border="1" width="892" cellspacing="0" style="border-collapse: collapse;border-color: skyblue;">
<tr>
	<td align="center" > CSC Computer Education </td>
</tr>
<tr>
	<td align="center" background="./image/i3.jpg" >
		<%=msg%><img alt="" src="./images/thankyou.gif">
	</td>
</tr>
<tr>
	<td align="center"  >
		<%=msg%> 
	</td>
</tr>
<tr>
	<td align="center" >
		<input type="button" id="but" onclick="rld('<%=file%>')" value="Press">
		<img src="./images/goodluck.gif">
	</td>
</tr>  
</table>
 </form>
</body>
</html>