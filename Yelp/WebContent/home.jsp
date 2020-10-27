<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<style type="text/css">
table {
	font-size: 30px;
}
div {
	width: 1200px;
	display:inline;
}

body {
	background-color:#FFAC55;
}

h1.header {
	font-size: 30px;
	color: black;
	text-align: center;
}

p {
	color: red;
	font-family: fantasy;
	font-size: 20px;
}

MENU {
      width: 720px;
	  margin:0 auto;
  } 
  
  ul{
	  list-style-type: none;
	  margin: 0;
 }
  
  li a{
	 width: 16px;
	 height: 31px;
	 text-align: center;
	 color: white;
	 font-family: Arial, Helvetica, sans-serif;
	 text-decoration: none;
	 font-size: 24px;
  }
  
  .myButton {
	background-color:#44c767;
	-moz-border-radius:28px;
	-webkit-border-radius:28px;
	border-radius:28px;
	border:1px solid #18ab29;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:17px;
	padding:16px 31px;
	margin-right:315px;
	text-decoration:none;
	text-shadow:0px 1px 0px #2f6627;
}
.myButton:hover {
	background-color:#5cbf2a;
}
.myButton:active {
	position:relative;
	top:1px;
}
</style>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">

<title>旅遊網</title>
</head>
<body>
	<div><a><img src="taiwan2.jpg" alt="taiwan2"></a>
		<a><img src="taiwan1.jpg" alt="taiwan2"></a>
		<a><img src="taiwan3.jpg" alt="taiwan2"></a>
	</div>
	<div class="title" width="1200" id="MENU">
		<ul>
			<li class="myButton" float="left">
				<a href="Json.do" target="Json.do" title="">店家</a>
			</li>
			<li class="myButton" float="center">
				<a href="View.jsp" target="json.do"title="">景點</a> 
			</li>
			<li class="myButton" float="right">
				<a href="News.jsp" target="json.do" title="">活動</a>
			</li>
		</ul>
	</div></br>
	
</body>
</html>