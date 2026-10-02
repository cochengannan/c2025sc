<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"  errorPage="../errorpage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*,csc.*,java.util.*,csc.excel2,java.io.*"%><html>  
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="../css/txtbox.css" />
<link rel="stylesheet" href="../menu/menunew_files/css3menu1/style.css" type="text/css" />

<body>
<%@ include file="../commdiv.jsp"%> 
<div id="inner">
<table align="center" border="1" width="890" class="newtab">
<tr>
<td>
<%
try
{
	
%>
 
<%

		Calendar cs=Calendar.getInstance();

		int year=cs.get(Calendar.YEAR);
		int month=cs.get(Calendar.MONTH)+1;
		int day=cs.get(Calendar.DAY_OF_MONTH);
		
		
		String report_title="Report_"+day+"_"+month+"_"+year;
		
		
		Controller obj = new Controller();
		Connection con = obj.con();
		DatabaseMetaData mtdt = con.getMetaData();
		ResultSet rs = mtdt.getTables(con.getCatalog(), null, null,new String[] { "TABLE" });
		String flag=obj.setValue("flag",request);
		String spl=obj.setValue("spl",request);
		HttpSession session2=request.getSession(true);
		String report_type=(String)session2.getAttribute("report_type");;
		 
		if (spl.equalsIgnoreCase("SUBMIT"))
		{
			String tab_name=obj.setValue("tab",request);
			String selection_qry=obj.setValue("columns_list",request);
			
			String rowcnt=obj.setValue("rowcnt",request);
			String cond_set="";
			
			if (Integer.parseInt(rowcnt)!=0) cond_set=" where "; else cond_set="";
			
			for(int i=1;i<=Integer.parseInt(rowcnt);i++)
			{
				String column=obj.setValue("column"+i,request);
				String value=obj.setValue("value"+i,request);
				String conj=obj.setValue("conj"+i,request);
				String conv="";
				if (conj.equalsIgnoreCase("1")) conv=" and "; else conv="or";
				if (i==1 )
				{					
					
					cond_set+=" strconv("+column+",1)="+"strconv('"+value+"',1)";
					
					if (i<Integer.parseInt(rowcnt))
					{
						
						cond_set+=" "+conv;
					}
				} 
				else
				{
					if (i==Integer.parseInt(rowcnt))
					{
						
						conv=" ";
					}
					else 
					{
						conv=" "+conv;
					}
					cond_set+=" strconv("+column+",1)="+"strconv('"+value+"',1) "+ conv;
				}
			} 
			        
		
			String columns_order_list=obj.setValue("columns_order_list",request);
			if (!columns_order_list.equalsIgnoreCase("0")) columns_order_list=" order by "+columns_order_list;
			 String query = "select "+selection_qry+" from "+tab_name+cond_set+" "+columns_order_list+ " " ;
			 System.out.println(query);
 			 excel2.excel_write(new File(application.getRealPath("/excel")),report_title+".xls",con,query);
		}
		else
		{
			 if (report_type==null)
			  {
				  %>
				  	<script type="text/javascript">
				  		alert("Report Setting Not Yet to be done");
				  	</script>
				  <%	 
				  response.sendRedirect("../process/report_set.jsp");
			  }
			File f= new File(application.getRealPath("/excel"));
			if (!f.exists())
			{ 
				f.mkdir();
			}
			
				 if (report_type.equalsIgnoreCase("2"))
				 {
					   if (flag.equalsIgnoreCase("1"))
						{
						 
							String query="select a.htno,a.name,a.sex,b.mobile1,b.mobile2,b.landline from Reception a ,QAData b  where a.exatt='Y' and a.htno=b.htno order by a.htno";
							excel2.excel_write(new File(application.getRealPath("/excel")),"ExamAttend"+".xls",con,query);
							
						}  
						if (flag.equalsIgnoreCase("2"))
						{  
						 
							String query="select htno,name,sex,fname,mobile1,mobile2,landline  from QAData where qual='12TH' and source='Q'  order by name";
							excel2.excel_write(new File(application.getRealPath("/excel")),"12th_overall"+".xls",con,query);
							
						}  
						if (flag.equalsIgnoreCase("3"))
						{  
						 
							String query="select htno,name,sex,fname,mobile1,mobile2,landline  from QAData where qual='10TH' and source='Q'  order by name";
							excel2.excel_write(new File(application.getRealPath("/excel")),"10TH_overall"+".xls",con,query);
							
						}
						if (flag.equalsIgnoreCase("4"))
						{  
						 
							String query="select htno,name,sex,fname,mobile1,mobile2,landline  from QAData where   source='d' order by name";
							excel2.excel_write(new File(application.getRealPath("/excel")),"Direct_overall"+".xls",con,query);
							
						}  
						if (flag.equalsIgnoreCase("5"))
						{  
						 
							String query="select htno,name,sex,fname,mobile1,mobile2,landline  from QAData where   source='d'  order by name";
							excel2.excel_write(new File(application.getRealPath("/excel")),"Cscian_overall"+".xls",con,query);
							
						}  
						if (flag.equalsIgnoreCase("6"))
						{  
						 	String qry_cond=obj.setValue("qry_cond",request);
							String query="select *  from QAData "+qry_cond;
						
							
								excel2.excel_write(new File(application.getRealPath("/excel")),"Conditional_"+".xls",con,query);
							 
						}  
						if (flag.equalsIgnoreCase("7"))
						{  
							String query="select htno,name,totalmark,SeatNo,Bname,discount   from Reception  order by totalmark  desc ,name asc ";
							excel2.excel_write(new File(application.getRealPath("/excel")),"Scholarship"+".xls",con,query);
							
						}    
						if (flag.equalsIgnoreCase("8"))  
						{  
						  
							String query="select * from [Exam Time]  ";
							excel2.excel_write(new File(application.getRealPath("/excel")),"Exam_Time"+".xls",con,query);
							
						}  
						if (flag.equalsIgnoreCase("9"))  
						{  
						  
							String query="select htno,name,totalmark,SeatNo,Bname,discount   from Reception     where discount=75 order by totalmark  desc ,name asc ";
							excel2.excel_write(new File(application.getRealPath("/excel")),"75_Scholarship"+".xls",con,query);
						}  
						if (flag.equalsIgnoreCase("10"))  
						{  
						  
							String query="select htno,name,totalmark,SeatNo,Bname,discount   from Reception  where discount=60  order by totalmark  desc ,name asc ";
							excel2.excel_write(new File(application.getRealPath("/excel")),"60_Scholarship"+".xls",con,query);
							
						}  
						if (flag.equalsIgnoreCase("11"))  
						{  
						  
							String query="select htno,name,totalmark,SeatNo,Bname,discount   from Reception where discount=50  order by totalmark  desc ,name asc ";
							excel2.excel_write(new File(application.getRealPath("/excel")),"50_Scholarship"+".xls",con,query);
							
						}  
						if (flag.equalsIgnoreCase("12"))
						{  
						 
							String query="select htno,name,fname,mobile1,mobile2,landline,course,remarks  from direct where   htno like ('PVMD%') order by name";
							excel2.excel_write(new File(application.getRealPath("/excel")),"Direct_direct"+".xls",con,query);
							
						} 
						if (flag.equalsIgnoreCase("13"))
						{  
						 
							String query="select htno,name,fname,mobile1,mobile2,landline,course,remarks  from direct where   htno like ('PVMC%') order by name";	
							excel2.excel_write(new File(application.getRealPath("/excel")),"Cscian_direct"+".xls",con,query);
							
						} 
						if (flag.equalsIgnoreCase("14"))
						{  
						 
							String bname=obj.setValue("batch", request);
							String query="select htno,name,totalmark,SeatNo,Bname,discount   from Reception where Bname =''  order by totalmark  desc ,name asc ";	
							excel2.excel_write(new File(application.getRealPath("/excel")),"Receiption_entry"+".xls",con,query);
							
						} 
						if (flag.equalsIgnoreCase("15"))
						{  
						 
							String query="select htno,name,sex,fname,mobile1,mobile2,landline  from QAData where   source='Z' order by name";
							excel2.excel_write(new File(application.getRealPath("/excel")),"Paper"+".xls",con,query);
							
						} 
						if (flag.equalsIgnoreCase("16"))
						{  
						 
							String query="select htno,name,sex,fname,mobile1,mobile2,landline  from QAData where   source='O' order by name";
							excel2.excel_write(new File(application.getRealPath("/excel")),"Others"+".xls",con,query);
							
							
						} 
						if (flag.equalsIgnoreCase("17"))
						{  
						 
							String query="select rfno,name,sex,mobile1,mobile2,landline,Counsellarname,Timepreferred,Remarks from Enquiry  order by name";
							excel2.excel_write(new File(application.getRealPath("/excel")),report_title+".xls",con,query);
							
							
						} 
				 }else
				 {
					 String query = "select htno,sname, phone1,phone2,phone3,school,subject,qual from QA_Data_SMS   order by htno ";
					 excel2.excel_write(new File(application.getRealPath("/excel")),report_title+".xls",con,query);
				 }
		}
		  response.sendRedirect("../excel_report.jsp");  
}catch(Exception e) { out.println(e);}    
%></td></tr></table>
 </div>
</body>

</html>