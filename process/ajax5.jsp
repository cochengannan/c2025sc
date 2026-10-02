<%@ page language="java" errorPage="../errorpage.jsp"
	import="csc.*,java.sql.*,java.io.*,java.text.*,java.util.Date,java.util.Calendar,java.lang.System,java.util.*"%>
<%
String htno = "", sc = "", sb = "", sbcode = "", sc_code = "", med = "", sb_code = "", class_ = "";
String name1 = "", sexd = "", name2 = "", addr1 = "", type = "";
String addr2 = "", addr3 = "", addr4 = "", pincode = "", phone = "", mobile1 = "";
String mobile2 = "", Religiond = "", Communityd = "", occ = "", doorno = "";
String satyear = (String) session.getAttribute("satyear");
String satype = (String) session.getAttribute("sattype");
response.setContentType("text/xml");
response.setHeader("Cache-Control", "no-cache");
Connection con = null;
Controller obj = new Controller();
con = obj.con();
String process = "0";
String value_return = "";
obj.createStatement(con);
try {
	String ent_uname = obj.isNull((String) session.getAttribute("uname"), 1);
	process = obj.setValue("process", request);
	System.out.println("Process --->" + process);
	if (process.equalsIgnoreCase("12")) {
		String btc = obj.setValue("btc", request);
		String sno = obj.setValue("sno", request);
		int c = obj.getCount("Reception",
		" where Bname='" + btc + "' and SeatNo=" + sno + " and  satyear=" + satyear + " and sattype=" + satype);
		value_return = "" + c;
		htno = obj.getValue("Reception", "htno",
		" where Bname='" + btc + "' and SeatNo=" + sno + " and  satyear=" + satyear + " and sattype=" + satype);

		if (!htno.equalsIgnoreCase("0")) {
	String cond = " where htno='" + htno + "'";
	int count = obj.getCount("QAData", cond);
	value_return = "" + count; // 0
	name1 = obj.getValue("QAData", "name", cond).toUpperCase();
	value_return += "|" + name1; //1

	name2 = obj.getValue("QAData", "fname", cond).toUpperCase();
	value_return += "|" + name2;//2

	sexd = obj.getValue("QAData", "sex", cond).toUpperCase();
	value_return += "|" + sexd;//3

	sc = obj.getValue("QAData", "school", cond).toUpperCase();
	value_return += "|" + sc;//4

	type = obj.getValue("QAData", "source", cond).toUpperCase();
	value_return += "|" + type;//5

	addr1 = obj.getValue("QAData", "add1", cond).toUpperCase();
	value_return += "|" + addr1;//6

	addr2 = obj.getValue("QAData", "add2", cond).toUpperCase();
	value_return += "|" + addr2;//7

	addr3 = obj.getValue("QAData", "area", cond).toUpperCase();
	value_return += "|" + addr3;//8

	addr4 = obj.getValue("QAData", "city", cond).toUpperCase();
	value_return += "|" + addr4;//9

	pincode = obj.getValue("QAData", "pincode", cond).toUpperCase();
	value_return += "|" + pincode;//10

	phone = obj.getValue("QAData", "landline", cond).toUpperCase();
	value_return += "|" + phone;//11

	mobile1 = obj.getValue("QAData", "mobile1", cond).toUpperCase();
	value_return += "|" + mobile1;//12

	mobile2 = obj.getValue("QAData", "mobile2", cond).toUpperCase();
	value_return += "|" + mobile2;//13

	Religiond = obj.getValue("QAData", "religion", cond).toUpperCase();
	value_return += "|" + Religiond;//14

	Communityd = obj.getValue("QAData", "community", cond).toUpperCase();
	value_return += "|" + Communityd;//15

	occ = obj.getValue("QAData", "occ", cond).toUpperCase();
	value_return += "|" + occ;//16

	doorno = obj.getValue("QAData", "doorno", cond).toUpperCase();
	value_return += "|" + doorno;//17

	class_ = obj.getValue("QAData", "qual", cond).toUpperCase();
	value_return += "|" + class_ + "|" + count + "|" + htno;//18
		} else {
	value_return = "text|" + c;
		}
		System.out.println(value_return);
	} else if (process.equalsIgnoreCase("15")) {

		htno = obj.setValue("no", request);

		String cond = " where htno='" + htno + "'";
		int count = obj.getCount("QA_Data_SMS", cond);
		name1 = obj.getValue("QA_Data_SMS", "sname", cond).toUpperCase();
		value_return += "" + name1; //1
		phone = obj.getValue("QA_Data_SMS", "phone1", cond).toUpperCase();
		value_return += "|" + phone;//11

		mobile1 = obj.getValue("QA_Data_SMS", "phone2", cond).toUpperCase();
		value_return += "|" + mobile1;//12

		mobile2 = obj.getValue("QA_Data_SMS", "phone3", cond).toUpperCase();
		value_return += "|" + mobile2;//13

		value_return += "|" + count;//13

		System.out.println(value_return);
	} else if (process.equalsIgnoreCase("55")) {
		
		java.util.Date sysDate = new java.util.Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("d/M/yyyy");
		SimpleDateFormat sdfM = new SimpleDateFormat("hh:mm:ss aa");
		String date_ = sdf.format(sysDate);
		String cmt = obj.setValue("cmt", request);
		htno = obj.setValue("htno", request).toUpperCase();
		int bcount2 = obj.getCount("StudentFollowup", " where htno='" +htno+"'");
		int sqno = obj.getMax("StudentFollowup", "seqno"," where htno='" +htno+"'");
		String source= obj.setValue("source", request);
		String res=obj.setValue("res", request);
		int sub_max = obj.getMax("StudentFollowup", "fid", " ");
		
		String qry = "insert into StudentFollowup values (?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(qry);
		ps.setInt(1, sub_max);
		ps.setString(2, htno);
		ps.setString(3, cmt);
		ps.setString(4, ent_uname);
		ps.setString(5, date_);
		ps.setString(6, date_);
		ps.setInt(7, sqno);
		ps.setString(8, source);
		ps.setString(9, res);
		ps.executeUpdate();
		int acount2 = obj.getCount("StudentFollowup", " where htno='" +htno+"'");
		value_return += "|" + bcount2+"|"+acount2 ;//13
		System.out.println(value_return);
	}
	con.close();
} catch (Exception e) {
	e.printStackTrace();
	con.close();
}
response.getWriter().write(value_return);
%>