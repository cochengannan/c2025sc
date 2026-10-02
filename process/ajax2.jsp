
<%@ page language="java"  errorPage="../errorpage.jsp" 
	import="csc.*,java.sql.*,java.io.*,java.text.*,java.util.Date,java.util.Calendar,java.lang.System,java.util.*"%>


<%
	response.setContentType("text/xml");
	response.setHeader("Cache-Control", "no-cache");
	   
 
	String satyear=(String)session.getAttribute("satyear");
	String satype=(String)session.getAttribute("sattype"); 
	  String table="";     
	  Controller obj =null;
		java.sql.Connection con = null;
	try {

		obj = new Controller();
	
		String process = obj.setValue("process", request);
		table= obj.setValue("table", request);
		if (table.equalsIgnoreCase("0") || table.equalsIgnoreCase("undefined")) table="QAData";
		con=obj.con();
		obj.createStatement(con);
		int count=0; 
	  
if (Integer.parseInt(process) == 10) {
			
			String no = obj.setValue("no", request);
			try { 
				count = obj.getCount("Enquiry", "where rfcode='"+no+"'");
			} catch (Exception e) {
				e.printStackTrace();
			}
			response.getWriter().write("text" + "|" + count);
			
		}else 
		if (Integer.parseInt(process) == 1) {
			
			String no = obj.setValue("no", request);
			String no2= obj.setValue("no2", request);
			try { 
				count = obj.getCount(table, "where htno='"+no+"'");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 
			response.getWriter().write("text" + "|" + count);
			
		} else if (Integer.parseInt(process) == 2) {
			 
			String area = obj.setValue("area", request);
			String city="",pincode="";  
			try {
				 
				  area=area.replace("'","");
				  city = obj.getValue("Area", "city", "where [Area]='"+area.trim()+"'");
				  pincode = obj.getValue("Area", "pincode", "where [area]='"+area.trim()+"'");
				 
				                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();  
			}
			response.getWriter().write("text" + "|" + city+"|"+pincode);
		 
		}else if (Integer.parseInt(process) == 5) {
			
			String no = obj.setValue("no", request);
		 
			try { 
				count = obj.getCount("Reception", "where htno='"+no+"'");  
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 
			response.getWriter().write("text" + "|" + count);
			
		}
		if (Integer.parseInt(process) == 3)  
		{     
			 
			String school = obj.setValue("scholl", request);
		 
			String code="";
			ResultSet rs1=null;
			rs1=obj.getRS("select SubjectCode from School where  schoolname="+school+"");
			 
			String []c=null;
			String combo=": <select id='subject' name='subject' class='select2'><option>Select</option>";
			String temp="";
			
			while (rs1.next())
			{   
				String val=rs1.getString(1);
				c=val.split(",");
				int i=0;
				String []code_2=null;
				while (i<c.length)
				{
					
				code_2=c[i].split("-");
				
				 
				if (!temp.trim().equals(code_2[0].toString().trim()))
				{
					combo+="<option value='"+code_2[0]+"'>"+code_2[0]+"</option>";
				}
				temp=code_2[0].toString().trim();
				
				i++;
				}
				
			} 
			 combo+="</select>";
		 
			 
			
			response.getWriter().write("text" + "|" + combo); 
		}
		
		con.close();
			
	} catch (Exception e) {
		  
		System.out.println(e);
		con.close();

	}  
%>
