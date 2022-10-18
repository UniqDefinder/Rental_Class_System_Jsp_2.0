<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../Css/Css_Reset.css">
    <link rel="stylesheet" href="../Css/Header_Footer.css">
    
    <link rel="stylesheet" href="../Css/User_Index_Style.css">
    <title>場地查詢 - 國立臺北護理健康大學</title>
</head>
<body>
    
    <div class="Header">
        <div class="Head">
            <img src="/Images/System_Logo.png" alt="">
            <h1>教室租借系統</h1>
        </div>
        <div class="Logout">
            <p>歡迎！<span id="User_Name">User</span></p>
            <a href="">登出</a>
        </div>
    </div>

    <div class="Container">
        <ul class="Tabs">
            <li><a href="">場地租借/查詢</a></li>
            <li><a href="">租借紀錄</a></li>
            <li><a href="">活動公告</a></li>
        </ul>
        <div class="Img"></div>
       
        <p class="Bar">目前位置：場地查詢</p>
       
        <form class="Search_Place">
            <div class="Select">
                <select name="">
                    <option value="" disabled selected>選擇類型</option>
                    <%
                    Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        			Connection con=DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\login\\eclipse-workspace\\Rental_Class_System_Jsp_2.0\\src\\main\\webapp\\NtunhsClassroom.accdb;");
        			Statement smt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        
        			String sql = "SELECT * FROM Classroom_Type_Code ";
        			ResultSet rs = smt.executeQuery(sql);
        			
        			
        			while(rs.next()){
        				out.println("<option value='" + rs.getString("Type_Code") + "'>" + rs.getString("Type") + "</option>");
        				con.close();
        			}
        			
                    %>
                </select>
                <select name="選擇大樓">
                    <option value="" disabled selected>選擇大樓</option>
                    <%
                    Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        			 con=DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\login\\eclipse-workspace\\Rental_Class_System_Jsp_2.0\\src\\main\\webapp\\NtunhsClassroom.accdb;");
        			 smt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        
        			 sql = "SELECT * FROM Building_Code";
        			 rs = smt.executeQuery(sql);
        			
        			
        			while(rs.next()){
        				out.println("<option value='" + rs.getString("Building_Code") + "'>" + rs.getString("Building_Name") + "</option>");
        			}
        			
        			con.close();
                    %>
                </select>
                
            </div>
            
            <div class="Submit">
                <input type="submit">
            </div>
        </form>

        <ul class="Card">
            <li>
                <img src="" alt="">
                <p>教學大樓G105</p>
                <p>一般教室</p>
            </li>
            <li>
                <img src="" alt="">
                <p>教學大樓G105</p>
                <p>一般教室</p>
            </li>
            <li>
                <img src="" alt="">
                <p></p>
            </li>
            <li>
                <img src="" alt="">
                <p></p>
            </li>
            <li>
                <img src="" alt="">
                <p></p>
            </li>
        </ul>

        <ul>
            <li></li>
        </ul>

    </div>

    <div class="Footer">
        <table>
            <tr><td>國立臺北護理健康大學</td><td>National Taipei University of Nursing and Health Sciences</td></tr>
            <tr><td>校本部地址：112303 台北市北投區明德路365號</td><td>城區部地址：108306 台北市內江街89號</td></tr>
            <tr><td>電話代表號：(02)28227101</td><td>電話代表號：(02)23885111</td></tr>
            <tr><td style="text-align: center;"colspan="2">請尊重與保護智慧財產權，並使用正版教科書</td></tr>
        </table>
    </div>
</body>
</html>