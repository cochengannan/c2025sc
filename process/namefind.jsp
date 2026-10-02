<%@page import="csc.*"%>
<%@page import="java.util.*,java.sql.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<html>
<head>
<script language="JavaScript" src="../js/cellcreate.js"></script>
<script language="JavaScript" src="../js/entry_help.js"></script>
<script language="JavaScript" src="../js/csc.js"></script>
<script language="JavaScript" src="../js/reception.js"></script>
<script language="JavaScript" src="../js/validate.js"></script>
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
</head>
<body>
<%
 

String[] Batch = { "A", "B", "C", "D", "E", "F", "G", "H", "I",      
		"J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T",
		"U", "V", "W", "X", "Y", "Z" };
String combo = "<select  id='bat' name='bat' class='select2'  onchange=dview(7,event)>";
combo += "<option value='0'>Select </option>";
try {
	for (int i = 0; i < Batch.length; i++) {  
		 
			combo += "<option value='" + Batch[i]+ "'>" + Batch[i] + "</option>";
	 
	}
} catch (Exception e) {
	System.out.println("Combo ----------------------> " + e);
}
combo += "</select>";
%>
<table bgcolor='#ADDFFF' bordercolor="#ADFFFA" width="100%" >
	<tr>
					<td width="75%">
						<b>Name  </b><input type="text" id="ename" name="ename" onkeyup="help(99,'ename','studname');">
						<input type="button" class="ttab" value="Home" onclick="window.history.go(-1)">
						<b>Phone  </b><input type="text" id="phone" name="phone" onkeyup="help(100,'phone','studname');">
						<b>HTNO   </b><input type="text" id="htno" name="htno" onkeyup="help(101,'htno','studname');">
					</td>					
					 
					<td><%=combo%><input type="button" class="ttab" onclick="help2(999,'ename','studname');" value="Click"></td>
				</tr>  

</table>
	<table  border=1 width="100%" style="border-color: skyblue; border-collapse: collapse">
				<tr>
				<td valign="top" id="stuname_div">
					
				
				
				</td>
				</tr>
	</table>
 
</body>
</html>