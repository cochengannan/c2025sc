 <%@page import="java.util.*,java.sql.*,csc.*"%>
 <%
 
	 try {

		Controller obj = null;
		obj = new Controller();
		Connection con = obj.con();
		obj.createStatement(con);
 		String fname0 = obj.setValue("fname0", request).toUpperCase();
		String fname1 = obj.setValue("fname1", request).toUpperCase();
		String no1 = obj.setValue("no1", request).toUpperCase();
		String no2 = obj.setValue("no2", request).toUpperCase();
		String name1 = obj.setValue("name", request).toUpperCase();
		String name2 = obj.setValue("name2", request).toUpperCase();
		String pincode = obj.setValue("pincode", request);
		String phone = obj.setValue("phone", request);
		String mobile1 = obj.setValue("mobile1", request);
		String mobile2 = obj.setValue("mobile2", request);
		
		String qry = "insert into QA_Data_SMS (htno,name,phone1,phone2,phone3) ";
		 
		int no_find = Integer.parseInt(no2);
  
		if (no2.length() == 1)
			no2 = "00" + no2;     
		if (no2.length() == 2)
			no2 = "0" + no2;
		
try
{    

		String no = no1 + no2;
	 	Statement st=con.createStatement();
		qry=qry + " values ('"+no+"','"+name1 + " ." + name2+"',"+phone+","+mobile1+","+mobile2+")";
		System.out.println(qry); 
	    int  row = st.executeUpdate(qry);
		
		 
	 
}catch(Exception e) {} 
		} catch (Exception e) {
			out.println(e);
		}
%>