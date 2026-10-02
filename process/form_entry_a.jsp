<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%><html>
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
	 document.location.href="./form_entry.jsp?flagtype="+a;
}
function ps()
{
	 document.getElementById("but").focus();
}
</script>
</head>
<body onload="ps()">
<br>
<br><br><br><br><br> 
 <table width="75%" align="center"  cellpadding="5" cellspacing="0" border="1" style="border-collapse: collapse;">
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
			sb_code = obj.isNull((String) session.getAttribute("subject_code"), 1);
			source = "D";		
		} else if (entrytype.equalsIgnoreCase("4")) {
			source = "C";
			sb_code = obj.isNull((String) session.getAttribute("subject_code"), 1);
		} else if (entrytype.equalsIgnoreCase("5")) {
			sb_code = obj.isNull((String) session.getAttribute("subject_code"), 1);
			source = "O";
		} else if (entrytype.equalsIgnoreCase("6")) {
			sb_code = obj.isNull((String) session.getAttribute("subject_code"), 1);
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

		java.util.Date sysDate = new java.util.Date(System
				.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("d/M/yyyy");
		SimpleDateFormat sdfM = new SimpleDateFormat("hh:mm:ss aa");
		String date_ = sdf.format(sysDate);
		//Date date1=new SimpleDateFormat("dd/MM/yyyy").parse(date_);
		//SimpleDateFormat dmyFormat = new SimpleDateFormat("yyyy-MM-dd");
	//	date_ = dmyFormat.format(date1);
		out.println(date_);
		String no1 = obj.setValue("no1", request).toUpperCase();
	//	String no2 = obj.setValue("no2", request).toUpperCase();
		String name1 = obj.setValue("name", request).toUpperCase();
		String name2 = obj.setValue("name2", request).toUpperCase();
		String sex = obj.setValue("sex", request).toUpperCase();
		String mobilenobelong = obj.setValue("mobilebelong", request).toUpperCase();
		String day = obj.setValue("day", request).toUpperCase();
		String month = obj.setValue("month", request); 
		String year = obj.setValue("year", request);
		String monincome = obj.setValue("monincome", request);
		String class_s = obj.setValue("class_s", request).toUpperCase();
		String fname0 = obj.setValue("fname0", request).toUpperCase();
		String fname1 = obj.setValue("fname1", request).toUpperCase();
		String foccup = obj.setValue("foccup", request).toUpperCase();
		String addfirst = obj.setValue("addfirst", request).toUpperCase();
		String attend = obj.setValue("attend", request).toUpperCase(); 
		if (addfirst.equalsIgnoreCase("None"))
			addfirst = "";
		String doorno = addfirst + " "+ obj.setValue("doorno", request).toUpperCase() + ",";
		String addr1 = obj.setValue("addr1", request).toUpperCase();
		String addr2 = obj.setValue("addr2", request).toUpperCase();
		String addr3 = obj.setValue("addr3", request).toUpperCase();
		String addr4 = obj.setValue("addr4", request).toUpperCase();
		String pincode = obj.setValue("pincode", request);
		String phone = obj.setValue("phone", request);
		String mobile1 = obj.setValue("mobile1", request);
		String mobile2 = obj.setValue("mobile2", request);
		String Religion = obj.setValue("Religion", request).toUpperCase();
		String Community = obj.setValue("Community", request).toUpperCase();
		String S_code = obj.getValue("SubjectCode", "SubjectCode","where SubjectName='" + sb_code + "' and  Medium='"+ sel_med + "'");
out.println("sb"+sb_code);
out.println("med_sh"+med_sh);
out.println("sc_code"+sc_code);
		int maxseqno=obj.getSSMMaxSeq(sb_code, med_sh, sc_code);
out.println(no1);
out.println(no1);
		out.println(maxseqno);
		String no =obj.getSSMMax(no1,maxseqno); 
		 
		Calendar cal = Calendar.getInstance();
		int cy = cal.get(Calendar.YEAR);
		int age = cy - Integer.parseInt(year);
		int count = obj.getCount("QAData", " where htno='" + no + "'");
		out.println(count);
		out.println(no);
		int sub_max = obj.getMax("QAData", "slno", " where subject='"+ sb_code + "'");
		int r = 0;
		
		if (count == 0) 
		{ 
			String qry = "insert into QAData (htno,name,qual,qualtype,sex,age,fname,occ,add1,add2,area,city,pincode,landline, mobile1,mobile2,religion,community,school,subject,medium,dob,etime,NickName,EntryDate,doorno,source,slno,satalready,monincome,mobilenobelong,ssmseqno,scode)";
			qry += "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'"
					+ source
					+ "',"
					+ sub_max
					+ ",'"
					+ attend
					+ "',"
					+ monincome + ",'"+mobilenobelong+"',"+maxseqno+",'"+sc_code+"')";//22
					System.out.println(qry);
					String db = day + "-" + month + "-" +year;
			PreparedStatement ps = con.prepareStatement(qry);
			ps.setString(1, no);
			ps.setString(2, name1 + " ." + name2);
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
			ps.setString(3, qual);
			ps.setString(4, qualtype);
			ps.setString(5, sex);
			ps.setString(6, Integer.toString(age));
			ps.setString(7, fname0 + "." + fname1);
			ps.setString(8, foccup);
			ps.setString(9, addr1);
			ps.setString(10, addr2);
			ps.setString(11, addr3);
			ps.setString(12, addr4);
			ps.setString(13, pincode);
			ps.setString(14, phone);
			ps.setString(15, mobile1);
			ps.setString(16, mobile2);
			ps.setString(17, Religion);
			ps.setString(18, Community);
			ps.setString(19, sc_code + " - " + sc);
			ps.setString(20, sb_code);
			ps.setString(21, med_sh);
			ps.setString(22, db);
			ps.setString(23, sbt2);
			ps.setString(24, ent_uname);
			ps.setString(25, date_);
			ps.setString(26, doorno);
			ps.executeUpdate();
			int count2 = obj.getCount("QAData", " where htno='" +no+"'");
			System.out.println("count2 : " + count2);
			if (count2 == 0)
			{
				try 
				{
					row = 0;
					row = ps.executeUpdate();
					int resf = 0;
					int oldstudcount = obj.getCount("stud"," where name='" + name1 + "'");
					if (oldstudcount == 0)
					{
						Hashtable ht = new Hashtable();
						ht.put("name", "'" + name1 + "'");
						ht.put("htno", "0");
						//resf=obj.recordSave(ht,"stud",con);   	
					}
					int oldfathercount = obj.getCount("father"," where fname='" + fname0 + "'");
					if (oldfathercount == 0)
					{
						int fmax = obj.getMax("father", "sno", "");
						Hashtable ht = new Hashtable();
						ht.put("fname", "'" + fname0 + "'");
						ht.put("sno", fmax);
						//	resf=obj.recordSave(ht,"father",con);   	
					}
					int oldstreetcount = obj.getCount("street"," where street='" + addr1 + "'");
					if (oldstreetcount == 0)
					{
						Hashtable ht = new Hashtable();
						ht.put("street", "'" + addr1 + "'");
						//resf=obj.recordSave(ht,"street",con);   	
					}
					int oldnagarcount = obj.getCount("nagar"," where sname='" + addr2 + "'");
					if (oldnagarcount == 0)
					{
						Hashtable ht = new Hashtable();
						ht.put("sname", "'" + addr2 + "'");
						//resf=obj.recordSave(ht,"nagar",con);   	
					}
				} catch (Exception e)
				{
				}
			} else {
				row = 1; 
			}
			int crow = Integer.parseInt(obj.setValue("crow", request));

			for (int i = 1; i <= crow; i++) 
			{
				qry = "insert into QARelation ( htno,name,rname,rqual,rqualtype,rsex,rage,fname,occ,add1,add2,area,city,pincode,landline, mobile1,mobile2,religion,community,source,doorno,edate,etime ) ";
				qry += "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'"
						+ source+"','"+doorno+"','"+date_+ "','"+ sbt2 + "')";
				ps = con.prepareStatement(qry);

				ps.setString(1, no);
				ps.setString(2, name1 + " ." + name2);
				String ssname = obj.isNull(request.getParameter("ssname" + i), 3).toUpperCase().trim();
				
				if (ssname.length() > 0)
				{
					String ssage = obj.setValue("ssage" + i, request).toUpperCase();
					String sssex = obj.setValue("sssex" + i, request).toUpperCase();
					String ssscholl = "";
					String ssqtype = obj.setValue("ssqtype" + i,request).toUpperCase();
					ssscholl = obj.getValue("Qualification","qualtype", "where qual='" + ssqtype + "'");
					ps.setString(3, ssname + " ." + name2);
					ps.setString(4, ssqtype);
					ps.setString(5, ssscholl);
					ps.setString(6, sssex);
					ps.setString(7, ssage);
					ps.setString(8, fname0 + "." + fname1);
					ps.setString(9, foccup);
					ps.setString(10, addr1);
					ps.setString(11, addr2);
					ps.setString(12, addr3);
					ps.setString(13, addr4);
					ps.setString(14, pincode);
					ps.setString(15, phone);
					ps.setString(16, mobile1);
					ps.setString(17, mobile2);
					ps.setString(18, Religion);
					ps.setString(19, Community);
				 
					try {

						if (r == 0) 
						{
							row = ps.executeUpdate();
						}

					} catch (Exception e) {
						System.out.println(e);
					}

				}
			}

			
			if (entrytype.equalsIgnoreCase("3")
					|| entrytype.equalsIgnoreCase("4")
					|| entrytype.equalsIgnoreCase("5")
					|| entrytype.equalsIgnoreCase("6"))
			{
				Hashtable ht = new Hashtable();
				int direct_sno = obj.getMax("direct", "sno", "");
				String Staff = obj.setValue("Staff", request, 3);
				String BatchTime = obj.setValue("BatchTime", request);
				String idate = obj.setValue("idate", request, 3);
				String remarks = obj.setValue("remarks", request);
				String CourseName = obj.setValue("CourseName", request);
				String htno = no;
				String cond = " where htno='" + htno + "'";
				name1 = obj.getValue("QAData", "name", cond).toUpperCase();
				name2 = obj.getValue("QAData", "fname", cond).toUpperCase();
				phone = obj.getValue("QAData", "landline", cond).toUpperCase();
				mobile1 = obj.getValue("QAData", "mobile1", cond).toUpperCase();
				mobile2 = obj.getValue("QAData", "mobile2", cond).toUpperCase();
				ht.put("sno", direct_sno);
				ht.put("name", "'" + name1 + "'");
				ht.put("htno", "'" + htno + "'");
				ht.put("fname", "'" + name2 + "'");
				ht.put("mobile1", "'" + mobile1 + "'");
				ht.put("mobile2", "'" + mobile2 + "'");
				ht.put("landline", "'" + phone + "'");
				ht.put("staff", "'" + Staff + "'");
				ht.put("course", "'" + CourseName + "'");
				ht.put("dateofissue", "'" + idate + "'");
				ht.put("timealloted", "'" + BatchTime + "'");
				ht.put("remarks", "'" + remarks + "'");
				int row_direct = obj.recordSave(ht, "direct", con);
			}
	%>
	<tr>
	  	<Td class="tdText" align="center"><font size=4> Entry Status </font> </Td> 
	</tr>
	<%
		out.println("r value "+ r);
		if (row != 0)
			{
					if (entrytype.equalsIgnoreCase("4") || entrytype.equalsIgnoreCase("3")) 
					{
					response.sendRedirect("./success.jsp?no="+no+"&row=" + row+ "&flagtype=" + entrytype + "&file="+ "./direct_entry.jsp?flagtype=" + entrytype);
					}else {
					response.sendRedirect("./success.jsp?no="+no+"&row=" + row+ "&flagtype=" + entrytype + "&file="+ "./form_entry.jsp?flagtype=" + entrytype);
					}
			} else {
	%>
	<tr bgcolor='red'>
		<Td class="tdText" align="center"><b>Not</b> Successfully Stored&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" id="but" onclick="ps(<%=entrytype%>)" value="Press Enter" onclick="ps1()" class="fb2">
		</Td>
	</tr>
	<%
		}
	} 
	else 
	{
	%>
	<tr bgcolor='red'>
		 <Td bgcolor='red'> <img src='../image/err1.jpg'> 
		 <font color='white'>Sorry Information Not Stored ,<a href="./form_entry.jsp">Click </a>
		 	<img src='../image/err2.gif'>
		 </font>
		 </Td>
	 </tr>
	 <%
		}
	 %>
	</table>
	<%
		con.close();
		} catch (Exception e) {
			out.println(e);
		}
	%>
</body>
</html>