<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="../errorpage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Phone Follow Up</title>
<style type="text/css">
#apDiv5 {
	position: absolute;
	left: 0px;
	top: 0px;
	width: 75%;
	height: 10%;
}

#apDiv6 {
	position: absolute;
	z-index: 3;
	top: 835px;
	width: 75%;
	left: 120px;
}

#thead {
	position: absolute;
	left: 50px;
	top: 120px;
	width: 75%;
	height: 110px;
	z-index: 3;
}

.box-shadow {
	font-family: cursive, sans-serif;
	padding: 2px;
	border-radius: 4px;
	box-shadow: 2px 2px 20px 23px #7AC5CD;
}

body {
	background-repeat: no-repeat;
	background-size: 1600px 900px;
	background-image: url('../sky2.jpg');
}
</style>
</head>
<%@page import="csc.*"%>
<%@page import="java.util.*,java.sql.*"%>
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css"
	type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />

<script type="text/javascript">
	document.onkeydown = function(event) {
		var s = event.srcElement || event.target;
		var sn = s.tagName.toUpperCase();

		if (sn == "HTML")
			return false;
		else
			return true;
	};

	var ampm = "";
	var cflag = 0;
	var http = createObject();

	function createObject() {
		try {
			var xmlhttp;
			if (window.XMLHttpRequest) {
				xmlhttp = new XMLHttpRequest();
			} else if (window.ActiveXObject) {
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			return xmlhttp;

		} catch (e) {
			alert("XML Object Not Created\n--------------------------")
		}

	}
	function datastorehitory(id) {
		
		var htno = document.getElementById("htno" + id).value;		
		let url = "FollowupHistory.jsp?htno=" + htno;
		let height = 500;
		let width = 1200;
		var left = (screen.width - width) / 2;
		var top = (screen.height - height) / 2;
		var newWindow = window.open(url, "center window",
				'resizable = no, width=' + width + ', height=' + height
						+ ', top=' + top + ', left=' + left);
	}
	function datastore(id) {

		var http = createObject();
		var source = document.getElementById("source").value;
		var res = document.getElementById("res" + id).value;
		
		var cmt = "", htno = "";
		cmt = document.getElementById("cmt" + id).value;
		if(cmt=="")
			{
			 alert ("Please give comments")
			 return ;
			}
		try {
			cmt = document.getElementById("cmt" + id).value;
			htno = document.getElementById("htno" + id).value;

			var url = "../process/ajax5.jsp?cmt=" + cmt + "&htno=" + htno
					+ "&process=55&source="+source+"&res="+res;

			http.open("GET", url, true);
			http.onreadystatechange = function() {
				csc_process_new(http, id);
			}

			http.send(null);

		} catch (e) {
		}
	}
	function csc_process_new(xmlobj, row) {
		try {

			if (xmlobj.readyState == 4) {

				if (xmlobj.status == 200) {
					var setvalue = "";
					results = xmlobj.responseText.split("|");
					var name = new String(results[0]);
					var bct = results[1];
					var act = results[2];

					if (bct < act) {
						alert("Comments stored successful")
						document.getElementById("cmt" + row).value="";
						
					} else {
						alert("Comments not stored successful")

					}
				}

			}

		} catch (e) {
		}
	}
</script>

<%
response.setHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Expires", "0");
response.setDateHeader("Expires", -1);
%>

<body>


	<%
	Connection con = null;
	try {
		Controller obj = new Controller();
		con = obj.con();
		HttpSession session2 = request.getSession(true);
		String schoolValue = obj.setValue("School", request);
		String sub = obj.setValue("subject", request);
		String medvalue = obj.setValue("med", request);
		String std = obj.setValue("Stds", request);
		String areav = obj.setValue("area", request);
		String sourcev = obj.setValue("source", request);
		String uname1 = obj.isNull((String) session2.getAttribute("uname"), 1);
		String class_ = "", Religion = "", Community = "", Qualification = "", School = "", Occupation = "";
		String source = obj.combo_box("source", "select * from CallSource", "source", "source", 0, sourcev, "source","class='select2' ");
		School = obj.combo_box("School", "select * from School", "schoolname", "schoolcode", 0, schoolValue, "schoolcode",
		"class='select2' ");
		String subjectcode = obj.combo_box("subject", "select * from SubjectCode order by sno", "subjectcode",
		"subjectcode", 0, sub, "subjectcode", "class=select2");
		String Medium = obj.combo_box("med", "select  * from Medium ", "Medium", "Medium", 0, medvalue, "Medium",
		"  class='select2'");
		String Std = obj.combo_box("Stds", "select  * from Stds ", "Std", "Std", 0, std, "Std", "  class='select2'");
		String area = obj.combo_box("area", "select * from Area order by Area", "Area", "Area", 0, areav, "Area",
		"class='select2' onKeyDown='area_value(2,event,this)'");
	%>

	<form action="PhoneFollowup.jsp" method="post" name="test"
		style="top: 19x">

		<div>

			<div
				style="position: absolute; top: 0%; left: 137px;; width: 75%; overflow-x: hidden; margin-left: 10px; padding: 13px; background: transparent;">
				<div>
					<ul id="css3menu1" style="width: 100%;">
						<li><a href='../home.jsp'>Home</a></li>
						<li><a href="../logout.jsp">Logout</a></li>
					</ul>
				</div>
				<table align="center" border="0" width="100%" cellspacing="0"
					cellpadding="0"
					style="border-color: red; border-collapse: collapse">
					<tr>
						<td>
							<table width="100%" height="60" align="center" cellpadding="10"
								cellspacing="0" border="1"
								style="border-collapse: collapse; border-color: white">
								<tr>
									<td align="center" colspan="4"><font size='4'>Student Phone Call</font></td>
								</tr>
								<tr>
									<td>Source : &nbsp; &nbsp; <%=source%> </td><td>School : &nbsp; &nbsp; <%=School%>
									</td>
									<td>&nbsp;&nbsp;&nbsp;Standard : &nbsp; <%=Std%></td>
									
								</tr>
								<tr>
									<td>Medium : &nbsp; &nbsp; <%=Medium%> &nbsp; &nbsp;Subject : &nbsp; &nbsp; <%=subjectcode%>&nbsp;
									</td>
									<td>&nbsp;&nbsp;Area : &nbsp; &nbsp; <%=area%></td>
									<td><input type="submit" value="Search"></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>

				<div id='scroll_clipper'
					style='position: relative; vertical-align: top; width: 872; border-height: 1px; height: 450px; overflow: auto; white-space: nowrap;'>
					<div id='scroll_text'>
						<%
						String qry_cond = "  where (1=1)";
						int ct = 0;

						if (!sub.isEmpty() && !sub.equals("0")) {
							ct++;
							qry_cond = qry_cond + " and  subject like ('" + sub + "%')";
						}

						if (!schoolValue.isEmpty() && !schoolValue.equals("0")) {
							ct++;
							qry_cond = qry_cond + " and  school like ('" + schoolValue + "%')";
						}

						if (!medvalue.isEmpty() && !medvalue.equals("0")) {
							ct++;
							qry_cond = qry_cond + " and  medium like ('" + medvalue.substring(0, 1) + "%')";
						}

						if (!std.isEmpty() && !std.equals("0")) {
							ct++;
							qry_cond = qry_cond + " and  qual like ('" + std + "%')";
						}

						if (!areav.isEmpty() && !areav.equals("0")) {
							ct++;
							qry_cond = qry_cond + " and  area like ('" + areav + "%')";
						}

						String table_heading = "<center>Information Sheet  </center>";
						String tab = "cellspacing='0' align=center cellpadding='3' width='100%' style='BORDER-COLLAPSE: collapse' border='1' borderColor='#92c2d8'";

						if (ct != 0) {
							String msg = " <font color='#7D1B7E'>Subject Code:</font>" + sub + " <font color='#7E2217' > Medium : </font>"
							+ Medium;
							String qry = "select htno,name,mobile1+','+'<br>'+mobile2 as mobile1 from QAData    " + qry_cond
							+ "  order by htno,EntryDate";

							String table_column = "htno,name,mobile1";
							String table_header = "HTNO,Stduent Name,Mobile1,Call History,Reasons,Comments,Save";
							String html = obj.genReportWithCtrl(qry, table_header, table_column, tab, table_heading, "htno", 0,
							"form_entry_ed.jsp");
							out.println(html);
						}
						%>

					</div>
				</div>
			</div>
		</div>
		<%
		con.close();
		} catch (SQLException e1) {
		out.println("DataBase Maybe Already use someone else  " + e1);
		} catch (Exception e) {
		con.close();
		out.println(e);

		}
		%>
	</form>


</body>
</html>
