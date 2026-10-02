var http = getHTTPObject();
var process = 0;
function getHTTPObject() {
	var xmlhttp;
	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	return xmlhttp;
}

function folder_create() {
	var xmlobj = createObject();
	var fname = document.getElementById("fname").value;
	var df = document.getElementById("df").value;
	var col = document.getElementById("col").value;
	var she = document.getElementById("she").value;
	var url = "../cscval?name=" + fname + "&col=" + col + "&df=" + df
			+ "&process=3" + "&she=" + she;
	var process = 3;
	 
	xmlobj.open("GET", url, true);

	xmlobj.onreadystatechange = function() {
		folder_create_process(xmlobj, process);
	}

	xmlobj.send(null);
}

function column_selection(input_value, process) {

	var xmlobj = createObject();

	var fname = document.getElementById("fname").value;
	var sh = 0;
	try {
			sh = document.getElementById("she").value;
	} catch (e) {
		// TODO: handle exception
	}
	if (process == 5 || process == 4|| process == 3) {
		if (fname != "") {
			
			if (process == 5 || process == 4)
			{
				 
			var url = "../process/selectAjax.jsp?name=" + fname + ""
					+ "&process=" + process + "&she=" + sh;
			}
			else
			{
				var fname = document.getElementById("fname").value;
				var df = document.getElementById("df").value;
				var col = document.getElementById("col").value;
				var she = document.getElementById("she").value;
				var url = "../process/selectAjax.jsp?name=" + fname + "&col=" + col + "&df=" + df
						+ "&process=3" + "&she=" + she;
				 
			}
			 
			http.open("GET", url, true);
			this.process = process;
			http.onreadystatechange = handleHttpResponse
			http.send(null);
			
			
			
			
			
			
		} else {
			alert("File Name Missing ")

		}

	}  
}

function handleHttpResponse() {
	if (http.readyState == 4) {
		if (http.status == 200) {
			
			if (process==5)
			{
			var setvalue = "";
			results = http.responseText.split("|");
			var indval = results[0];
			setvalue = results[1];
			document.getElementById("sheeet_id").innerHTML = setvalue;
			}else if (process==4)
			{
				var setvalue = "";
				results = http.responseText.split("|");
				var indval = results[0];
				setvalue = results[1];
				document.getElementById("col_id").innerHTML = setvalue;
				
				
			}
			else if (process==3)
			{
				var setvalue = "";
				results = http.responseText.split("|");
				var indval = results[1];
				setvalue = results[2];
				  
				if (indval > 0 && setvalue > 0) {
					alert(" Totally" + indval + " Folder Created Successfully ! Already "+setvalue+" Folder Created Successfully" );
				} else if (indval > 0){ 
					alert(" Totally" + indval + " Folder Created Successfully !")
				}else
				{
					alert(" Already   "+setvalue+" Folder Created Successfully");
				}
				 
			}
		}
	}

}

function folder_create_process(xmlobj, process) {

	var row = 0;
	try {
		if (xmlobj.readyState == 4) {

			if (xmlobj.status == 200) {

				if (process == 3) {
					var bR = xmlobj.responseXML.getElementsByTagName("result")[0];
					var row = bR.getElementsByTagName("row")[0].firstChild.nodeValue;
					var erow = bR.getElementsByTagName("erow")[0].firstChild.nodeValue;
					if (row > 0) {
						alert(" Totally" + row + " Folder Created Successfully");

					} else {

						alert(" Already" + erow
								+ " Folder Created Successfully");
					}

				}

			}
		}
	} catch (e) {

	}
}

function column_process(xmlobj, input_value, process) {

	var row = 0;
	try {
		if (xmlobj.readyState == 4) {

			if (xmlobj.status == 200) {

				if (process == 5) {
					var bR = xmlobj.responseXML.getElementsByTagName("result")[0];
					var len = bR.getElementsByTagName("sname").length;
					document.getElementById(input_value).options.length = 0;
					addOption(document.getElementById(input_value),
							"Select Sheet Name ", -1);
					for (i = 0; i < len; i++) {
						var sno = bR.getElementsByTagName("sno")[i].firstChild.nodeValue;
						var name = bR.getElementsByTagName("sname")[i].firstChild.nodeValue;
						addOption(document.getElementById(input_value), name,
								sno)
					}
				} else {
					var bR = xmlobj.responseXML.getElementsByTagName("result")[0];
					var len = bR.getElementsByTagName("cname").length;

					document.getElementById(input_value).options.length = 0;

					addOption(document.getElementById(input_value),
							"Select Column Name ", -1)
					for (i = 0; i < len; i++) {
						var sno = i;
						var name = bR.getElementsByTagName("cname")[i].firstChild.nodeValue;
						addOption(document.getElementById(input_value), name,
								sno)
					}

				}
			}
		}
	} catch (e) {
		// TODO: handle exception
	}
}
