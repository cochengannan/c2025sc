<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<html>
<%@page import="csc.*"%>
<%@page import="java.util.*,java.sql.*"%>
<head>
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<title>CSC : Reception Entry</title>
<script language="JavaScript" src="../js/cellcreate.js"></script>
<script language="JavaScript" src="../js/entry_help.js"></script>
<script language="JavaScript" src="../js/csc.js"></script>
<script language="JavaScript" src="../js/reception.js"></script>
<script language="JavaScript" src="../js/validate.js"></script>
<script type="text/javascript">
function disp()
{
	document.getElementById("st").innerHTML="Now Pointer in Save Button";
}
function dis()
{  
	document.getElementById("st").innerHTML="";
}
function store(event,a)
{
	  document.test.submit();  
}

function batchcount(event,a)
{
		document.location.href="reception.jsp?btc="+a.value;
}
function rld2()
{
document.location.href="reception.jsp?btc="+document.getElementById("sbatch").value;
}
function entry(val)
{
    
	var win=window.open(val,"mywindow","width=910,height=910,location=1,status=1,scrollbars=1,resizable=1");
}
function casechange(id)
{
	var val=new String(document.getElementById(id).value);
	document.getElementById(id).value=val.toUpperCase();
}
function val_sub(event)
{
	try
	{
				var s = event.keyCode;
				if (s == 13) 
				{
					var btc=document.getElementById('btc').value;
					var sno=document.getElementById('sno').value;
					var slno=document.getElementById('slno').value;
					var yes=document.getElementById('yes');
					var flag=0;
					if (yes.checked==false)
					{
						flag=1;
						
						var s=confirm ("Studnet Not Attend Exam ? Continoue ?");
						if (s==true)
						{
						flag=0;
						}	
						else
						{
						flag=1;
						document.getElementById('yes').focus();
						}
					}
				 	if (btc!=0 && sno!=0 && sno!="" && slno!=0 && slno!="" && flag==0)
				 	{
					  
					 document.getElementById("cmd").value="Save";
					 
					 document.test.submit();
					   
					 dview(7);
				 	}
				 	else
				 	{
						alert("Please Check All Field !");
					}
				}  
			 
	}catch(e)  { }
}
function de_fun()
{
	 document.getElementById('htno').focus();

}

function check_val(a,event)
{
	var flag=1;
	var flag1=1;
	var s = event.keyCode;
	if (s == 13) 
	{
		var val=parseInt(document.getElementById('nstno').innerHTML);
		var next=val+1;
		 
			 if (val==parseInt(a.value))
			 {  
				flag=0;
			 }
			    
			  
				if (next!=parseInt(a.value))
					{  
						 
					 flag1=0; 
					}  
			 
			   
				if (flag==0 || flag1==0 ) 
				{  
				
			
								alert("Give Next Seat to this Student");
						document.getElementById('sno').value="";     
					 	try
					 	{ 
					 			document.getElementById('sno').focus();
					 	}catch(e) {}
					 	
					return false; 	
				}
				else
				{
					
					return true;
				}
	}
}
</script>
</head>


<body onload="de_fun(); vis('stuname_div',1)">
<%
	Connection con = null;
	String entrytype = "",condvalue="", sc = "", sb = "", sbcode = "", sc_code = "", med = "", sb_code = "", class_ = "";
	String name1 = "", sexd = "", name2 = "", addr1 = "", type = "";
	String addr2 = "", addr3 = "", addr4 = "", pincode = "", phone = "", mobile1 = "", mobile2 = "", Religiond = "", Communityd = "", occ = "", doorno = "";
	try {
		Controller obj = new Controller();
		con = obj.con();
		obj.createStatement(con);
		Calendar cal1 = Calendar.getInstance();
		int mm1 = cal1.get(Calendar.MONTH) + 1;
		int dd1 = cal1.get(Calendar.DAY_OF_MONTH);
		int yy1 = cal1.get(Calendar.YEAR);
		String date1 = dd1 + "/" + mm1 + "/" + yy1;
		 
		String htno = obj.setValue("htno", request);
		  condvalue = obj.setValue("btc", request);
		String slno = obj.setValue("slno", request);
		String sno = obj.setValue("sno", request);
		String yes = obj.setValue("yes", request);
		String savebutton = obj.setValue("savebutton", request);
		
		String satyear="0" ,sattype="0",sdesc="0";
		String msg="";
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
		String cond = " where htno='" + htno + "'";
		String combo = "<select  id='btc' name='btc' class='select2'  onchange=dview(7,event)>";  
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
		int serlno=obj.getMax("Reception","sno"," where satyear="+satyear+" and sattype="+sattype)+1;
		int batch_count = obj.getCount("Reception", " where Bname='"+condvalue+"'   and  satyear="+satyear+" and sattype="+sattype);
		int prv_ = 0;  
		 
		if (batch_count != 0) 
		{ 
			prv_ = (obj.getMax("Reception", "SeatNo", " where Bname='"+condvalue+"'   and  satyear="+satyear+" and sattype="+sattype)+1); 
		}  
		
		if (prv_==0) prv_=1;
		String Batch_label=condvalue;    
	
%>
<form name="test" action="../dbprocess/receptiaon_a.jsp" method="get">
  
<div id="menudiv" style="margin-top: 3%"><ul id="css3menu1" >
				<li><a href='../home.jsp'>Home</a></li>
				<li><a href='javascript:window.history.go(-1)'>Back</a></li>
				<li><a href="../logout.jsp" style="width:60px; height:16px;line-height:16px;">Logout</a></li>
			</ul>
</div>
 <center> 
 
  <div id="cdiv">  <Br> 
				<table width="100%" border=1 style="border-color: skyblue; border-collapse: collapse">   
				<tr>
					<td valign="top" width="50%"> 
						<table align="left" border="1"   cellspacing="0" cellpadding="5" width="100%" style="border-color: skyblue; border-collapse: collapse">
								<tr>
									<td>
										<table  width="100%" border="0" cellpadding="5" cellspacing="0"	style="border-color: skyblue; border-collapse: collapse">
										<tr><td>Name </td><td>: <input type="text" id="ename" name="ename" onkeyup="help(9,'ename','studname');"></td></tr>
										<tr><td>Ph</td><td>: <input type="text" id="ph" name="ph" onkeyup="help(10,'ph','studname');"></td></tr>
										<tr><td colspan="2"><input type="button" value="Close" onclick="javascript:window.close()"></td></tr></table>
									</td>
									<td colspan="5"  align="right"><a href="../reports/excel_report_gen.jsp?flag=14&batch='A'"><font color='red' size="2">Print</font></a></td>
								</tr>
						</table> 
					</td>
				</tr>   
				</table>
				
				<table border=0 width="892" style="border-color: skyblue; border-collapse: collapse">
				<tr>
				<td valign="top" align="left" width="1092">
				<div  id="stuname_div" style="position: absolute; border: 1;left:10px; top:140px; width:0; height:140;list-style:none;">
				<select id="studname" class="select2" name="studname" multiple="multiple" style="border: 0em; "><option value="0"></option> </select>
				</div>
				</td>
				</tr>
				</table>      
				
<% 	con=null;
	} catch (Exception e) {
		out.println(e);
		 response.sendRedirect("satsetting.jsp");
	}
%> 
		<input type="hidden" id="sbatch" name="sbatch" value="<%=condvalue%>">
		<input type="hidden" id="flag" name="flag" value="0">
	    <input type="hidden" id="cmd" name="cmd" value="0"> 
	    <input type="hidden" id="flag" name="flag" value="0">
</div>
</center>
</form>

 
</body>

</html>