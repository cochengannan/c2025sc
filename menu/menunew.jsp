<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="csc.*"%>
<%@page import="java.util.*,java.sql.*"%>
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	 
</head>
<body >  
 <%
 String uname="";
 String cname="";
 try {  
		Controller obj2 = new Controller();
		HttpSession session2 = request.getSession(true);
		uname= obj2.isNull((String) session2.getAttribute("uname"),1);
		Connection con=obj2.con();
		obj2.createStatement(con);
		
		if (uname.equals("0")   )
 		{
 			response.sendRedirect("./logout.jsp");
 		}
		cname=obj2.getValue("clist","cname","");  
		con.close();
 }catch(Exception e)
 {
	 
	 System.out.println("e"+e);
 }  
 %>
<ul id="css3menu1" style="width: 99%;" >   
	<li  class="topmenu"><a href="./home.jsp" style=" height:16px;line-height:16px;"><b><%=cname%></b></a></li>
	&nbsp;
	<li class="topmenu"><a href="#" style="height:16px;line-height:16px;"><b>Master</b></a>
	<ul>    
				 		 		 <li><a href="./process/satsetting.jsp" ><b>Month Setting</b></a></li>
				 		 		 <li><a href="./master/school.jsp"><b>School</b></a></li>
								<li class="mid"><a href="./master/subject.jsp" ><b>Subject</b></a></li>
								<li><a href="./master/schoolset.jsp"><b>Subject Set</b></a></li> 
								<li><a href="#nogo21"><b>Standard</b></a></li>
								<li><a href="./master/occupation.jsp"><b>Occupation</b></a></li>
								<li><a href="./master/qualification.jsp"><b>Qualification</b></a></li>
								<li><a href="./master/street.jsp"><b>Street</b></a></li>
								<li><a href="./master/place.jsp"><b>Place</b></a></li>
								<li><a href="./master/area.jsp"><b>Area</b></a></li>   
								<li><a href="./master/time.jsp"><b>Exam Time</b></a></li>
								<li><a href="./master/smsmas.jsp"><b>SMS Master</b></a></li>  
				 		</ul></li>
	<li class="topmenu"><a href="#" style="width:60px; height:16px;line-height:16px;" ><b>Q / A</b></a>
	<ul>
		<!--<li><a href="#"><span><b>Plus2  Stage1 </b></span></a>
		<ul>
			<li><a href="./process/entry_set.jsp?flagtype=1&spltype=2"><b>New Entry</b></a></li>
			<li><a href="./process/report_cond.jsp"><b>Edit</b></a></li> 
		</ul></li>
		<li><a href="#"><span><b>S S L C Stage1</b></span></a>
		<ul>
						<li><a href="./process/entry_set.jsp?flagtype=2&spltype=2"><b>New Entry</b></a></li>
						<li><a href="./process/report_cond.jsp"><b>Edit</b></a></li>
		</ul></li>
		
		--><li><a href="#"><span><b>Plus 2</b></span></a>
		<ul>
			<li><a href="./process/entry_set.jsp?flagtype=1&spltype=1"><b>New Entry</b></a></li>
			<li><a href="./process/report_cond.jsp"><b>Edit</b></a></li> 
		</ul></li>
		<li><a href="#"><span><b>S S L C</b></span></a>
		<ul>
						<li><a href="./process/entry_set.jsp?flagtype=2&spltype=1"><b>New Entry</b></a></li>
						<li><a href="./process/report_cond.jsp"><b>Edit</b></a></li>
		</ul></li>
		
		<li><a href="./process/enq_entry.jsp"><b>Enquiry</b></a></li>
			<li><a href="../reports/event_entry.jsp"><b>Event Entry</b></a></li>
		<!-- <li><a href="./process/datatmodification.jsp">Delete</a></li> -->
	</ul></li>
	<li class="topmenu"><a href="#" style="width:80px; height:16px;line-height:16px;"><b>SAT</b></a>
	<ul> 
				<li><a href="./process/direct_entry.jsp?flagtype=3"><b>Direct Entry</b></a></li>
				<li><a href="./process/direct_entry.jsp?flagtype=4"><b>Cscian Entry</b></a></li>
				<li><a href="./process/direct_entry.jsp?flagtype=5"><b>Others</b></a></li>
				<li><a href="./process/direct_entry.jsp?flagtype=6"><b>Paper</b></a></li>
				<li><a href="./process/cre_kidentry_set.jsp?flagtype=4"><b>CRE-KID</b></a></li>	
				<li><a href="./process/satsetting.jsp"><b>SAT SET</b><font color='red'>**</font></a></li>
				<li><a href="./process/reception.jsp"><b>Reception</b></a></li>
				<li><a href="./process/mark_entry.jsp"><b>Mark Entry</b></a></li>
				<li><a href="./process/sch.jsp"><b>Scholarship</b></a></li>
				<li><a href="./process/award_collect.jsp"><b>Batch Process</b></a></li>
				<li><a href="./process/update_data.jsp"><b>Exam Update</b></a></li>
	</ul>
	</li>
		<li class="topmenu"><a href="#" style="height:16px;line-height:16px;"><b>Report</b></a>
		<ul>
					<li><a href="./process/report_set.jsp"><b>Report Setting</b></a></li>
					<li><a href="./process/report_cond.jsp"><b>Common</b></a></li>
						<li><a href="javascript:void()"><b>School Wise - Stage1 </b></a> 
						<ul>
							<li><a href="./reports/schoolwisecount1.jsp?flag=1"><b>Plus Two</b></a></li>
							<li><a href="./reports/schoolwisecount1.jsp?flag=2"><b>Tenth</b></a></li>
						</ul>
					</li>  
					<li><a href="javascript:void()"><b>School Wise -Regular</b></a> 
						<ul>
							<li><a href="./reports/schoolwisecount.jsp?flag=1"><b>Plus Two</b></a></li>
							<li><a href="./reports/schoolwisecount.jsp?flag=2"><b>Tenth</b></a></li>
						</ul>
					</li>
					<li><a href="./reports/record_missing.jsp"><b>Record Missing</b></a></li>
					<li><a href="./reports/schoolmedium2.jsp"><b>School Medium Wise</b></a></li>
					<li><a href="./reports/schoolmedium.jsp"><b>School Medium Wise - 10</b></a></li>
					<li><a href="./reports/schoolmedium1.jsp"><b>School Medium Wise - 12</b></a></li>
					  
					<li><a href="./reports/staffwise.jsp"><b>Staff Wise</b></a></li>
					<li><a href="./reports/excel_report_gen.jsp"><b>Excel Generation</b></a></li> 
					<li><a href="./reports/report_list.jsp"><b>Report List</b></a></li> 
						<li ><a href="#" style="height:16px;line-height:16px;"><b>Misc</b></a>
						<ul>
								<li ><a style="height:5px;line-height:5px;" href="#"><span>Help</span></a>
									<ul>
										<li><a href="./process/instruction.jsp"><b>Basic Hints</b></a></li>
										<li><a href="./db.jsp"><b>Data View</b></a></li>
									</ul>
								</li>     
						</ul> 
		 		</li>
		 		<li><a href="./process/namefind.jsp"><b>Namefind</b></a></li>
	 	</ul>
	 	</li>
		 <li  class="topmenu"><a href="./logout.jsp" id="privacy" style="width:60px; height:16px;line-height:16px;"><b>Logout</b></a></li>
		 <li class="topmenu"><a href="#" style="width:147px;height:16px;line-height:16px;"><font size=1><b><%=uname %></b></font></a></li>
		
	</ul> 
 </body> 
</html>
