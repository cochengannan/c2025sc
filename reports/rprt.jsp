<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="csc.*"%>
<%@page import="java.util.*,java.sql.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<head>
<script type="text/javascript">
document.onkeydown = function (event){
    var s=event.srcElement ||   event.target;
    var sn=s.tagName.toUpperCase();
    if (sn=="HTML")
        return false;
    else
        return true;  
};
</script>
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/tooltip.css" />  
<link rel="stylesheet" type="text/css" href="../css/csccss.css" />
</head>
<body   >
<form>  
<%
ResultSet rs=null,rs_ct=null;
String School = "", SubjectCode = "", Medium = "",Setting="",etime="";
String flagtype="";
Controller obj=null;
String entrytype="";
Connection con=null;	String sch_name = "";  
String sc="";
try {

	  obj = new Controller();
	  con = obj.con();
	  sc = obj.setValue("School", request);
	String mdv ="";
	String sub = obj.setValue("SubjectCode", request);

	try  

	{
		sch_name = obj.getValue("School", "schoolname"," where  schoolcode='" + sc + "'");
	} catch (Exception e) {

	}

} catch (Exception e) {
	out.println(e);
}
%><%@ include file="../commdiv.jsp"%> 
	<div id="menudiv"><ul id="css3menu1" style="width: 100%" >
				<li><a href='../home.jsp'>Home</a></li>
				<li><a href="../logout.jsp">Logout</a></li>
			</ul>
	 </div>
	
    <div id="cdiv"> 
 	 			<div id="div31"><br /><br />
					<a href="../process/report_set.jsp">Settings</a>
				</div>
				<div id="div31"><br /><br />
					<a href="../process/report_cond.jsp">Common</a>
				</div>
				
				<div id="div31"><br /><br />
					<a href="../reports/schoolwisecount.jsp?flag=1">Plus Two</a>
				 </div>
				 
				 
				 <div id="div31"><br /><br />
					<a href="../reports/schoolwisecount.jsp?flag=2">Tenth</a>
				 </div>
				 
				 
				 	<div id="div31"><br /><br />
				 		<a href="../reports/staffwise.jsp"">Staff Wise</a>
				 	</div>
				 		
					<div id="div31"><br /><br /><a href="../reports/excel_report_gen.jsp"">Excel Generation</a>
						</div>
					 
					<div id="div31"><br /><br /><a href="../reports/report_list.jsp"">Report List</a>
					</div> 
	 
 
 </div>
 </form>
 
</body>
</html>
 