<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登出中。。。</title>
</head>
<body>
<% 
	session.invalidate();
	out.print("<script>alert('登出成功！您可以關閉瀏覽器了！'); window.location.assign('../Index.jsp');</script>");
%>
</body>
</html>