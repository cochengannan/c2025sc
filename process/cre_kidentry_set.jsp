<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="csc.*"%>
<%@page import="java.util.*,java.sql.*"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<script type="text/javascript">
	function subject_load() {
		var sc = document.getElementById("School").value;
	 
		window.location.href = "entry_set.jsp";
		document.setting.submit();
	}
		function Sett_() 
		{
		var sc = document.getElementById("School").value;
		 
				//  var medium = document.getElementById("medium").value;
				 
				var SubjectCode = document.getElementById("SubjectCode").value;
				 
				if (sc !=0  && SubjectCode!=0) 
				{
				window.location.href = "entry_set.jsp";
				document.setting.submit();
				}
				else
				{
					alert("Please Select All Values .....");  
					return false;
				} 
		}  
</script>
</head>
<%@ include file="../commdiv.jsp"%> 
<body onload="javascript:document.getElementById('School').focus();">
	<div id="menudiv">
			<ul id="css3menu1" style="width: 100%" >
				<li><a href='../home.jsp'>Home</a></li>
				<li><a href='javascript:window.history.go(-1)'>Back</a></li>
				<li><a href="../logout.jsp">Logout</a></li>
			</ul>
	</div>
<div id="cdiv">
<form name="setting"   method="post">
 
<%
	String School = "", SubjectCode = "", Medium = "",Setting="",etime="";
	Controller obj;
	try {

		  obj = new Controller();
		Connection con = obj.con();
		String sc = obj.setValue("School", request);
		String mdv ="";
		
		  Setting= obj.setValue("b1", request);
		 
		//  School = obj.combo_box("School", "select * from School",  "schoolname", "schoolcode", "", "");
		// public String combo_box(String id,  String userquery,	String text,String value
		//	 ,int set,String default_select, String defaultvalue,String fun)
		String entrytype=obj.setValue("flagtype",request);  	
		String flagtype="";
		String flag = entrytype;
		if (flag.equalsIgnoreCase("1")) 
			flagtype="XII";
		else if (flag.equalsIgnoreCase("2")) 
			flagtype="X";
		else
			flagtype="";
		
		String medcond = (mdv.equalsIgnoreCase("0")) ? ""  
				: " where Medium='" + mdv + "' and SubjectCode in (select SubjectCode from subjectset where schoolcode='"+sc+"' ) and class='"+flagtype+"'";

  
		String[] md = { "Select", "TAMIL", "ENGLISH" };
		Medium = "<select id='medium' name='medium' class='select2'>";
		for (int i = 0; i < md.length; i++) {
			if (mdv.equals(md[i])) {
				Medium += "<option value='" + md[i] + "' selected>"  
						+ md[i] + "</option>";
			} else {
				Medium += "<option value='" + md[i] + "' >" + md[i]
						+ "</option>";
			}
		}  
		Medium += "</select>";
		
		School = obj.combo_box("School", "select * from School",
				"schoolname", "schoolcode", 1, sc, "schoolcode",
				"class='select2' onKeyDown=key_pass(event,'School','medium')  onchange='subject_load()'");  
		
		con.close();
   
 
	

	if (Setting.equalsIgnoreCase("Setting"))
	{   
		  session=request.getSession(true);
		  session.setMaxInactiveInterval(36000); 
		String scvalue=obj.getValue("School","schoolname","where schoolcode='"+sc+"'");
		 
		session.setAttribute("flagtype",flag);
		session.setAttribute("school_name",scvalue);
		session.setAttribute("school_code",sc);
		session.setAttribute("med",mdv);
		
		    
		 
	 	 response.sendRedirect("cre-kid.jsp?flagtype="+entrytype);
		 
		 
	}
	 
	
	} catch (Exception e) {
		out.println(e);
	}
%>
 
<table border="1" align="center" background="./draw.jpg" cellpadding="0" cellspacing="0" style="height: 502px;vertical-align: top;" class="newtab"  width="872" >
	<tr>
		<td colspan="2" valign="middle">
				<table align="center" border=1 width="500" cellpadding="10"   
					cellspacing="0"  >
					<tr>
						<td colspan="2" align="center"><font color="black" size="3"><b>Entry Type Setting</b></font> </td>
					</tr>
					<tr>
						<td><font color="black">School Name</font></td>
						<Td><%=School%></td>
					</tr>
					 
 					
					<tr>
		<td colspan="2" align="center"><input type="submit" class="fb1" name="b1" value="Setting" onclick="return Sett_()"  >  </td>
	</tr>
				</table>
		</td>
	</tr>
</table> 
  </form>
  
   </div>
</body>
</html>