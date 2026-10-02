
var obj;




function req()
{
	
	try
	{
		
		if (window.XMLHttpRequest)
		{
			obj=new XMLHttpRequest();			
		}else if (window.ActiveXObject())
		{
			
			obj=new ActiveXObject("Microsoft.XMLHTTP");
		}
		
	}catch(e)
	{
		
	}
	return obj;
}

function val_set()
{
	var http=createObject();
	if (document.getElementById("whe").checked)
	{
		try
		{
			var tab=document.getElementById("tab").value;
			 var row=parseInt(document.getElementById('rowcnt').value)+1;
		 	 document.getElementById('rowcnt').value=row;
			var column=document.getElementById("tab2").options[document.getElementById("tab2").selectedIndex].value;
			var url=""; 
			url = "../entry_help?table="+tab+"&column="+column+"&option=16"; 
			
			http.open("GET", url, true);	   
			http.onreadystatechange = function() 
			{ 
				set_value(http,row,column);
			} 
		}catch(e) {
		}
		http.send(null);    
	}
}


function set_value(http,rowcnt,column)
{
	
	 
		var bR= http.responseXML.getElementsByTagName("response")[0];
	if (http.readyState==4)  
	{
		if (http.status==200)
		{
			var cond_combo=document.getElementById("cond_select").innerHTML;		 
			 document.getElementById("cond_select").innerHTML="";
			
			document.getElementById("cond_select").innerHTML=cond_combo+"<br><input type='text' id='wc"+rowcnt+"' value="+column+" class='tb3'><select class='select' id='colum"+rowcnt+"' name='colum"+rowcnt+"'><option='0'>select</option></select><select  class='select' id='conj"+rowcnt+"'><option value='1'>And</option><option value='2'>OR</option></select>";
			var len2 = bR.getElementsByTagName("column").length;
			var hgt2 = len2*20+"px";   
			addOption2("0", "Select",document.getElementById("colum"+rowcnt)); 
			for (var j = 0; j < len2; j++)   
			{ 			 
				var nname = bR.getElementsByTagName("column")[j].firstChild.nodeValue;
				addOption2(nname, nname,document.getElementById("colum"+rowcnt)); 
			}   
			
		}   
		
	}
	

}
function addOption2(val, select)
{
	  var option = document.createElement('option');
	  option.value = val;
	  option.innerHTML = val;
	  select.appendChild(option);
}
function addOption2(val,val1, select)
{
	  var option = document.createElement('option');
	  option.value = val;
	  option.innerHTML = val1;
	  select.appendChild(option);
}
