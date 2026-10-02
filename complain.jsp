<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.io.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%
	
		File f=new File("D://DB/comp.txt");
		
		try
		{
			  BufferedWriter outputStream = null;
		
			   outputStream = new BufferedWriter(new FileWriter(f),1);
			
			
		}catch(Exception e) 
		{
			
			
		}
		
%>

<table>
	<tr>	
			<td> <textarea id="comp" name="comp" rows="" cols=""></textarea> </td>
	</tr>
</table>
</body>
</html>