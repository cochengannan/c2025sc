<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@ page language="java" 
	import="csc.*,
	        java.sql.*,
		java.io.*,
		java.text.*,
		java.util.Date,
		java.util.Calendar,
		java.lang.System,
		java.util.*"

%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enquiry Form</title>
<script language="JavaScript" src="../js/cellcreate.js"></script>
<script language="JavaScript" src="../js/entry_help.js"></script>  
<script language="JavaScript" src="../js/csc.js"></script>
<script language="JavaScript" src="../js/validate.js"></script>
<script language="JavaScript" src="../js/menu1.js"></script>
<script type="text/javascript">
function onsub()
{

	 document.test.submit();
}

function onld()
{
	document.getElementById("no2").focus()
}
</script>
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
</head>
<body onload="onld()">
<form action="info_a.jsp" method="post" name="test"
	style="top: 0px">
 
<%
int c=0;
int	max=0;
String[] cmonth = {"-select month-", "Jan", "Feb", "Mar",
		"Apr", "May", "Jun", "July", "Aug", "Sep", "Oct",
		"Nov", "Dec"};
String month;
Calendar cal = Calendar.getInstance();
String Qualification="",Religion="",Community="",Occupation="";
 String process1="",process2="",process3="",process4="",process5="",process6="",course="";
String sTime=" ",sDate=" ",timeslab="";
String area="",date_="";
try {
	Controller obj = new Controller();
	
	Connection con = obj.con();
	obj.createStatement(con);
	
	Qualification = obj.combo_box("Qualification",
			"select * from Qualification", "qual", "qual", "", "  class=select2  onKeyDown=key_pass(event,'Qualification','Process1')");
	
	Religion = obj
	.combo_box("Religion", "select * from RC", "Religion",
			"Religion", "",
			" class=select2 onKeyDown=key_pass(event,'Religion','Community')");
    Community = obj
	.combo_box("Community", "select * from RC",
			"Community", "Community", "",
			" class=select2 onKeyDown=key_pass(event,'Community','savebutton') onblur=check_2()");
    Occupation = obj
	.combo_box("foccup", "select * from Occupation",
			"Occupation", "Occupation", "",
			" class=select2 onKeyDown=key_pass(event,'foccup','addr1')");
	  area = obj.combo_box("addr3", "select * from area",
			"area", "area", "",
			"class='select2' onKeyDown=area_value(2,event,this)");
		c = obj.getCount("Enquiry", "");
	 	max = obj.getMax("Enquiry", "rfno","");
	 	 if (c==0)
	 	 {
	 		 c=1; 
	 	 }
	  
	 	 
				
			java.util.Date sysDate=new java.util.Date(System.currentTimeMillis());
			SimpleDateFormat sdf=new SimpleDateFormat("d/M/yyyy");
			SimpleDateFormat sdfM=new SimpleDateFormat("hh:mm:ss aa"); 
			date_=sdf.format(sysDate);
	        sTime=sdfM.format(sysDate);
	 	 	con.close();
}catch(Exception e)
{
		out.println(e);	
}
int cy = cal.get(Calendar.YEAR);

%>
<%@ include file="../head.jsp"%>
<table width="910" align="center" border="1" style="border-collapse: collapse;" cellspacing="0"  bgcolor="#ADFFFA"  cellpadding="0" bordercolor="skyblue">
	<tr>
	<Td colspan="6">
	
<table width="100%" cellpadding="5" cellspacing="0" border="0" 	style="border-collapse: collapse;" bordercolor="skyblue">

<tr>
		<td valign="bottom" width="25%" class="tdText">&nbsp;&nbsp;Record : <a
			href="enquiry_r.jsp" style="cursor: pointer; color: #307D7E"><%=c%></a></td>

		<td align="center" id="t1"  width="35%" ><font size="4" face="Tahoma">Enquiry Form</font>&nbsp;&nbsp;&nbsp;&nbsp;</td>  
		<td valign="top" width="35%" class="tdText" valign="baseline" colspan="1"
			align="right">Sl.No <input type="text" id="no2" name="no2" maxlength="5" value="<%=max %>" onkeydown="validate(1,event),key_pass(event,'no2','edate')" class="tbI2"> Entry Date : <input type="text" id="edate" name="edate" maxlength="10" class="tb4" value="<%=date_%>"  onkeydown="key_pass(event,'edate','name')" ></td>

	</tr>
</table>
</Td>
</tr>
<Tr>
<td colspan="6" >
<table width="100%" cellpadding="5" cellspacing="0" border="1" 	style="border-collapse: collapse;" bordercolor="skyblue">
<tr class="tdText">
				<td width="15%" style="height: 29px" align="left"> Name </td>

				<td width="2%">:</td>
				<td align="left"><input type="text" name="name" id="name"
					maxlength="55" class="tb6"
					onKeyDown="key_pass(event,'name','name2')"
					onKeyUp="isChar(this,9,event)">&nbsp;<input type="text"
					id="name2" name="name2" class="tbI0" maxlength="5"
					onKeyDown="key_pass(event,'name2','sex')"
					onKeyUp="isChar(this,9,event)"></td>
</tr>
<tr class="tdText">
				<td width="15%" class="tdText" align="left">Sex				</td>
				<td width="2%">:</td>
				<td align="left"><input type="radio" id="sex" name="sex" value="M"
					onKeyDown="key_pass(event,'sex','addr1')" >Male <input
					type="radio" id="sex" name="sex" value="F"
					onKeyDown="key_pass(event,'sex','addr1')" >Female</td>
			</tr>

 
			
			
			<tr class="tdText">
				<td width="25%" class="tdText" align="left">Address</td>
				<td width="2%">:</td>
				<td align="left"><input type="text" class="tb6" id="addr1"
					maxlength="50" name="addr1"
					onKeyDown="key_pass(event,'addr1','addr2')"></td>
			</tr>
			<tr class="tdText">
				<td width="25%" class="tdText">&nbsp;</td>
				<td width="2%">:</td>
				<td align="left"><input type="text" class="tb6" id="addr2"
					maxlength="50" name="addr2"
					onKeyDown="key_pass(event,'addr2','addr3')"></td>
			</tr>



			<tr class="tdText">
				<td width="25%" class="tdText">&nbsp;</td>
				<td width="2%">:</td>
				<td align="left"><%=area%></td>
			</tr>
			<tr class="tdText">
				<td width="25%" class="tdText">&nbsp;</td>
				<td width="2%">:</td>
				<td align="left" colspan="1"><input type="text" class="tb6" id="addr4"
					maxlength="50" name="addr4"
					onKeyDown="key_pass(event,'addr4','pincode')"></td>
			</tr>
			<tr>
				<td colspan=6>
				<table width="100%" cellpadding="5" cellspacing="0" border=1  style="border-collapse: collapse;" align="center" style="padding-top: 2px" bordercolor="skyblue">
					<tr class="tdText">
						<td width="26%" class="tdText" align="left">Pincode
						</td>
						<td width="3%" style="width: 5px">:</td>
						<td width="5%" align="left"><input type="text" class="tb3"
							id="pincode" name="pincode" maxlength="6"
							onKeyDown="key_pass(event,'pincode','phone')"></td>

						<td width="10%" class="tdText" align="left">LandLine
						</td>
						<td width="3%">:</td>
						<td align="left"><input type="text" class="tb3" id="phone"
							name="phone" maxlength="8" value="0"
							onKeyDown="key_pass(event,'phone','mobile1') "
							onKeyUp="isInteger(this,9,event)"></td> 
					</tr>
					<tr>
						<td width="25%" class="tdText" align="left"> Mobile1
						</td>
						<td width="3%">:</td>
						<td   align="left" ><input type="text" class="tb5"
							id="mobile1" name="mobile1" maxlength="10"
							onKeyDown="key_pass(event,'mobile1','mobile2')"
							onKeyUp="isInteger(this,9,event)"
							onchange="return  dgcount('mobile1',10)"></td><Td class="tdText"> Mobile2</td>
						<td width="3%">:</td><td align="left"><input type="text" class="tb5" id="mobile2" name="mobile2"
							maxlength="10" onKeyDown="key_pass(event, 'mobile2', 'mail')" onKeyUp="isInteger(this,9,event)"
							onchange="return  dgcount('mobile2',10)" /></td>
					</tr>
					<tr>
						<td class="tdText" align="left">Email</td>
					<td width="2%">:</td>
					<td  colspan="5" align="left" ><input type="text" class="tbmail"
							id="mail" name="mail" 
							onKeyDown="key_pass(event,'mail','Qualification')"></td>
					</tr>
					</table></td>
					</tr>
					
		<tr>
		<td colspan="6">
		
	</td>
	</tr>		 	
				</table>
				</td>
			</tr>
			
			<tr>

				<td colspan="6" align="center"><input type="button" class="fb1" id="savebutton" name="savebutton" onclick="onsub()" value="Save">
				</td>
			</tr>

</table>
 
</form>
</body>
<input type="hidden" id="flag" name="flag" value="0"> 
</html>