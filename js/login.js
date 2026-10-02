 
function login()
{ 

	var http =createObject();  
	
	var uname=document.getElementById("uname").value;  
	var pwd=document.getElementById("password").value;  
	var url = "./loginserver?uname=" + uname + "&pwd="+pwd;         
	http.open("GET", url, true);

	http.onreadystatechange = function()
	{  
		login_process(http);
	};

	http.send(null);
}
function login_process(xmlobj)
{  
	   
	try {
		if (xmlobj.readyState == 4) {
			 
			if (xmlobj.status == 200)
			{
			    
					var baseResponse=xmlobj.responseXML.getElementsByTagName("response")[0];	
					var count=baseResponse.getElementsByTagName("count")[0].firstChild.nodeValue;
					 
					if (count > 0)
					{
						   
						location.href="./home.jsp";
					}
					else
					{
						alert("User name / Password Incorrect");
						document.getElementById("uname").focus();
						  var newO = document.getElementById("password");        
					      if (newO.type!="password")
					      {
					    		document.getElementById("ps").innerHTML="";
								var txt=" <input type='password'  class='tb_long' id='password'  name='password' size='34' onblur='txthide2()' onclick='txthide3()'>";		
								document.getElementById("ps").innerHTML=txt;
							}
						
					} 
			}
		}
	}catch(e) {}
}