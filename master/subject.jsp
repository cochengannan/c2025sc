<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"  errorPage="../errorpage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="csc.Controller,java.sql.*"%><html>
<head>
 <title>Welcome To CSC : Subject Master</title>
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<script language="JavaScript" src="../js/csc.js"></script>
<script language="JavaScript" src="../js/cellcreate.js"></script>
<script type="text/javascript">
str();

function up(row)
{
	 
	 
		    
				var sbcode= document.getElementById("sbcode"+row).value;
				var sbname= document.getElementById("sbname"+row).value;
				var sbmed= document.getElementById("sbmed"+row).value;
				var sbsno= document.getElementById("sbsno"+row).value;


				document.getElementById("subname").value=sbcode;
				document.getElementById("subcode").value=sbname;

				var len=document.getElementById("medium").options.length;
			
			 
				var i=0;
				for (i=0;i<len;i++)
				{

					 var optn = document.getElementById("medium").options[i];
					 var value=optn.value;
				   	     	 
          	     	 if (value==sbmed)
          	     	 {
              	     optn.setAttribute("selected","1");
              	     break;
          	     	 }
              	     
				}	
				document.getElementById("processkey").value=sbcode;
				document.getElementById("processsno").value=sbsno;
}
function sub()
{
	 var flag=document.getElementById("flag").value;
		if (parseInt(flag)==0)
		 { 
			 try
			 {  
				 var subname=document.getElementById("subname").value;
				 var subcode=document.getElementById("subcode").value;
				 var class_name=document.getElementById("class").value;
				 var Medium=document.getElementById("Medium").value;
				 var b1=document.getElementById("b1").value;
				 document.location.href="../dbprocess/subject_a.jsp?class_name="+class_name+"&Medium="+Medium+"&b1="+b1+"&subcode="+subcode+"&subname="+subname;
				//  document.my_frm.submit();    
			 }catch(e)
			 {
				 alert(e) ;
				    
			 }
		}else
		{
			 
		}  
}
</script>
</head>
<form action="../dbprocess/subject_a.jsp" method="get" name="my_frm" id="my_frm"  >
<%@ include file="../commdiv3.jsp"%> 
 <center>
<div id="menudiv">
	<ul id="css3menu1" >
		<li><a href='../home.jsp'>Home</a></li>
		<li><a href='javascript:window.history.go(-1)'>Back</a></li>
		<li><a href="../logout.jsp" style="width:60px; height:16px;line-height:16px;">Logout</a></li>
	</ul>
</div>
 
<%
	Controller obj = new Controller();
	Connection con = obj.con();
	PreparedStatement ps = con.prepareStatement("select * from SubjectCode  order by SubjectCode ");
	ResultSet rs = ps.executeQuery();

	String Medium = obj.combo_box("Medium", "select  Medium   from Medium ",
			"Medium", "Medium", 0, "", "Medium", "class='select2' onKeyDown=key_pass(event,'Medium','class')");
	String classmaster = obj.combo_box("class", "select  class   from classmaster ",
			"class", "class", 0, "", "class", "class='select2' onKeyDown=key_pass(event,'class','subcode')");
	HttpSession session2 = request.getSession(true);
	String uname1 = obj.isNull((String) session2.getAttribute("uname"),1);
	if (uname1.equals("0")   )
	{
		con.close();
		response.sendRedirect("../logout.jsp");
	}	
	
%>    

 <div id="cdiv">  
<table bordercolor="skyblue" cellspacing="0" width="872" cellpadding="5"
	align="center" border="1" class="dvfont">
	<tr>
		<td colspan="6" align="center">Subject Master</td>
	</tr>
	<tr id='row_color'>
		<td><font color='black' size='2'><b>Subject Name</b></font></td>   
		<td  ><input type="text" id="subname" name="subname" class="tb11" maxlength="4" onKeyUp="CharOnly('subname',9,event);"  onKeyDown="key_pass(event,'subname','Medium')"></td>
	 	<td><font color='black' size='2'><b>Medium</b></font></td>
		<td><%=Medium%></td>
		<td><%=classmaster%></td>
		<td><font color='black' size='2'><b>Subject Code</b></font></td>
		<td  ><input type="text" id="subcode" name="subcode"  class="tb1" onKeyDown="key_pass(event,'subcode','b1');" onKeyUp="CharOnly('subcode',9,event);"  maxlength="2"/></td>	
	</tr>
	<tr>
	
		<td colspan="6" > 
		<table>  
					<tr>    
				<td>  
				  	<input type="button" value="Submit" name="b1" id="b1"   class="fb1" onclick="sub()">  
					<input type="button" value="Update" name="b1" id="b1"  class="fb1">
					<input type="button" value="Delete" name="b3" id="b3"  class="fb1">
				</td>
			</tr>
			</table>       
			</td>
	</tr>
</table> 
 
 
<table align="center" width="892" border="0">
<tr bgcolor="#c0ccc0"  >
		<td width="20%"><font color='black' size='2'><b>Subject Code</b></font></td>
		<td><font color='black' size='2'><b>Subject Name</b></font></td>
		<td width="30%"><font color='black' size='2'><b>Medium</b></font></td>
	</tr>
	<tr>
		<td colspan="3"  align="center">
		<div id='scroll_clipper' style='position:  relative; vertical-align: top; width: 872; border-height: 1px; height: 370px; overflow: auto; white-space: nowrap;'>
		<table  style="border-collapse: collapse;vertical-align: top;"
			bordercolor="skyblue" cellspacing="0" width="872" cellpadding="3"
			border="1" align="center">
		<%
			int row=0;
			while (rs.next()) 
			{
				row++;
				String sc = rs.getString("SubjectCode");
				String sn = rs.getString("SubjectName");
				String Mediumv = rs.getString("Medium");
				String sno = rs.getString("sno");
		%>
		
			<tr>
				<td width="20%"><a href="javascript:up(<%=row%>)"><font color='black' size='2'><b><%=sc%></b></font></a></td>
				<td><font color='black' size='2'><b><%=sn%></b></font></td>
				<td width="30%"><font color='black' size='2'><b><%=Mediumv%></b></font></td>
				<input type="hidden" id=sbname<%=row%> name=sbname<%=row%> value='<%=sn%>'>
				<input type="hidden" id="sbcode<%=row%>" name="sbcode<%=row%>" value="<%=sc%>">
				<input type="hidden" id="sbmed<%=row%>" name="sbmed<%=row%>" value="<%=Mediumv%>">
				<input type="hidden" id="sbsno<%=row%>" name="sbsno<%=row%>" value="<%=sno%>">
 

				
			</tr>
			
			<%
				}
			%>


  
		</table>
	 
		</div>
		</td>
	</tr>
</table>
</div>
  
 	<input type="hidden" id="processkey" name="processkey" value="0">
	<input type="hidden" id="processsno" name="processsno" value="0>">
 	<input type="hidden" id="flag" name="flag" value="1"> </div></center>
</form>
</body>
</html>