<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<%@page import="java.util.*,java.sql.*"%>
<%@ page language="java" import="csc.*,java.sql.*,java.io.*,java.text.*,java.util.Date,java.util.Calendar,java.lang.System,java.util.*"%>
<head>
<link href="../css/txtbox.css" rel="stylesheet" media="screen" />
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function ps1(a)
{
	 document.location.href="./form_entry_sms.jsp?flagtype="+a;
}
function ps()
{
	 document.getElementById("but").focus();
}
</script>
</head>
<body onload="ps()">
<%
	int row = 0;
	try {

		Controller obj = null;
		obj = new Controller();
		Connection con = obj.con();
		obj.createStatement(con);
		String sc = "", sb = "", sc_code = "", sb_code = "", sel_med = "";
		String entrytype = obj.setValue("entrytype", request);
		String source = "";
		if (entrytype.equalsIgnoreCase("1")
				|| entrytype.equalsIgnoreCase("2")) 
			{
			sc = obj.isNull((String) session.getAttribute("school_name"), 1);
			sb = obj.isNull((String) session.getAttribute("subject_name"), 1);
			sc_code = obj.isNull((String) session.getAttribute("school_code"), 1);
			sb_code = obj.isNull((String) session.getAttribute("subject_code"), 1);
			sel_med = obj.isNull((String) session.getAttribute("med"),1);
			source = "Q";
		} else if (entrytype.equalsIgnoreCase("3")) {
			source = "D";

		} else if (entrytype.equalsIgnoreCase("4")) {
			source = "C";

		} else if (entrytype.equalsIgnoreCase("5")) {
			source = "O";

		} else if (entrytype.equalsIgnoreCase("6")) {
			source = "Z";

		}

		String ent_uname = obj.isNull((String) session.getAttribute("uname"), 1);
		String sbt2 = obj.isNull((String) session.getAttribute("time"),1);
		String uname = obj.isNull((String) session.getAttribute("uname"), 1);
		String med_sh = "";
		if (sel_med.equalsIgnoreCase("ENGLISH")) {
			med_sh = "E";
		} else {
			med_sh = "T";     
		}

		java.util.Date sysDate = new java.util.Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("d/M/yyyy");
		SimpleDateFormat sdfM = new SimpleDateFormat("hh:mm:ss aa");
		String date_ = sdf.format(sysDate);
		String class_s = obj.setValue("class_s", request).toUpperCase();
		String fname0 = obj.setValue("fname0", request).toUpperCase();
		String fname1 = obj.setValue("fname1", request).toUpperCase();
		String no1 = obj.setValue("no1", request).toUpperCase();
		String no2 = obj.setValue("no2", request).toUpperCase();
		String name1 = obj.setValue("name", request).toUpperCase();
		String name2 = obj.setValue("name2", request).toUpperCase();
		String pincode = obj.setValue("pincode", request);
		String phone = obj.setValue("phone", request);
		String mobile1 = obj.setValue("mobile1", request);
		String mobile2 = obj.setValue("mobile2", request);
		
		if (entrytype.equalsIgnoreCase("1")
				|| entrytype.equalsIgnoreCase("2")) 
			{
			sc = obj.isNull((String) session.getAttribute("school_name"), 1);
			sb = obj.isNull((String) session.getAttribute("subject_name"), 1);
			sc_code = obj.isNull((String) session.getAttribute("school_code"), 1);
			sb_code = obj.isNull((String) session.getAttribute("subject_code"), 1);
			sel_med = obj.isNull((String) session.getAttribute("med"),1);
			source = "Q";
		} else if (entrytype.equalsIgnoreCase("3")) {
			source = "D";

		} else if (entrytype.equalsIgnoreCase("4")) {
			source = "C";

		} else if (entrytype.equalsIgnoreCase("5")) {
			source = "O";

		} else if (entrytype.equalsIgnoreCase("6")) {
			source = "Z";

		}
		String qry = "insert into QA_Data_SMS (htno,sname,phone1,phone2,phone3,school,subject,source,qual,NickName,EntryDate) ";
		
		int no_find = Integer.parseInt(no2);
  
		if (no2.length() == 1)
			no2 = "00" + no2;     
		if (no2.length() == 2)
			no2 = "0" + no2;
		String qual = "";
		String qualtype = "";
		if (class_s.equalsIgnoreCase("+2")) 
		{
			qual = "12TH";
		} else if (class_s.equalsIgnoreCase("10"))
		{
			qual = "10TH";
		} else 
		{
			qual = class_s;
		}
		if (class_s.equalsIgnoreCase("+2")) 
		{
			qualtype = "XII";
		} else if (class_s.equalsIgnoreCase("10")) 
		{
			qualtype = "X";
		} else
		{
			qualtype = class_s;
		}  
		qualtype = obj.getValue("Qualification","qualtype", "where qual='"+qual+"'");
		
try
{   
	

		String no = no1 + no2;
	 	Statement st=con.createStatement();
		qry=qry + " values ('"+no+"','"+name1 + " ." + name2+"','"+phone+"','"+mobile1+"','"+mobile2+"','"+sc_code + " - " + sc+"','"+sb_code+"','"+source+"','"+qual+"','"+uname+"','"+date_+"')";
		System.out.println(qual); 
	 	row = st.executeUpdate(qry);
%>
		<table width="75%" align="center"  cellpadding="5" cellspacing="0" border="1" style="border-collapse: collapse;">
	 	<tr>
	  	<Td class="tdText" align="center"><font size=4> Entry Status </font> </Td> 
	</tr>
	<%
		if (row != 0)
			{
				if (entrytype.equalsIgnoreCase("3") || entrytype.equalsIgnoreCase("4"))
				response.sendRedirect("./success.jsp?row=" + row+ "&flagtype=" + entrytype + "&file="+ "./direct_entry.jsp?flagtype=" + entrytype);
				else
				response.sendRedirect("./success.jsp?row=" + row+ "&flagtype=" + entrytype + "&file="+ "./form_entry_sms.jsp?flagtype=" + entrytype);	
				
				
			} else {
	%>
	<tr bgcolor='red'>
		<Td class="tdText" align="center"><b>Not</b> Successfully Stored&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" id="but" onclick="ps(<%=entrytype%>)" value="Press Enter" onclick="ps1()" class="fb2">
		</Td>
	</tr>
	<%
		}
	 %>
	  
	</table>
	
<%
}catch(Exception e)
{
	out.println(e);	
} 
		} catch (Exception e) {
			out.println(e);
		}
	%>
</body>
</html>