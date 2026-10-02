<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="csc.Controller,java.sql.*,java.util.*,java.text.*"  errorPage="../errorpage.jsp"%><html>
 
<head>
  <style type="text/css">
  
   
 #apDiv51 {
	 position:absolute;
	left:-5px;
	top:-10px;
	width:100.6%; 
	height:10%; 
	  
}  
  #apDiv62 {
	 	position:absolute;
 		z-index:3;
	top:755px;
	width:100.6%;
	height:100%;
	left:-5px;
}
  </style>
 <script language="JavaScript" src="../js/csc.js"></script>
<script language="JavaScript" src="../js/entry_help.js"></script>  
<script language="JavaScript" src="../js/cellcreate.js"></script>
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<script type="text/javascript">

function ind()
{
	location.href="../index.jsp";
}
function onsub()
{
	 var flag=document.getElementById("flag").value;
	  if (flag==0 )
		   document.staff_frm.submit();
	    else
		    msgload("Check All Filed ",1) ;
	
}

</script>             
 
<title>Welcome To CSC : Staff Master</title>

</head>
<div id="apDiv51">
<table width="100%"   border="0" align="center"   >
<tr>
                    <td width="144" height="50" bgcolor="#0099FF" class="style2"><h2 align="left"><img src="../images/CSC Logo.PNG" border="0" width="141" height="65" alt="" /></h2>
                    </td>
        <td width="100%" height="20%" bgcolor="#0099FF" ><h2 align="right">CSC Computer Education (P) Ltd</h2>
                      <p align="right"><font size="2">
                       </font>
        &nbsp;</p></td>
      </tr>
</table>
</div  > 
  <%
  
   Calendar cal = Calendar.getInstance();
	int mm = cal.get(Calendar.MONTH) + 1;
	int dd = cal.get(Calendar.DAY_OF_MONTH);
	int yy = cal.get(Calendar.YEAR);
	String date = dd + "/" + mm + "/" + yy;
	
	SimpleDateFormat d=new SimpleDateFormat("dd/MM/yyyy");
 	Controller obj=new Controller();
 	Connection con=obj.con();
 	PreparedStatement ps =con.prepareStatement("select * from staff");
 	ResultSet rs=ps.executeQuery();
 	String qual1 = obj.combo_box("qual", "select distinct qual  from Qualification","qual", "qual", 0, "", "qual",
				"class='select2'  onKeyDown=key_pass(event,'qual','ptime',1)");
 	String qualtype = obj.combo_box("qualtype", "select distinct qualtype  from Qualification",
				"qualtype", "qualtype", 0, "", "qualtype","class='select2'  onKeyDown=key_pass(event,'qualtype','qual',1)");  
 	String	religion = obj.combo_box("RC", "select * from RC", "Religion","Religion", ""," class=select2 onKeyDown=key_pass(event,'RC','Community')");
 	
 	String cclist = obj.combo_box("clist", "select * from clist",
			"cname", "sno", 0, "", "cname","class='select2' ");  

 	 
 	String Community = obj.combo_box("Community", "select * from RC","Community", "Community", "",
				" class=select2 onKeyDown=key_pass(event,'Community','uname') onblur=check_2()");
 %>     

<body onload="javascript:document.getElementById('stfname').focus();"   >     
<form name="staff_frm" action="../dbprocess/staff_a.jsp"><br><br> <br><br> <br><br> <br><br> 
			<table  border="1" bgcolor="#ffffff" align="center" cellpadding="10" cellspacing="0" >  
			 
 			<tr class="tdtablerow1">
 				<td width="10%" align="left"><b> Center Name</b> </td>
 				<td colspan="3"><%=cclist %></td>
 			</Tr>
			<tr class="tdtablerow1">
					<td width="10%" align="left"><b> Name </b> </td>
					<td> <input type="text" id="stfname" name="stfname" class="tb5_2" onKeyUp="CharOnly('stfname',9,event)" onKeyDown="key_pass(event,'stfname','stffname',1)"></td>    
					<td   width="30%" align="left" ><b>Father/Mother Name</b></td>
					<td> <input type=text id="stffname" name="stffname" class="tb5_2"  onKeyUp="CharOnly('stffname',9,event)" onKeyDown="key_pass(event,'stffname','sex')"></td>
			</tr>
			<tr class="tdtablerow1">	 
						<td colspan="4" align="center"><input type="radio" id="sex" value="Male" name="sex"  onKeyDown="key_pass(event,'sex','dob')"/>Male &nbsp;<input type="radio"  id="sex" name="sex"  value="Female" onKeyDown="key_pass(event,'sex','dob')" /> Female</td>
			</tr>
			<tr class="tdtablerow1">
					<td  align="left"><b>Date of Birth</b></td>
					<td> <input type=text id="dob" name="dob"  class="tb5" maxlength="10" onKeyUp="IsNumeric(this.value,'Number only#no2',event)"  onKeyDown="key_pass(event,'dob','doj')"><font size=1>(dd/mm/yyyy)</font></td>
					<tD  align="left"><b>Date of Joining</b></tD>
					<td> <input type=text id="doj" name="doj"  class="tb5" maxlength="10" onKeyUp="IsNumeric(this.value,'Number only#no2',event)"  onKeyDown="key_pass(event,'doj','qualtype')"><font size=1>(dd/mm/yyyy)</font></td>
			</tr>
			<tr class="tdtablerow1">
					<td colspan="1"  align="left"> <b>Education Details</b></td>
					<td> 
						<%=qualtype%><%=qual1%>
					</td>
					<td align="left"><b>Mode of Work</b></td>
					
					<td> <input type="checkbox"  id="ptime" name="ptime" value="Part Time" onKeyDown="key_pass(event,'ptime','ftime')">Part Time  <input type="checkbox"  id="ftime" name="ftime"  onKeyDown="key_pass(event,'ftime','addr1')" value="Full Time" >Full Time </td>
			</tr>
			<tr class="tdtablerow1">
					<td  align="left"><b> Address </b></td>
					<td colspan="3"> 
					<input type=text class="tb5_0" id="addr1" name="addr1" onKeyDown="key_pass(event,'addr1','addr2')" onKeyUp="toUpper(this);">&nbsp;
					<input type=text class=tb5  id="addr2" name="addr2"  onKeyDown="key_pass(event,'addr2','addr3')"  onKeyUp="toUpper(this);">  
					<input type=text class=tb5_2 id="addr3" name="addr3" onKeyDown="key_pass(event,'addr3','addr4')" onKeyUp="toUpper(this);"> 
					<input type=text class=tb5_2 id="addr4" name="addr4" onKeyDown="key_pass(event,'addr4','city')"  onKeyUp="toUpper(this);"><br>
					
					</td>
				</tr>
				<tr class="tdtablerow1"><td colspan="1"  align="left"><b> City  </td><td> <input type=text  class=tb5_2  id="city" name="city"  onKeyUp="toUpper(this);"  onKeyDown="key_pass(event,'city','pin')" ></td><td><b>Pincode <input type=text  maxlength="7" class=tb5  id="pin" name="pin" onKeyUp="isInteger(this,9,event)" onKeyDown="key_pass(event,'pin','landline')"></td></tr>
				<tr>
					<td width="5%" colspan="1" align="left"> <b>LandLine </td><td><input type=text  class="tb5"  maxlength="8" id="landline" name="landline"  onKeyUp="isInteger(this,9,event)" onKeyDown="key_pass(event,'landline','phone')"></td><td><b>Mobile <input type=text  class="tb5"  maxlength="10" id="phone" name="phone" onKeyUp="isInteger(this,9,event)" onKeyDown="key_pass(event,'phone','RC')"></td>
				</tr>
				<tr class="tdtablerow1">
						<td width="25%"  align="left"> <b>Religion</b> 
						</td>
						 
						<td align="left">&nbsp;<%=religion%></td>

						<td width="10%"  align="left"> <b>Community</b>  </td>
						 
						<td align="left"><%=Community%></td>
 
					</tr>
			   <tr class="tdtablerow1">
			   	<td   align="left"><b> Username </b></td>
			   	<td>
			   	<input type="text" class="tb5" id="uname" name="uname"  onKeyDown="key_pass(event,'uname','pwd')">
			   	</td>
			   	<td   align="left"><b> Password</b></td>
			   	<td><input type="password" class="tb5" id="pwd" name="pwd"  onKeyDown="key_pass(event,'pwd','b1')">
			   	</td>
			   </tr>
				<tr>
					 
					<td colspan="4" align="center"> 
					   <input type="button"  id="b1" name="b1" value="Submit" class="tb7button" onkeydown="onsub()">
					   <input type="button"  id="b2" name="b2" value="Close" class="tb7button" onclick="window.close()">
					    <input type="button"  id="b3" name="b3" value="Login" class="tb7button" onclick="ind()">
					  </td>
				</tr> 
				<tr>
					<td colspan="4" align="center"> Press Home for login after successfull Register </td>
				</tr>
			</table>  
			  
 <div id="apDiv62">
				<table width="100%"   border="0" align="center"   >
                  <tr>
                   <td height="10%"  colspan="2" bgcolor="#0099FF">
                   <h6 align="center">Copyright © <%=yy %> iteducation.com, All Rights Reserved.<br />
                    (Pallavaram, Pammal, Chromepet)</h6>
                    </td>
				</tr>
</table>
</div>
<input type="hidden" id="flag" name="flag" value="1"> 
 </form></body>
</html>