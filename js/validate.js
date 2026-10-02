function phoneval(event, current, next,flag) 
{
	var ck = 0;
	var s = event.keyCode;
	if (s == 13 || s==9) 
	{	
		ck = valempty(current);
		if (ck == 2)  
		{ 
		 document.getElementById(current).focus();  
		 alert("Please Enter the value");
		}	
	    else 
	    {			 
		 document.getElementById(next).focus();
		}
	}
}

function valempty(current) {
	var r = 0;
	 
	try {

		var v = document.getElementById(current).value;
 
		if (v == "") {
			r = 2;
			document.getElementById("flag").value = 1;
		} else {
			r = 1;
			document.getElementById("flag").value = 0;
		}
	} catch (e) {
		alert("test error" +e)
	}
	return r;  
  
}
