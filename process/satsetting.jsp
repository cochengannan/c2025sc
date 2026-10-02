<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="csc.*"%>
<%@page import="java.util.*,java.sql.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<head>
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/tooltip.css" />  
<link rel="stylesheet" type="text/css" href="../css/csccss.css" />
<title>CSC : SAT Year Setting </title>
<script language="JavaScript" src="../js/entry_help.js"></script>  
</head>
<body>
<%
Connection con = null;
Calendar cal1 = Calendar.getInstance();
int mm1 = cal1.get(Calendar.MONTH) + 1;
int dd1 = cal1.get(Calendar.DAY_OF_MONTH);
int yy1 = cal1.get(Calendar.YEAR);
try {
	Controller obj = new Controller();
	con = obj.con();
	obj.createStatement(con);
	 
	 
	String set=obj.setValue("set", request);
	
	 String msg1="";
	if (set.equalsIgnoreCase("Submit"))
	{
		String sty=obj.setValue("satyear",request);
		String satype=obj.setValue("satype",request);
		String sv="";
		 if (Integer.parseInt(satype)==1)
		 {
			 sv="12th SAT";
		 }else if (Integer.parseInt(satype)==2)
		 {
			 sv="10th SAT";
		 }else 
		 {
			 sv="Middle SAT "+satype ;
		 } 
		 PreparedStatement ps=con.prepareStatement("delete from satset");
		 ps.executeUpdate();
		 Hashtable htc =new Hashtable();
		 htc.put("satyear",sty);
		 htc.put("sattype",satype);
		 htc.put("satdesc","'"+sv+"'");
		 int r2=obj.recordSave(htc,"satset",con);
			session.setAttribute("satyear",sty);
			session.setAttribute("sattype",satype);
			session.setAttribute("sdesc",sv);
			
			 if (r2 > 0)
				 msg1="Setting Done.....<a href='reception.jsp'>Reception</a>";
	}
	String type=obj.setValue("satype",request); 
	String []stype={"Select","12th SAT","10th SAT","SAT3","SAT4","SAT5"};
	
	String []stypev={"0","1","2","3","4","5"};
%>
<form name="test" action="./satsetting.jsp" method="get">
<%@ include file="../commdiv.jsp"%>
<div id="menudiv"><ul id="css3menu1" >
				<li><a href='../home.jsp'>Home</a></li>
				<li><a href='javascript:window.history.go(-1)'>Back</a></li>
				<li><a href="../logout.jsp" style="width:60px; height:16px;line-height:16px;">Logout</a></li>
			</ul>
</div>
 
 <div id="cdiv">   
    
		<%
		for(int i=1;i<stype.length;i++)
		{
		  
		%><div id='div3' style="font-family: sans-serif"><br /><br />
		<a href="./tempset.jsp?satyear=<%=yy1%>&satype=<%=stypev[i]%>"  style="height:   124px;	"><%=stype[i] %></a></div> 	
		<%	 
		}
		%> 
		</div>
		 
<%
}catch(Exception e)
{
out.println(e);	

}
%>
 
</form>
</body>
</html>