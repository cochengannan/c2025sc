<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="com.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="csc.Controller,java.sql.*"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	 
<%
String enqdate="",source="",enqname="",enqcourse="",enqmobileno="",enqremarks="",major="";
	
	String enqstatus="",createddate="",timing="",enqmonth="",enqyear="",enqby="";
	String qry="select * from QAData";
	java.sql.PreparedStatement ps=null;
	java.sql.ResultSet rs=null;
	java.sql.Connection con=null;
	Calendar cal=Calendar.getInstance();
	Controller obj=new Controller();  
	String role=(String)session.getAttribute("role"); 
	String cname=(String)session.getAttribute("cname");
	DateFormat sdf=new SimpleDateFormat("dd/MM/yyyy");
	String  sc = obj.setValue("School", request);
	  String entrytype=obj.setValue("flagtype",request);
	  String std_new=obj.setValue("std_new",request);
		String flag = entrytype;
	  String class_="";
	  String scvalue=obj.getValue("School","schoolname","where schoolcode='"+sc+"'");
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
 		%>  
 		
								 <div class="form-group"> 
			                        <Table border='1' width="100%" cellpadding="5" cellspacing="0" class="blueTable">
			                        <tr bgcolor='skyblue' style="height: 65px;">
		                        	<td colspan="8">
		                        		<% 
		                        		out.println("School : "+sc+" - "+scvalue+" Standard : " +class_);
		                        		%>
		                        	</td>
			                        </tr>
			                        <tr bgcolor="#ffab62">  
										<td>#</td> <td>htno</td> <td>Name</td>	<td>Father Name </td>
										<td>Address </td><td>Phone Number1</td>
										<td>Phone Number2</td>
									</tr> 
 		<%
					 				  qry="select * from QAData where school='"+sc+" - "+scvalue+"' and qualtype='"+std_new+"' order by subject,htno  desc";
					 				int row=0;
               		  				 
               		  				  con=obj.con();
					 				ps=con.prepareStatement(qry);
					 				rs=ps.executeQuery();
					 				String subject_temp="";
					 				while(rs.next())
					 				{ 
					 					
					 					String htno=rs.getString("htno");
					 					String name=rs.getString("name");
					 					String fname=rs.getString("fname");  
					 					String doorno=rs.getString("doorno");
					 					String add1=rs.getString("add1");
					 					String add2=rs.getString("add2");
					 					String city=rs.getString("city");
					 					String mobile1=rs.getString("mobile1");
					 					String mobile2=rs.getString("mobile2");
					 					String seqno=rs.getString("slno");
					 					String subject=rs.getString("subject");
					 					String html="";	
					 					if (!subject_temp.equals(subject))
					 					{
					 						row=1;
					 						html+="<tr bgcolor='#c02'><td colspan=8><font color=white>"+subject+"</font></td></tr><tr ><td>"+row+"</td><td><input readonly='readonly' style='border: 0px'  type=text id='htno"+row+"' name='htno"+row+"' value="+htno+"></td> <td>"+name+"</td><td>"+fname+" </td><Td>"+doorno+","+add1+","+add2+","+city+"</td>"; 					
						 					html+=" <td><input readonly='readonly' style='border: 1px' type=text id='mobile1"+row+"' name='ph' value="+mobile1+">  </td>";
						 					html+="<td><input readonly='readonly' style='border:1px' type=text id='mobile2"+row+"' name='ph' value="+mobile2+"> </td>";
						 					html+="<td align=center><input  style='border: 0px' type=checkbox name='ch"+row+"'></td></tr>";
						 					
					 					}else    
					 					{
					 						row++;
					 						html+="<tr><td>"+row+"</td><td><input readonly='readonly' style='border: 0px'  type=text id='htno"+row+"' name='htno"+row+"' value="+htno+"></td> <td>"+name+"</td><td>"+fname+" </td><Td>"+doorno+","+add1+","+add2+","+city+"</td>"; 					
						 					html+=" <td><input readonly='readonly' style='border: 1px' type=text id='mobile1"+row+"' name='ph' value="+mobile1+">  </td>";
						 					html+="<td><input readonly='readonly' style='border:1px' type=text id='mobile2"+row+"' name='ph' value="+mobile2+"> </td>";
						 					html+="<td align=center><input  style='border: 0px' type=checkbox name='ch"+row+"'></td></tr>";
						 						 
					 					}
					 					subject_temp=subject;
					 					out.println(html);
					 				}
               				 %>                    
                              </Table>      
                                      
	                                     
                                </div>
</body>
</html>