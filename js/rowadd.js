function celladd() {
	var tbody = document.getElementById("entred_body");
	var table = document.getElementById("entred_data");

	var crow = document.getElementById("crow").value;
	var crow1 = parseInt(crow) + 1;
	var cb1 = document.getElementById("cb1").value;

	var new_row = cell("TR", "", "", "row" + crow1, 1, 2, "", "", "", "", "",
			"", "");// 13
	var sno = cell("TD", "input", "text", "sno" + crow1, crow1, 7, "tbI0", "",
			"", "", "center", "onKeyDown", "key_pass(event,'sno" + crow1
					+ "','ssname" + crow1 + "')");
	   
	 
	    
	
	var name = cell("TD", "input", "text", "ssname" + crow1, "", 7, "tb6", "",
			"", "", "center", "onKeyDown#onKeyUp", "key_pass(event,'ssname" + crow1+ "','ssage" + crow1 + "')#toUpper(this)");
	
	
	var age = cell("TD", "input", "text", "ssage" + crow1, "", 7, "tbI0", "","", "", "center", "onKeyDown#onKeyUp#maxlength", "key_pass(event,'ssage" + crow1+ "','sssex" + crow1 + "')#IsNumeric(this.value,'Number only',event)#3");
   
	var sex_typname = document.getElementById("sssex").value;
	var sex_ssno = document.getElementById("sssexv").value

	var name_array2 = sex_typname.split(",");
	var sno_array2 = sex_ssno.split(","); 

	var n_sno2 = name_array2.length;
	var n_name2 = sno_array2.length;  

	var cell3 = document.createElement("TD");
	cell3.setAttribute("align", "center");
	//	
	if (window.navigator.appName.toLowerCase().indexOf("netscape") == -1) {
		 
		var inp3 = document.createElement("<SELECT id=sssex" + crow1
				+ " name=sssex" + crow1
				+ "  class='select2' onKeyDown=key_pass(event,'sssex" + crow1
				+ "','ssqtype" + crow1 + "')>");
	} else {
		var inp3 = document.createElement("SELECT");
		inp3.setAttribute("id", "sssex" + crow1);
		inp3.setAttribute("name", "sssex" + crow1);
		inp3.setAttribute("class", "select2");
		inp3.setAttribute("onKeyDown", "key_pass(event,'sssex" + crow1
				+ "','ssqtype" + crow1 + "')");
	}
	var s = "";

	for ( var j = 0; j < name_array2.length; j++) {
		s = "inp3" + j;

		s = document.createElement("OPTION");
		inp3.appendChild(s);
		s.text = name_array2[j];
		s.value = sno_array2[j];

	}

	cell3.appendChild(inp3);

	var rel_typname = document.getElementById("cb1").value;
	var rpt_ssno = document.getElementById("cb2").value
	var name_array = rel_typname.split(",");
	var sno_array = rpt_ssno.split(",");
	var n_sno = name_array.length;
	var n_name = sno_array.length
	var cell1 = document.createElement("TD");
	cell1.setAttribute("align", "center");
	if (window.navigator.appName.toLowerCase().indexOf("netscape") == -1) {

		var inp1 = document.createElement("<SELECT id=ssqtype" + crow1
				+ " name=ssqtype" + crow1
				+ "  class='select2' onKeyDown=key_pass(event,'ssqtype" + crow1
				+ "','savebutton')>");
	} else {
		var inp1 = document.createElement("SELECT");
		inp1.setAttribute("id", "ssqtype" + crow1);
		inp1.setAttribute("name", "ssqtype" + crow1);
		inp1.setAttribute("class", "select2");
		inp1.setAttribute("style", "width:50pt");
		inp1.setAttribute("onKeyDown", "key_pass(event,'ssqtype" + crow1
				+ "','savebutton')");

	}
	var l = "";
	for ( var j = 0; j < name_array.length; j++) {
		l = "inp1" + j;
		l = document.createElement("OPTION");
		inp1.appendChild(l);
		l.text = name_array[j];
		l.value = sno_array[j];

	}

	var ssscholl = cell("TD", "input", "text", "ssscholl" + crow1, "", 7,
			"tb6", "", "", "", "center", "onKeyDown",
			"key_pass(event,'ssscholl" + crow1 + "','savebutton')");

	cell1.appendChild(inp1);
	new_row.appendChild(sno);
	new_row.appendChild(name);
	new_row.appendChild(age);
	new_row.appendChild(cell3);
	new_row.appendChild(cell1);
	//new_row.appendChild(ssscholl);

	tbody.appendChild(new_row);
	document.getElementById("crow").value = crow1;
}
