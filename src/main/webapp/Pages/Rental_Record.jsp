<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<%
if(session.getAttribute("Access_Type") ==null){
	response.sendRedirect("../Index.jsp");
//登入控管
}
%>

<%!String 
/*DB ="jdbc:ucanaccess://C:\\Users\\login\\eclipse-workspace\\Rental_Class_System_Jsp_2.0\\src\\main\\webapp\\NtunhsClassroom.accdb;";*/
DB ="jdbc:ucanaccess://C:\\Users\\User\\Desktop\\Rental_Class_System_Jsp_2.0\\src\\main\\webapp\\NtunhsClassroom.accdb;";
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
    <title>租借紀錄 - 國立臺北護理健康大學</title>
    <%
    
    //公告系統
    if(session.getAttribute("Alert") != null && (String)session.getAttribute("Alert") != ""){
    	out.print("<script>alert('"+(String) session.getAttribute("Alert")+"');</script>");
    	session.setAttribute("Alert","");
    }
    
    %>
</head>
<body>
    	
    <div class="Header">
        <div class="Head">
            <img src="../Images/System_Logo.png" alt="">
            <h1>教室租借系統</h1>
        </div>
        <div class="Logout">
            <p>歡迎！<%= session.getAttribute("Access_Id") %></p>
            <a  href="Logout.jsp">登出</a>
        </div>
    </div>

    <div class="Record Container">
        <ul class="Tabs">
            <li><a href="">場地租借/查詢</a></li>
            <li><a href="">租借紀錄</a></li>
            <li><a href="">審核專區</a></li>
            <li><a href="">系統公告</a></li>
        </ul>
        <div class="Img"></div>
       
        <p class="Bar">目前位置：場地查詢</p>
       
        
    </div>

    <div class="Footer">
        <table>
            <tr><td>國立臺北護理健康大學</td><td>National Taipei University of Nursing and Health Sciences</td></tr>
            <tr><td>校本部地址：112303 台北市北投區明德路365號</td><td>城區部地址：108306 台北市內江街89號</td></tr>
            <tr><td>電話代表號：(02)28227101</td><td>電話代表號：(02)23885111</td></tr>
            <tr><td style="text-align: center;"colspan="2">請尊重與保護智慧財產權，並使用正版教科書</td></tr>
        </table>
    </div>
    <script src="../Js/User.js" charset="utf-8"></script>
</body>
</html>