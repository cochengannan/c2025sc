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
<script language="JavaScript" src="../js/cellcreate.js"></script>
<script language="JavaScript" src="../js/entry_help.js"></script>  
<script language="JavaScript" src="../js/csc.js"></script>
<script language="JavaScript" src="../js/validate.js"></script>
<script language="JavaScript" src="../js/menu1.js"></script>
<script src="../admin/jquery.min.js" type="text/javascript"></script>
<script language="JavaScript" src="../js/rowadd.js"></script>
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
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

  
		    var flag=document.getElementById("flag").value;
		    var flag2=isnull2();
		    if (flag==0 && flag2==0)
			   document.test.submit();
		    else
			  alert("Please Check All Filed...... ") ;
	 
}




function check_2()
{
	 
		// var flag=document.getElementById("flag").value;
		 var flag2=isnull2();
		 var flag=document.getElementById("flag").value;
		    if (flag2==0 && flag==0)
			 document.test.submit();
		    else
		    	alert("Check All Filed ...... ") ;
		 
	  
}
</script>
    

<body bgcolor="#dedede" onload="c1(),onld(),vis('street_mas',1);vis('nagar_div',1);vis('name_div',1);vis('fname_div',1)">

      
<%
	Connection con = null;
	String entrytype="",sc="",sb="",sbcode="",sc_code="",med="",sb_code="";
	try {
		Controller obj = new Controller();
		con = obj.con();
	    obj.createStatement(con);
		HttpSession session2 = request.getSession(true);
		entrytype=obj.setValue("flagtype",request);  	
		String uname1 = obj.isNull((String) session2.getAttribute("uname"),1);
		String sch_val;
		String class_ = "", Religion = "", Community = "", Qualification = "", School = "", Occupation = "";
		String val_="",style="",Staff="",BatchTime="";
		String Qualification2="";				  
	 
			style="";
			Qualification2 = obj.combo_box("class_s","select * from Qualification order by sno ", "qual", "qual",  1,val_,val_,"class=select2 onKeyDown=key_pass(event,'class_s','addfirst'); " + style);
		String sex = "";
		Calendar cal = Calendar.getInstance();
		int cy = cal.get(Calendar.YEAR);

		Religion = obj.combo_box("Religion", "select * from RC", "Religion","Religion", ""," class=select2 onKeyDown=key_pass(event,'Religion','Community');");
		Community = obj.combo_box("Community", "select * from RC","Community", "Community", ""," class=select2 onKeyDown=key_pass(event,'Community','CourseName') ");
		String ch = "";  
		String cb_code = "";
	 	int c =0; 
	 	int sub_count=0;
		Staff = obj.combo_box("Staff", "select * from Staff","name", "name", "", "class='select2'  onKeyDown=key_pass(event,'Staff','BatchTime'); " );
		BatchTime = obj.combo_box("BatchTime", "select * from [Batch Time]","BatchTime", "BatchTime", "", "class='select2'  onKeyDown=key_pass(event,'BatchTime','remarks');" );
		Occupation = obj.combo_box("foccup", "select * from Occupation","Occupation", "Occupation", ""," class='select2' onKeyDown=key_pass(event,'foccup','addfirst')");
		String CourseName = obj.combo_box("CourseName", "select  * from Course ", "CourseName", "CourseName", 0, "", "CourseName", "  class='select' onKeyDown=key_pass(event,'CourseName','Staff'); ");
		 
 		int sch_count=obj.getCount("Enquiry", "");
		String[] cmonth = { "-select month-", "Jan", "Feb", "Mar","Apr", "May", "Jun", "July", "Aug", "Sep", "Oct","Nov", "Dec" }; 
		String School1 ="";
		String area = obj.combo_box("addr3", "select * from Area order by Area","Area", "Area", "","class='select2' onKeyDown='area_value(2,event,this)'");   
		String street_mas = obj.combo_box("subset", "select street from street  ","street", "street", 0, "", "street", "multiple  style='height: 10pc' class='select2'  onKeyDown=key_pass(event,'area','b1')");
		String add_mas1 = obj.combo_box("addfirst", "select name from addmaster1  ","name", "name", 1, "None", "None", " class='select2' onKeyDown=key_pass(event,'addfirst','doorno')");
		 int year =  cal.get(Calendar.YEAR);
		 int month =  cal.get(Calendar.MONTH); 
		 int day =  cal.get(Calendar.DAY_OF_MONTH);
	 
	 String tdate=day + "/"+(month+1)+"/"+year;
	  	int next_=0;
	try  
	{
		next_= obj.getCount("Enquiry", "")+1 ;
	}catch(NullPointerException e) { 
		
		  out.println(e);
		next_=1;  
	}   
%>    

<form action="enq_entry_a.jsp" method="post" name="test"  style="top: 0px">

 <center> <div id="inner"  class="newcls">
	<%@ include file="../head.jsp"%>
				<div id="name_div"  style="position: absolute; border: 1;left:829px; top:182px; width:0; height:140;list-style:none;">
				<select id="oldstud" class="select2" name="oldstud" multiple="multiple" style="border: 0em; " onKeyDown="prv(event,'oldstud','name','name2','name_div')"><option value="0"></option> </select>
				</div>
				  
				<div id="fname_div"  style="position: absolute; border: 1;left:829px; top:282px; width:0; height:140;list-style:none;">
				<select id="oldfather" class="select2" name="oldfather" multiple="multiple" style="border: 0em; " onKeyDown="prv(event,'oldfather','fname0','fname1','fname_div')"><option value="0"></option> </select>
				</div>			         
				             
				<div  id="street_mas" style="position: absolute; border: 1;left:859px; top:272px; width:0; height:140;list-style:none;">   
				<select id="streetmas" class="select2" name="streetmas" multiple="multiple" style="border: 0em; " onKeyDown="prv(event,'streetmas','addr1','addr2','street_mas')"><option value="0"></option> </select>
				</div>         
				<div id="nagar_div"  style="position: absolute;  border: 1;left:800px; top:312px; width:0; height:140;list-style:none;">
				<div>
				<select id="nagar" class="select2" name="nagar" multiple="multiple" style="border: 0em; " onKeyDown="prv(event,'nagar','addr2','addr3','nagar_div')"><option value="0"></option> </select>
				</div>    
				</div>  
  
<table  align="center" border="1"   width="400"    cellspacing="0" cellpadding="0" style="border-color:skyblue;border-collapse: collapse"   >
<tr style="width: 892" bgcolor="skyblue">
		<td colspan="4" align="center"  >  
		<table  width="100%" border="0" background="../images2/main-butt.jpg"
			cellpadding="0" cellspacing="0" style="border-color:skyblue;border-collapse: collapse">
			<tr>  
				 <td align="center"  id="t1">      
				<font size="4" face="Tahoma" color='blue'>Enquiry Form</font>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				 
			</tr>
		</table>
		</td>  

	</tr>  
  <tr>
  <td>
			<table  width="100%" border="0">
				<tr>
					<td valign="bottom"  class="tdText" width="40%"   align="left">&nbsp;Total Record
					   <%=sch_count%>  </td>
			
					<td align="center" >&nbsp;</td><td width="40%" id='err_msg'></td>
					<td valign="top" width="25%"  class="tdText" valign="baseline"  
						colspan="1" align="right">Number <input type="text" id="no1"  
						name="no1" maxlength="4" onkeydown="key_pass(event,'no1','no2')"
						value="ENQ" class="tb1"> <input type="text" id="no2"
						name="no2" value="<%=next_%>" maxlength="6" class="tb1" style="color: red;font-weight: bold;background-color: #00fff0"
						onKeyDown="validate(10,event);key_pass(event,'no2','name',1)"      
						onKeyUp="IsNumeric(this.value,'Number only#no2',event)" onblur="nocheck(this,event)">&nbsp;&nbsp;&nbsp;&nbsp;</td>
			  
				</tr>    
			</table>
</td>
</tr>
	
	<tr>
		<td align="center" colspan="4"  >  
		<table width="700" align="left"  cellpadding="10" cellspacing="0" border="0" style="border-collapse: collapse;border-color: ">
			<tr   >
				<td width="25%" align="left"  class="tdText">&nbsp;Name </td>

				<td width="2%">:</td>
				<td align="left">
				
					<input type="text" name="name" id="name" maxlength="55" class="tb6" onKeyDown="key_pass(event,'name','name2','oldstud','name_div'); "    
					onKeyUp="prv_must('name','no2','Number ');CharOnly('name',9,event);help(1,'name','oldstud');vis('name_div',2); ">&nbsp;
					<input type="text" id="name2" name="name2" class="tbI0" maxlength="5"   onKeyDown="key_pass(event,'name2','sex')"   
					onKeyUp="prv_must('name2','name','Student Name ');CharOnly('name2',9,event);" onblur="cur_must('name2','Intial Missing ')" ></td>     
					      
					 			</tr>  
			<tr class="tdText" align="left">
				<td width="15%" class="tdText"><font class="tdText">&nbsp;Sex
				</font></td>
				<td width="2%">:</td>  
				<td><input type="radio" id="sex" name="sex" value="M" style="background-color: skyblue;color: red" onfocus=""
					onKeyDown="key_pass(event,'sex','class_s',1)">Male <input
					type="radio" id="sex" name="sex" value="F"  style="background-color: skyblue"     
					onKeyDown="key_pass(event,'sex','class_s')">Female</td>
			</tr>
			 
			<tr class="tdText">
				<td width="20%" align="left" class="tdText"><font class="tdText">&nbsp;Qualification
				</font></td>
				<td width="2%">:</td>
				<td align="left"> <%=Qualification2 %></td>
			</tr>
			 
			 
			<tr class="tdText" align="left">
				<td width="25%" class="tdText"><font class="tdText">&nbsp;Residential Address</font></td>
				<td width="2%">:</td>
				<td align="left">
					 <%=add_mas1%>
					<input type="text" id="doorno"  name="doorno" class="tbdoor"  onKeyUp="toUpper(this)" onKeyDown="key_pass(event,'doorno','addr1')">   
					<input type="text" class="tb6" id="addr1" maxlength="50" name="addr1" onKeyDown="key_pass(event,'addr1','addr2','streetmas','street_mas');"  onKeyUp="prv_must('addr1','doorno','Door No ');toUpper(this);help(3,'addr1','streetmas');vis('street_mas',2);">
				</td>  
				      
			</tr>           
			<tr class="tdText">     
				<td width="25%" class="tdText">&nbsp;</td>
				<td width="2%">:</td>
				<td align="left"><input type="text" class="tb6" id="addr2"
					maxlength="50" name="addr2"
					onKeyDown="key_pass(event,'addr2','addr3','nagar','nagar_div')"  onKeyUp="prv_must('addr2','addr1','Value to Previous Box ');toUpper(this);help(2,'addr2','nagar');vis('nagar_div',2);"></td>
			</tr>
      
     
  
			<tr class="tdText">
				<td width="25%" class="tdText">&nbsp;</td>
				<td width="2%">:</td>
				<td align="left"><%=area%>&nbsp;&nbsp;&nbsp;<input type="text" class="tb5" id="addr4"
					maxlength="10" name="addr4"
					onKeyDown="key_pass(event,'addr4','pincode')"  onKeyUp="toUpper(this)"  readonly="readonly"></td>
			</tr> 
		 
			<tr>
				<td colspan="3" align="left">      
							<table width="900" cellpadding="5" cellspacing="0" border=1 align="center" style="border-color:skyblue;border-collapse: collapse">
								<tr class="tdText">  
									<td width="25%" class="tdText" align="left"><font class="tdText">Pincode</font>
									</td>
									<td width="3%">:</td>
									<td width="5%" align="left">&nbsp;<input type="text"
										class="tb3" id="pincode" name="pincode" maxlength="7"
										onKeyDown="key_pass(event,'pincode','phone')"></td>
			
									<td width="10%" class="tdText" align="left"><font class="tdText">LandLine</font>
									</td>
									<td width="3%">:</td>
									<td align="left"><input type="text" class="tb3" id="phone"
										name="phone" maxlength="8"
										onKeyDown="phoneval(event,'phone','mobile1','1')"      
										onKeyUp="prv_must('phone','pincode',' PinCode ! ');isInteger(this,9,event)"
										onChange="return dgcount('phone',8)"></td>
										<td>Counsellor'Name</td><td><%=Staff%></td>
										  
								</tr>
								<tr  class="tdText">
									<td width="25%" class="tdText" align="left"><font class="tdText"> Mobile1</font>
									</td>
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
										onKeyDown="phoneval(event,'mobile2','idate','1')" 
										onKeyUp="prv_must('mobile1','phone','   Mobile Number1 ..Type 0 if no Mobile Number1  ! ');isInteger(this,9,event)"
										onchange="return  dgcount('mobile2',10)" /></td>
										<td>Time Allotted</td><td><%=BatchTime%></td>
										  
								</tr>
								<tr class="tdText">  
									<td>Date of Enquiry<font color=darkgreen size='2'><b>(dd/mm/yyyy)</b></font></td>
									<td width="2%">:</td> 
									<td><input type="text" name="idate" id="idate" value="<%=tdate%>" class="tb4" maxlength="10" onKeyDown="key_pass(event,'idate','CourseName')"></td>
									 
									<td>Course</td>
									<td width="2%">:</td>  
									<td><%=CourseName%></td>
								</tr>
								<tr class="tdText">
									<td >Remarks</td>
									<td width="3%">:</td>
									<td colspan="6">
									<textarea  name="remarks" id="remarks"   onKeyDown="key_pass(event,'remarks ','savebutton')" cols="40">
									</textarea></td>
									
									</tr>
							</table>  
				</td> 
			</tr>
			
			 
		</table>


		</td>

	</tr>


	 
			<tr>

				<td colspan="6" align="center"><input type="button" class="fb1"
					id="savebutton" name="savebutton" onclick="onsub()" value="Save">
				</td>
			</tr>
		</table>
		 
 
 
</div></center>
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
	type="hidden" id="crow" name="crow" value="1">
	
	<input type="hidden" id="entrytype" name="entrytype" value="<%=entrytype%>">
	
	</form>  
		
          
</body>  
</html>
     