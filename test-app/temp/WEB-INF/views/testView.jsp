<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"/>
	<title>Test View</title>
</head>
<body>

	<h1>Test View</h1>
    <h2>Sprint 5 test</h2>
    	<p>hello world</p>
	<p>Message: ${message}</p>
     
     <%
    String[] arr = (String[]) request.getAttribute("items");
%>

<ul>
<% for (String item : arr) { %>
    <li><%= item %></li>
<% } %>
</ul>


	

	<p><a href="${pageContext.request.contextPath}/">Home</a></p>
</body>
</html>
