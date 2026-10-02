 /*
  * major - TR,TD,
  * item - input ,label
  * type -  text,redio,check
  * name -  item name
  * value -  display value
  * size  -  size of control
  * sclass - style class
  * url    - linked url 
  * style -  user writed style
  * tdwidth - td width
  * tdalign -  td align
  * funtype - function type (event)
  * funname - function name if (more then one user comma sepearated)
 
  */
 
var src="";
function value_process(id,msg)
{
	  var strname=document.getElementById(id).value;
	  if (strname=="" || strname==0)
	  {
		  alert(" Please Type/Select value of " + msg);
		  return false;
	  }
	  else
	  {
		  return true;
	  }
}
function cell(major,item,type,name,value,size,sclass,url,style,tdwidth,tdalign,funtype,funname)
 {  
	var name_cell=document.createElement(major);
    if (major=="TR")
    {
    name_cell.setAttribute("id", name);
    name_cell.setAttribute("style", style);
    name_cell.setAttribute("class", sclass);
   
    }
	
	
	
	
	
	if (major=="TD")
    {
	name_cell.setAttribute("align",tdalign);
    name_cell.setAttribute("width",tdwidth); 
    name_cell.setAttribute("style", style); 
    name_cell.setAttribute("class", sclass);
    
    var name_label=document.createElement(item);  //label,text,combo
   
    if (window.navigator.appName.toLowerCase().indexOf("netscape") == -1)
    {
    	   
    		if (item=="div")
    		{
    			name_label=document.createElement("<DIV id='"+name+"' name='"+name+"' style='"+style+"' class='"+sclass+"' >"+value+"</div>");
    			
    			
    		}else  if (item=="select")
			{
		    	var fun1="";
		    	if (funtype!="")
		    		fun1= funtype+"='"+funname+"'";
          		  else
          			fun1="";	
		    		
			name_label=document.createElement("<SELECT id='"+name+"' name='"+name+"' style='"+style+"' class='"+sclass+"'  "+fun1+" >");
			name_label.setAttribute("id", name)
			name_label.setAttribute("name", name)
 			var optn1 = document.createElement("OPTION");
			theText=document.createTextNode("Yes");
			optn1.appendChild(theText);
			optn1.setAttribute("value","Y");
			
			if (value=="Yes") 
		    optn1.setAttribute("selected ","1");
			name_label.appendChild(optn1);
		    var optn2 = document.createElement("OPTION");	
		    theText=document.createTextNode("No");
		    optn2.appendChild(theText);
		    optn2.setAttribute("value","N");
		    if (value=="No")
		    optn2.setAttribute("selected","1");
		    name_label.appendChild(optn2);
		    name_cell.appendChild(name_label);
		    }   
		    if (item=="span" )
	           {
	           name_label=document.createElement("<span id='"+name+"' name='"+name+"' style='"+style+"' class='"+sclass+"'></span>");
	           
	           name_label.innerHTML=""+value+"";            		 
 	           name_cell.appendChild(name_label);
	              }
		    try
      	  {  
		    var fun="";
  		  if (funtype!="")
            fun= funtype+"="+funname+"";
  		  else
  			  fun="";
  		  var fs="";
  		    var fun_type=funtype.split("#");
            var fun_name=funname.split("#");
            
      	  var len=fun_type.length;
      	  
      	  if (funtype!="")
      	  {
      		  for (var i=0;i<len;i++)
      		  {
      			 
      			  fs+=fun_type[i]+"="+fun_name[i]+"   ";
      		  } 
      		  
      	  }
      	  }catch(e) {}
		    		if (item=="label" )
		    		{
        	    
		    		  name_label=document.createElement("<label id='"+name+"'  name='"+name+"' style='"+style+"' class='"+sclass+"' "+fs+" >");
		    		  name_label.innerHTML=""+value+"";            		 
            		  name_cell.appendChild(name_label);
		    		}
            	  else if(item=="input")
            	  {
            		  
            		  
            		  
            		 
            		 
            		if (type=="checkbox" || type=="radio")  {          			 
            		    name_label=document.createElement("<INPUT type="+type+" id='"+name+"' name='"+name+"'  size='"+size+"' style='"+style+"'   class='"+sclass+"' "+fs+" "+url+">");
            		}
            		else if (type=="text")
            		{ 
            			 
            			    			name_label=document.createElement("<INPUT type='"+type+"' id='"+name+"' value='"+value+"' name='"+name+"'    style='"+style+"'   class='"+sclass+"' "+fs+" >");
            			    		
            		}
            		else
            		{	
            			
            			name_label=document.createElement("<INPUT type="+type+" id='"+name+"' value='"+value+"' name='"+name+"' size='"+size+"' style='"+style+"'   class='"+sclass+"' "+fs+" >");
            		}
            		
            		 
            		  
             		  if(type!="hidden")
            		  name_cell.appendChild(name_label);
            		  else
            		  name_cell=name_label;
            		  
            		  
            		  
            		  
            	  }else if (item=="A")
                  {
            		  
            		  var name_label =document.createElement("<A href="+url+" id='"+name+"' name='"+name+"'  size='"+size+"'   class='"+sclass+"'  "+fun+" >"+value+"</a>");
            		//  var name_label=document.createElement("A");
                     // var url=url;
                    //  name_label.href=url;
            		  	
                       var edit=document.createTextNode(value);
                       name_label.appendChild(edit);
            		  
        	  		  name_cell.appendChild(name_label);
                  }
            	  
            	  	 
            	  	
            	  	  
              }else if (item=="div")
         	 {
            	  
         		 name_label=document.createElement("DIV");
         		 name_label.setAttribute("id", name)
              	 name_label.setAttribute("name", name)
              	  
              	 name_label.innerHTML=value;
         		 
         		 name_cell.appendChild(name_label);
         		 
         	 }  
              else
              {	 
            	 if (item=="select")
              	 {
            		 	
                 	 name_label=document.createElement("SELECT");
                 	 name_label.setAttribute("id", name)
                 	 name_label.setAttribute("name", name)
                 	  name_label.setAttribute(funtype, funname);
                 	
                 	 
                 	 
                 	 var optn = document.createElement("OPTION");
              	     	 optn.text = "Yes";
              	     	 optn.value = "Y";
              	     	 
              	     	if (value=="Yes")
                  	    optn.setAttribute("selected","1");	     
              	     	 
              	     	name_label.options.add(optn);     
              	                  	     	
              	 	 var optn2 = document.createElement("OPTION");
              	 	 	 optn2.text = "No";
              	 	 	 optn2.value = "N";
              	 	 	 
              	 	 	if (value=="No")
              	 	 	optn2.setAttribute("selected","1");	
              	 	 	 
              	 	 	name_label.options.add(optn2);              	 	 	 
              		    name_cell.appendChild(name_label);            		
              	} else         		
              	{  
            	  
            	  if (type!="label")
            	  name_label.setAttribute("type",type);
            	 
            	  name_label.setAttribute("value",value);
            	  name_label.setAttribute("name", name);
            	  name_label.setAttribute("id", name);
            	  name_label.setAttribute("size",size);
            	  name_label.setAttribute("class",sclass);
            	  name_label.setAttribute("style",style);
            	  
            	 
            	   
            	  
            	  if (type=="checkbox") 
            	  { 
            		   
            		  if (value=='y')
            			  name_label.checked = true; 	  
            		  else
            			  name_label.checked = false;;
            	  }
                  
            	  try
            	  {
                  var fun_type=funtype.split("#");
                  var fun_name=funname.split("#");
                  
            	  var len=fun_type.length;
                  
            	  if (funtype!="")
            	  {
            		  for (var i=0;i<len;i++)
            		  {
            			 
            		     name_label.setAttribute(fun_type[i], fun_name[i]);
            		  }
            		  
            	  }
            	  
            	  }catch(e) {}
            	  
            	  if (item=="A")
                  {
            		     
            		  name_label.href=url;
                      name_label.setAttribute("class",sclass);
                  }
            	  
            		  
            	  
                  var name_data=document.createTextNode(value);//value
                  name_label.appendChild(name_data);
            	  
            	 
                  
                  if(type!="hidden")
            		  name_cell.appendChild(name_label);
            		  else
            		  name_cell=name_label
                  
                  
              	}
              }
              
              
            } 
		       
              return name_cell;
 }
 function createObject()
{	    
	
	try
	{
		var xmlhttp;
		try
		{
			 
			if (window.XMLHttpRequest) {

				xmlhttp = new XMLHttpRequest();
			}
		}catch(e)
		{

		    
			xmlhttp =   ActiveXObject("MSXML2.XMLHTTP.3.0");
		   
		}

		return xmlhttp;

	}catch(e)
	{
		alert("XML Object Not Created\n--------------------------")
	}
	

	
}
function addOption(selectbox,text,value)
{  
	 
	try
	{
			var optn = document.createElement("OPTION");
			optn.text = text;
			optn.value = value;
			if (this.src=='ob')
			{
				if (selectbox.id=="year")
				{
					 var d=new Date();
					 var cy=d.getFullYear();
					 var cm=d.getMonth()+1;
					 
					 
					if (value==parseInt(cy))
					{
							if ( parseInt(cm) <=3)
							{
								
								
							}	
						
					optn.selected=1;
					}
					
				}
				if (selectbox.id=="month")
				{
					if (value=="4")
					optn.selected=1;
				}
			}
			
			selectbox.options.add(optn);
	}catch(e)
	{
			alert("Option Creation Have Problem\n-------------------------------------")
		
	}
}





function monthselect(i)
{
	var month =new Array("Select","Jan","Feb","Mar","Apr","May","Jun","July","Aug","Sep","Oct","Nov","Dec");	
return month[i];
}
function month(smonth,src)
{
var d=new Date();
var cm=d.getMonth()+1;
this.src=src;
var month =new Array("-select month-","Jan","Feb","Mar","Apr","May","Jun","July","Aug","Sep","Oct","Nov","Dec");	
for (i=0;i<month.length;i++)
{
	var sno =i;
    var name =month[i];
    addOption(document.getElementById(smonth),name,sno)
}
}

function year(year,src)
{
	this.src=src;
	var year_v1 =new Array("-select year-","2009","2010");	
	var year_v =new Array("-select year-","2009-2010","2010-2011");
	 
	 
 	for (i=0;i<year_v.length;i++)
	{
		
		var sno=year_v1[i];
		var name =year_v1[i]
	
		addOption(document.getElementById(year),name,sno)
}
}
function fld_clr(name)
{
	 
	document.getElementById(name).value="";
	 
}

function combo_sel_value(in_id,out_id)
{
	
	 var sel_value_res=document.getElementById(in_id).options[document.getElementById(in_id).selectedIndex].text;
 	 document.getElementById(out_id).value=sel_value_res;
}
function notzero(id)
{
	val="";
	try
	{
		var val=parseInt(document.getElementById(id).value);
		
	}catch(e) {
		
		val=0;
	}
	if (val==0)
	{
		
		alert("This Filed Not Allowed Zero");
		 document.getElementById(id).value="";	        
         document.getElementById(id).focus();
	}
}
function IsNumeric(inputVal,sErrorMsgvar,event) {
	
	
    var s=event.keyCode;
    
    var smsg=sErrorMsgvar.split('#');
    var sErrorMsg=smsg[0];
     
    	
	    if (inputVal=="") inputVal=0;
	   // if ((s >=96 && s <=105) || (s>=48 && s <=57) || (s==8)   )
	  //  {
	    	
		    if (isNaN(parseInt(inputVal))) {
		          alert(sErrorMsg);
		        // msgload(sErrorMsg,1);
		         document.getElementById(smsg[1]).value="";
	        
		         document.getElementById(smsg[1]).focus();
		         return false;
		    }else
		    {
	 
	    
		 
		return true;
		
}
	
	
   
	
}

function comboRemove(id){
	document.getElementById(id).length = 0;
}

function vTest(a)
{
alert("TESTING\n====================\n"+a)	
}
 
function isInteger(s,dig,event)
{ 
       
       var i;
	  s = s.value.toString();
	  var ss="";
	  
      for (i = 0; i < s.length; i++)
      {
       var c = s.charAt(i);
      
       if (c=='.')
       {
    	   ss+=c;
       }else if (c=='-')
       { 
    	   ss+=c;
       }else
    	   {
	    	   if (isNaN(c)) 
	    	   	   {
	    		   msgload("Given values is not a number  \n Remove the Character by Mouse Click", 1);
	    		   //alert(" Given values is not a number  \n Remove the Character by Mouse Click");
	    		   s.value="";
	    		   return 	false;
	    	   	   }
	    	   else
	    	   {
	    		   ss+=c;
	    	   
	    	   }
    	   }
       
      }
      
      
      return true;
    /* 
	
	var unicode=event.charCode? event.charCode : event.keyCode;
	
		if (unicode!=8 && unicode!=9 && unicode!=37 && unicode!=39 && unicode!=46)
    {
         if (unicode<48 || unicode>57 || txt.length>=dig)
            return false;
    }
		 */
}
function isChar(s,dig,event)
{ 
       var prv="";
       var i;
	  s = s.value.toString();
	  var ss="";
	  
	  var cr=event.keyCode;
	 
	  if ((cr>=65 && cr <=90) || cr==190 || (cr==8) ||  (cr==13)||  (cr==32)||  (cr==16)||  (cr==20))
	  {
									  for (i = 0; i < s.length; i++)
									  {
							       var c = s.charAt(i);
							       
							       if (c==' ')
							       {
							    	   
							    	   ss+=c;
							       }else if (c=='.')
							       {
							    	   ss+=c;
							    	   prv=ss;
							       }else if (c=='-')
							       { 
							    	   ss+=c;
							    	   prv=ss;
							       }else
							    	   {
							    	   
								    	   if (isNaN(c)) 
								    	   	   {
								    		   
								    		   ss+=c;
								    		   prv=ss;	   
								    	   	   }
								    	   else
								    	   {
								    		 
								    		   alert(" Given values is not a Chars  \n Remove the Number by Mouse Click");
								    		   s.value=""
								    		   s.value=prv;
								    		   
								    		   return 	false;
								    	   }
							    	   }
							       
				      }
      
	  }
	  else
		  
	  {
		  
		  s.value=""; 
		  alert("Enter Characters Only");
		  
		 
		  
		  return 	false;
	  }
	  
      return true;
}
function CharOnly(id,dig,event)
{ 
       var prv="";
       var i;
     
      var s=document.getElementById(id);
     
	  s = s.value.toString().toUpperCase();
	  
	  var ss="";
	  document.getElementById(id).value=s.toUpperCase();    
	  var cr=event.keyCode;     
	 
	  if ((cr>=65 && cr <=90) || cr==190 || (cr==8) || (cr==38)|| (cr==39)|| (cr==13)||  (cr==32)||  (cr==16)||  (cr==20))
	  {
									  for (i = 0; i < s.length; i++)
									  {
							       var c = s.charAt(i);
							       
							       if (c==' ')
							       {
							    	   
							    	   ss+=c;
							       }else if (c=='.')
							       {
							    	   ss+=c;
							    	   prv=ss;
							       }else if (c=='-')
							       { 
							    	   ss+=c;
							    	   prv=ss;
							       }else
							    	   {
							    	   
								    	   if (isNaN(c)) 
								    	   	   {
								    		   
								    		   ss+=c;
								    		   prv=ss;	   
								    	   	   }
								    	   else
								    	   {
								    		 
								    		   alert(" Given values is not a Chars  \n Remove the Number by Mouse Click");
								    		   s.value=""
								    		   s.value=prv;
								    		   
								    		   return 	false;
								    	   }
							    	   }
							       
				      }
      
	  }
	  else
		  
	  {
		  
		  document.getElementById(id).value="";   
		  alert("Enter Characters Only");
		  
		 
		  
		  return 	false;
	  }
	  
      return true;
}
function dec(input) 
{
	 var input=new String(input);
	 
		
	if (input=="0.0" || input=="") input="0";
	var d3=new Packages.java.text.DecimalFormat("0.00");
	
	var res=d3.format(input);
	
	
	return (res)
	
}
	


function flash()
{	 
	pr_status()
}
function pr_status()
{
	 
	var first=document.getElementById("pr_status").value;
	if (first==0)
	{
	document.getElementById("msg").innerHTML="<font size=2 color='red'>Processing <img src='../../../../../images/circle.gif'></font>";
	
	}
	else
	{
		document.getElementById("msg").innerHTML="";
	}
	setTimeout("pr_status()",1);
}

function msgload(m,f) {
	
	 
	newWindow("","../process/alert_msg.jsp?msg="+m+"&flag="+f,300,150,1)
	//var s=window.open('alert_msg.jsp','mywindow','width=400,height=200,scrollbars=no,resizable=no');
	//s.window.resizeTo(100,200)
//	var s=window.open("alert_msg.jsp","width=200,height=100'")
	
	
	
}

function newWindow(windowName, URL, width, height, scrolling) {
	width = width || 400;
	height = height || 360;
	scrolling = scrolling || 0;
	
	var topX = (window.screen.width / 2) - ( width / 2);
	var topY = (window.screen.height / 2) - ( height / 2);
	
	window.open(URL, windowName, 'width=' + width + ',height=' + height + ',toolbar=no,copyhistory=no,location=no,menubar=no,status=no,resizable=no,scrollbars=no,screenX=' + topX + ',screenY=' + topY);
}

function toUpper(id)
{ 
            
	var val=new String(id.value).toUpperCase();
	id.value="";
	id.value=val;
	
     
}