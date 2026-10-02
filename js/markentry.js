

var http2 = createObject();
function markdview(process) {

	var flag = document.getElementById("flag").value;
	
	var btc = document.getElementById("btc").value;
	var slno = document.getElementById("sno").value;

	var flag_2 = 0;    
	var url = "./../viewserv?no=0&option=" + process + "&btc=" + btc + "&slno="+ slno+"&abc="+Math.random() ;  
 
	var flag = document.getElementById('flag').value;
	var sno = document.getElementById('sno').value;
	 
	url += "&slno=" + slno + "&sno=" + sno ;
	http2.open("GET", url, true);     
	if (process == 11) {
		var btc_v = document.getElementById('btc').value;
		document.getElementById("btc_v").innerHTML = btc_v;
		http2.onreadystatechange = function() {
			markdviewview_process(http2, 0,   process);
		}
		
		http2.send(null);
     
	}          

}
function markdviewview_process(xmlobj, htno,   process) {
	var row = 0;
	try {

		if (xmlobj.readyState == 4) {

			if (xmlobj.status == 200) {
				markviewfinal(xmlobj, process);

			}  
		}
	} catch (e) {
	}
}
function markviewfinal(xmlobj, process) {
	if (process == 11) {
		var tbody = document.getElementById("recp");
		var t = 0;
		var bR = xmlobj.responseXML.getElementsByTagName("response")[0];
		var len = bR.getElementsByTagName("htno").length;
		// document.getElementById('nstno').innerHTML="";
		for (t = tbody.rows.length - 1; t >= 0; t--) {
			tbody.deleteRow(0);
		}
		var i = 0;
		var hnew_row = cell("TR", "", "", "mrow" + (i + 1), (i + 1), 2, "", "",
				"", "", "", "");
		var hhtno1_cell = cell("TD", "label", "", "", "H.T No", 7, "tdText",
				"", "", "", "center", "", "");
		var hname_cell = cell("TD", "label", "", "", "Name", 7, "tdText", "",
				"", "", "center", "", "");
		var hBname_cell = cell("TD", "label", "", "", "Batch", 7, "tdText", "",
				"", "", "center", "", "");
		var hSeatNo_cell = cell("TD", "label", "", "", "SNo", 7, "tdText", "",
				"", "", "center", "", "");

		var ActualMark_cell = cell("TD", "label", "", "", "A.M", 7, "tdText",
				"", "", "", "center", "", "");
		var Bonus_Mark_cell = cell("TD", "label", "", "", "B.M", 7, "tdText",
				"", "", "", "center", "", "");
		var TotalMark_cell = cell("TD", "label", "", "", "Tot", 7, "tdText",
				"", "", "", "center", "", "");
		try {
			hnew_row.appendChild(hBname_cell);
			hnew_row.appendChild(hSeatNo_cell);
			
			hnew_row.appendChild(hhtno1_cell);
			hnew_row.appendChild(hname_cell);  
			
			
			hnew_row.appendChild(ActualMark_cell);
			hnew_row.appendChild(Bonus_Mark_cell);
			hnew_row.appendChild(TotalMark_cell);

			tbody.appendChild(hnew_row);
			 
		} catch (e) {
		} 

		for (i = 0; i < len; i++) {
			var new_row = cell("TR", "", "", "mrow" + (i + 1), (i + 1), 2, "",
					"", "", "", "", "");
			var htno1 = bR.getElementsByTagName("htno")[i].firstChild.nodeValue;
			var htno1_cell = cell("TD", "label", "", "", htno1, 7, "tdText",
					"", "", "", "left", "", "");

			var name = bR.getElementsByTagName("name")[i].firstChild.nodeValue;
			var name_cell = cell("TD", "label", "", "", name, 7, "tdText", "",
					"", "", "left", "", "");

			var Bname = bR.getElementsByTagName("Bname")[i].firstChild.nodeValue;
			var Bname_cell = cell("TD", "label", "", "", Bname, 7, "tdText",
					"", "", "", "left", "", "");

			var SeatNo = bR.getElementsByTagName("SeatNo")[i].firstChild.nodeValue;
			var SeatNo_cell = cell("TD", "label", "", "", SeatNo, 7, "tdText",
					"", "", "", "left", "", "");

			var ActualMark = bR.getElementsByTagName("ActualMark")[i].firstChild.nodeValue;
			var ActualMark_cell = cell("TD", "label", "", "", ActualMark, 7,
					"tdText", "", "", "", "left", "", "");

			var Bonus_Mark = bR.getElementsByTagName("Bonus_Mark")[i].firstChild.nodeValue;
			var Bonus_Mark_cell = cell("TD", "label", "", "", Bonus_Mark, 7,
					"tdText", "", "", "", "left", "", "");

			var TotalMark = bR.getElementsByTagName("TotalMark")[i].firstChild.nodeValue;
			var TotalMark_cell = cell("TD", "label", "", "", TotalMark, 7,
					"tdText", "", "", "", "left", "", "");
			new_row.appendChild(Bname_cell);
			new_row.appendChild(SeatNo_cell);
			
			new_row.appendChild(htno1_cell);
			new_row.appendChild(name_cell);
			
		

			new_row.appendChild(ActualMark_cell);
			new_row.appendChild(Bonus_Mark_cell);
			new_row.appendChild(TotalMark_cell);

			tbody.appendChild(new_row);
		}

		document.getElementById('sno').focus();  
	}
}

