<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.RCS.*"%>
<%
if(session.getAttribute("Access_Type") ==null){response.sendRedirect("../Index.jsp");
//登入控管
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>資料傳送中。。。</title>
</head>
	<% 
	String Serial_Number = (String)request.getParameter("Serial_Number"),
				Agree = "";
	
	Agree = request.getParameter("Agree").equals("T")? "通過" : "未通過";
	
	DB_CRUD DB = new DB_CRUD();
	DB.updateString("SELECT * FROM Rental_Record Where Rental_Serial_Number ='" + Serial_Number + "'","Check_State",Agree);
	
	session.setAttribute("Alert","操作成功！");
	response.sendRedirect("../Approval.jsp");
	%>
	
	
	
	
</html>