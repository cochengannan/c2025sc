<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>vcbcvbcv
	<table>
	
	<%
	System.out.println("YRDY");
		int r=0;
		int r1=0;
		
		int g=0;
		int g1=0;
		
		int b=0;
		int b1=0;
		
		int row=0;
		String tab="";
		String r2="",r3="";
		String g2="",g3="";
		String b2="",b3="";
		
		for(int i=1;i<=45;i++)
		{
			if (r <=15 )
			{
				r++;
			}
			else
			{	
				if (r1 <=15 )
				{
					r1++;
				}
				else
				{
					if (g <= 15 )
					{ 	
						g++;
					}
					 else
					 { 
								 if (g1 <= 15 )
								 {
									 g1++;
								 }else
								 {
										 if (b <=15)
										 {
											 b++;
										 }
										 else
										 {
											 if (b1 <=15)
													b1++;
										 }
								 }
					 }
			 }
				
			}
		 	
			
			r2=clr(r);  
			r3=clr(r1);

			g2=clr(g);  
			g3=clr(g1); 
			
			b2=clr(b);  
			b3=clr(b1);  
			
			
			
			 
			
			
			
			tab="<tr><td bgcolor='#"+r2+""+r3+""+g2+""+g3+""+b2+""+b3+"'>&nbsp;</td></tr>";
			out.println(tab);
			System.out.println(tab);
		}
		
		
	
	%>
	
	
	
	<%!
	static String clr(int c)
	{
		String val="";
		
		if (c >9)
		{
			switch(c)
			{
			case 10:
				val="A";
				break;
			case 11:
				val="B";
				break;
			case 12:
				val="C";
				break;
			case 13:
				val="D";
				break;
			case 14:
				val="E";
				break;
			case 15:
				val="F";
				break;
			
			}
		}
		else
		{
			
			val=""+c;
		}
		return val;
	}
	
	%> 
	</table>

</body>
</html>