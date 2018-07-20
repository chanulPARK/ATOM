<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String msg = (String)request.getAttribute("msg");
	String loc = request.getContextPath()+(String)request.getAttribute("loc");
	String script = (String)request.getAttribute("script");
	System.out.println("세서ㅕㄴ"+session.getAttribute("empLoggedIn"));
%>
<body>
	<script>
		alert('<%=msg%>');
		location.href="<%=loc%>";
		<%=script!=null?script:""%>;
	</script>
</body>
</html>