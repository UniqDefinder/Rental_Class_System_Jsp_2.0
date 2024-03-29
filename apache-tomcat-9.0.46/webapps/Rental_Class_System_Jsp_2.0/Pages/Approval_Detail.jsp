<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.RCS.*"%>
<%
if(session.getAttribute("Access_Type") !="2"){
	session.setAttribute("Alert","您無權存取此網頁，或超過存取期限！將自動跳轉登入頁面！");
	response.sendRedirect("../Index.jsp");}

%> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../Css/Css_Reset.css">
    <link rel="stylesheet" href="../Css/Header_Footer.css">
    <link rel="stylesheet" href="../Css/User_Style.css">
    <title>租借教室 - 國立臺北護理健康大學</title>
    <%@include file="Page_Function/Alert.jsp" %>
    <% 
    String Serial_Number = (String)request.getParameter("Serial_Number");
    DB_CRUD DB = new DB_CRUD();
    ResultSet rs =DB.getResultSet("SELECT * FROM Rental_Record Where Rental_Serial_Number ='" + Serial_Number + "'");
    rs.last();
    
    
    
    %>

    
</head>
	
<body>

    <%@include file="Page_Function/Header.jsp" %>

    <div class="Approval Container">
        <%@include file="Page_Function/Tabs.jsp" %>
        <p class="Bar">目前位置：租借審核 / <%=Serial_Number %></p>
       
      	
	        <table>
	                <tr><th>帳號</th><td><%=rs.getString(6) %></td></tr>
	                <tr><th>租借地點</th><td><%=rs.getString(2) %></td></tr>
	                <tr><th>租借日期</th><td><%=rs.getDate(4) %></td></tr>
	                <tr><th>租借時段</th><td><%=rs.getString(5) %></td></tr>
	                <tr><th>租借事由</th><td><%=rs.getString(7) %></td></tr>
	        </table>
	        <div style="display:flex;justify-content:center;margin-top:20px;";>
		        <a style="margin-right:30px;height:40px;width:80px;text-align:center;font-size:30px;font-weight: bold;text-decoration:none;color:red;" href="Page_Function/Approving.jsp?Serial_Number=<%=Serial_Number%>&Agree=F">拒絕</a>
		        <a style="height:40px;width:80px;text-align:center;font-size:30px;font-weight: bold;text-decoration:none;color:red;" href="Page_Function/Approving.jsp?Serial_Number=<%=Serial_Number%>&Agree=T">核准</a>
	        </div>
    </div>

   <jsp:include page="Page_Function/Footer.jsp"></jsp:include>

   
  
</body>
</html>