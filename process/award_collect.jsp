<%@page import="csc.*"%>
<%@page import="java.util.*,java.sql.*"%>
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" /><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<head>

<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script language="JavaScript" src="../js/cellcreate.js"></script>
<script language="JavaScript" src="../js/data.js"></script>
<script language="JavaScript" src="../js/award_collection.js"></script>  
</head>
<body>



<%
String htno = "", sc = "",elist="", sb = "", sbcode = "", sc_code = "", med = "", sb_code = "", class_ = "" ;
String name1 = "", sexd = "", name2 = "", addr1 = "", type = "" ;
String addr2 = "", addr3 = "", addr4 = "", pincode = "", phone = "", mobile1 = "";
String mobile2 = "", Religiond = "", Communityd = "", occ = "", doorno = "",CourseName="" ;
String satyear="0" ,sattype="0",sdesc="0";
Connection con = null;	
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
	  CourseName = obj.combo_box("CourseName", "select  * from Course  ", "CourseName", "CourseName", 0, "", "CourseName", "  class='select' onKeyDown=key_pass(event,'CourseName','save'); ");
	  
	  elist = obj.combo_box("elist", "select  * from QAData where enrolled='Y'  ", "name", "name", 0, "", "name", "  class='select' onKeyDown=key_pass(event,'CourseName','save'); ");
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
<form action="award_collect.jsp" method="get">
<%
	String bt=obj.setValue("view",request);
	htno=obj.setValue("htno",request);

	if (bt.equalsIgnoreCase("View"))
	{
		String cond = " where htno='" + htno + "'";
		int count = obj.getCount("QAData", cond) ;
		
		name1 = obj.getValue("QAData", "name", cond).toUpperCase();
		name2 = obj.getValue("QAData", "fname", cond).toUpperCase();
		sexd = obj.getValue("QAData", "sex", cond).toUpperCase();
		sc = obj.getValue("QAData", "school", cond).toUpperCase();
		type = obj.getValue("QAData", "source", cond).toUpperCase();
	
		//addr1 = obj.getValue("QAData", "add1", cond).toUpperCase();
		//addr2 = obj.getValue("QAData", "add2", cond).toUpperCase();
		//addr3 = obj.getValue("QAData", "area", cond).toUpperCase();
		//addr4 = obj.getValue("QAData", "city", cond).toUpperCase();
		pincode = obj.getValue("QAData", "pincode", cond).toUpperCase();
		phone = obj.getValue("QAData", "landline", cond).toUpperCase();
		mobile1 = obj.getValue("QAData", "mobile1", cond).toUpperCase();
		mobile2 = obj.getValue("QAData", "mobile2", cond).toUpperCase();
	}
		
	if (bt.equalsIgnoreCase("Update"))
	{
		 Hashtable htvalue=new Hashtable();
		 Hashtable htcond=new Hashtable();
		 String	awd=obj.setValue("awd",request);
		 String enroll=obj.setValue("enroll",request);
		 String eno=obj.setValue("eno",request);
		 
		if (enroll.equalsIgnoreCase("0")) enroll="N";
		if (awd.equalsIgnoreCase("0")) awd="N"; 
		 
		 
		 
		 if (awd.equalsIgnoreCase("Y"))
			  htvalue.put("award","'"+awd+"'");
		 
		 
		 
		 if (enroll.equalsIgnoreCase("Y"))
		 {
			 htvalue.put("enrolled","'"+enroll+"'");
			 htvalue.put("Entno",eno);
		 }
			 htcond.put("htno","'"+htno+"'");
		 int r=obj.recordSave(htvalue,htcond,"QAData",con);
		 
		 if (r > 0 )  
		 {%>
		 <script type="text/javascript">
		  alert("Update Done ");
		 </script>
			  <%
			  
		 }
	}
%>  
    
    
<table  align="center" border="1"   width="872"    cellspacing="0" cellpadding="0" style="border-color:skyblue;border-collapse: collapse"   >
<tr>
	<td align="left"><%@ include file="../head.jsp"%></td>
</tr>
</table>
<table  width="900"   border=1 align="center" border="1" cellpadding="0" cellspacing="0" style="border-color: skyblue; border-collapse: collapse">
<tr> 
<td valign="top" width="100%" colspan="2">  
<table align="center" border="1" cellspacing="0"  width="100%"  cellpadding="0" cellspacing="0"
			style="border-color: skyblue; border-collapse: collapse">
				<tr bgcolor="#cc5000">
					<td class="tdText" align="center" colspan="4">
					<font color='white' size="2">In Batch Process</font> &nbsp; &nbsp; &nbsp;<font color='blue'> <label
						id="err_msg" name="err_msg" /></label></font><font size="2" color="white"><b><%=satyear %>---<%=sdesc %></b></font></td>
				</tr>
				 
				<tr>
						<td align="left"  class="tdText">&nbsp;H.T No:</td>
						<td> <input type="text" id="htno" name="htno" class="tb5" value=<%=htno %>>&nbsp;&nbsp;<input type=submit name="view"  value="View" class="fb3"> </td>
				</tr>
				<tr>
													<td class="tdText" width="20%">&nbsp;Name :</td>
													<td class="tdText" width="80%" id='sname' bgcolor="white" style="color: darkred;font-weight: bold;">
													<%=name1%> 
													</td>
												</tr>
												<tr>
													<td class="tdText" width="20%">&nbsp;F.Name :</td>
													<td class="tdText"  width="80%" id='fname' bgcolor="white"  style="color: darkred;font-weight: bold;">
													<%=name2 %>
													</td>
												</tr>
												<tr>
													<td id='row' colspan="4" style="font-size: 2">&nbsp;</td>
												</tr>
												<tr>
													<td class="tdText" width="10%">&nbsp;Sex :</td>
													<td class="tdText" width="5%" id='sexd' colspan="3" bgcolor="white">
													<%=sexd %>
													</td>
												</tr>
												<tr>
													<td class="tdText" width="10%" class="tdText" valign="top">&nbsp;Address
													 </td>
													<td class="tdText" width="80%" id='address' colspan="3" bgcolor="white">
													<%=addr1 %> ,<%=addr2 %><Br>
													<%=addr3 %>,<%=addr4 %> - <%=pincode %> 
													</td>  
												</tr>
												<tr>
													<td class="tdText" width="10%" class="tdText" valign="top">&nbsp;Contact
													:</td>
													<td class="tdText" width="10%"  id='contact' colspan="3">
													<%=phone %> ,<%=mobile1 %> ,<%=mobile2 %></td>
												</tr>
												<tr>
					<td align="left"  class="tdText">	
						Process
					</td>
					<td  class="tdText" >
						 Award <input type=checkbox id="awd" name="awd" value="Y"> &nbsp; &nbsp; &nbsp; Entrolled <input type=checkbox id="enroll" name="enroll" value="Y"> &nbsp; E.No &nbsp;<input type="text" id="eno" name="eno" class="tb21">
					</td>
				</tr>
				<tr>
					<td  class="tdText" >  
					Entrolled List
					</td>  
					<td>
						<%=elist %>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">	
						 <input type=submit name="view" value="Update" class="fb3">
						 <input type=reset value="Reset" class="fb3">
					</td>
				</tr>
</table>
</td>  
</tr>
</table>
</form>

<%

}catch(Exception e )
{
	
	out.println("Some Problem is There " +e+"<br> Please Set Sat Setting <a href='./satsetting.jsp'>Click Here</a>");
	//response.sendRedirect("./satsetting.jsp");

}

%>

</body>
</html>