<%@ page errorPage="errorPage.jsp"%>
<%@page import="java.util.*" import="org.json.*"%>
<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">
table {
	border: 2;
	font-family: arial;
	font-size: 30px;
	align: center;
	border: 3px blue dashed;
}

body {
	position: absolute;
	left: 15%;
	background-color: #FFAC55;
}

a {
	font-size: 30px;
	color: BLUE;
	text-decoration: none;
}

p {
	color: red;
	font-family: fantasy;
	font-size: 20px;
}
</style>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<%
	//ob = (JSONObject) jsonArr.get(0);

	/*ArrayList<String> phone = new ArrayList<String>();
	ArrayList<String> image_url = new ArrayList<String>();
	ArrayList<String> name = new ArrayList<String>();
	ArrayList<String> rating_img_url_large = new ArrayList<String>();
	ArrayList<String> snippet_text = new ArrayList<String>();*/

	//phone = (ArrayList<String>) request.getAttribute("phone");
%>



<title>旅遊網--${type}</title>
</head>
<body>
	<jsp:include page="header.jsp">
		<jsp:param name="a" value="1" />
	</jsp:include>
	<form method="POST" action="Json.do">
		<select name="category_filter" value="hotpot">
			<option value="bbq">燒烤</option>
			<option value="hotpot">火鍋</option>
			<option value="breakfast_brunch">早午餐</option>
			<option value="cafes">咖啡</option>
			<option value="seafood">海鮮</option>
			<option value="sandwiches">三明治</option>
			<option value="hotelstravel">飯店</option>
			<option value="shopping">購物</option>
			
		</select> <select name="location">
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


		</select> <input name="submit" type="submit" />
	</form>

	<%
		JSONArray jsonArr = new JSONArray();
		jsonArr = (JSONArray) request.getAttribute("jsonArr");
		JSONObject ob = new JSONObject();
		String loc;
		System.out.println(jsonArr.length());
		for (int i = 0; i < jsonArr.length(); i++) {
			ob = (JSONObject) jsonArr.get(i);
			JSONObject address = (JSONObject) ob.get("location");
			JSONArray locArr = new JSONArray();
			locArr = (JSONArray) address.get("display_address");
			String city = address.getString("state_code");
			System.out.println(city);
			if (city.equals(request.getAttribute("location"))) {
	%>
	<br>
	<%
		try {
	%>
	<div style="lign: center">
		<a href=<%=ob.get("url")%>><%=ob.get("name")%> <img
			src=<%=ob.get("rating_img_url_large")%>
			style="text-decoration: none;"> </a>

		<table border="1">
			<tr>
				<td rowspan="2"><img src=<%=ob.get("image_url")%>></td>
				<td><%=ob.get("phone")%></td>
			</tr>
			<tr>
				<td><%=locArr.get(1) + "" + locArr.get(0)%></td>
			</tr>
			<%
				} catch (Exception e) {
			%>
			<%="無資料"%>
			<%
				}
			%>
			<%
				try {
			%>
			<tr>
				<td width="800" colspan="2"><%=ob.get("snippet_text")%> <a
					href=<%=ob.get("url")%> style="text-decoration: none;">readmore</a></td>
			</tr>
			<%
				} catch (Exception e) {
			%>
			<tr>
				<td width="800" colspan="2"><%="  目前沒有評價                                                                                     "%>
			</tr>



			<%
				}
			%>
		</table>
	</div>
	<%
		}
		}
	%>
	<br>
</body>
</html>