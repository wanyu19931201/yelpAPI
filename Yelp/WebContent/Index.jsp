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



<title>�ȹC��--${type}</title>
</head>
<body>
	<jsp:include page="header.jsp">
		<jsp:param name="a" value="1" />
	</jsp:include>
	<form method="POST" action="Json.do">
		<select name="category_filter" value="hotpot">
			<option value="bbq">�N�N</option>
			<option value="hotpot">����</option>
			<option value="breakfast_brunch">�����\</option>
			<option value="cafes">�@��</option>
			<option value="seafood">���A</option>
			<option value="sandwiches">�T���v</option>
			<option value="hotelstravel">����</option>
			<option value="shopping">�ʪ�</option>
			
		</select> <select name="location">
			<option value="keelung">��</option>
			<option value="taipei">�x�_</option>
			<option value="newtaipei">�s�_</option>
			<option value="taoyuan">���</option>
			<option value="hsinchu">�s��</option>
			<option value="miaoli">�]��</option>
			<option value="taichung">�x��</option>
			<option value="changhua">����</option>
			<option value="nantou">�n��</option>
			<option value="yunlin">���L</option>
			<option value="chiayi">�Ÿq</option>
			<option value="tainan">�x�n</option>
			<option value="kaohsiung">����</option>
			<option value="pintung">�̪F</option>
			<option value="I-LAN">�y��</option>
			<option value="hualien">�Ὤ</option>
			<option value="taitung">�x�F</option>


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
			<%="�L���"%>
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
				<td width="800" colspan="2"><%="  �ثe�S������                                                                                     "%>
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