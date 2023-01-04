<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.RCS.*"%>
<%
if(session.getAttribute("Access_Type") ==null){
	session.setAttribute("Alert","您無權存取此網頁，或超過存取期限！將自動跳轉登入頁面！");
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
    <title>租借紀錄 - 國立臺北護理健康大學</title>
	<%@include file="Page_Function/Alert.jsp" %>
</head>
<body>
    	
	<%@include file="Page_Function/Header.jsp" %>

    <div class="Record Container">
        
		<%@include file="Page_Function/Tabs.jsp" %>
        <p class="Bar">目前位置：租借紀錄</p>
        
       <table>
            
                <tr><th>申請日期</th><th>租借教室</th><th>租借時段</th><th>租借理由</th><th>審核狀態</th><th>取消申請</th></tr>
                <% 
                
                String Account = (String)session.getAttribute("Access_Id");
                DB_CRUD DB = new DB_CRUD();
                ResultSet rs =DB.getResultSet("SELECT * FROM Rental_Record Where Account ='" + Account + "' ORDER BY Date_Of_Application DESC ");
                
    			while(rs.next()){
    				if(rs.getString("Check_State").equals("已取消申請")){
    					out.println("<tr><td>" + rs.getDate("Date_Of_Application") + "</td><td>" + rs.getString("Classroom") + "</td><td>" + rs.getDate("Rental_Date") +"<br>"+ rs.getString("Rental_Term") + "</td><td>" + rs.getString("Reason") + "</td><td>" + rs.getString("Check_State") + "</td><td>已取消申請</td></tr>");
    				}else{
    					out.println("<tr><td>" + rs.getDate("Date_Of_Application") + "</td><td>" + rs.getString("Classroom") + "</td><td>" + rs.getDate("Rental_Date") +"<br>"+ rs.getString("Rental_Term") + "</td><td>" + rs.getString("Reason") + "</td><td>" + rs.getString("Check_State") + "</td><td><a href='Page_Function/Delete_Record.jsp?Serial_Number=" + rs.getString("Rental_Serial_Number") + "&Classroom="+rs.getString("Classroom")+"&Rental_Date="+rs.getDate("Rental_Date")+"' >取消申請</a></td></tr>");
    				}
    			}
                %>
                
            
            
        </table>
        
    </div>

    <jsp:include page="Page_Function/Footer.jsp"></jsp:include>
    <script src="../Js/User.js" charset="utf-8"></script>
</body>
</html>