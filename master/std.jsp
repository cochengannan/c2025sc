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
<body >
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
%>
	<%@ include file="../commdiv3.jsp"%> 
	<div id="menudiv"><ul id="css3menu1" style="width: 100%" >
				<li><a href='../home.jsp'>Home</a></li>
				<li><a href='javascript:window.history.go(-1)'>Back</a></li>
				<li> <a href='../master/school.jsp'>School</a></li>
				<li><a href="../logout.jsp">Logout</a></li>
			</ul>
	</div>
	<div id="newdiv" style="color: #012f0f;font-weight: bold"><%=sch_name %></div>
    <div style="position:absolute;top:24%;left:120px;;width:75%;height:290px;overflow: scroll;overflow-x: hidden;margin-left:10px;padding:15px;background:transparent;">
 	 			
				<div id="div31"><br /><br /><a href="../process/entry_set.jsp?flagtype=2&School=<%=sc%>"><b>SSLC</b></a> </div>
				<div id="div31"><br /><br /><a href="../process/entry_set.jsp?flagtype=1&School=<%=sc%>"><b>Plus Two</b></a> </div>
				
				
				 
	 
 
 </div>
 </form>
 
</body>
</html>
 