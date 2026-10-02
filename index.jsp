<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.Calendar,java.util.Date"%> 
<%@page import="java.text.SimpleDateFormat"%><html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
 <style type="text/css">
 html {
  margin: 0;
  height: 100%;
}

body {
  margin: 0;
  height: 100%;
  overflow: hidden;
  display: flex;
  justify-content: center;
  align-items: center;
  background: blue;
  color: #ccc;
  background-image: url("sky.jpeg");
}


html::before,
html::after,
body::before,
body::after {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  display: block;
  width: .5vmin;
  height: .5vmin;
  border-radius: 50%;
  color: transparent;
}

html::before {
  box-shadow: 93vw 63vh .3vmin rgba(255,255,255,.8),
              3vw 17vh .3vmin rgba(255,255,255,.8),
              28vw 85vh .3vmin rgba(255,255,255,.8),
              97vw 82vh .3vmin rgba(255,255,255,.8),
              55vw 83vh .3vmin rgba(255,255,255,.8),
              74vw 72vh .3vmin rgba(255,255,255,.8),
              84vw 11vh .3vmin rgba(255,255,255,.8),
              32vw 6vh .3vmin rgba(255,255,255,.8),
              45vw 92vh .3vmin rgba(255,255,255,.8),
              98vw 57vh .3vmin rgba(255,255,255,.8),
              63vw 98vh .3vmin rgba(255,255,255,.8),
              90vw 46vh .3vmin rgba(255,255,255,.8),
              50vw 86vh .3vmin rgba(255,255,255,.8),
              38vw 21vh .3vmin rgba(255,255,255,.8),
              74vw 2vh .3vmin rgba(255,255,255,.8),
              89vw 22vh .3vmin rgba(255,255,255,.8),
              39vw 0vh .3vmin rgba(255,255,255,.8),
              25vw 89vh .3vmin rgba(255,255,255,.8),
              54vw 58vh .3vmin rgba(255,255,255,.8),
              81vw 39vh .3vmin rgba(255,255,255,.8),
              51vw 8vh .3vmin rgba(255,255,255,.8),
              24vw 56vh .3vmin rgba(255,255,255,.8),
              50vw 23vh .3vmin rgba(255,255,255,.8),
              62vw 34vh .3vmin rgba(255,255,255,.8),
              10vw 77vh .3vmin rgba(255,255,255,.8),
              92vw 45vh .3vmin rgba(255,255,255,.8),
              70vw 40vh .3vmin rgba(255,255,255,.8),
              2vw 53vh .3vmin rgba(255,255,255,.8),
              3vw 54vh .3vmin rgba(255,255,255,.8),
              18vw 21vh .3vmin rgba(255,255,255,.8),
              48vw 47vh .3vmin rgba(255,255,255,.8),
              83vw 96vh .3vmin rgba(255,255,255,.8),
              26vw 32vh .3vmin rgba(255,255,255,.8),
              46vw 9vh .3vmin rgba(255,255,255,.8),
              2vw 13vh .3vmin rgba(255,255,255,.8),
              29vw 63vh .3vmin rgba(255,255,255,.8),
              17vw 90vh .3vmin rgba(255,255,255,.8),
              78vw 9vh .3vmin rgba(255,255,255,.8),
              15vw 39vh .3vmin rgba(255,255,255,.8),
              90vw 5vh .3vmin rgba(255,255,255,.8);
}

html::after { 
  box-shadow: 67vw 35vh .2vmin .1vmin rgba(255,200,200,.8),
              89vw 13vh .2vmin .1vmin rgba(255,200,200,.8),
              77vw 62vh .2vmin .1vmin rgba(255,200,200,.8),
              1vw 74vh .2vmin .1vmin rgba(255,200,200,.8),
              38vw 15vh .2vmin .1vmin rgba(255,200,200,.8),
              79vw 10vh .2vmin .1vmin rgba(255,200,200,.8),
              16vw 47vh .2vmin .1vmin rgba(255,200,200,.8),
              74vw 71vh .2vmin .1vmin rgba(255,200,200,.8),
              30vw 96vh .2vmin .1vmin rgba(255,200,200,.8),
              13vw 98vh .2vmin .1vmin rgba(255,200,200,.8),
              9vw 40vh .2vmin .1vmin rgba(255,200,200,.8),
              9vw 71vh .2vmin .1vmin rgba(255,200,200,.8),
              12vw 93vh .2vmin .1vmin rgba(255,200,200,.8),
              91vw 26vh .2vmin .1vmin rgba(255,200,200,.8),
              73vw 48vh .2vmin .1vmin rgba(255,200,200,.8),
              61vw 46vh .2vmin .1vmin rgba(255,200,200,.8),
              20vw 3vh .2vmin .1vmin rgba(255,200,200,.8),
              90vw 59vh .2vmin .1vmin rgba(255,200,200,.8),
              48vw 72vh .2vmin .1vmin rgba(255,200,200,.8),
              91vw 68vh .2vmin .1vmin rgba(255,200,200,.8);
}

body::before {
  box-shadow: 30vw 90vh .2vmin rgba(190,200,255,.9),
              93vw 64vh .2vmin rgba(190,200,255,.9),
              75vw 80vh .2vmin rgba(190,200,255,.9),
              37vw 24vh .2vmin rgba(190,200,255,.9),
              83vw 58vh .2vmin rgba(190,200,255,.9),
              12vw 36vh .2vmin rgba(190,200,255,.9),
              62vw 82vh .2vmin rgba(190,200,255,.9),
              87vw 91vh .2vmin rgba(190,200,255,.9),
              9vw 2vh .2vmin rgba(190,200,255,.9),
              99vw 46vh .2vmin rgba(190,200,255,.9),
              39vw 86vh .2vmin rgba(190,200,255,.9),
              48vw 42vh .2vmin rgba(190,200,255,.9),
              53vw 24vh .2vmin rgba(190,200,255,.9),
              63vw 42vh .2vmin rgba(190,200,255,.9),
              2vw 53vh .2vmin rgba(190,200,255,.9),
              67vw 11vh .2vmin rgba(190,200,255,.9),
              32vw 44vh .2vmin rgba(190,200,255,.9),
              0vw 82vh .2vmin rgba(190,200,255,.9),
              51vw 47vh .2vmin rgba(190,200,255,.9),
              74vw 30vh .2vmin rgba(190,200,255,.9);
}

body::after {
  box-shadow: 80vw 64vh .1vmin rgba(200,255,230,.7),
              32vw 45vh .1vmin rgba(200,255,230,.7),
              65vw 62vh .1vmin rgba(200,255,230,.7),
              22vw 55vh .1vmin rgba(200,255,230,.7),
              68vw 19vh .1vmin rgba(200,255,230,.7),
              54vw 34vh .1vmin rgba(200,255,230,.7),
              1vw 56vh .1vmin rgba(200,255,230,.7),
              95vw 1vh .1vmin rgba(200,255,230,.7),
              60vw 93vh .1vmin rgba(200,255,230,.7),
              14vw 82vh .1vmin rgba(200,255,230,.7),
              6vw 64vh .1vmin rgba(200,255,230,.7),
              19vw 12vh .1vmin rgba(200,255,230,.7),
              25vw 39vh .1vmin rgba(200,255,230,.7),
              21vw 36vh .1vmin rgba(200,255,230,.7),
              4vw 10vh .1vmin rgba(200,255,230,.7),
              85vw 70vh .1vmin rgba(200,255,230,.7),
              54vw 93vh .1vmin rgba(200,255,230,.7),
              9vw 46vh .1vmin rgba(200,255,230,.7),
              63vw 59vh .1vmin rgba(200,255,230,.7),
              48vw 28vh .1vmin rgba(200,255,230,.7);
}

h1 {
  margin: 0;
  height: 12vmin;
  width: 120vmin;
  display: flex;
  justify-content: center;
  position: relative;
}

h1::before {
  content: "";
  display: block;
  position: absolute;
  z-index: -1;
  top: -26vmin;
  left: 29vmin;
  width: 62vmin;
  height: 62vmin;
  border-radius: 50%;
  border: 1.3vmin solid currentColor;
  box-sizing: border-box;
}

em {
  font-family: 'Josefin Sans', sans-serif;
  color: currentColor;
  font-size: 15vmin;
  position: relative;
  font-style: normal;
  width: 20vmin;
  text-align: center;
}

em.planet {
  -webkit-animation: planet-rotate 4s linear infinite;
  animation: planet-rotate 4s linear infinite;
  position: relative;
}

em.planet::before {
  content: "";
  position: absolute;
  top: -.5vmin;
  left: 3.5vmin;
  z-index: -1;
  width: 13vmin;
  height: 13vmin;
  border-radius: 50%;
  background: black;
}

em.planet.left {
  -webkit-transform-origin: 40vmin 5vmin;
  transform-origin: 40vmin 5vmin;
}

em.planet.right {
  -webkit-transform-origin: -20vmin 5vmin;
  transform-origin: -20vmin 5vmin;
}

@-webkit-keyframes planet-rotate {
  to {
    -webkit-transform: rotate(1turn);
  }
}

@keyframes planet-rotate {
  to {
    transform: rotate(1turn);
  }
}

#divan
{	
	position:   fixed; float: left; top: 259px; left: -10px; padding-top: 1px; margin-top: 2px;
 
} 
 </style>
 <link rel="stylesheet" type="text/css" href="./css/home.css" />
<link rel="stylesheet" type="text/css" href="./css/txtbox.css" />
<script type="text/javascript" src="./js/login.js"></script>
 <script type="text/javascript" src="js/cellcreate.js"></script>
<script type="text/javascript">

function set()
{
	
}
function txthide()
{
	document.getElementById("uname").value="";
}
function txthide3()
{
	 document.getElementById("password").value="";
	 
}
function txthide1()
{
	
	var v=document.getElementById("uname").value;
	if (v=="")
	document.getElementById("uname").value="Enter Your User Name";
}
function txthide2()
{
 	replaceT2(document.getElementById("password"))
  
try
{	
	var v=document.getElementById("password").value;
	var newO=document.getElementById("password");
	 
	if (v=="")    
	{
    	if (newO.type=="password")
		{
	    		document.getElementById("ps").innerHTML="";
				var txt="<input type='text'  class='tb_long' id='password' name='password' onblur='txthide2()' onclick='txthide3()'>";		
				document.getElementById("ps").innerHTML=txt;
		}
	document.getElementById("password").value="Enter Your Password";
	}
}catch(e) 
{
	 
}
}

function fls()
{  
   			document.getElementById("ps").innerHTML="";
			var txt="<input type='password' size='34'  class='tb_long' id='password'  name='password'  onblur='txthide2()' onclick='txthide3()'>";		
			document.getElementById("ps").innerHTML=txt;
			document.getElementById("password").focus=true;
	 

}
function textshow()
{
	document.getElementById("uname").value="Enter Your User Name";
	document.getElementById("password").value="Enter Your Password";
}
function cls()
{
	document.getElementById("uname").value="";
	document.getElementById("password").value="";

}
</script>
<script language="JavaScript">

function replaceT(obj) 
{
	try
	{
        var newO = document.createElement("input");
        newO.setAttribute('type', 'password');     
        newO.setAttribute('id', 'password');  
        newO.setAttribute('onblur', 'txthide2()');                   
        newO.setAttribute('onclick', 'txthide3()');
        obj.parentNode.replaceChild(newO, obj);
     }catch(e) {
     	 
     }     
    } 
function replaceT2(obj) 
{
 		  if (newO.type!="password")
        {  
			var txt=" <input type='text' class='tb_long'  id='password' name='password' onblur='txthide2()' "+"/>";		 
			document.getElementById("ps").innerHTML="";
			document.getElementById("ps").innerHTML=txt;
		}  
    }   


function cls2(a)
{
	a.value="";
}
</script>
</head> 
 
<body onload="textshow()" topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0"  >
 <%
	Calendar cal = Calendar.getInstance();
	int mm = cal.get(Calendar.MONTH) + 1;
	int dd = cal.get(Calendar.DAY_OF_MONTH);
	int yy = cal.get(Calendar.YEAR);
	String date = dd + "/" + mm + "/" + yy;
	
	SimpleDateFormat d=new SimpleDateFormat("dd/MM/yyyy HH:MM:SS");
	
 %><div id="divan">   <h1>
  <em></em>
  <em class="planet left">P<sup><font size="6">2</font></sup></em>
  <em>  &nbsp;<b>CSC</b></em>
  <em></em>
  <em class="planet right">C</em>
  <em></em>
</h1></div>
   
 

	<div id="divB">

		<div id="login">
			<div class="title">
				<h2>LOGIN</h2>
			</div>
			<div class="thead">
				<br>
				<br> <input type="text" class="user" name="uname" id="uname"
					onclick="cls2(this)"> <input type="password"
					name="password" id="password" class="pass" onclick="cls2(this)">
				<div>
					<button class="metal radial" onclick="login()" name="play_button"
						id="play_button">
						<i class="icon-lock"></i><font size=3>Click</font>
					</button>
					<div id="apDiv612">
						<a href="./master/staff.jsp"> <font size=1><b><img
									border=0 height="15" src="./images/reghere.jpg"></b></font></a>
					</div>
				</div>


			</div>
		</div>
		<div></div>

	</div>

	 
</body>
 
</html>