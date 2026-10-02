<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<html>
<%@page import="csc.*"%>
<%@page import="java.util.*,java.sql.*"%>
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<script src="../css/pro_drop_1/stuHover.js" type="text/javascript"></script>
<head>
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CSC : Scholarship  Entry</title>
</head>
<body>
<form action="sch.jsp" method="post">
 <center> 
 <%@ include file="../commdiv.jsp"%>
 <div id="menudiv"><ul id="css3menu1" style="width: 100%" >
				<li><a href='../home.jsp'>Home</a></li>
				<li><a href="../logout.jsp">Logout</a></li>
			</ul>
	 </div>
<%
Connection con = null;
Connection con1 = null;
Connection con2 = null;
Connection con3 = null;
try {
	Controller obj = new Controller();
	con = obj.con();
	con1 = obj.con();
	con2 = obj.con();
	con3 = obj.con();
	obj.createStatement(con);	
	String satyear="0" ,sattype="0",sdesc="0";
	try
	{
	  satyear = (String) session.getAttribute("satyear");
	  sattype = (String) session.getAttribute("sattype");
	  sdesc = (String) session.getAttribute("sdesc");	  
	}catch(Exception e )
	{
		response.sendRedirect("./satsetting.jsp");
	}
	 if (satyear.equalsIgnoreCase("0") || sattype.equalsIgnoreCase("0") || sdesc.equalsIgnoreCase("0"))
	 {
		 response.sendRedirect("./satsetting.jsp");		 
	 }
		int count = obj.getCount("Reception", " where  satyear="+satyear+" and sattype="+sattype+"");
		int count2 = obj.getCount("QAData", " where  satyear="+satyear+" and sattype="+sattype+"");
%>
<div id="cdiv"> 
<table  align="center" border="1" width="910" class="newtab" cellpadding="0" cellspacing="0">
	<tr bgcolor='lightgreen' style="color:'darkred' " class="tdText" >
				<td align="center"> <font size="3" > Scholarship <b><%=satyear %>---<%=sdesc %></b></font> </td>  
	</tr>
	<tr  class='tdText'>  
				<td><b>Total Reception Record  : <%=count	 %></b></td>
			</tr> 
	<tr>
		<td align="center"> 75% &nbsp;<input type="text" id="m1" name="m1" class="tb1"> 
		 60% &nbsp;<input type="text" id="m2" name="m2" class="tb1">
		 50% &nbsp;<input type="text" id="m3" name="m3" class="tb1"></td>
	</tr>
    <tr>
    		<td   align="center">    			
    			<input type="Submit" name="Order" value="Order">
    			<input type="Submit" name="submit" value="Submit">
    			<input type="submit" name="Clear" value="Clear">
    			<input type="Reset" name="Reset" value="Reset">
    		</td>
    </tr>
    <%
	String Clear=obj.setValue("Clear",request);
	String submit=obj.setValue("submit",request);
	String Order=obj.setValue("Order",request);
	if (submit.equalsIgnoreCase("Submit"))
	{
		
					String m1=obj.setValue("m1",request);
					String m2=obj.setValue("m2",request);
					String m3=obj.setValue("m3",request);				
					
					PreparedStatement ps=con.prepareStatement("select htno from Reception where updateflag between  1 and "+(Integer.parseInt(m1)+1)+" and   satyear="+satyear+" and sattype="+sattype+" and  ( Discount=0 or Discount is null ) order by updateflag  asc");
					ResultSet rs=ps.executeQuery();
					 
					int row1=-1;  
					while (rs.next())  
					{
						row1++;  
						if (row1 < Integer.parseInt(m1))
						{  
							String htno=rs.getString("htno");
							ps=null;
							String qry="update Reception set Discount=75   where ( Discount=0 or Discount is null ) and  htno='"+htno+"'";
							 ps=con.prepareStatement(qry);
							 ps.execute();
						}
						  
					}      
					
					PreparedStatement ps2=con1.prepareStatement("select htno from Reception where  updateflag  between  "+(Integer.parseInt(m1)+1)+" and "+((Integer.parseInt(m1)+Integer.parseInt(m2))+1)+" and   satyear="+satyear+" and sattype="+sattype+" and  ( Discount=0 or Discount is null )   order by updateflag  asc");
					ResultSet  rs2=ps2.executeQuery();
					int row2=-1;
					while (rs2.next())  
					{
						row2++;  
						if (row2 < Integer.parseInt(m2))  
						{
							String htno=rs2.getString("htno");
						 
							String qry1="update Reception set Discount=60  where ( Discount=0 or Discount is null ) and  htno='"+htno+"'";
							ps=null;
							  ps=con.prepareStatement(qry1);
						  	ps.execute();
						}     
						 
					}    
					
					int start=((Integer.parseInt(m1)+Integer.parseInt(m2))+1);
					int end=((Integer.parseInt(m1)+Integer.parseInt(m2)+Integer.parseInt(m3))+1);
					PreparedStatement ps3=con2.prepareStatement("select htno from Reception where updateflag between  "+start+" and "+end+" and   satyear="+satyear+" and sattype="+sattype+" and  ( Discount=0 or Discount is null )    order by updateflag  asc");
					ResultSet  rs3=ps3.executeQuery();
					int row3=-1;
					while (rs3.next())  
					{     
						row3++;  
						if (row3 < Integer.parseInt(m3))
						{
							String htno=rs3.getString("htno");
							String qry2="update Reception set Discount=50  where  ( Discount=0 or Discount is null ) and  htno='"+htno+"'";
							ps=null;
							 ps=con.prepareStatement(qry2);
							 
						 	ps.execute();
						}
						 
					}      
					submit="";
					
					//response.sendRedirect("./sch.jsp");
					  
				    
				
				    
	} 
	if (Clear.equalsIgnoreCase("Clear"))
	{
		Hashtable ht=new Hashtable();  
		Hashtable ht1=new Hashtable();
		ht.put("Discount","0");
		ht.put("updateflag","0");
		ht1.put("1","1"); 
		ht1.put("satyear",satyear); 
		ht1.put("sattype",sattype);  
		
		int r=obj.recordSave(ht,ht1,"Reception ",con);
		
		//response.sendRedirect("sch.jsp");
	}
	if (Order.equalsIgnoreCase("Order"))
	{

		PreparedStatement ps0=con3.prepareStatement("select htno from Reception   where   satyear="+satyear+" and sattype="+sattype+" order by totalmark  desc ,name asc");
		ResultSet rs0=ps0.executeQuery();
		int row=0;    
		while (rs0.next())  
		{
			row++;         
			String htno=rs0.getString("htno");
			 
			String qry="update Reception set updateflag="+row+"   where htno='"+htno+"'";
			 
			PreparedStatement ps4=con.prepareStatement(qry);
			ps4.execute();
			
		}
		%>
		<script>
			alert(" Ordering done !! Please Give Offer ")
		</script>
		<%   
		
	}
	
	int s1=  obj.getCount("Reception", "where Discount=75 and  satyear="+satyear+" and sattype="+sattype+"  ");
    int s2=  obj.getCount("Reception", "where Discount=60  and  satyear="+satyear+" and sattype="+sattype+"  ");
    int s3=  obj.getCount("Reception", "where Discount=50  and  satyear="+satyear+" and sattype="+sattype+"  ");
    
    int total_reception=  obj.getCount("QAData", "where (reception='y' or reception='Y' ) and  satyear="+satyear+" and sattype="+sattype+"   ");
    int total_exam=  obj.getCount("QAData", "where ( examatt='y' or examatt='Y' ) and  satyear="+satyear+" and sattype="+sattype+"   ");
    int total_mark1=  obj.getCount("Reception", "where markflag=1 and  satyear="+satyear+" and sattype="+sattype+"");
    int total_mark=  obj.getCount("Reception", " where [markflag] is null and  satyear="+satyear+" and sattype="+sattype+"");
    out.println("<tr class='tdText' ><td align='left'><table width='50%'>");
    out.println("<tr><td>Reception :  </td><td>  "+total_reception+"</td></tr>");
    out.println("<tr><td>Exam Attended </td><td>  "+total_exam+"</td></tr>");
    out.println("<tr class='tdText' ><td>Mark Entry  </td><td>"+total_mark1+"</td></tr>");
    out.println("<tr class='tdText' ><td>Mark Not Entry </td><td> "+total_mark+"</td></tr>");
    out.println(" </table><td></tr>");
    out.println("<tr class='tdText' ><td align='left'><table width='50%'>");
    int total_plus=  obj.getCount("QAData", "where qual='12TH' and source='Q' ");
    int total_ten=  obj.getCount("QAData", "where qual='10TH'  and source='Q'");
    int total_plus_rec=  obj.getCount("QAData", "where qual='12TH' and source='Q' and reception='Y' and examatt='Y'  and  satyear="+satyear+" and sattype="+sattype);
    int total_ten_rec=  obj.getCount("QAData", "where qual='10TH'  and source='Q' and reception='Y' and examatt='Y'  and  satyear="+satyear+" and sattype="+sattype);
    int total_plus_mark=  obj.getCount("QAData", "where qual='12TH' and source='Q' and reception='Y' and examatt='Y'  and  satyear="+satyear+" and sattype="+sattype);
    int total_ten_mark=  obj.getCount("QAData", "where qual='10TH'  and source='Q' and reception='Y' and examatt='Y'  and  satyear="+satyear+" and sattype="+sattype);
    out.println("<tr><td colspan=2 align=left>Total  = "+count2+"  </td> </tr>");
    out.println("<tr><td>Total +2 Record = "+total_plus+"  </td><td> Total Tenth Record= "+total_ten+"</td></tr>");
    out.println("<tr><td>Total +2 Reception  ="+total_plus_rec+"</td><td>Total Tenth Reception= "+total_ten_rec+"</td></tr>");
    out.println("<tr><td>Total +2 Mark Entry  ="+total_plus_mark+"</td><td>Total Tenth Mark Entry= "+total_ten_mark+"</td></tr>");
    out.println(" </table><td></tr>");
    out.println("<tr class='tdText' ><td align='left'><table width='100%'><tr><td align='center'> 75% is  </td><td>"+s1+"</td></tr>");
    out.println("<tr><td align='center'> 60% is  </td><td>"+s2+"</td></tr>");
    out.println("<tr><td align='center'> 50% is  </td><td>"+s3+"</td></tr></table></td></tr>");
	con1.close();
	con2.close();  
	con3.close();
	con.close();
	con=null;
	con2=null;
	con3=null;
	con1=null;
	

%>
  
<tr>
	<td>Please Fill Request No in each box.if no allocation please use '1'</td>
</tr>  
<%

}catch(Exception r) { 
	out.println("<br>"+r+"<br><font size=4><a href='satsetting.jsp'>&nbsp;Sat Type setting  may not be set Please click here to set </a>  </font>");
}
%>
</table></div>

</center>
</form>
</body>
</html>