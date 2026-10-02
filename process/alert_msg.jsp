

<%@page import="java.util.*,java.sql.*"  errorPage="../errorpage.jsp"%>
<%@page import="csc.*" %>
<link href="../css/txtbox.css" rel="stylesheet" media="screen"/>
<title>CSC Computer Education</title>
 <script type="text/javascript">
 
function cls_w(event)
{
	var s = event.keyCode;
 
	if (s==13)
	{
	 window.close();
	}
}
function ps_set()
{
	 document.getElementById("cls_but").focus();
}
</script>
<%
		String c="";
		Controller obj=new Controller();
		Calendar cal = Calendar.getInstance();
		int day = cal.get(Calendar.DATE);  
		int month = cal.get(Calendar.MONTH)+1 ;
		int year = cal.get(Calendar.YEAR);
		String Date_dis=day+"/"+(month+1)+"/"+year;
		String msg=obj.setValue("msg",request); 
		String flag=obj.setValue("flag",request);
		;
		if (Integer.parseInt(flag)==1)
			c="red";
		else
			c="green";
%> 

<body onload="ps_set()" bgcolor="green">
<form>
<table summary="Standard alerts box" class="alerts" cellspacing="0" align="left" border=0 cellpadding="5" >
<tr><td class="alertHd" align="left"><font color=blue>CSC Computer Education</font></td>
<td   class="alertHd" align="right">Message Box </td>
</tr>
 
<tr>
<td colspan="2" ><font color='<%=c%>' size="2"><%=msg%></font></td>
</tr>
<tr>
<td colspan="2"  align="center"><input type="button" id="cls_but" value="Close" class="cbutton" onKeyDown="cls_w(event)"> </td>
</tr>
</table>
</form>
</body>  
