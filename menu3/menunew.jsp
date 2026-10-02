<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html dir="ltr">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="menunew_files/css3menu1/style.css" type="text/css" /><style>._css3m{display:none}</style>
	<%@page import="csc.*"%>
<%@page import="java.util.*,java.sql.*"%>
</head>
<body  class="arial12Ash">
<%
 String uname="";
 try {
		Controller obj2 = new Controller();
		HttpSession session2 = request.getSession(true);
		uname= obj2.isNull((String) session2.getAttribute("uname"),1);
		if (uname.equals("0")   )
 		{
 			response.sendRedirect("../logout.jsp");
 		}
 }catch(Exception e)
 {
	 
	 System.out.println("e"+e);
 }
 %>
<ul id="css3menu1" class="topmenu">
	<li class="topmenu"><a href="./home.jsp" style="width:60px; height:16px;line-height:16px;">Home</a></li>
	<li class="topmenu"><a href="#" style="height:16px;line-height:16px;">Master</a>
	<ul>
				 		 		 <li><a href="./process/satsetting.jsp" >Month Setting &nbsp;&nbsp;     </a></li>
				 		 		 <li><a href="./master/school.jsp"  >School</a></li>
								<li class="mid"><a href="./master/subject.jsp" >Subject</a></li>
								<li><a href="./master/schoolset.jsp">Subject Set</a></li>				 
								<li><a href="#nogo20"  >Time</a></li>
								<li><a href="#nogo21"  >Standard</a></li>
								<li><a href="./master/occupation.jsp"  >Occupation</a></li>
								<li><a href="./master/qualification.jsp"  >Qualification</a></li>
								<li><a href="./master/street.jsp"  >Street</a></li>
								<li><a href="./master/place.jsp"  >Place</a></li>
								<li><a href="./master/area.jsp"  >Area</a></li>   
								<li><a href="./master/time.jsp"  >Exam Time</a></li>  
				 		</ul></li>
 
	<li class="toproot"><a href="#" style="height:16px;line-height:16px;"><span>Q / A</span></a>
	<ul>
		<li><a href="#"><span>Plus 2</span></a>
		<ul>
			<li><a href="./process/entry_set.jsp?flagtype=1">New Entry</a></li>
			<li><a href="./process/report_cond.jsp">Edit</a></li> 
		</ul></li>
		<li><a href="#"><span>S S L C</span></a>
		<ul>
						<li><a href="./process/entry_set.jsp?flagtype=2">New Entry</a></li>
							<li><a href="./process/report_cond.jsp">Edit</a></li>
		</ul></li>
		<li><a href="./process/datatmodification.jsp">Delete</a></li>
	</ul></li>
	<li class="topmenu"><a href="#" style="height:16px;line-height:16px;">SAT</a>
	<ul>
				<li><a href="./process/form_entry.jsp?flagtype=3">Direct Entry</a></li>
				<li><a href="./process/form_entry.jsp?flagtype=4">Cscian Entry</a></li>
				<li><a href="./process/form_entry.jsp?flagtype=5">Others</a></li>
				<li><a href="./process/form_entry.jsp?flagtype=6">Paper</a></li>
				<li><a href="./process/cre_kidentry_set.jsp?flagtype=4">CRE-KID</a></li>	
				<li><a href="./process/satsetting.jsp">SAT SET<font color='red'>**</font></a></li>
				<li><a href="./process/reception.jsp">Reception</a></li>
				<li><a href="./process/mark_entry.jsp">Mark Entry</a></li>
				<li><a href="./process/sch.jsp">Scholarship</a></li>
				<li><a href="./process/update_data.jsp">Exam Update</a></li>
	</ul>
	</li>
		<li class="topmenu"><a href="#" style="height:16px;line-height:16px;">Report</a>
		<ul>
				<li><a href="./process/report_cond.jsp">Common</a></li>
				<li><a href="javascript:void()">School Wise</a> 
						<ul>
							<li><a href="./reports/schoolwisecount.jsp?flag=1">Plus Two</a></li>
							<li><a href="./reports/schoolwisecount.jsp?flag=2">Tenth</a></li>
						</ul>
					
				</li>  
				<li><a href="#" style="height:16px;line-height:16px;">Misc</a>
				<ul>
				<li><a href="javascript:void()">Help</a>
						<ul>
							<li><a href="./process/instruction.jsp">Basic Hints</a></li>
							<li><a href="./db.jsp">Data View</a></li>
						</ul>
					
				</li>  
		</ul>
		</li>
		</ul>
		</li>
		<li class="topmenu"><a href="./logout.jsp" style="width:60px; height:16px;line-height:16px;">Logout</a></li>
		<li class="topmenu"><a href="#" style="width:147px;height:16px;line-height:16px;"><%=uname %></a></li>
</ul>  

</body>
</html>
