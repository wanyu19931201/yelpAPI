<%@ page errorPage="errorPage.jsp"%>
<%@page import="java.util.*" import="org.json.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<style type="text/css">
<!--
body {
	background-color: #D6D7D6;
	font-size: 12px;
}
-->
h3{
	display: block;
	font-size: 18px;
	font-weight: bold;
	text-indent: 40px;
	height: 25px;
	width: 513px;
	background-image: url(bar.gif);
	padding-top: 12px;
}
.text{
text-indent: 40px;
}
</style></head>
<style type="text/css">
searchNews1 { /*----最新消息搜尋-----*/
	float: left;
	font-size : 20;
	display: block;
	width: 100%;
	overflow: hidden;
	margin-bottom: 23px;
	border-bottom: 1px #e7e7e7 solid;
	color : blue;
}

body {
	position: absolute;
	left: 15%;
	background-color: #FFAC55;
	text-decoration:none;
}
a{
text-decoration:none;
}
</style>
<script>
	var activityData = new XMLHttpRequest();
	activityData.open('GET', '/Yelp/view.txt');
	var activityDataText;
	var activityDataRow;
	var activityDataLength;

	function filterSearch() {
		var x = document.getElementById("region").selectedIndex;
		//alert(document.getElementsByTagName("option")[x].value);
		document.getElementById("newsDisplay").innerHTML = "";
		for (var i = 0; i < activityDataLength; i++) {
			//window.alert(activityDataLength);
			if (document.getElementsByTagName("option")[x].innerHTML == activityDataRow[i]
					.split(" ")[0]) {

				document.getElementById("newsDisplay").innerHTML += "<h3> "
				        + activityDataRow[i].split(" ")[0] + "  "
						+ activityDataRow[i].split(" ")[1] + "\t</h3><br>" 
						+ activityDataRow[i].split(" ")[2] + "<br>"
						+ activityDataRow[i].split(" ")[3] + "<br>"
						+ activityDataRow[i].split(" ")[4] + "<br>"
						+ activityDataRow[i].split(" ")[5] + "<br><br>"
			}
		}
	}

	activityData.onreadystatechange = function() {
		//alert(activityData.responseText);
		var x = document.getElementById("region").selectedIndex;
		document.getElementById("newsDisplay").innerHTML = "";
		activityDataRow = ((activityData.responseText).split("\n"));
		activityDataText = activityData.responseText;
		activityDataLength = activityDataRow.length;
		for (var i = 0; i < activityDataLength; i++) {
			//window.alert(activityDataLength);
			if (document.getElementsByTagName("option")[x].innerHTML == activityDataRow[i]
					.split(" ")[0]) {
				document.getElementById("newsDisplay").innerHTML += " <h3> "
						+ activityDataRow[i].split(" ")[0] + "  "
						+ activityDataRow[i].split(" ")[1] + "\t</h3><br>" 
						+ activityDataRow[i].split(" ")[2] + "<br>"
						+ activityDataRow[i].split(" ")[3] + "<br>"
						+ activityDataRow[i].split(" ")[4] + "<br>"
						+ activityDataRow[i].split(" ")[5] + "<br><br>"
			}
		}
	}
	activityData.send();
</script>
</head>
<body>
	<%
		request.setAttribute("type", "景點");
	%>
	<jsp:include page="header.jsp">
		<jsp:param name="a" value="1" />
	</jsp:include>
	<searchNews1> <br>
	<br>
	<form method="POST">
		<select name="location" id="region">
			<option value="keelung">基隆</option>
			<option value="taipei">台北</option>
			<option value="newtaipei">新北</option>
			<option value="taoyuan">桃園</option>
			<option value="hsinchu">新竹</option>
			<option value="miaoli">苗栗</option>
			<option value="taichung">台中</option>
			<option value="changhua">彰化</option>
			<option value="nantou">南投</option>
			<option value="yunlin">雲林</option>
			<option value="chiayi">嘉義</option>
			<option value="tainan">台南</option>
			<option value="kaohsiung">高雄</option>
			<option value="pintung">屏東</option>
			<option value="I-LAN">宜蘭</option>
			<option value="hualien">花蓮</option>
			<option value="taitung">台東</option>
			<option value="penghu">澎湖</option>
			<option value="kinmen">金門</option>
			<option value="lienchiang">連江</option>
		</select> <input name="submit" type="button" value="搜尋"
			onclick="filterSearch()">
	</searchNews1>
	</form>
	<span style="white-space: pre;"></span>
	<div id="newsDisplay" style="white-space: pre;"></div>
</body>
</html>