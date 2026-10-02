<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"  errorPage="../errorpage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.Date"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Q/A Book Entry</title>
</head>
<%@page import="csc.*"%>
<%@page import="java.util.*,java.sql.*"%>
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<script language="JavaScript" src="../js/cellcreate.js"></script>
 <script language="JavaScript" src="../js/validate.js"></script>
<script language="JavaScript" src="../js/entry_help.js"></script>  
<script language="JavaScript" src="../js/csc.js"></script>
<script language="JavaScript" src="../js/menu1.js"></script>
<script src="../admin/jquery.min.js" type="text/javascript"></script>
<script language="JavaScript" src="../js/rowadd.js"></script>
<script type="text/javascript">
document.onkeydown = function (event){
    var s=event.srcElement ||   event.target;
    var sn=s.tagName.toUpperCase();

    if (sn=="HTML")
        return false;
    else
        return true;  
};
   
</script>
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
				var no1=parseFloat(no);
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
function nocheck(a,e,next)
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
				var no1=parseFloat(no);
				if (no1==0)
				{
					alert("No Missing");
					document.getElementById("flag").value=1;
					document.getElementById("err_msg").innerHTML="<font size=3><b>Type Correct Number</b></font>";
					a.value="";
				}else
				{
					document.getElementById(next).focus(); 
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
 
 document.getElementById("t1").style.color="#595454";  

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
	document.getElementById("t1").style.color="#F6358A"
	document.getElementById("err_msg").style.color="#ffffff";  
	//document.getElementById("test").value=2;
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
	var phone=document.getElementById("phone").value;
	var mobile1=document.getElementById("mobile1").value;
	var mobile2=document.getElementById("mobile2").value;
	
	   
	 var s=confirm("\t Name:\t"+name+" \n \n \t Phone1:\t"+phone+"\n \n \t Phone2:\t"+mobile1+" \n \n\t Phone3:\t"+mobile2);
	 if (s==true)
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
   <%  
   response.setHeader("Pragma","no-cache");  
    response.setHeader("Cache-Control","no-store");  
   response.setHeader("Expires","0");  
     response.setDateHeader("Expires",-1);  
    %>  
<body  onload="c1(),onld(),vis('street_mas',1);vis('nagar_div',1);vis('name_div',1);vis('fname_div',1)">
<%
	Connection con = null;  
	String entrytype="",sc="",sb="",sbcode="",sc_code="",bvalue="",med="",sb_code="",scholltype="";
	try {
		Controller obj = new Controller();
		con = obj.con();
		HttpSession session2 = request.getSession(true);
		entrytype=obj.setValue("flagtype",request);  	
		if (entrytype.equalsIgnoreCase("1")||entrytype.equalsIgnoreCase("2"))
		{	
			sc = obj.isNull((String) session2.getAttribute("school_name"),1);  
			sb = obj.isNull((String) session2.getAttribute("subject_name"),1);
			sbcode = obj.isNull((String) session2.getAttribute("subject_code"),1);
		    sc_code = obj.isNull((String) session2.getAttribute("school_code"),1);
		    bvalue = obj.isNull((String) session2.getAttribute("bvalue"),1);
			 
		    med = obj.isNull((String) session2.getAttribute("med"),1);
		     sb_code = obj.getValue("SubjectCode", "SubjectCode",
				"where SubjectName='" + sb + "' and Medium='" + med  
						+ "'");
			sb="Book Code&nbsp;&nbsp;:&nbsp;" + sb+"&nbsp;";			
		}  else if (entrytype.equalsIgnoreCase("3"))
		{
		 sb_code = obj.getValue("SubjectCode", "SubjectCode","where class='D'");
		}  else
		{
		 sb_code = obj.getValue("SubjectCode", "SubjectCode","where class='C'");
		}
		    
		    
		String uname1 = obj.isNull((String) session2.getAttribute("uname"),1);
		//String sb_code = (String) session.getAttribute("subject_code");
	 
		if (uname1.equals("0") || med.equals("0") || sb_code.equals("0")    ||
				 sc.equals("0") || sb.equals("0")  || sbcode.equals("0")  || sc_code.equals("0") )
		{
			 
			response.sendRedirect("../logout.jsp");
		}		
		String sch_val;
		if (Integer.parseInt(entrytype) == 1 || Integer.parseInt(entrytype) == 2)
			sch_val = "&nbsp;&nbsp;&nbsp;"
					+ sc;
		else if (Integer.parseInt(entrytype) == 3)
			sch_val = "&nbsp;&nbsp;Direct";
		else  
			sch_val = "&nbsp;&nbsp;&nbsp;Cscian";

		String class_ = "", Religion = "", Community = "", Qualification = "", School = "", Occupation = "";
		Qualification = obj.combo_box("Qualification",
				"select * from Qualification order by sno", "qual", "qual", "", "");
				
		String val_="",style="",Staff="",BatchTime="";
		String Qualification2="";				  
		if (Integer.parseInt(entrytype) == 1) 
		{			 
				class_ = "+2";
				val_="12TH";
			Qualification2="<input type='text' class='tbI1' id='class_s' readonly='readonly' name='class_s' value="+class_+" onKeyDown=key_pass(event,'class_s','fname0');>";	 
		} else if(Integer.parseInt(entrytype) == 2) {  
			class_ = "10";
			val_="10TH";
			 Qualification2="<input type='text' id='class_s'  name='class_s' readonly='readonly' class='tbI1' value="+class_+" onKeyDown=key_pass(event,'class_s','fname0');>";
		}else
		{
			style="";
			Qualification2 = obj.combo_box("class_s","select * from Qualification", "qual", "qual",   1,val_,val_,"class=select2 onKeyDown=key_pass(event,'class_s','fname0'); " + style);
		}
	
		String sex = "";
 
		try {
			sex = obj.getValue("School", "schollmode", "where schoolcode='"+ sc_code + "'");
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
		Calendar cal = Calendar.getInstance();

		int cy = cal.get(Calendar.YEAR);

		Religion = obj.combo_box("Religion", "select * from RC", "Religion","Religion", ""," class=select2 onKeyDown=key_pass(event,'Religion','Community');");
		String Sat_Att="";
		Community = obj.combo_box("Community", "select * from RC","Community", "Community", ""," class=select2 onKeyDown=key_pass(event,'Community','attend')");
		if (entrytype.equalsIgnoreCase("3")|| entrytype.equalsIgnoreCase("4")|| entrytype.equalsIgnoreCase("5")|| entrytype.equalsIgnoreCase("6"))
		{
			
			Sat_Att="<select  id='attend' name='attend' class=select2 onKeyDown=key_pass(event,'attend','CourseName')>"+
			"<option value='Yes'>Yes</option>"+
			"<option value='No' selected>No</option>"+  
			"</select>";  
		}         
		else
		{
			Sat_Att="<select  id='attend' name='attend' class='select2' onKeyDown=key_pass(event,'attend','sno1') onblur='check_2()'>"+
			"<option value='Yes'>Yes</option>"+
			"<option value='No' selected>No</option>"+
			"</select>";   
			
			
		} 
		School = obj.combo_box("School", "select * from School","schoolname", "schoolcode", "", "");
		Staff = obj.combo_box("Staff", "select * from Staff","name", "name", "", "class='select2'  onKeyDown=key_pass(event,'Staff','BatchTime'); " );
		BatchTime = obj.combo_box("BatchTime", "select * from [Exam Time]","ExamTime", "ExamTime", "", "class='select2'  onKeyDown=key_pass(event,'BatchTime','idate');" );
		Occupation = obj.combo_box("foccup", "select * from Occupation order by Occupation","Occupation", "Occupation", ""," class='select2' onKeyDown=key_pass(event,'foccup','monincome')");
		String CourseName = obj.combo_box("CourseName", "select  * from Course ", "CourseName", "CourseName", 0, "", "CourseName", "  class='select2' onKeyDown=key_pass(event,'CourseName','Staff'); ");
		String ch = "";  
		try  
		{
			ch = obj.getValue("School", "schoolcode"," where schoolname ='" + sc + "'");
		} catch (Exception e) {
		}
		String cb_code = "";
 		int c =0; 
 		int sub_count=0;
 		int sch_count=0;obj.getCount("QA_Data_SMS", "where htno like '%"+cb_code+"%'");
		if (Integer.parseInt(entrytype) == 1)
		{
			cb_code = ch + "" + sbcode;
			c=obj.getCount("QA_Data_SMS", "where qual='12TH'");
			sub_count=obj.getCount("QA_Data_SMS", "where subject like '%"+sb_code+"%'");
			sch_count=obj.getCount("QA_Data_SMS", "where htno like '%"+cb_code+"%'");
		}
		else if (Integer.parseInt(entrytype) == 2)
		{
			cb_code = ch + "" + sbcode;
			c=obj.getCount("QA_Data_SMS", "where qual='10TH'");
			sub_count=obj.getCount("QA_Data_SMS", "where subject like '%"+sb_code+"%'");
			sch_count=obj.getCount("QA_Data_SMS", "where htno like '%"+cb_code+"%'");
		}
		else if (Integer.parseInt(entrytype) == 3)
		{
			cb_code = obj.getValue("Subjectcode", "Subjectcode",
					" where class ='D'");
			c=obj.getCount("QA_Data_SMS", "where source='D'");
			sub_count=obj.getCount("QA_Data_SMS", "where source='D'");
		}
		else if (Integer.parseInt(entrytype) == 4)
		{
			cb_code   = obj.getValue("Subjectcode", "Subjectcode"," where class ='C'");
			c=obj.getCount("QA_Data_SMS", "where source='C'");
			sub_count=obj.getCount("QA_Data_SMS", "where source='C'");
		}
		else if (Integer.parseInt(entrytype) == 5)
		{
			cb_code   = obj.getValue("Subjectcode", "Subjectcode",
					" where class ='O'");
			c=obj.getCount("QA_Data_SMS", "where source='O'");
			sub_count=obj.getCount("QA_Data_SMS", "where source='O'");
		}
		else if (Integer.parseInt(entrytype) == 6)
		{
			cb_code   = obj.getValue("Subjectcode", "Subjectcode",
					" where class ='Z'");
			c=obj.getCount("QA_Data_SMS", "where source='Z'");
			sub_count=obj.getCount("QA_Data_SMS", "where source='Z'");
		}
 		
		
 		
 		 
 
		String[] cmonth = { "-select month-", "Jan", "Feb", "Mar",
				"Apr", "May", "Jun", "July", "Aug", "Sep", "Oct",
				"Nov", "Dec" };

		String Qualification1 = obj
				.combo_box("ssqtype1", "select * from Qualification order by sno",
						"qual", "qual", "",
						"class=select2 onKeyDown=key_pass(event,'ssqtype1','savebutton')");
		
		String School1 = obj
				.combo_box("ssscholl", "select * from School",
						"schoolname", "schoolcode", "",  
						"class='select2' onKeyDown=key_pass(event,'ssscholl','savebutton')");
	 
		String area = obj.combo_box("addr3", "select * from Area order by Area",
				"Area", "Area", "",      
				"class='select2' onKeyDown='area_value(2,event,this)'");   
				//   
				 		String Al_ht = obj.combo_box("HCode",
				"select * from QA_Data_SMS where htno like ('" + cb_code
						+ "%') order by htno DESC", "htno", "htno",
				" ", " class=select2 ");
		
		
		String street_mas = obj.combo_box("subset", "select street from street",
				"street", "street", 0, "", "street", "multiple  style='height: 10pc' class='select2'  onKeyDown=key_pass(event,'area','b1')");
				
		String add_mas1 = obj.combo_box("addfirst", "select name from addmaster1  ",
				"name", "name", 1, "None", "None", " class='select2' onKeyDown=key_pass(event,'addfirst','doorno')");
	 int year =  cal.get(Calendar.YEAR);
	 int month =  cal.get(Calendar.MONTH); 
	 int day =  cal.get(Calendar.DAY_OF_MONTH);
	 
	 String tdate=day + "/"+(month+1)+"/"+year;
	   
%>    

<form action="form_entry_sms_a.jsp" method="post" name="test"  style="top: 0px">
 <center> <div id="inner"  class="newcls">
				<div id="name_div"  style="position: absolute; border: 1;left:829px; top:182px; width:0; height:140;list-style:none;">
				<select id="oldstud" class="select2" name="oldstud" multiple="multiple" style="border: 0em; " onKeyDown="prv(event,'oldstud','name','name2','name_div')"><option value="0"></option> </select>
				</div>
				  
				<div id="fname_div"  style="position: absolute; border: 1;left:829px; top:282px; width:0; height:140;list-style:none;">
				<select id="oldfather" class="select2" name="oldfather" multiple="multiple" style="border: 0em; " onKeyDown="prv(event,'oldfather','fname0','fname1','fname_div')"><option value="0"></option> </select>
				</div>			         
				            
				<div  id="street_mas" style="position: absolute; border: 1;left:829px; top:372px; width:0; height:140;list-style:none;">   
				<select id="streetmas" class="select2" name="streetmas" multiple="multiple" style="border: 0em; " onKeyDown="prv(event,'streetmas','addr1','addr2','street_mas')"><option value="0"></option> </select>
				</div>         
				<div id="nagar_div"  style="position: absolute;  border: 1;left:800px; top:402px; width:0; height:140;list-style:none;">
				<div>
				<select id="nagar" class="select2" name="nagar" multiple="multiple" style="border: 0em; " onKeyDown="prv(event,'nagar','addr2','addr3','nagar_div')"><option value="0"></option> </select>
				</div>    
				</div>  
 

<table  align="center" border="1"   width="90%"    cellspacing="0" cellpadding="0" style="border-color:skyblue;border-collapse: collapse"   >
<tr>
	<td align="left"><%@ include file="../head.jsp"%></td>
</tr>
<tr style="width: 1092" bgcolor="skyblue">
		<td colspan="4" align="center"  >
		<table  width="100%" border="0" background="../images2/main-butt.jpg"
			cellpadding="0" cellspacing="0" style="border-color:skyblue;border-collapse: collapse">
			<tr bgcolor="#f8FAAF" class="tdText">
				<td align="left"  width="40%"><font
					style="color: black;  " class="tdText" >&nbsp;<%=sch_val%></font>
				</td><td align="left"  id="t1"><font size="3"> Information Sheet</font>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td align="right"><font
					style="color: black;  class="tdText"><%=bvalue%></font></td>
			</tr>
		</table>
		</td>  

	</tr>      
  <tr>  
  <td> 
			<table  width="100%" border="1" cellpadding="10" cellspacing="0" style="border-color:skyblue;border-collapse: collapse">
				<tr>
					<td valign="bottom"  class="tdText" width="40%"   align="left">&nbsp;Total Record
					: <a href="entry_r.jsp" style="cursor: pointer; color: #307D7E"><font  size="2" color='Blue'><%=c%></font></a> &nbsp;School <font  size="2" color='Blue'><%=sch_count%></font> &nbsp;&nbsp;<%=sb_code%> : <font  size="2" color='Blue'><%=sub_count%></font></td>
			
					<td align="center" >&nbsp;</td><td width="40%" id='err_msg'></td>
					<td valign="top" width="25%"  class="tdText" valign="baseline"  
						colspan="1" align="right">Number <input type="text" id="no1"  
						name="no1" maxlength="4" onkeydown="key_pass(event,'no1','no2')"
						value="<%=cb_code%>" class="tb1"><input type="text" id="no2"
						name="no2" value="" maxlength="3" class="tb0" style="background-color: #00fff0"
						onKeyDown="validate(1,event,'QA_Data_SMS');key_pass(event,'no2','name',1)"      
						onKeyUp="IsNumeric(this.value,'Number only#no2',event)" onblur="nocheck(this,event,name)" >&nbsp;&nbsp;&nbsp;&nbsp;</td>
			  
				</tr>    
			</table>
</td>
</tr>   
	  
	<tr>
		<td align="center" colspan="4"  >     
		<table width="100%" align="left"  cellpadding="10" cellspacing="0" border="1" style="border-collapse: collapse;border-color: ">
			<tr   >
				<td width="25%" align="left"  class="tdText">&nbsp;Name </td>
				<td align="left">
					<input type="text" name="name" id="name" maxlength="55" class="tb6" onKeyDown="key_pass(event,'name','name2','oldstud','name_div'); "    
					onKeyUp="prv_must('name','no2','Number ');CharOnly('name',9,event);help(1,'name','oldstud');vis('name_div',2); ">&nbsp;
					<input type="text" id="name2" name="name2" class="tbI0" maxlength="5"   onKeyDown="key_pass(event,'name2','phone')"   
					onKeyUp="prv_must('name2','name','Student Name ');CharOnly('name2',9,event);" onblur="cur_must('name2','Intial Missing ')" ></td>     
				</tr>   
		   <tr>
		   
		   <td width="10%" class="tdText" align="left"><font class="tdText">Qualification2</font></td>
		  	<td align="left"> <%=Qualification2 %></td>
		   	
		   </tr>
			<tr>
				<td width="10%" class="tdText" align="left"><font class="tdText">LandLine</font></td>  
				<td align="left"><input type="text" class="tb3" id="phone"
										name="phone" maxlength="8"
										onKeyDown="phoneval(event,'phone','mobile1','1')"      
					 					onKeyUp="prv_must('phone','pincode',' PinCode ! ');isInteger(this,9,event)"
										onChange="return dgcount('phone',8)">
				</td>
			</tr>
			<tr>
				<td width="20%" class="tdText" align="left"><font class="tdText"> Mobile1</font></td>
				<td align="left"><input type="text" class="tb5"
										id="mobile1" name="mobile1" maxlength="10"
										onKeyDown="phoneval(event,'mobile1','mobile2','1')"
										onKeyUp="prv_must('mobile1','phone',' Landline Number ..Type 0 if Landline Number  ! ');isInteger(this,9,event)"
										onchange="return  dgcount('mobile1',10)">
				</td>
			</tr>
			<tr>
				<td><font class="tdText" align="left">Mobile2</font></td>
				<td align="left"><input type="text" class="tb5" id="mobile2"
										name="mobile2" maxlength="10"
										onKeyDown="phoneval(event,'mobile2','savebutton','1')" 
										onKeyUp="prv_must('mobile1','phone','   Mobile Number1 ..Type 0 if no Mobile Number1  ! ');isInteger(this,9,event)"
										onchange="return  dgcount('mobile2',10)" /></td>
			</tr>	
							</table>								  
				</td>
			</tr>
 

			<tr>

				<td colspan="6" align="center"><input type="button" class="fb1"
					id="savebutton" name="savebutton" onclick="onsub()" value="Save">
				</td>
			</tr>
			
				<tbody id="entred_body">



			</tbody>
		</table>
	
</div>  
<%
	ResultSet rs1 = obj.getRS("select * from Qualification  order by sno");

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
 	} catch(SQLException e1)
 	{
 		out.println(e1);
 	}catch (Exception e) {
 		con.close();
 		out.println(e);

 	}
 %> <input type="hidden" id="flag" name="flag" value="0"> <input
	type="hidden" id="crow" name="crow" value="1">
	
	<input type="hidden" id="entrytype" name="entrytype" value="<%=entrytype%>">
 </center>
	</form>  
		
          
</body>  
</html>
     