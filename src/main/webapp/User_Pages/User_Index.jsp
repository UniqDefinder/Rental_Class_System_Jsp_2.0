<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="UTF-8"%>
<%
if(session.getAttribute("Access_Type") !="1"){
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
    <link rel="stylesheet" href="/Css/Css_Reset.css">
    <link rel="stylesheet" href="/Css/Header_Footer.css">
    <link rel="stylesheet" href="/Css/User_Index_Style.css">
    <title>租借教室 - 國立臺北護理健康大學</title>
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
            <li><a href="">租借教室</a></li>
            <li><a href="">場地查詢</a></li>
            <li><a href="">租借紀錄</a></li>
            <li><a href="">活動公告</a></li>
        </ul>
        <div class="Img"></div>
       
        <p class="Bar">目前位置：租借教室</p>
       
        <form>
            <div class="Select_Class_Type">
                <select name="">
                    <option value=""disabled selected>選擇類型</option>
                    <%
                    Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        			Connection con=DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\login\\eclipse-workspace\\Rantal_Class_System_Jsp_2.0\\src\\main\\webapp\\NtunhsClassroom.accdb;");
        			Statement smt= con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        			String getpaperdata = "SELECT Type FROM Classroom WHERE ";
        			ResultSet rs = smt.executeQuery(getpaperdata);
                    %>
                </select>
                <select name="選擇大樓">
                    <option value=""disabled selected>選擇大樓</option>
                </select>
                <select name="選擇地點">
                    <option value=""disabled selected>選擇地點</option>
                </select>
            </div>
            <p class="Bar">請選擇日期與時段</p>
            <div class="Date_Time" >
                <div class="Date">
                    <table>
                        <tr>
                            <th colspan="5">2022</th>
                            <th colspan="2">十月</th>
                        </tr>
                        <tr>
                            <th>日</th>
                            <th>一</th>
                            <th>二</th>
                            <th>三</th>
                            <th>四</th>
                            <th>五</th>
                            <th>六</th>
                        </tr>
                        <tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
                        <tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
                        <tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
                        <tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
                        <tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
                    </table>
                </div>
                <div class="Time">
                    <table>
                        <tr>
                            <th>上午</th>
                            <th>下午</th>
                        </tr>
                        <tr><td></td><td></td></tr>
                        <tr><td></td><td></td></tr>
                        <tr><td></td><td></td></tr>
                        <tr><td></td><td></td></tr>
                        <tr><td></td><td></td></tr>
                        <tr><td></td><td></td></tr>
                    </table>
                </div>
                
            </div>
            <p class="Bar">租借事由</p>
            <div class="Reason">
                <input class="Reason_Text" type="text" name="Reason">
                <p>上傳附件：<input type="file"></p>
            </div>
            <div class="Submit">
                <input type="submit">
            </div>
        </form>
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