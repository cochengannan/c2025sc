<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="../errorpage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Q/A Book Entry</title>
</head>
<%@page import="csc.*"%>
<%@page import="java.util.*,java.sql.*"%>
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<script language="JavaScript" src="../js/cellcreate.js"></script>
<script language="JavaScript" src="../js/entry_help.js"></script>
<script language="JavaScript" src="../js/csc.js"></script>
<script language="JavaScript" src="../js/validate.js"></script>
<script language="JavaScript" src="../js/menu1.js"></script>
<script src="../admin/jquery.min.js" type="text/javascript"></script>
<script language="JavaScript" src="../js/rowadd.js"></script>

<script type="text/javascript">
var ampm="";

var cflag=0;
function nocheck(a,e)
{

	 
	 
		var no=new String(a.value);
		var code=document.getElementById("no1").value;   
		var len=no.length;

		for (var i=0;i<len;i++)
		{
			var chr=no.charAt(i);

			switch(chr)
			{
				case '.':
					document.getElementById("flag").value=1;	
					document.getElementById("err_msg").innerHTML="<font color=red size=2>Type Correct No</font>";
				 
					a.value="";	
					break;
				
			}
			 

		}  	
		
		if (no=="")
		{

				//alert("No Missing !");
				document.getElementById("flag").value=1;
				document.getElementById("err_msg").innerHTML="<font   size=3>Type Correct Number</font>";
				a.value="";
				
		}else 
		{
  
			try
			{
				var no1=parseInt(no);
			 
				if (no1==0)
				{
					alert("No Missing");
					document.getElementById("flag").value=1;
					document.getElementById("err_msg").innerHTML="<font size=3><b>Type Correct Number</b></font>";
					a.value="";
				}else
				{
					document.getElementById("err_msg").innerHTML="<font size=3><b>"+code+"&nbsp;&nbsp;"+a.value+"</b></font>";
				}
			}catch(e) {}
  
		}

}
function cls()
{
	 var c=new Array("#595454","#9172EC","#488AC7","#5CB3FF","#41627E","#F6358A","#7F38EC","#D16587","#4EE2EC","#3B9C9C");
	 
	 var s=parseInt(Math.random()*10);

	 
	 return(c[s])
}


function c1()
{
 
 document.getElementById("t1").style.color=cls();

 var f=0;
 try
 {
	 f=document.getElementById("flag").value;  
	 
	if (f==0)  
	{
		document.getElementById("err_msg").style.color="green";
	   
	}  
	else  
	{
		 
		document.getElementById("err_msg").style.color="#ff0000";  
		 
	}
	 
 }catch(e) {}
 setTimeout("c2()",500);

}

function c2()
{
	document.getElementById("t1").style.color=cls();  
	document.getElementById("err_msg").style.color="#ffffff";  
	document.getElementById("test").value=2;
	setTimeout("c1()",500);


}

function isnull2()
{
	 
var var_flag2=0;
var str="name,name2,day,month,year,foccup,fname0,addr1,addr2,addr3,addr4,pincode, phone, mobile1,mobile1,Religion,Community";
var s=str.split(",");
var i=0;
				for (i=0;i<s.length-1;i++)
				{
					try
					{
					 var id=s[i];
					 
					 if (id=="month" || id=="year" || id=="addr3" || id=="foccup" || id=="Religion" || id=="Community")
					 {
					 var id_v=""; 
						try
						{
						id_v=document.getElementById(id).value;
						}catch (e) {
						// TODO: handle exception
						}
							  
						    if (parseInt(id_v)==0)
							{
								var_flag2=1;
							}
					
						}
						else
						{
	
						 
							if (document.getElementById(id).value=="")
							{
								var_flag2=1;
							}
							 
						}
					}catch (e) {
						// TODO: handle exception
					}
				}
				 
	return var_flag2;
	
}


 
function onld()
{
	document.getElementById("no2").focus()
}
function onsub()
{
	var name=document.getElementById("name").value;

	 var s=confirm (" If One More Record Of Brothers and Sisters of "+name+" Press Ok.  \n\n\n Press Cancel For Store)")
	 if (s==true)
	 {
		 celladd()
		var crow=document.getElementById("crow").value;
		document.getElementById("ssname"+crow).focus();	
	 }
	 else  
	 {
		    var flag=document.getElementById("flag").value;
		    var flag2=isnull2();
		    if (flag==0 && flag2==0)
			   document.test.submit();
		    else
			  alert("Please Check All Filed...... ") ;
	 }
}




function check_2()
{
	 var s=confirm (" IF any Brothers and Sisters of "+name+" is there ?  then Press Ok \n ----------------------------------------------\n")
	 
	 if (s==true)
	 {
		 	 
			document.getElementById("ssname1").focus();	
	 }
	 else
	 {
		  
		// var flag=document.getElementById("flag").value;
		 var flag2=isnull2();
		 var flag=document.getElementById("flag").value;
		    if (flag2==0 && flag==0)
			 document.test.submit();
		    else
		    	alert("Check All Filed ...... ") ;
		 
	 }
}
</script>


<body
	onload="vis('street_mas',1);vis('nagar_div',1);vis('name_div',1);vis('fname_div',1)">


<%
	Connection con = null;
	String entrytype="",sc="",sb="",sbcode="",sc_code="",med="",sb_code="";
	try {
		Controller obj = new Controller();
		con = obj.con();
		  session = request.getSession(true);
		
		 
		
		
		
		
			entrytype=obj.setValue("flagtype",request);  	
		    sc = obj.isNull((String) session.getAttribute("school_name"),1);  
			sb = obj.isNull((String) session.getAttribute("subject_name"),1);
		    sc_code = obj.isNull((String) session.getAttribute("school_code"),1);
						
			sb="CRE-KID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";  			
		 
		String uname1 = obj.isNull((String) session.getAttribute("uname"),1);
		String sch_val;
		sch_val = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+sc;
		String class_ = "", Religion = "", Community = "", Qualification = "", School = "", Occupation = "";
		Qualification = obj.combo_box("Qualification",
				"select * from Qualification where qualtype='SCHOOL'", "qual", "qual", "", "");
				    
		String val_="",style="";
		String Qualification2="";				  
		if (Integer.parseInt(entrytype) == 1) 
		{			 
				class_ = "+2";
				val_="12TH";
			Qualification2="<input type='text' class='tbI1' id='class_s'  name='class_s' value="+class_+" onKeyDown=key_pass(event,'class_s','fname0');>";	 
		} else if(Integer.parseInt(entrytype) == 2) {  
			class_ = "10";
			val_="10TH";
			 Qualification2="<input type='text' id='class_s'  name='class_s' class='tbI1' value="+class_+" onKeyDown=key_pass(event,'class_s','fname0');>";
		}else
		{
			style="";
			Qualification2 = obj.combo_box("class_s","select * from Qualification where qualtype='SCHOOL'", "qual", "qual",  1,val_,val_,"class=select2 onKeyDown=key_pass(event,'class_s','btc'); " + style);
		}
	
		String sex = "";
 
		try {
			sex = obj.getValue("School", "Sex", "where schoolcode='"
					+ sc_code + "'");
		} catch (Exception e) {
			sex = "0";
		} 
		String ch1 = "", ch2 = "";
		if (Integer.parseInt(sex) == 1) { 
			ch1 = "checked";
			ch2 = "";
		} else if (Integer.parseInt(sex) == 2) {
			ch1 = "";
			ch2 = "checked";
		} else {
			ch2 = "";
			ch1 = "";
		}
		Calendar cal_ = Calendar.getInstance();

		int cy = cal_.get(Calendar.YEAR);

		Religion = obj
				.combo_box("Religion", "select * from RC", "Religion",
						"Religion", "",  
						" class=select2 onKeyDown=key_pass(event,'Religion','Community');");
		Community = obj
				.combo_box("Community", "select * from RC",     
						"Community", "Community", "",
						" class=select2 onKeyDown=key_pass(event,'Community','sno1') onblur=check_2()");

		School = obj.combo_box("School", "select * from School",
				"schoolname", "schoolcode", "", "");
		Occupation = obj
				.combo_box("foccup", "select * from Occupation",
						"Occupation", "Occupation", "",
						" class='select2' onKeyDown=key_pass(event,'foccup','addfirst')");

		String ch = "";
		try  
  
		{
			ch = obj.getValue("School", "schoolcode",
					" where schoolname ='" + sc + "'");
		} catch (Exception e) {

		}

		String cb_code = "CRK";
 
 		 
 		
 		int c =0; 
 
		 
		String[] cmonth = { "-select month-", "Jan", "Feb", "Mar",
				"Apr", "May", "Jun", "July", "Aug", "Sep", "Oct",
				"Nov", "Dec" };

		String Qualification1 = obj
				.combo_box("ssqtype1", "select * from Qualification",
						"qual", "qual", "",
						"class=select2 onKeyDown=key_pass(event,'ssqtype1','savebutton')");
		String School1 = obj
				.combo_box("ssscholl", "select * from School",
						"schoolname", "schoolcode", "",  
						"class='select2' onKeyDown=key_pass(event,'ssscholl','savebutton')");
		String area = obj.combo_box("addr3", "select * from area order by area",
				"Area", "Area", "",      
				"class='select2' onKeyDown='area_value(2,event,this)'");   
				//     
		String Al_ht = obj.combo_box("HCode",
				"select * from QAData where htno like ('" + cb_code
						+ "%') order by htno DESC", "htno", "htno",
				" ", " class=select2 ");
		
		
		String street_mas = obj.combo_box("subset", "select street from street  ",
				"street", "street", 0, "", "street", "multiple  style='height: 10pc' class='select2'  onKeyDown=key_pass(event,'area','b1')");
				
		String add_mas1 = obj.combo_box("addfirst", "select name from addmaster1  ",
				"name", "name", 1, "None", "None", " class='select2' onKeyDown=key_pass(event,'addfirst','doorno')");
	 int year =  cal_.get(Calendar.YEAR);
	 String combo = "<select  id='btc' name='btc' class='select2' onKeyDown=key_pass(event,'btc','fname0')>";  
		String[] Batch = { "A", "B", "C", "D", "E", "F", "G", "H", "I",
				"J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T",
				"U", "V", "W", "X", "Y", "Z" };

		combo += "<option value='0'>Select </option>";

		try {
			for (int i = 0; i < Batch.length; i++) {
				 
					combo += "<option value='" + Batch[i] + "'>"
							+ Batch[i] + "</option>";
			}
		} catch (Exception e) {
			System.out.println("Combo ----------------------> " + e);
		}
		combo += "</select>"; 
		c=obj.getCount("crekid", ""); 
%>
<%@ include file="../commdiv.jsp"%>
<form action="crekid_a.jsp" method="post" name="test" style="top: 0px">
  
	<div id="menudiv"><ul id="css3menu1" style="width: 100%" >
				<li><a href='../home.jsp'>Home</a></li>
				<li><a href='javascript:window.history.go(-1)'>Back</a></li>
				<li> <a href='../master/school.jsp'>School</a></li>
				<li><a href="../logout.jsp">Logout</a></li>
			</ul>
	</div>
 
 

<div id="name_div"
	style="position: absolute; border: 1; left: 829px; top: 182px; width: 0; height: 140; list-style: none;">
<select id="oldstud" class="select2" name="oldstud" multiple="multiple"
	style="border: 0em;"
	onKeyDown="prv(event,'oldstud','name','name2','name_div')">
	<option value="0"></option>
</select></div>

<div id="fname_div"
	style="position: absolute; border: 1; left: 829px; top: 282px; width: 0; height: 140; list-style: none;">
<select id="oldfather" class="select2" name="oldfather"
	multiple="multiple" style="border: 0em;"
	onKeyDown="prv(event,'oldfather','fname0','fname1','fname_div')">
	<option value="0"></option>
</select></div>

<div id="street_mas"
	style="position: absolute; border: 1; left: 829px; top: 372px; width: 0; height: 140; list-style: none;">
<select id="streetmas" class="select2" name="streetmas"
	multiple="multiple" style="border: 0em;"
	onKeyDown="prv(event,'streetmas','addr1','addr2','street_mas')">
	<option value="0"></option>
</select></div>
<div id="nagar_div"
	style="position: absolute; border: 1; left: 800px; top: 402px; width: 0; height: 140; list-style: none;">
<div><select id="nagar" class="select2" name="nagar"
	multiple="multiple" style="border: 0em;"
	onKeyDown="prv(event,'nagar','addr2','addr3','nagar_div')">
	<option value="0"></option>
</select></div>
</div>
 <div id="cdiv">
<table align="center" border="1" width="400" cellspacing="0"
	cellpadding="0"
	style="border-color: skyblue; border-collapse: collapse">
	<tr style="width: 892" bgcolor="skyblue">
		<td colspan="4" align="center">
		<table width="100%" border="0" background="../images2/main-butt.jpg"
			cellpadding="0" cellspacing="0"
			style="border-color: skyblue; border-collapse: collapse">
			<tr>
				<td align="left" width="40%"><font
					style="color: black; font-style: oblique;" class="tdText">&nbsp;<%=sch_val%></font>
				</td>
				<td align="left" id="t1"><font size="4" face="Tahoma">Information
				Sheet</font>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td align="right"><font
					style="color: black; font-style: oblique" class="tdText"><%=sb%></font></td>
			</tr>
		</table>
		</td>

	</tr>
	<tr>
		<td>
		<table width="100%" border="0">
			<tr>
				<td valign="bottom" class="tdText" width="15%" align="left">&nbsp;Total
				Record : <a href="entry_r.jsp"
					style="cursor: pointer; color: #307D7E"><font size="2"><%=c%></font></a>
				</td>

				<td align="center">&nbsp;</td>
				<td width="40%" id='err_msg'></td>
				<td valign="top" width="25%" class="tdText" valign="baseline"
					colspan="1" align="right">Number <input type="text" id="no1"
					name="no1" maxlength="3" onkeydown="key_pass(event,'no1','no2')"
					value="<%=cb_code%>" class="tb1"> <input type="text"
					id="no2" name="no2" value="" maxlength="3" class="tb0"
					style="color: red; font-weight: bold; background-color: #00fff0"
					onKeyDown="validate(1,event);key_pass(event,'no2','name',1)"
					onKeyUp="IsNumeric(this.value,'Number only#no2',event)"
					onblur="nocheck(this,event)">&nbsp;&nbsp;&nbsp;&nbsp;</td>

			</tr>
		</table>
		</td>
	</tr>

	<tr>
		<td align="center" colspan="4">
		<table width="700" align="left" cellpadding="5" cellspacing="0"
			border="0" style="border-collapse: collapse; border-color: ">



			<tr>
				<td width="25%" align="left" class="tdText">&nbsp;Name</td>

				<td width="2%">:</td>
				<td align="left"><input type="text" name="name" id="name"
					maxlength="55" class="tb6"
					onKeyDown="key_pass(event,'name','name2','oldstud','name_div'); "
					onKeyUp="prv_must('name','no2','Number ');CharOnly('name',9,event);help(1,'name','oldstud');vis('name_div',2); ">&nbsp;
				<input type="text" id="name2" name="name2" class="tbI0"
					maxlength="5" onKeyDown="key_pass(event,'name2','sex')"
					onKeyUp="prv_must('name2','name','Student Name ');CharOnly('name2',9,event);"
					onblur="cur_must('name2','Intial Missing ')"></td>

			</tr>
				<tr><td  align="left" class="tdText">Sex</td> 
				<td colspan="2"><input type="radio" id="sex" name="sex" value="M" style="background-color: skyblue;color: red" onfocus=""
					onKeyDown="key_pass(event,'sex','class_s',1)" <%=ch1%>>Male <input
					type="radio" id="sex" name="sex" value="F"   style="background-color: skyblue"     
					onKeyDown="key_pass(event,'sex','class_s')" <%=ch2%>>Female</td>
			</tr>
			<tr class="tdText">
				<td width="20%" align="left" class="tdText"><font
					class="tdText">&nbsp;class </font></td>
				<td width="2%">:</td>
				<td align="left"><%=Qualification2 %><%=combo%></td>
			</tr>
			<tr class="tdText">
				<td width="27%" class="tdText" align="left"><font
					class="tdText">&nbsp;Father's/Guardian's Name </font></td>
				<td width="2%">:</td>
				<td align="left"><input type="text" id="fname0" class="tb6"
					maxlength="55" name="fname0"
					onKeyDown="key_pass(event,'fname0','fname1','oldfather','fname_div');"
					onKeyUp="prv_must('fname0','year','Year in DOB ');CharOnly('fname0',9,event);help(4,'fname0','oldfather');vis('fname_div',2);">&nbsp;<input
					type="text" id="fname1" name="fname1" class="tbI0" maxlength="5"
					onKeyDown="key_pass(event,'fname1','addfirst')"
					onKeyUp="prv_must('fname1','fname0','Father Name');CharOnly('fname1',9,event)"></td>
			</tr>

			<tr class="tdText" align="left">
				<td width="25%" class="tdText"><font class="tdText">&nbsp;Residential
				Address</font></td>
				<td width="2%">:</td>
				<td align="left"><%=add_mas1%> <input type="text" id="doorno"
					name="doorno" class="tbdoor" onKeyUp="toUpper(this)"
					onKeyDown="key_pass(event,'doorno','addr1')"> <input
					type="text" class="tb6" id="addr1" maxlength="50" name="addr1"
					onKeyDown="key_pass(event,'addr1','addr2','streetmas','street_mas');"
					onKeyUp="prv_must('addr1','doorno','Door No ');toUpper(this);help(3,'addr1','streetmas');vis('street_mas',2);">
				</td>

			</tr>
			<tr class="tdText">
				<td width="25%" class="tdText">&nbsp;</td>
				<td width="2%">:</td>
				<td align="left"><input type="text" class="tb6" id="addr2"
					maxlength="50" name="addr2"
					onKeyDown="key_pass(event,'addr2','addr3','nagar','nagar_div')"
					onKeyUp="prv_must('addr2','addr1','Value to Previous Box ');toUpper(this);help(2,'addr2','nagar');vis('nagar_div',2);"></td>
			</tr>



			<tr class="tdText">
				<td width="25%" class="tdText">&nbsp;</td>
				<td width="2%">:</td>
				<td align="left"><%=area%></td>
			</tr>
			<tr class="tdText">
				<td width="25%" class="tdText">&nbsp;</td>
				<td width="2%">:</td>
				<td align="left"><input type="text" class="tb6" id="addr4"
					maxlength="50" name="addr4"
					onKeyDown="key_pass(event,'addr4','pincode')"
					onKeyUp="toUpper(this)" readonly="readonly"></td>
			</tr>
			<tr>
				<td colspan="3">
				<table width="600" cellpadding="2" cellspacing="0" border=1
					align="center" bgcolor="skyblue">
					<tr class="tdText">
						<td width="25%" class="tdText" align="left"><font
							class="tdText">Pincode</font></td>
						<td width="3%">:</td>
						<td width="5%" align="left">&nbsp;<input type="text"
							class="tb3" id="pincode" name="pincode" maxlength="7"
							onKeyDown="key_pass(event,'pincode','phone')"></td>

						<td width="10%" class="tdText" align="left"><font
							class="tdText">&nbsp;LandLine</font></td>
						<td width="3%">:</td>
						<td align="left"><input type="text" class="tb3" id="phone"
							name="phone" maxlength="8"
							onKeyDown="phoneval(event,'phone','mobile1','1')"
							onKeyUp="prv_must('phone','pincode',' PinCode ! ');isInteger(this,9,event)"
							onChange="return dgcount('phone',8)"></td>
					</tr>
					<tr>
						<td width="25%" class="tdText" align="left"><font
							class="tdText"> Mobile1</font></td>
						<td width="3%">:</td>
						<td align="left">&nbsp;<input type="text" class="tb5"
							id="mobile1" name="mobile1" maxlength="10"
							onKeyDown="phoneval(event,'mobile1','mobile2','1')"
							onKeyUp="prv_must('mobile1','phone',' Landline Number ..Type 0 if Landline Number  ! ');isInteger(this,9,event)"
							onchange="return  dgcount('mobile1',10)"></td>
						<Td><font class="tdText" align="left">Mobile2</font></td>
						<td width="3%">:</td>
						<td align="left"><input type="text" class="tb5" id="mobile2"
							name="mobile2" maxlength="10"
							onKeyDown="phoneval(event,'mobile2','Religion','1')"
							onKeyUp="prv_must('mobile1','phone','   Mobile Number1 ..Type 0 if no Mobile Number1  ! ');isInteger(this,9,event)"
							onchange="return  dgcount('mobile2',10)" /></td>
					</tr>
					<tr class="tdText">
						<td width="25%" align="left" class="tdText"><font
							class="tdText">Religion</font></td>
						<td width="2%">:</td>
						<td align="left">&nbsp;<%=Religion%></td>

						<td width="10%" class="tdText" align="left"><font
							class="tdText">Community</font></td>
						<td width="2%">:</td>
						<td align="left"><%=Community%></td>

					</tr>
				</table>
				</td>
			</tr>
			<tr class="tdText">
				<td colspan="3" align="right"><u> Brothers and
				SistersEducation Details </u></td>
			</tr>
		</table>


		</td>

	</tr>


	<tr>
		<td colspan="6">
		<table width="100%" cellpadding="0" cellspacing="0" id="entred_data"
			style="border-collapse: collapse;" bgcolor=" #ADFFFA"
			bordercolor="#ADDFFF" border="1" align="center">

			<tr>
				<td class="tdText" align="center" style="width: 23px"><font
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
			<Tr>
				<td class="tdText" align="center"><input class=tbI0 id="sno1"
					name="sno1" onKeyDown="key_pass(event,'sno1','ssname1')" value="1"></td>
				<td class="tdText" align="center"><input class="tb6"
					id="ssname1" name="ssname1"
					onKeyDown="key_pass(event,'ssname1','ssage1')"
					onKeyUp="toUpper(this)"></td>
				<td class="tdText" align="center"><input class="tbI0"
					id="ssage1" name="ssage1" maxlength="3"
					onKeyDown="key_pass(event, 'ssage1', 'sssex1')"
					onKeyUp="IsNumeric(this.value,'Number only',event)"></td>
				<td class="tdText" align="center"><select class="select2"
					id="sssex1" name="sssex1"
					onKeyDown="key_pass(event,'sssex1','ssqtype1')">
					<option value="0">Select</option>
					<option value="M">Male</option>
					<option value="F">Female</option>
				</select></td>
				<td class="tdText" align="center"><%=Qualification1%></td>
				<td class="tdText" align="center"><input class="tb6"
					type="hidden"></td>
			</Tr>

			<tbody id="entred_body">



			</tbody>
			<tr>

				<td colspan="6" align="center"><input type="button" class="fb1"
					id="savebutton" name="savebutton" onclick="onsub()" value="Save">
				</td>
			</tr>
		</table>
		</td>
	</tr>
 
</table>
</div>
<%
	ResultSet rs1 = obj.getRS("select * from Qualification");

		String rel_typno = "0".concat(",");
		String rel_typname = "Select".concat(",");
		String val = "";
		while (rs1.next()) {
			val = rs1.getString("qual");
			rel_typname = rel_typname.concat(val).concat(",");
			rel_typno = rel_typno.concat(val).concat(",");

		}
%><input type="hidden" id="cb1" name="cb1" value="<%=rel_typname%>">
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
<input type="hidden" id="sssexv" name="sssexv" value="0,M,F"> <%
 	con.close();
 	} catch (Exception e) {
 		con.close();
 		out.println(e);

 	}
 %> <input type="hidden" id="flag" name="flag" value="0"> <input
	type="hidden" id="crow" name="crow" value="1"> <input
	type="hidden" id="entrytype" name="entrytype" value="<%=entrytype%>">
</div></center>
</form>


</body>
</html>
