<%@page import="java.util.*" import="org.json.*"%>

<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
	<%
		JSONArray jsonArr = new JSONArray();
		jsonArr = (JSONArray) request.getAttribute("jsonArr");
		JSONObject ob = new JSONObject();
		String loc;
		//ob = (JSONObject) jsonArr.get(0);

		ArrayList<String> phone = new ArrayList();
		phone = (ArrayList<String>) request.getAttribute("phone");
	%>


	<%
		for (int i = 0; i < 20; i++) {
			ob = (JSONObject) jsonArr.get(i);
			JSONObject address = (JSONObject) ob.get("location");
			JSONArray locArr = new JSONArray();
			locArr = (JSONArray) address.get("display_address");
	%>
	<br>
	<div>
		<a href=<%=ob.get("url")%>><%=ob.get("name")%> <img
			src=<%=ob.get("rating_img_url_large")%>> </a>

		<table border="1">
			<tr>
				<td rowspan="2"><img src=<%=ob.get("image_url")%>></td>
				<td><%=ob.get("phone")%></td>
			</tr>
			<tr>
				<td><%=locArr.get(1) + "" + locArr.get(0)%></td>
			</tr>
			<% if(ob.get("snippet_text")!=null){ %>
			<tr>
				<td colspan="2"><%=ob.get("snippet_text")%> <a
					href=<%=ob.get("url")%>>readmore</a></td>
			</tr>
			<% } %>
		</table>
	</div>
	<%
		}
	%>
	<br>
</body>
</html>