<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.RCS.*"%>
<%
if(session.getAttribute("Access_Type") =="2"){
	response.sendRedirect("../Index.jsp");
//登入控管
}
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
    <title>審核專區 - 國立臺北護理健康大學</title>
    <%@include file="Page_Function/Alert.jsp" %>
  
</head>
	
<body>

    <%@include file="Page_Function/Header.jsp" %>

    <div class="Approval Container">
        <%@include file="Page_Function/Tabs.jsp" %>
        <p class="Bar">目前位置：審核專區</p>
       
      
        <table>
            
                <tr><th>申請編號</th><th>申請時間</th><th>申請人帳號</th><th>租借地點</th><th>審核狀態</th></tr>
                <% 
                
                String Check_State = "審核中";
                DB_CRUD DB = new DB_CRUD();
                ResultSet rs =DB.getResultSet("SELECT * FROM Rental_Record Where Check_State ='" + Check_State + "' ORDER BY Date_Of_Application  DESC ");
                
    			while(rs.next()){
    				out.println("<tr><td><a href='Approval_Detail.jsp?Serial_Number=" + rs.getString("Rental_Serial_Number") + "'>" + rs.getString("Rental_Serial_Number") + "</a></td><td>" + rs.getDate("Date_Of_Application") + "</td><td>" + rs.getString("Account") + "</td><td>" + rs.getString("Classroom") + "</td><td>尚未處理</td></tr>");
    				
    			}
                %>
                
            
            
        </table>
                   
    </div>

   <jsp:include page="Page_Function/Footer.jsp"></jsp:include>
   
   
  
</body>
</html>