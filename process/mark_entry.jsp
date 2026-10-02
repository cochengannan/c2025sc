<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<html>
<%@page import="csc.*"%>
<%@page import="java.util.*,java.sql.*"%>
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<head>
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script language="JavaScript" src="../js/cellcreate.js"></script>
<script language="JavaScript" src="../js/data.js"></script>
<script language="JavaScript" src="../js/markentry.js"></script>
<title>CSC : Reception Entry</title>
  
</head>
<body>
<%
	Connection con = null;
	String entrytype = "",condvalue="", sc = "", sb = "", sbcode = "", sc_code = "", med = "", sb_code = "", class_ = "";
	String name1 = "", sexd = "", name2 = "", addr1 = "", type = "";
	String addr2 = "", addr3 = "", addr4 = "", pincode = "", phone = "", mobile1 = "", mobile2 = "", Religiond = "", Communityd = "", occ = "", doorno = "";
	try {

		Controller obj = new Controller();
		con = obj.con();
		obj.createStatement(con);
		Calendar cal = Calendar.getInstance();
		int mm = cal.get(Calendar.MONTH) + 1;
		int dd = cal.get(Calendar.DAY_OF_MONTH);
		int yy = cal.get(Calendar.YEAR);
		String date = dd + "/" + mm + "/" + yy;
		obj.createStatement(con);
		String htno = obj.setValue("htno", request);
		  condvalue = obj.setValue("btc", request);
		String slno = obj.setValue("slno", request);
		String sno = obj.setValue("sno", request);
		String yes = obj.setValue("yes", request);
		String savebutton = obj.setValue("savebutton", request);
		String cond = " where htno='" + htno + "'";
		String combo = "<select  id='btc' name='btc' class='select2'  onchange=markdview(11)>";  
		String[] Batch = { "A", "B", "C", "D", "E", "F", "G", "H", "I",      
				"J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T",
				"U", "V", "W", "X", "Y", "Z" };

		combo += "<option value='0'>Select </option>";

		try {
			for (int i = 0; i < Batch.length; i++) {
				if (condvalue.equalsIgnoreCase(Batch[i]))
					combo += "<option value='" + Batch[i]
							+ "' selected>" + Batch[i] + "</option>";
				else
					combo += "<option value='" + Batch[i] + "'>"
							+ Batch[i] + "</option>";
			}
		} catch (Exception e) {
			System.out.println("Combo ----------------------> " + e);
		}
		combo += "</select>";
		String cont = "";
		if (type.equalsIgnoreCase("Q")) {

			cont += "<td  class='tdText' width='15%'>&nbsp;School : </td>";
			cont += "<td class='tdText'>" + sc + "</td>";
			cont += "<td  class='tdText' width='15%'>&nbsp;Class : </td>";
			cont += "<td class='tdText'>" + class_ + "</td>";

		} else {
			cont += "<td  class='tdText' width='15%'>&nbsp;Type : </td>";
			cont += "<td class='tdText'>" + type + "</td>";
			cont += "<td  class='tdText' width='15%'>&nbsp;Qualification : </td>";
			cont += "<td class='tdText'>" + class_ + "</td>";

		}
		 int serlno=obj.getMax("Reception","sno","");
		int batch_count = obj.getCount("Reception", " where Bname='"+condvalue+"'");
		int prv_ = 0;  
		 
		if (batch_count != 0) { 
			prv_ = (obj.getMax("Reception", "SeatNo", " where Bname='"+condvalue+"'")+1); 

		}  
		String CourseName = obj.combo_box("CourseName", "select  * from Course ", "CourseName", "CourseName", 0, "", "CourseName", "  class='select' onKeyDown=key_pass(event,'CourseName','save'); ");
		String Batch_label=condvalue;  
		
		
		String satyear="0" ,sattype="0",sdesc="0";
		try
		{
		  satyear = (String) session.getAttribute("satyear");
		  sattype = (String) session.getAttribute("sattype");
		  sdesc = (String) session.getAttribute("sdesc");
		  
		}catch(Exception e )
		{
			response.sendRedirect("./satsetting.jsp");
		}
		 if (satyear.equalsIgnoreCase("0") || sattype.equalsIgnoreCase("0") || sdesc.equalsIgnoreCase("0"))
		 {
			 response.sendRedirect("./satsetting.jsp");
			 
		 }
		
%>  
<form>
 <center> <div id="inner"  style="background-color:white; width: 75%;border: 0em; vertical-align: top;height: 48em;left: 35em">
<div id="inner"  >
 <%@ include file="../head.jsp"%>
</div>
<table width="100%" border=1 align="center" border="1" cellpadding="0" cellspacing="0" style="border-color: skyblue; border-collapse: collapse">
<tr>
<td valign="top" width="50%">  
		<table align="left" border="1" cellspacing="0" height="475" width="100%"
			 cellpadding="0" cellspacing="0"
			style="border-color: skyblue; border-collapse: collapse">
				<tr bgcolor="#cc5000">
					<td class="tdText" align="center" colspan="4">
					<font color='white' size="2">Mark Entry</font> &nbsp; &nbsp; &nbsp;<font color='blue'> <label
						id="err_msg" name="err_msg" /></label></font><font size="2" color="white"><b><%=satyear %>---<%=sdesc %></b></font></td>
				</tr>
				<tr>
						<td align="left"  class="tdText">&nbsp;Batch :</td>
						<td> <jsp:expression>combo</jsp:expression></td>
				</tr>
				<tr>
						<td align="left"  class="tdText">&nbsp;Seat No</td> 
						<td><input type="text" class="tbI2" id="sno" name="sno" maxlength="3" value="" onkeydown="next(event)">
						<input type="button" id="but" class="butI2" onkeydown="help_fun(12)"  value="Enter">
						</td>
				</tr>    
				<tr bgcolor='lightgreen'  class="tdText" >
						<td width="20%"> <font color='darkred'  ><b>&nbsp;Actual Mark</b></font> </td>  
						<td><input type="text" class="tbI2" id="mark" name="mark"  onKeyDown="key_pass(event,'mark','CourseName')" maxlength="2" value="">
						<font color='darkred' ><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Course</b></font>&nbsp;&nbsp;&nbsp; <%=CourseName%>&nbsp;&nbsp;&nbsp; <input class="butI2" type="button" name="save"  id="save"  value="Update" onkeydown="data_store(9,event)" ></td>
				</tr>
				<tr>
					<td  align="center" valign="top" width="100%"  colspan="2">
					  <table width="100%" border="0" background="../images2/main-butt.jpg"  cellpadding="10" cellspacing="0" style="border-color: skyblue; border-collapse: collapse">
							<tr>
								<td class="tdText" width="10%">&nbsp;H.T No </td>
								<td align="left"  id="htno" name="htno"  bgcolor="white"></td>
							</tr>
							<tr>  
								<td class="tdText" width="10%">&nbsp;Name </td> 
								<td class="tdText" id='sname' bgcolor="white"></td>
							</tr>
							<tr>
								<td class="tdText" width="20%">&nbsp;Father Name</td>
								<td class="tdText" id='fname' bgcolor="white"></td>
							</tr>
							<tr>
								<td id='row' colspan="4">&nbsp;</td>
							</tr>
							<tr>
								<td class="tdText" width="10%">&nbsp;Sex </td>
								<td class="tdText" id='sexd' colspan="3" bgcolor="white"></td>
							</tr>
							<tr>
								<td class="tdText" width="10%" class="tdText" valign="top">&nbsp;Address
								 </td>
								<td class="tdText" id='address' colspan="3" bgcolor="white">
								</td>
							</tr>
							<tr>
								<td class="tdText" width="10%" class="tdText" valign="top">&nbsp;Contact
								 </td>
								<td class="tdText" id='contact' colspan="3"></td>
							</tr>
						</table>
					</td>
				</tr>    
			</table>
</td>
<td  align="center" valign="top" width="50%">
<table style="border-color: skyblue; border-collapse: collapse"  height="475"  width="100%" cellpadding="0" cellspacing="0"
	id="data_table" border="0" >
	<tr bgcolor="#cc5000">
		<td class="tdText" colspan="4">
		<font color='white'> Bacth Name </font><font color='yellow' size='3'><b><label id='btc_v'><%=condvalue %></label></b></font> </td>
  
	</tr>
 

 <tr>
		<td colspan="4" valign="top">
		<div id='scroll_clipper' style='  vertical-align: top; width: 686; border-height: 0px; height: 400px; overflow: auto;cue: none;'>
		<table   bordercolor="#00FFFF" width="100%" align="center" border="1"  style="border-color: skyblue; border-collapse: collapse" cellspacing="0" cellpadding="0">
			<tbody id="recp" align="center" ></tbody>
		</table>
		</div>  

		</td>
	</tr>  
</table>
 
</td></tr></table>
<%
	 
con=null;
	} catch (Exception e) {
		out.println(e);
		response.sendRedirect("satsetting.jsp");
	}
%> <input type="hidden" id="sbatch" name="sbatch" value="<%=condvalue%>">
 <input type="hidden" id="cmd" name="cmd" value="0">   
	<input type="hidden" id="flag" name="flag" value="0">
	<input type="hidden" id="mflag" name="mflag" value="0">
	 <input type="hidden" id="ehtno" name="ehtno" value="0">
	 
	 </div></center></form>

</body>

</html>