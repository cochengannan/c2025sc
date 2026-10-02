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
<link rel="stylesheet" type="text/css" href="../css/tooltip.css" />  
<link rel="stylesheet" type="text/css" href="../css/csccss.css" />  
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<script language="JavaScript" src="../js/cellcreate.js"></script>
<script language="JavaScript" src="../js/validate.js"></script>
<script language="JavaScript" src="../js/entry_help.js"></script>  
<script language="JavaScript" src="../js/csc.js"></script>
<script language="JavaScript" src="../js/menu1.js"></script>
<script src="../admin/jquery.min.js" type="text/javascript"></script>
<script language="JavaScript" src="../js/rowadd.js"></script>
<script type="text/javascript">
	function subject_load() {
		var sc = document.getElementById("School").value;
		
		window.location.href = "entry_set.jsp";
		document.setting.submit();
	}
		function Sett_(sub) 
		{
				var sc = document.getElementById("School").value;
				var SubjectCode =sub; 
				var flagtype= document.getElementById("flagtype").value;
				if (sc !=0  && SubjectCode!=0) 
				{
					window.location.href = "entry_set.jsp?flagtype="+flagtype+"&School="+sc+"&SubjectCode="+SubjectCode+"&b1=Setting";
					//document.setting.submit();
					return true; 
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
<body   onload="javascript:document.getElementById('School').focus();">

<div id="inner">
<form name="setting"   method="post">
 
<%  
	ResultSet rs=null,rs_ct=null;
	String School = "", sch_name="",SubjectCode = "", Medium = "",Setting="",etime="",stdlabel="";
	String flagtype="";
	Controller obj=null;
	String entrytype="";
	Connection con=null;
	String sc="";
	try {

		  obj = new Controller();
		  con = obj.con();
		  sc = obj.setValue("School", request);
		String mdv ="";
		String sub = obj.setValue("SubjectCode", request);
		
		String etime_v=obj.setValue("etime", request);
		  Setting= obj.setValue("b1", request);
		 
		//  School = obj.combo_box("School", "select * from School",  "schoolname", "schoolcode", "", "");
		// public String combo_box(String id,  String userquery,	String text,String value
		//	 ,int set,String default_select, String defaultvalue,String fun)
		  entrytype=obj.setValue("flagtype",request);  
		String spltype	=obj.setValue("spltype",request);
		
		String flag = entrytype;
		String class_="";
		if (flag.equalsIgnoreCase("1") || flag.equalsIgnoreCase("3")) 
		{
			
			class_="12";
		}
		
		else if (flag.equalsIgnoreCase("2") || flag.equalsIgnoreCase("4"))
		{
			
			class_="10";
		}
		else
		{
			
			class_="0";
		}
		String medcond = (mdv.equalsIgnoreCase("0")) ? ""  
				: " where Medium='" + mdv + "' and SubjectCode in (select SubjectCode from subjectset where schoolcode='"+sc+"' ) and class='"+flagtype+"'";

		
		if (entrytype.equalsIgnoreCase("1"))
		{
			stdlabel="PLUS TWO";
			rs=obj.getRS("select * from SubjectCode  where  class='XII' ");//a ,subjectset b where  b.schoolcode='"+sc+"' and b.subjectcode=a.SubjectCode");
		}else
		{
			stdlabel="TENTH";
			  rs=obj.getRS("select * from SubjectCode  where  class='X' ");//a ,subjectset b where  b.schoolcode='"+sc+"' and b.subjectcode=a.SubjectCode");			
		}
		  
		  

			  
		
			  try  

				{
					sch_name = obj.getValue("School", "schoolname"," where  schoolcode='" + sc + "'");
				} catch (Exception e) {

				}	
	  

		
	
	if (Setting.equalsIgnoreCase("Setting"))
	{   
		HttpSession session2=request.getSession(true);
		session2.setMaxInactiveInterval(36000); 
		String scvalue=obj.getValue("School","schoolname","where schoolcode='"+sc+"'");
		String sbvalue=obj.getValue("SubjectCode","SubjectName","where SubjectCode='"+sub+"'");
		String  bvalue=obj.getValue("SubjectCode","BookName","where SubjectCode='"+sub+"'");
		  mdv=obj.getValue("SubjectCode","Medium","where SubjectCode='"+sub+"'");
		  sub=obj.getValue("SubjectCode","SubjectCode","where SubjectCode='"+sub+"'");
		  session2.setAttribute("class_",class_);
		session2.setAttribute("flagtype",entrytype);
		session2.setAttribute("bvalue",bvalue);
		session2.setAttribute("school_name",scvalue);
		session2.setAttribute("subject_name",sbvalue);
		session2.setAttribute("subject_code",sub); 
		session2.setAttribute("school_code",sc);
		session2.setAttribute("time",etime_v);
		session2.setAttribute("med",mdv);
	
		out.println("Setting" + Setting) ;
		out.println("sub" + sub) ;
		out.println("flagtype" + entrytype) ;
		
		
		spltype="1";
		
		if (Integer.parseInt(spltype)==2  ) 
	  	response.sendRedirect("form_entry_sms.jsp?flagtype="+entrytype);
	 	else
	 	response.sendRedirect("form_entry.jsp?flagtype="+entrytype);
		 
		 
	}
	
	HttpSession session2 = request.getSession(true);
	String uname1 = obj.isNull((String) session2.getAttribute("uname"),1);
	if (uname1.equals("0")   )
	{
		//response.sendRedirect("../logout.jsp");
	}	
	
	
	} catch (Exception e) {
		out.println(e);
	}
%>

	<div id="menudiv">
			<ul id="css3menu1" style="width: 100%" >
				<li><a href='../home.jsp'>Home</a></li>
				<li><a href='javascript:window.history.go(-1)'>Back</a></li>
				<li> <a href='../master/school.jsp'>School</a></li>
				<li><a href='../master/std.jsp?flagtype=1&School=<%=sc%>'>Standard</a></li>
				<li><a href="../logout.jsp">Logout</a></li>
			</ul>
	</div>
			
			<div id="newdiv" style="color: #012f0f;font-weight: bold"><%=sch_name %> >> <font style="color: red;" ><%=stdlabel %></font></div>
			
			<div style="position:absolute;top:29%;left:120px;;width:75%;height:290px;overflow: scroll;overflow-x: hidden;margin-left:10px;padding:15px;background:transparent;"> 
 
					<%
						String subname="",medium="",subcode="";
						while (rs.next())
						{
							subname=rs.getString("SubjectName");
							subcode=rs.getString("SubjectCode");
							medium=rs.getString("Medium");
							if (entrytype.equalsIgnoreCase("1"))
							rs_ct=obj.getRS("select count(*) from    SubjectCode a ,subjectset b where a.class='XII' and  b.schoolcode='"+sc+"' and b.subjectcode=a.SubjectCode and a.SubjectCode='"+subcode+"'");
							else
								rs_ct=obj.getRS("select count(*) from    SubjectCode a ,subjectset b where a.class='X'  and b.schoolcode='"+sc+"' and b.subjectcode=a.SubjectCode and a.SubjectCode='"+subcode+"'");	
							
							String url="";
							int ct=0;
							if (rs_ct.next())
							{ 
								ct=rs_ct.getInt(1);
							}
							String tooltip=" class='tooltip'",message="";
							if (ct>0)
							{
								subcode="'"+subcode+"'";
								url="<a href=javascript:Sett_("+subcode+")>"+subname+"-"+medium.substring(0,1)+"</a>";
								tooltip="";
								message="";
							}else
							{
								tooltip=" class='tooltip'";
								message="Subject "+subname+"-"+medium.substring(0,1)+" Not Applicable ";
								url="<label>"+subname+"-"+medium.substring(0,1)+"</label>";
								
							}
							
					%>
							<div id="div4" <%=tooltip %>>
				 					<br />
       			 					<br />
								<%=url%>								 
								 <span class="tooltiptext"><%=message %></span>
							</div>
				  
					<% } %>
			</div>

<input type="hidden" name="b1" id="b1" value="Setting">
<input type="hidden" name="School" id="School" value="<%=sc %>">
<input type="hidden" name="flagtype" id="flagtype" value="<%=entrytype %>">
  </form>
   <%
   con.close();
    %>
   </div>
  
</body>
</html>