<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 	pageEncoding="ISO-8859-1"%>
<%@page import="csc.Controller,java.sql.*"  errorPage="../errorpage.jsp"%><html>
<head>
<script language="JavaScript" src="./js/csc.js"></script>
<script language="JavaScript" src="./js/entry_help.js"></script>  
<script language="JavaScript" src="./js/cellcreate.js"></script>  
<script language="JavaScript">
<!-- 
function FP_preloadImgs() {//v1.0
 var d=document,a=arguments; if(!d.FP_imgs) d.FP_imgs=new Array();
 for(var i=0; i<a.length; i++) { d.FP_imgs[i]=new Image; d.FP_imgs[i].src=a[i]; }
}

function FP_swapImg() {//v1.0
 var doc=document,args=arguments,elm,n; doc.$imgSwaps=new Array(); for(n=2; n<args.length;
 n+=2) { elm=FP_getObjectByID(args[n]); if(elm) { doc.$imgSwaps[doc.$imgSwaps.length]=elm;
 elm.$src=elm.src; elm.src=args[n+1]; } }
}

function FP_getObjectByID(id,o) {//v1.0
 var c,el,els,f,m,n; if(!o)o=document; if(o.getElementById) el=o.getElementById(id);
 else if(o.layers) c=o.layers; else if(o.all) el=o.all[id]; if(el) return el;
 if(o.id==id || o.name==id) return o; if(o.childNodes) c=o.childNodes; if(c)
 for(n=0; n<c.length; n++) { el=FP_getObjectByID(id,c[n]); if(el) return el; }
 f=o.forms; if(f) for(n=0; n<f.length; n++) { els=f[n].elements;
 for(m=0; m<els.length; m++){ el=FP_getObjectByID(id,els[n]); if(el) return el; } }
 return null;
}
// -->
</script>
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
 
<title>FRONT OFFICE APPLICATION</title>
</head>
  <%
 		Controller obj=new Controller();
 		Connection con=obj.con();
 		PreparedStatement ps =con.prepareStatement("select * from staff");
 		ResultSet rs=ps.executeQuery();
 		String qual1 = obj.combo_box("qual", "select distinct qual  from Qualification",
				"qual", "qual", 0, "", "qual",
				"class='select2'  onKeyDown=key_pass(event,'qual','ptime',1)");
 		String qualtype = obj.combo_box("qualtype", "select distinct qualtype  from Qualification",
				"qualtype", "qualtype", 0, "", "qualtype",
				"class='select2'  onKeyDown=key_pass(event,'qualtype','qual',1)");  
 	String	religion = obj
		.combo_box("RC", "select * from RC", "Religion",
				"Religion", "",
				" class=select2 onKeyDown=key_pass(event,'RC','Community')");
 		
 		 
	String Community = obj
		.combo_box("Community", "select * from RC",  
				"Community", "Community", "",
				" class=select2 onKeyDown=key_pass(event,'Community','uname') onblur=check_2()");
 %>  
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" onload="FP_preloadImgs(/*url*/'button70.jpg', /*url*/'button71.jpg', /*url*/'button82.jpg', /*url*/'button83.jpg')">
<form name="staff_frm" action="../dbprocess/staff_a.jsp">
<div align="center">
	<table border="0" width="100%" bgcolor="#FFFFFF">
		<tr>
			<td align="center">
			<p align="center">  
			<img border="0" src="./CSC_Logo.jpg" width="139" height="76" align="baseline"></td>
			<td>
			<p align="center"><b>
			<font face="Arial Rounded MT Bold" color="#FF0000" style="font-size: 28pt">
			FRONT OFFICE APPLICATION</font></b></td>
			<td align="center">
			<img border="0" src="./founder.gif" width="103" height="106" align="baseline"></td>
		</tr>
	</table>
</div>
<div align="center">
<table border="4" width="75%" bgcolor="#2781BA" bordercolordark="#C0C0C0" bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" style="border: 1px solid #C0C0C0">
	<tr>
		<td style="font-family: Calibri; font-style: oblique; font-weight: bold" colspan="6" height="75">
		<p align="center"><span style="font-style: normal">
		<font size="7" color="#FFFF00">STAFF REGISTRATION FORM</font></span></td>
	</tr>
	<tr>
		<td style="font-family: Calibri; font-style: oblique; font-weight: bold" height="50" width="63%" align="center" colspan="3">
			<font color="#FFFFFF">
			<!--webbot bot="SaveResults" U-File="_private/form_results.csv" S-Format="TEXT/CSV" S-Label-Fields="TRUE" startspan --><input TYPE="hidden" NAME="VTI-GROUP" VALUE="0"><!--webbot bot="SaveResults" i-checksum="43374" endspan -->
			</font>
			<p align="center"><font color="#FFFFFF">Staff Name : 
			<font color="#FFFF00">
			<input type="text" id="stfname" name="stfname"  size="41" onKeyUp="CharOnly('stfname',9,event)" onKeyDown="key_pass(event,'stfname','T60',1)"></font>&nbsp;
			</font>
			<font color="#FFFFFF"> 
			<input type="text" name="T60" id="T60" size="4" style="vertical-align: baseline" onKeyUp="CharOnly('T60',9,event)" onKeyDown="key_pass(event,'T60','T61',1)"> 
			</font> </p></td>
		<td style="font-family: Calibri; font-style: oblique; font-weight: bold" height="50" width="35%" align="center" colspan="3">
		<font color="#FFFFFF">Employee Code. :&nbsp; 
		<input type="text"  size="5" style="vertical-align: baseline" id="T61" name="T61" onKeyDown="key_pass(event,'T61','T62',1)"><input type="text" id="T62" name="T62" size="5" style="vertical-align: baseline"  onKeyDown="key_pass(event,'T62','D4',1)"></font></td>
	</tr>
	<tr>
		<td style="font-family: Calibri; font-style: oblique; font-weight: bold" height="50">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<font color="#FFFFFF">Gender :
		 <select size="1" id="D4" name="D4"  onKeyDown="key_pass(event,'D4','D5')"> 
			<option value="0">Select</option>
			<option value="Male">Male</option> 
			<option value="Female">Female</option>
		</select>
		</font></td>
		<td style="font-family: Calibri; font-style: oblique; font-weight: bold" colspan="3" height="50">&nbsp;&nbsp;
		<font color="#FFFFFF">Date of Birth :&nbsp; 
		<select size="1" name="D5"  id="D5" onKeyDown="key_pass(event,'D5','D6')"> 
				<option value="0">DD</option>
				<%
				for(int i=1;i<=31;i++)
				{%>
				<option value=<%=i%>><%=i%></option>		
				<%}
				%>
			</select>
			<select size="1" name="D6"  id="D6" onKeyDown="key_pass(event,'D6','D7')"> 
				<option value="0">MM</option>
				<%
				for(int i=1;i<=12;i++)
				{%>
				<option value=<%=i%>><%=i%></option>		
				<%}
				%>
				</select>
				<select size="1" name="D7" id="D7" onKeyDown="key_pass(event,'D7','T5')"> 
				<option value="0">YYYY</option>
				<%
				for(int i=1975;i<=2000;i++)
				{%>
				<option value=<%=i%>><%=i%></option>		
				<%}
				%>
				</select></font></td>
		<td style="font-family: Calibri; font-style: oblique; font-weight: bold" colspan="2" height="50">
		<font color="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Age&nbsp; 
		:&nbsp;&nbsp;&nbsp; </font>
		<input type="text" name="T5" id="T5" size="7" onKeyDown="key_pass(event,'T5','T6')"></td>
	</tr>
	<tr>
		<td style="font-family: Calibri; font-style: oblique; font-weight: bold" height="49" width="63%" align="center" colspan="3">
			<!--webbot bot="SaveResults" U-File="_private/form_results.csv" S-Format="TEXT/CSV" S-Label-Fields="TRUE" startspan --><input TYPE="hidden" NAME="VTI-GROUP" VALUE="1"><!--webbot bot="SaveResults" i-checksum="43406" endspan -->
			<p align="center"><font color="#FFFFFF">Father Name : </font>
			<input type=text id="T6" name="T6"  onKeyUp="CharOnly('stffname',9,event)" onKeyDown="key_pass(event,'T6','T7')" size="41" style="vertical-align: baseline"> 
			<input type="text" name="T7" id="T7" size="4" style="vertical-align: baseline" onKeyDown="key_pass(event,'T7','T8')"> </p></td>
		<td style="font-family: Calibri; font-style: oblique; font-weight: bold" height="49" width="35%" align="center" colspan="3">
		<font color="#FFFFFF">Monthly Salary :&nbsp; </font>
		<input type="text" name="T8" id="T8" size="12" style="vertical-align: baseline" onKeyDown="key_pass(event,'T8','D10')"></td>
	</tr>
	<tr>
		<td style="font-family: Calibri; font-style: oblique; font-weight: bold" align="center" height="51" width="34%">
			<!--webbot bot="SaveResults" U-File="_private/form_results.csv" S-Format="TEXT/CSV" S-Label-Fields="TRUE" startspan --><input TYPE="hidden" NAME="VTI-GROUP" VALUE="2"><!--webbot bot="SaveResults" i-checksum="43438" endspan -->
			<p align="center"><font color="#FFFFFF">Date of Joining :&nbsp;&nbsp;&nbsp;&nbsp; 
			<select size="1" name="D10" id="D10" onKeyDown="key_pass(event,'D10','D11')"> <option> 
			DD</option>
			</select><select size="1" name="D11" id="D11" onKeyDown="key_pass(event,'D11','D12')"> <option> 
			MM</option>
			</select><select size="1" name="D12" id="D12" onKeyDown="key_pass(event,'D12','qualtype')"> <option> 
			YYYY</option>
			</select></font></p>
		</td>
		<td style="font-family: Calibri; font-style: oblique; font-weight: bold" colspan="4" align="center" height="51">
			<font color="#FFFFFF"><b>Education Details</b>&nbsp; : &nbsp;</font><select id="qualtype" name="qualtype" class="select2" onKeyDown="key_pass(event,'qualtype','qual')"><option selected="selected" value="0">Select</option><option value="0">0</option><option value="CA">CA</option><option value="DIPLOMA">DIPLOMA</option><option value="ENG">ENG</option><option value="ITI">ITI</option><option value="NEW">NEW</option><option value="OTHERS">OTHERS</option><option value="PG">PG</option><option value="SCHOOL">SCHOOL</option><option value="UG">UG</option><option value="X">X</option><option value="XII">XII</option></select>
			<select id="qual" name="qual" class="select2" onKeyDown="key_pass(event,'qual','D3')"><option selected="selected" value="0">Select</option><option value="10TH">10TH</option><option value="11TH">11TH</option><option value="12TH">12TH</option><option value="1ST">1ST</option><option value="2ND">2ND</option><option value="3RD">3RD</option><option value="4TH">4TH</option><option value="5TH">5TH</option><option value="6TH">6TH</option><option value="7TH">7TH</option><option value="8TH">8TH</option><option value="9TH">9TH</option><option value="BA">BA</option><option value="BBA">BBA</option><option value="BCA">BCA</option><option value="BCOM">BCOM</option><option value="BE">BE</option><option value="BL">BL</option><option value="BPHARM">BPHARM</option><option value="BSC">BSC</option><option value="BTECH">BTECH</option><option value="CA">CA</option><option value="DIPLOMA">DIPLOMA</option><option value="ITI">ITI</option><option value="MA">MA</option><option value="MBA">MBA</option><option value="MBBS">MBBS</option><option value="MCA">MCA</option><option value="MCOM">MCOM</option><option value="ME
	">ME
	</option><option value="MPHIL">MPHIL</option><option value="MSC">MSC</option><option value="NEW">NEW</option><option value="OTHERS">OTHERS</option><option value="VC">VC</option></select>
		</td>
		<td style="font-family: Calibri; font-style: oblique; font-weight: bold" align="center" height="51" width="23%">
			<font color="#FFFFFF">Timing : 
			<select size="1" name="D3" id="D3" style="vertical-align: baseline" onKeyDown="key_pass(event,'D3','T9')"> <option> 
			Select Timing</option>
			</select></font></td>
	</tr>
	<tr>
		<td style="font-family: Calibri; font-style: oblique; font-weight: bold" height="50" width="98%" align="center" colspan="6">
			<!--webbot bot="SaveResults" U-File="_private/form_results.csv" S-Format="TEXT/CSV" S-Label-Fields="TRUE" startspan --><input TYPE="hidden" NAME="VTI-GROUP" VALUE="3"><!--webbot bot="SaveResults" i-checksum="43470" endspan -->
			<p align="center"><font color="#FFFFFF">Address : </font>
			<input type="text" name="T9" id="T9" size="8" style="vertical-align: baseline" onKeyDown="key_pass(event,'T9','T10')">&nbsp;<input type="text" name="T10" id="T10" size="35" style="vertical-align: baseline" onKeyDown="key_pass(event,'T10','T12')"> 
			<input type="text" name="T11" id="T11" size="16" style="vertical-align: baseline" onKeyDown="key_pass(event,'T11','T12')" > 
		<input type="text" name="T12" id="T12" size="35" style="vertical-align: baseline" onKeyDown="key_pass(event,'T12','T13')"></p></td>
		</tr>
	<tr>
		<td style="font-family: Calibri; font-style: oblique; font-weight: bold" colspan="6" height="49">
		<p align="center"><font color="#FFFFFF">Mobile No.: </font>
		<input type="text" name="T13" size="1" value="0" style="vertical-align: baseline" onKeyDown="key_pass(event,'T13','T14')">
		<input type="text" name="T14" size="1" value="0" style="vertical-align: baseline" onKeyDown="key_pass(event,'T14','T15')">
		<input type="text" name="T15" size="1" value="0" style="vertical-align: baseline" onKeyDown="key_pass(event,'T15','T16')">
		<input type="text" name="T16" size="1" value="0" style="vertical-align: baseline" onKeyDown="key_pass(event,'T16','T17')">
		<input type="text" name="T17" size="1" value="0" style="vertical-align: baseline" onKeyDown="key_pass(event,'T17','T18')">
		<input type="text" name="T18" size="1" value="0" style="vertical-align: baseline" onKeyDown="key_pass(event,'T18','T19')">
		<input type="text" name="T19" size="1" value="0" style="vertical-align: baseline" onKeyDown="key_pass(event,'T18','T20')">
		<input type="text" name="T20" size="1" value="0" style="vertical-align: baseline" onKeyDown="key_pass(event,'T20','T21')">
		<input type="text" name="T21" size="1" value="0" style="vertical-align: baseline" onKeyDown="key_pass(event,'T21','T22')">
		<input type="text" name="T22" size="1" value="0" style="vertical-align: baseline" onKeyDown="key_pass(event,'T22','T23')">
		<font color="#FFFFFF">/</font>&nbsp;
		<input type="text" name="T41" size="1" value="0" style="vertical-align: baseline" onKeyDown="key_pass(event,'T41','T42')">
		<input type="text" name="T42" size="1" value="0" style="vertical-align: baseline" onKeyDown="key_pass(event,'T42','T43')">
		<input type="text" name="T43" size="1" value="0" style="vertical-align: baseline" onKeyDown="key_pass(event,'T43','T44')">
		<input type="text" name="T44" size="1" value="0" style="vertical-align: baseline" onKeyDown="key_pass(event,'T44','T45')">
		<input type="text" name="T45" size="1" value="0" style="vertical-align: baseline" onKeyDown="key_pass(event,'T45','T46')">
		<input type="text" name="T46" size="1" value="0" style="vertical-align: baseline" onKeyDown="key_pass(event,'T46','T47')">
		<input type="text" name="T47" size="1" value="0" style="vertical-align: baseline" onKeyDown="key_pass(event,'T47','T48')">
		<input type="text" name="T48" size="1" value="0" style="vertical-align: baseline" onKeyDown="key_pass(event,'T48','T49')">
		<input type="text" name="T49" size="1" value="0" style="vertical-align: baseline" onKeyDown="key_pass(event,'T49','T50')">
		<input type="text" name="T50" size="1" value="0" style="vertical-align: baseline" onKeyDown="key_pass(event,'T50','T51')">
		</td>
	</tr>
	<tr>
		<td style="font-family: Calibri; font-style: oblique; font-weight: bold" colspan="6" height="49">
		<p align="center">&nbsp;<font color="#FFFFFF">Landline No: </font>
		<input type="text" name="T51" size="1" value="0" style="vertical-align: baseline" onKeyDown="key_pass(event,'T51','T52')">
		<input type="text" name="T52" size="1" value="0" style="vertical-align: baseline" onKeyDown="key_pass(event,'T52','T53')">
		<input type="text" name="T53" size="1" value="0" style="vertical-align: baseline" onKeyDown="key_pass(event,'T53','T54')">
		<input type="text" name="T54" size="1" value="0" style="vertical-align: baseline" onKeyDown="key_pass(event,'T54','T55')">
		<input type="text" name="T55" size="1" value="0" style="vertical-align: baseline" onKeyDown="key_pass(event,'T55','T56')">
		<input type="text" name="T56" size="1" value="0" style="vertical-align: baseline" onKeyDown="key_pass(event,'T56','T57')">
		<input type="text" name="T57" size="1" value="0" style="vertical-align: baseline" onKeyDown="key_pass(event,'T57','T58')">
		<input type="text" name="T58" size="1" value="0" style="vertical-align: baseline" onKeyDown="key_pass(event,'T58','T59')"></p></td>
	</tr>
	<tr>
		<td style="font-family: Calibri; font-style: oblique; font-weight: bold" align="center" height="50" colspan="6">
			<!--webbot bot="SaveResults" U-File="_private/form_results.csv" S-Format="TEXT/CSV" S-Label-Fields="TRUE" startspan --><input TYPE="hidden" NAME="VTI-GROUP" VALUE="4"><!--webbot bot="SaveResults" i-checksum="43502" endspan -->
			<p align="center"><font color="#FFFFFF">Religion:&nbsp; 
			<select size="1" name="D8" style="vertical-align: baseline"> <option> 
			Select</option>
			</select> &nbsp; Community&nbsp; : &nbsp;<select size="1" name="D9" style="vertical-align: baseline"> <option> 
			Select</option>
			</select></font></p>
		</td>
		</tr>
	<tr>
		<td style="font-family: Calibri; font-style: oblique; font-weight: bold" colspan="2" height="50">
		<p align="center">
		<font color="#FFFFFF">User Name :&nbsp; </font> 
			<input type="text" name="T63" size="27" style="vertical-align: baseline"></td>
		<td style="font-family: Calibri; font-style: oblique; font-weight: bold" colspan="4" height="50">
		<p align="center"><font color="#FFFFFF">Password :&nbsp; </font> 
			<input type="text" name="T64" size="27" style="vertical-align: baseline"></td>
	</tr>
	<tr>
		<td style="font-family: Calibri; font-style: oblique; font-weight: bold" colspan="6" height="50">
		<p align="center">
		<img border="0" id="img4" src="./button6F.jpg" height="20" width="100"  onkeydown="onsub()" alt="Submit" fp-style="fp-btn: Braided Column 2; fp-font-style: Bold; fp-font-size: 11; fp-font-color-normal: #FFFFFF; fp-font-color-hover: #008000; fp-font-color-press: #FFFFFF; fp-bgcolor: #2781BA" fp-title="Submit" onmouseover="FP_swapImg(1,0,/*id*/'img4',/*url*/'button70.jpg')" onmouseout="FP_swapImg(0,0,/*id*/'img4',/*url*/'button6F.jpg')" onmousedown="FP_swapImg(1,0,/*id*/'img4',/*url*/'button71.jpg')" onmouseup="FP_swapImg(0,0,/*id*/'img4',/*url*/'button70.jpg')"><img border="0" id="img5" src="button81.jpg" height="20" width="100" alt="Reset" fp-style="fp-btn: Braided Column 3; fp-font-style: Bold; fp-font-size: 11; fp-font-color-normal: #FFFFFF; fp-font-color-hover: #FF0000; fp-font-color-press: #FFFFFF; fp-bgcolor: #2781BA" fp-title="Reset" onmouseover="FP_swapImg(1,0,/*id*/'img5',/*url*/'button82.jpg')" onmouseout="FP_swapImg(0,0,/*id*/'img5',/*url*/'button81.jpg')" onmousedown="FP_swapImg(1,0,/*id*/'img5',/*url*/'button83.jpg')" onmouseup="FP_swapImg(0,0,/*id*/'img5',/*url*/'button82.jpg')"></td>
	</tr>
</table>

</div>
<input type="hidden" id="flag" name="flag" value="1"> 
</form>
</body>

</html>