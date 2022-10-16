<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="UTF-8"%>
<%
if(session.getAttribute("Access_Type") !="3"){

	out.print("<script>window.alert('您不是系統管理員，您無權存取此網頁，或超過存取期限！將自動跳轉登入頁面')</script>");
	response.sendRedirect("../Index.jsp");
}else{
	out.println("登入成功<br>");
	out.println("登入者："+
			session.getAttribute("User_Id")+"！<br>");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
	<p>這裡是系統管理員登入後頁面</p>
</body>
</html>