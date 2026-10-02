<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.Date"%>
<%@page import="csc.*"%>
<%@page import="java.util.*,java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DATA</title>
</head>
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<script language="JavaScript" src="../script.js"></script>
<script language="JavaScript" src="../js/cellcreate.js"></script>
<script language="JavaScript" src="../js/csc.js"></script>
<script language="JavaScript" src="../js/menu1.js"></script>
<script src="../admin/jquery.min.js" type="text/javascript"></script>
<script language="JavaScript" src="../js/rowadd.js"></script>
<script type="text/javascript">
function cls()
{
	 var c=new Array("#595454","#9172EC","#488AC7","#5CB3FF","#41627E","#F6358A","#7F38EC","#D16587","#4EE2EC","#3B9C9C");
	 var s=parseInt(Math.random()*10);
	 return(c[s])
}
function c1()
{
document.getElementById("t1").style.color=cls();
setTimeout("c2()",500);
}

function c2()
{
	document.getElementById("t1").style.color=cls();
	setTimeout("c1()",500);
}
</script>
<script type="text/javascript">
function onld()
{
	document.getElementById("no2").focus()
}
function onsub()
{
	var name=document.getElementById("name").value;
	 var s=confirm (" If One More Record Of Brothers and Sisters of "+name+" Press Ok. Otherwise Press Cancel)")
	 if (s==true)   
	 {
		 celladd()
		var crow=document.getElementById("crow").value;
		document.getElementById("ssname"+crow).focus();	
	 }
	 else
	 {
		    var flag=document.getElementById("flag").value;

		    if (flag==0)
			 document.test.submit();
		    else
			    alert("Check All Filed ") 
	 }
}
</script>
 <body onload="c1(),onld()" >
<%
int row=0;
	//
	//try {
		Controller obj = new Controller();
		Connection con = obj.con();
		obj.createStatement(con);
		String sc_code = "";
		String sb_code ="";
		String class_ = "", Religion = "", Community = "", Qualification = "", School = "", Occupation = "";
		if (sb_code.equalsIgnoreCase("MA")
				|| sb_code.equalsIgnoreCase("ME")
				|| sb_code.equalsIgnoreCase("MT")
				|| sb_code.equalsIgnoreCase("SE")
				|| sb_code.equalsIgnoreCase("ST"))
			class_ = "10";
		else
			class_ = "+2";

		String sex ="";
		
		try
		{
		 sex =obj.getValue("School", "Sex", "where schoolcode='"
				+ sc_code + "'");
		}catch(Exception e) {sex="0";}
		Calendar cal = Calendar.getInstance();
		String cond=" where htno='"+obj.setValue("htno",request)+"'";
		String no=obj.getValue("QAData","htno",cond)
		;  
		String no1=no.charAt(0)+""+no.charAt(1)+""+no.charAt(2)+""+no.charAt(3);
		String no2="";
		int len=no.length();
		int i=0;
		for (i=0;i<len;i++)
		{
			int j=0;
			try   
			{
				  String s=no.charAt(i)+"";
				  no2+=Integer.parseInt(s)+"";
				 
			}catch(Exception e) {
				
			}
		}
	 
		String name1=obj.getValue("QAData","name",cond).toUpperCase().split("\\.")[0];
		String name2=obj.getValue("QAData","name",cond).toUpperCase().split("\\.")[1];
		String sexd=obj.getValue("QAData","sex",cond).toUpperCase();
		String sc=obj.getValue("QAData","school",cond).toUpperCase();
	 
		String sb ="";
		try
		{
		sb=obj.getValue("QAData","subject",cond).toUpperCase();
		}catch(Exception e ) {}
		 
 		String ch1 = "", ch2 = "";
		if (sexd.equalsIgnoreCase("M")) {
			ch1 = "checked";
			ch2 = "";
		} else if (sexd.equalsIgnoreCase("F")) {
			ch1 = "";
			ch2 = "checked";
		} else {
			ch2 = "";
			ch1 = "";
		}
		 
		String dob=obj.getValue("QAData","dob",cond).toUpperCase();		
		String day=dob.toUpperCase().split("/")[0].split(" ")[0];  		  
		String month=obj.getValue("QAData","dob",cond).toUpperCase().split("/")[1].split(" ")[0];;		
		String year=obj.getValue("QAData","dob",cond).toUpperCase().split("/")[2].split(" ")[0];;		 
		String class_s=obj.setValue("class_s",request).toUpperCase();  
		String fname0=obj.getValue("QAData","fname",cond).toUpperCase().split("\\.")[0];		 
		String fname1="";
		try
		{
				fname1=obj.getValue("QAData","fname",cond).toUpperCase().split("\\.")[1];				
		}catch(Exception e) {
			fname1=".";
		} 	
		String foccup=obj.setValue("foccup",request).toUpperCase();
		String addr1=obj.getValue("QAData","add1",cond).toUpperCase();
		String addr2=obj.getValue("QAData","add2",cond).toUpperCase();
		String addr3=obj.getValue("QAData","area",cond).toUpperCase();
		String addr4=obj.getValue("QAData","city",cond).toUpperCase();
		String pincode=obj.getValue("QAData","pincode",cond).toUpperCase();
		String phone=obj.getValue("QAData","landline",cond).toUpperCase();
 		String mobile1=obj.getValue("QAData","mobile1",cond).toUpperCase();
 		String mobile2=obj.getValue("QAData","mobile2",cond).toUpperCase();
		String Religiond=obj.getValue("QAData","religion",cond).toUpperCase();
		String Communityd=obj.getValue("QAData","community",cond).toUpperCase();
		String occ=obj.getValue("QAData","occ",cond).toUpperCase();		
		String doorno=obj.getValue("QAData","doorno",cond).toUpperCase();		
		  class_=obj.getValue("QAData","qual",cond).toUpperCase();
		int cy = cal.get(Calendar.YEAR);
		String monincome=obj.getValue("QAData","monincome",cond);
		Religion = obj.combo_box("Religion", "select * from RC",
				"Religion", "Religion", 2,Religiond,"",
				" class=select2 onKeyDown=key_pass(event,'Religion','Community')");
		Community = obj.combo_box("Community", "select * from RC",
				"Community", "Community", 2,Communityd,"",
				" class=select2 onKeyDown=key_pass(event,'Community','sno1')");
		Qualification = obj.combo_box("Qualification",
				"select * from Qualification", "qual", "qual", "", "");
		School = obj.combo_box("School", "select * from School",
				"schoolname", "schoolcode", "", "");
		Occupation = obj.combo_box("foccup",
				"select * from Occupation", "Occupation", "Occupation",2,occ,
				"", " class=select2 onKeyDown=key_pass(event,'foccup','addr1')");
		char ch = (char) sc.charAt(0);

		String cb_code = ch + "" + sb_code;
		String[] cmonth = {"-select month-", "Jan", "Feb", "Mar",
				"Apr", "May", "Jun", "July", "Aug", "Sep", "Oct",
				"Nov", "Dec"};

		String Qualification1 = obj
				.combo_box("ssqtype1", "select * from Qualification",
						"qual", "qual", "",
						"class=select2 onKeyDown=key_pass(event,'ssqtype1','ssscholl1')");
		String School1 = obj
				.combo_box("ssscholl", "select * from School",
						"schoolname", "schoolcode", "",
						"class='select2' onKeyDown=key_pass(event,'ssscholl','savebutton')");
		String area = obj.combo_box("addr3", "select * from area","area", "area", 2,addr3,"","class='select2' onKeyDown=area_value(2,event)");

		int c = obj.getCount("QAData", "");
%>
<jsp:scriptlet>
	ResultSet rs1 = obj.getRS("select * from Qualification");

		String rel_typno = "0".concat(",");
		String rel_typname = "Select".concat(",");
		String val = "";
		while (rs1.next()) {
			val = rs1.getString("qual");
			rel_typname = rel_typname.concat(val).concat(",");
			rel_typno = rel_typno.concat(val).concat(",");

		}
</jsp:scriptlet>

<form action="form_entry_e.jsp" method="post" name="test" style="top: 0px">
<%@ include file="../head.jsp"%>  
<table width="892" align="center" border="1" cellpadding="0" bgcolor="#ADFFFA"  
	style="border-collapse: collapse;" cellspacing="0" height="30" valign="top" bordercolor="#ADFFFA">
	<tr>
		 
		<td valign="bottom" width="25%" class="tdText">Record : <a href="entry_r.jsp" style="cursor: pointer; color: #307D7E"><%=c%></a></td><td align="center" id="t1"><font size="4" face="Tahoma">Information
		Sheet</font>    </td>
		<td valign="top" width="25%" class="tdText" valign="baseline"
			align="center"> 
		Number <input type="text" id="no1" name="no1" value="<%=no1%>" readonly="readonly"
			class="tb1"> <input type="text" id="no2" name="no2" readonly="readonly"
			value="<%=no2%>" class="tb1"			
			onKeyUp="IsNumeric(this.value,'Number only')"></td>

	</tr>
 </table>
 <div id="inner" >  
<table  align="center" border="1"   width="892"    cellspacing="0" cellpadding="0" style="border-color:skyblue;border-collapse: collapse">
 
	<tr class="tdH">
		<td colspan="6">
		<table width="100%" border=0 background="../images2/main-butt.jpg"
			cellpadding="0" style="border-color: green" cellspacing="0">
			<tr>
				<td align="left"><font
					style="color: black; font-style: oblique" class="tdText">School
				Name&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=sc%></font></td>
				<td align="right"><font
					style="color: black; font-style: oblique" class="tdText">Book
				Name&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;<input type='hidden' name='sb_c' value='<%=sb%>'><%=sb%></font></td>
			</tr>
		</table>
		</td>

	</tr>

	<tr>
		<td colspan="6">
		<table width="100%" cellpadding="5" cellspacing="0"    border="1" bordercolor="skyblue" style="border-color:skyblue;border-collapse: collapse"> 


   
			<tr class="tdText">
				<td width="10%"  align="left"><font
					style="color: black;  size:3;">
				Name </font></td>

				<td width="2%">:</td>
				<td align="left"><input type="text" name="name" id="name"
					value="<%=name1%>" class="tb6"
					onKeyDown="key_pass(event,'name','name2')"
					onKeyUp="isChar(this,9,event)">&nbsp;<input type="text"
					id="name2" name="name2" class="tbI0" value="<%=name2.trim()%>"
					onKeyDown="key_pass(event,'name2','sex')"
					onKeyUp="isChar(this,9,event)"></td>
			</tr> 
			<tr class="tdText">
				<td width="15%" class="tdText"  align="left"><font
					style="color: black; size:3;">Sex
				</font></td>
				<td width="2%">:</td>
				<td align="left"><input type="radio" id="sex" name="sex"
					onKeyDown="key_pass(event,'sex','day')" value="M" <%=ch1%>>Male <input
					type="radio" id="sex" name="sex" 
					onKeyDown="key_pass(event,'sex','day')" value="F" <%=ch2%>>Female</td>
			</tr>
			<tr class="tdText">
				<td width="15%" class="tdText"  align="left"><font
					style="color: black; size:3;">Date
				of Birth </font></td>
				<td width="2%" align="left">:</td>
				<td colspan="3" align="left"><table><tr>
				 	<td valign="top" align="left"> <input type="text" class="tbd" name="day" id="day"
					value="<%=day%>" maxlength="2"
					onKeyDown="key_pass(event,'day','month')"  style="vertical-align: text-top" ></td><td> <select
					name="month" id="month" class="select2"
					onKeyDown="key_pass(event,'month','year')">
					<option value=0>-Month-</option>
					<%
						for (int m = 1; m <= 12; m++) {
							
							if (Integer.parseInt(month)==m) { 
					%><option value='<%=m%>' selected><%=m%></option>
					<%
							}
							else {
								%><option value='<%=m%>'><%=m%></option>
					<% 
					} 
					}
					
					 %>

				</select></td><td> <select name="year" id="year" class="select2"
					onKeyDown="key_pass(event,'year','fname0')">
					<option value=0>-Year-</option>
					<%
						for (int y = 1980; y < cy; y++) {
							
							if (Integer.parseInt(year)==y) { 
					%><option value='<%=y%>' selected><%=y%></option>
					<%
						
							
						}
						else {
							%><option value='<%=y%>'><%=y%></option>
				<% 
				} 
						}
					%>

				</select></td></tr></table></td>
			</tr>
			<tr class="tdText">
				<td width="20%" class="tdText"  align="left"><font
					style="color: black; size:3;">Class
				</font></td>
				<td width="2%">:</td>
				<td align="left"><input type="text" id="class_s" name="class_s"
					class="tb2" value="<%=class_%>"></td>
			</tr>
			<tr class="tdText">
				<td width="25%" class="tdText"  align="left"><font
					style="color: black; size:3;">Father's
				/ Guardian's Name </font></td>
				<td width="2%">:</td>
				<td align="left"><input type="text" id="fname0" class="tb6" value="<%=fname0%>"
					name="fname0" onKeyDown="key_pass(event,'fname0','fname1')"
					onKeyUp="isChar(this,9,event)">&nbsp;<input type="text" value="<%=fname1%>"
					id="fname1" name="fname1" class="tbI0"
					onKeyDown="key_pass(event,'fname1','foccup')"
					onKeyUp="isChar(this,9,event)"></td>
			</tr>
			<tr class="tdText">
				<td width="25%" class="tdText"  align="left"><font
					style="color: black; size:3;">Father's
				Occupation</font></td>
				<td width="2%">:</td>  
				<td align="left"><%=Occupation%></td>
			</tr>
			<tr class="tdText" align="left">
				<td width="25%" class="tdText"><font class="tdText">Monthly Income</font></td>
				<td width="2%">:</td>
				<td align="left"><input type="text" id="monincome" value="<%=monincome%>"  name="monincome" maxlength="6" class="tb5"  onKeyDown="key_pass(event,'monincome','addfirst')">   
				</td>
			</tr>
			<tr class="tdText">
				<td width="25%" class="tdText"  align="left"><font
					style="color: black; size:3;">Residential
				Address</font></td>
				<td width="2%">:</td>
				<td align="left"><input type="text" id="doorno"  name="doorno" class="tbdoor" value="<%=doorno%>" ><input type="text" class="tb6" id="addr1" value="<%=addr1%>" 
					name="addr1" onKeyDown="key_pass(event,'addr1','addr2')"></td>
			</tr>
			<tr class="tdText">
				<td width="25%" class="tdText">&nbsp;</td>
				<td width="2%">:</td>
				<td align="left"><input type="text" class="tb6" id="addr2" value="<%=addr2%>" 
					name="addr2" onKeyDown="key_pass(event,'addr2','addr3')"></td>
			</tr>
 


			<tr class="tdText">
				<td width="25%" class="tdText">&nbsp;</td>
				<td width="2%">:</td>
				<td align="left"><%=area%></td>
			</tr>
			<tr class="tdText">
				<td width="25%" class="tdText">&nbsp;</td>
				<td width="2%">:</td>
				<td align="left"><input type="text" class="tb6" id="addr4"  value="<%=addr4%>" 
					name="addr4" onKeyDown="key_pass(event,'addr4','pincode')">
				</td>
			</tr>
			<tr>
				<td colspan=3>
				<table width="100%" cellpadding="2" cellspacing="0" border=0>
					<tr class="tdText">
						<td width="27%" class="tdText"><font
							style="color: black; size:3;">Pincode</font>
						</td>
						<td width="3%">:</td>
						<td width="5%" align="left"><input type="text" class="tb3"
							id="pincode" name="pincode" maxlength="6" value="<%=pincode%>" 
							onKeyDown="key_pass(event,'pincode','phone')"></td>

						<td width="10%" class="tdText" ><font
							style="color: black; size:3;">LandLine</font>
						</td>
						<td width="3%">:</td>
						<td align="left"><input type="text" class="tb3" id="phone" value="<%=phone%>"
							name="phone" maxlength="8"
							onKeyDown="key_pass(event,'phone','mobile1') " 
							onKeyUp="isInteger(this,9,event)"  onChange="return dgcount('phone',8)"></td>
					</tr>
					<tr>
						<td width="25%" class="tdText"><font
							style="color: black; size:3;">Mobile1</font>
						</td>
						<td width="3%">:</td>
						<td align="left" class="tdText"  colspan="2"><input type="text" class="tb5" id="mobile1"
							name="mobile1" maxlength="10" value="<%=mobile1%>"
							onKeyDown="key_pass(event,'mobile1','mobile2')"
							onKeyUp="isInteger(this,9,event)" onchange="return  dgcount('mobile1',10)"> <font style="color: black; size:3;">Mobile2</font></td><td width="3%">:</td><td align="left"><input type="text" class="tb5" value="<%=mobile2%>" id="mobile2" name="mobile2" maxlength="10" onKeyDown="key_pass(event,'mobile2','Religion')" onKeyUp="isInteger(this,9,event)" onchange="return  dgcount('mobile2',10)"/></td>
					</tr>
					<tr class="tdText">
						<td width="25%" class="tdText"><font
							style="color: black; size:3;">Religion</font>
						</td>
						<td width="2%">:</td>
						<td align="left"><%=Religion%></td>

						<td width="10%" class="tdText"><font
							style="color: black; size:3;">Community</font></td>
						<td width="2%">:</td>
						<td align="left"><%=Community%></td>

					</tr>
				</table>
				</td>
			</tr>
			<tr class="tdText">
				<td colspan="3" align="right"><u> <a href="javascript:celladd()">Brothers and Sisters
				Education Details</a> </u></td>
			</tr>
		</table>


		</td>

	</tr>


	<tr>
		<td colspan="6">
		<table  width="100%" cellpadding="0" align="center" bordercolor="skyblue"  
			cellspacing="0" id="entred_data" border="1">

			<tr>
				<td class="tdText" align="center"><font
					style="color: black; font-family: sans-serif; font-weight: 10">Sl.No</font></td>
				<td class="tdText" align="center"><font
					style="color: black; font-family: sans-serif; font-weight: 10">Brother's
				/Sisters Name</font></td>
				<td class="tdText" align="center"><font
					style="color: black; font-family: sans-serif; font-weight: 10">Age</font></td>
				<td class="tdText" align="center"><font
					style="color: black; font-family: sans-serif; font-weight: 10">Sex</font></td>
				<td class="tdText" align="center"><font
					style="color: black; font-family: sans-serif; font-weight: 10">Education</font></td>
				 
			</tr>
			<%
			
			PreparedStatement pr=con.prepareStatement("select * from QARelation where htno='"+no+"'");
			
			ResultSet rs_br=pr.executeQuery();
			String  rname="",  rage="", rqual="", rqualtype="",rsex="" ;
			  row=0;
			while (rs_br.next())
			{
			
				rname=rs_br.getString("rname");
				rage=rs_br.getString("rage");
				rqual=rs_br.getString("rqual");
				rqualtype=rs_br.getString("rqualtype");
				rsex=rs_br.getString("rsex");
				row++;
				 
				Qualification1 = obj.combo_box("ssqtype"+row,
						"select * from Qualification", "qual", "qual",2,rqual, "", "class=select2 ");
			%>
			
			
			<Tr>
				<td   align="center"><input class="tbI0"
					name="sno<%=row%>" id="sno<%=row%>" onKeyDown="key_pass(event,'sno1','ssname1')"
					value="<%=row%>"></td>
				<td class="tdText" align="center"><input class="tb6"
					name="ssname<%=row%>" id="ssname<%=row%>" value="<%=rname%>" 
					onKeyDown="key_pass(event,'ssname<%=row%>','ssage<%=row%>')"></td>
				<td class="tdText" align="center"><input class="tbI0"
					name="ssage<%=row%>" id="ssage<%=row%>"  value="<%=rage%>" 
					onKeyDown="key_pass(event, 'ssage<%=row%>', 'sssex<%=row%>')"></td>
				<td class="tdText" align="center"><select class="select2"
					id="sssex<%=row%>" name="sssex<%=row%>"   value="<%=rage%>" 
					onKeyDown="key_pass(event,'sssex<%=row%>','ssqtype<%=row%>')">
					<option value="0">Select</option>
					<option value="M" <%if (rsex.equalsIgnoreCase("M")) { %> selected > <% } else { %> ><%} %>Male</option>
					<option value="F" <%if (rsex.equalsIgnoreCase("F")) { %> selected > <% } else { %> ><%} %>Female</option>
				</select></td>
				<td class="tdText" align="center"><%=Qualification1%></td>
				<td class="tdText" align="center"><input class="tb6" type="hidden"
					name="ssscholl<%=row%>" id="ssscholl<%=row%>"
					onKeyDown="key_pass(event,'ssscholl1','savebutton')" value="<%=rqualtype%>"></td>
			</Tr>
			<% } %>
			<tbody id="entred_body"></tbody>
			<tr>
				<td colspan="6" align="center">
				<input type="button" class="fb1" id="savebutton" name="savebutton" onclick="javascript:window.history.go(-1)" value="Back">
				<input type="hidden" class="fb1" id="savebutton" name="savebutton" onclick="onsub()" value="Save">
				</td>
			</tr>
		</table>
		</td>
	</tr>
 
</table>

<input type="hidden" id="cb1" name="cb1" value="<%=rel_typname%>">
<input type="hidden" id="cb2" name="cb2" value="<%=rel_typno%>">
<%
	rs1 = null;
		rs1 = obj.getRS("select * from School");

		String sch_typno = "0".concat(",");
		String sch_typname = "Select".concat(",");
		String sch = "";
		while (rs1.next()) {

			sch_typname = sch_typname.concat(
					rs1.getString("schoolname")).concat(",");
			sch_typno = sch_typno.concat(rs1.getString("schoolcode"))
					.concat(",");

		}
%><input type="hidden" id="sccb1" name="sccb1" value="<%=sch_typname%>">
<input type="hidden" id="sccb2" name="sccb2" value="<%=sch_typno%>">
<input type="hidden" id="sssex" name="sssex" value="Select,Male,Female">
<input type="hidden" id="sssexv" name="sssexv" value="0,1,2"> <%
 /* 	} catch (Exception e) {

 		out.println(e);
 		//response.sendRedirect("../admin/sel.jsp");

 	} */
 %> <input type="hidden" id="flag" name="flag" value="0"> 
 <input type="hidden" id="crow" name="crow" value="<%=row%>">	
</div>	          
</form>

</body>
 
</html>