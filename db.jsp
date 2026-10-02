<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"  errorPage="../errorpage.jsp"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="java.sql.*,csc.*,java.util.*"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">

 

function set(a)
{
	 var flag=a;
	 
	 if (flag==0)  
	 {
	 	document.getElementById("flag").value=1;
	 	}
	 else
	 {
	 document.getElementById("flag").value=0;  
	 }
	 
}

</script>
</head>
<link rel="stylesheet" href="./menu/menunew_files/css3menu1/style.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="./css/txtbox.css" />
<body>
<form action="db.jsp" method="post">
		     
<%ArrayList inp=null;
	String combo = "";
	String tab_head = "", tab_value = "";
	try {
		Controller obj = new Controller();

		Connection con = obj.con();
		DatabaseMetaData mtdt = con.getMetaData();
		ResultSet rs = mtdt.getTables(con.getCatalog(), null, null,
				new String[] { "TABLE" });
		ResultSetMetaData rsmd = rs.getMetaData();
		int numCols = rsmd.getColumnCount();
		String tab = obj.setValue("tab", request);
		combo = "<select id='tab' name='tab'>";
		while (rs.next()) {
			String tab1=rs.getString("TABLE_NAME");
			
			if (!tab1.equalsIgnoreCase("Staff"))
			{
				if (tab.equalsIgnoreCase(tab1))
				combo += "<option value='"+tab1+"' selected>"+tab1+ "</option>";
				else
				combo += "<option value='"+tab1+"'>"+tab1+ "</option>";
			}
			
		}

		combo += "<select>";

		String but = obj.setValue("b1", request);
		String flag = obj.setValue("flag", request);
		String col= obj.setValue("b2", request);
 
		
		
		if (but.equalsIgnoreCase("->")   ) 
		{
			
			tab_head = obj.columnName(con, tab, Integer.parseInt(flag));
			inp= obj.columnValues(con, tab,Integer.parseInt(flag),col,"");
			//tab_value = obj.columnValues(con, tab,Integer.parseInt(flag),col,"");
		}
		else  
		{
		
			tab_head = obj.columnName(con, tab, Integer.parseInt(flag));
			inp= obj.columnValues(con, tab,  Integer.parseInt(flag),col,"");
		//	tab_value = obj.columnValues(con, tab,  Integer.parseInt(flag),col,"");
		}
%> <%
 	} catch (Exception e) {
 		out.println(e);

 	}
 %><input type="hidden" name="flag" id="flag" value=0>
	<center><%@ include file="../menu/menunew.jsp"%></center> 
<div  align="left" width="100%">        
		<table border=0 width="100%" align="center"> 
		
			<tr bgcolor='skyblue'>
				<td width="50%">Your Query <input type="text" name='qry' class="tb6"> Table Name <%=combo%> <input type="submit" value="->"
			name="b1"></td>
			</tr>
 
		<tr>
		<td>  
			<table  align="center" border="0"   width="100%"   >
		 	<tr>
			 	<td  width="100%">  
				 	 <div id='scroll_clipper' style='position: relative; vertical-align: top; width:172; border-height: 1px; height: 570px; overflow: auto; white-space: nowrap;'>
				 		<table  align="center" border="1"   width="100%" >
				 		<tr bgcolor="skyblue"><%=tab_head%></tr>
				 		
				 		<%        
				 			Iterator er=inp.iterator();
				 			   
				 			while (er.hasNext())
				 			{
				 				String val=er.next().toString();	
				 				out.println(""+val+"");
				 			}  
				 			 
				 		%> 
				 		  
				 		
				 		</table>
					 </div>
				 </td>
			 </tr>
			   
		</table>
		</td>
		</tr>
		</table>
		</div>
		
	 
</form>
</body>
</html>