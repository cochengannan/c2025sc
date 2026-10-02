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
<link rel="stylesheet" type="text/css" href="./css/txtbox.css" />
<link rel="stylesheet" href="./menu/menunew_files/css3menu1/style.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="./css/tooltip.css" />  
<link rel="stylesheet" type="text/css" href="./css/csccss.css" />
</head>
	<%@ include file="./commdiv1.jsp"%>
<body>
	<form>  
		 <div id="menudiv"><ul id="css3menu1" style="width: 100%" >
						<li><a href="./home.jsp">Home</a></li>
					</ul>
		</div>  
		<div id="cdiv"> 
		 	
					<div id="div5"><br /><br /><a href="./process/satsetting.jsp" >MONTH SETTING</a></div>
					<div id="div5"><br /><br /><a href="./master/school.jsp"  >SCHOOL</a></div>
					<div id="div5"><br /><br /><a href="./master/subject.jsp" >SUBJECT</a></div>
					<div id="div5"><br /><br /><a href="./master/schoolset.jsp">SUBJECT SET</a></div>				 
					<div id="div5"><br /><br /><a href="#nogo20"  >TIME</a></div>
					<div id="div5"><br /><br /><a href="#nogo21"  >STANDARD</a></div>
					<div id="div5"><br /><br /><a href="./master/occupation.jsp"  >OCCUPATION</a></div>
					<div id="div5"><br /><br /><a href="./master/qualification.jsp"  >QUALIFICATION</a></div>
					<div id="div5"><br /><br /><a href="./master/street.jsp"  >STREET</a></div>
					<div id="div5"><br /><br /><a href="./master/place.jsp"  >PLACE</a></div>
					<div id="div5"><br /><br /><a href="./master/area.jsp"  >AREA</a></div>   
					<div id="div5"><br /><br /><a href="./master/time.jsp"  >EXAM TIME</a></div>	
					
		 
		</div>
	 </form>
 </body>
</html>