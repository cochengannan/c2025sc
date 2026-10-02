var http = createObject();
alert("http"+http);
function validate(process, event) {
	
	alert("http"+http);
	var mid = "";
	var s = event.keyCode;
	var flag_test = 1;
	if (process == 5) {
		mid = "htno";
	} else {
		mid = "no2";
	}
	 
	if (s == 13 || s==9) {

		var noc = document.getElementById(mid).value;

		var res = 0;

		if (process != 5) {
			try {

				var str = new String(noc);
				var len = str.length;
				for ( var i = 0; i < len; i++) {

					var c = parseInt(str.charAt(i));

					if (isNaN(c))
						res = 1;
				}

				var d = parseInt(noc);

				if (noc != "" && noc != 0 && parseInt(noc) != 0 && res == 0) {
					flag_test = 0;
				}
			} catch (e) {

				flag_test = 1;
				document.getElementById(mid).focus();
			}

		} else {

			if (noc == "") {
				flag_test = 1;
			} else {
				flag_test = 0;
			}
		}
 
		if (flag_test == 0) {
			var id = "";
			var proc = process;
			var htno = "";
			var no1 = "", no2 = "";
			if (proc == 5) {
				no1 = document.getElementById("htno").value;
				htno = no1;
			} else {

				no1 = document.getElementById("no1").value;
				no2 = new String(document.getElementById("no2").value);
				if (no2.length == 1)
					no2 = "00" + no2;
				else if (no2.length == 2)
					no2 = "0" + no2;
				htno = no1 + no2;
			}

			url = "../process/ajax2.jsp?no=" + htno + "&process=" + proc;

			http.open("GET", url, true);
alert("http" + http);
			http.onreadystatechange = function() {
				csc_process(http, proc,event);
			}

			http.send(null);

		} else

		{

			document.getElementById(mid).value = "";
			document.getElementById(mid).focus();
		}
	}
}
function area_value(process, event, a) {

	var s = event.keyCode;
	var area = a.value;// document.getElementById("addr3").value;
	if (s == 13 || s==9) {
		proc = process;
		url = "../process/ajax2.jsp?area='" + area + "'&process=" + proc;

		http.open("GET", url, true);
		http.onreadystatechange = function() {
			csc_process(http, proc);
		}
		http.send(null);
	}
}
function school_code(process) {
	proc = process;
	var event;
	var scholl = document.getElementById("scholl").options[document
			.getElementById("scholl").selectedIndex].text;
	var url = "../process/ajax2.jsp?scholl='" + scholl + "'&process=" + proc;
	 
	http.open("GET", url, true);
	http.onreadystatechange = function() {
		csc_process(http, proc,event);

	}
	http.send(null);
}

function csc_process(xmlobj, proc,event) {

	 var ev1=event;
	 alert("proc" +event.keyCode);    
	var row = 0;     
	try {
		 alert("proc" +event.keyCode);    
		 alert("xmlobj" +xmlobj);    
		if (xmlobj.readyState == 4)
		{ alert("proc" +xmlobj.readyState); 
			 alert("proc" +event.keyCode);    
			if (xmlobj.status == 200) {
				 alert("proc" +event.keyCode);    
				final_proces(xmlobj, proc,event);
				
			}

		}
	} catch (e) {

	}

}


function final_proces(xmlobj, proc,event)
{
  

	if (parseInt(proc) == 1 || parseInt(proc) == 5) {

		var setvalue = "";
		results = xmlobj.responseText.split("|");
		var row = results[1];

		var p = 0;
		
		if (parseInt(row) > 0) {  

			p = 1;
			// msgload("Data Already Exists",1);
			alert("Data Already Exists");
			document.getElementById("err_msg").innerHTML = "Data Already Exists";
			try {
				document.getElementById("flag").value = 1;

			} catch (e) {
			}

		} else {
		  
			if (parseInt(proc)== 5) 
			{
				 alert("proc" +event.keyCode);    
				  
				 
				onsub(event);
				
				
			} else {
				document.getElementById("name").focus();
			}
			
			
			// document.getElementById("err_msg").innerHTML="";
			
		}
		if (proc == 5) {
			var mid = "htno";
		} else {
			var mid = "no2";
		}

		if (parseInt(p) == 1) {

			document.getElementById(mid).value = "";
			document.getElementById(mid).focus();

		}

	}
	if (proc == 2) {
		results = xmlobj.responseText.split("|");
		var city = results[1];
		pincode = results[2];

		document.getElementById("addr4").value = city;
		document.getElementById("pincode").value = pincode;

		document.getElementById("phone").focus();

	}
	if (proc == 3) {
		results = xmlobj.responseText.split("|");
		var code = results[1];

		document.getElementById("code").innerHTML = code;
	}


}
function list_process(process, sub, event, id) {

	try {

		var s = 13;// event.keyCode;
		if (s == 13 || s==9) {

			if (process == 1) {

				if (sub == 1) {
					ck = empty(id);
					ck = 0;
					if (ck == 2) {
						alert("   Please Enter the value");

						// msgload("Please Enter the value",1);
						// document.getElementById(id).focus();

					} else {
						// 	validate(1);
					}
				}

			}
		}
	} catch (e) {
		alert("teset")
	}

}

function key_pass(event, current, next, flag) {

	alert("TEST")
	var ck = 0;
	var s = event.keyCode;

	if (s == 13 || s==9) {

		ck = empty(current, flag);

		if (ck == 2) {
			document.getElementById(current).focus();
			// msgload("Please Enter the value",1);
			alert("Please Enter the value");
		} else {

			document.getElementById(next).focus();
		}

	}

}

function key_pass(event, current, next) {

	var ck = 0;
	var s = event.keyCode;

	if (s == 38) {
		sel(event, next);

	} else if (s == 13 || s==9) {

		ck = empty(current);

		if (ck == 2) {
			document.getElementById(current).focus();
			// msgload("Please Enter the value",1);
			alert("Please Enter the value");
		} else {

			document.getElementById(next).focus();
		}

	}

}
function key_pass(event, current, next, nextid, div_id) {

	var ck = 0;
	var s = event.keyCode;

	if (s == 38) {

		vis(div_id, 2);
		sel(event, nextid);

	} else if (s == 13 || s==9) {

		ck = empty(current);

		if (ck == 2) {
			document.getElementById(current).focus();
			// msgload("Please Enter the value",1);
			alert("Please Enter the value");
		} else {

			document.getElementById(next).focus();
			vis(div_id, 1);
		}

	}

}
function empty(current) {
	var r = 0;

	try {

		var v = document.getElementById(current).value;

		if (v == "" || v == "") {
			r = 2;
			document.getElementById("flag").value = 1;
		} else {
			r = 1;
			document.getElementById("flag").value = 0;
		}
	} catch (e) {
		alert("test error" + e)
	}
	return r;

}
function empty(current, flag) {
	var r = 0;

	try {

		var v = document.getElementById(current).value;

		if (v == 0) {
			r = 2;
			document.getElementById("flag").value = 1;
		} else {
			r = 1;
			document.getElementById("flag").value = 0;
		}
	} catch (e) {
		alert("test error" + e)
	}
	return r;

}
function dgcount(id, count) {

	var len = 0;

	var s = new String(document.getElementById(id).value);

	if (parseInt(s) != 0) {
		len = s.length;

		if (len < count) {
			alert("Please Enter the " + count + " digit")

			document.getElementById(id).focus();
			document.getElementById(id).value = "";
			// msgload("Please Enter the "+count+" digit",1);
			return false;
		}

	}
}

function prv_must(cid, id, msg) {
	var s = new String(document.getElementById(id).value);
	if (s.length == 0) {
		try {
			document.getElementById(cid).value = "";
			document.getElementById("flag").value = 1;
			document.getElementById(id).focus();
			alert("First Give " + msg)
		} catch (e) {
		}
	}
}
function daycount() {
	try {

		var val = document.getElementById("day").value;
		if (parseInt(val) == 0) {
			document.getElementById("day").value = "";
			document.getElementById("flag").value = 1;
			document.getElementById("day").focus();
			alert("if any day start 0 ? Please Give Correct Day....... ");

		} else if (parseInt(val) > 31) {
			document.getElementById("day").value = "";
			document.getElementById("flag").value = 1;
			document.getElementById("day").focus();
			alert("Day Must may be between 1 - 31 ? Correct ? Please Give That ");

		}
	} catch (e) {
	}
}

function cur_must(id, msg) {
	var s = new String(document.getElementById(id).value);
	if (s.length == 0) {
		try {

			document.getElementById("flag").value = 1;
			document.getElementById("err_msg").innerHTML = "" + msg;

		} catch (e) {
		}
	} else {
		document.getElementById("err_msg").innerHTML = "";
	}
}

function sec_val(cid, id, msg) {

	var s = new String(document.getElementById(id).value);

	if (s.length == 0) {

		try {
			document.getElementById(cid).value = "";
		} catch (e) {
		}
		document.getElementById("flag").value = 1;
		alert(msg + " Use Mouse Click to Go that Place.... ");
		// document.getElementById(id).focus();
	}

}
function onsub(ev)  
{	
	alert("char"+ev.keyCode+"test")  ;    
	try
	{
		var s = ev.keyCode;
		alert("char"+ ev.keyCode)  ;
		if (s == 13 || s==9) 
			{
			
						var htno=document.getElementById('htno').value;

						if (htno!=0 && htno!="")
						{
						 	fetch(1,htno,ev);
						 	var btc=document.getElementById('btc').value;
						 	if (btc==0)
						 	{
						 		document.getElementById('btc').focus();  
						 	}else
						 	{
							document.getElementById('sno').focus();  	
						 	}
						}else
						{
							alert("Enter the HallTicket No!");
							document.getElementById('htno').value="";
							document.getElementById('htno').focus();  	
						}  
			}
	}catch(e) 
	    {
	    alert(e)
		}
	
	 
}	