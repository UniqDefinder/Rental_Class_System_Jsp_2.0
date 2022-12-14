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
DB ="jdbc:ucanaccess://C:\\Users\\login\\eclipse-workspace\\Rental_Class_System_Jsp_2.0\\src\\main\\webapp\\NtunhsClassroom.accdb;";
/*DB ="jdbc:ucanaccess://C:\\Users\\User\\Desktop\\Rental_Class_System_Jsp_2.0\\src\\main\\webapp\\NtunhsClassroom.accdb;";*/
%>


<%
session.setAttribute("Classroom_Code",null);
session.setAttribute("Date",null); 
//重製教室與日期Session
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
    <title>場地查詢 - 國立臺北護理健康大學</title>
    <%
    
    //公告
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

    <div class="Search Container">
        <ul class="Tabs">
            <li><a href="">場地租借/查詢</a></li>
            <li><a href="">租借紀錄</a></li>
            <li><a href="">系統公告</a></li>
        </ul>
        <div class="Img"></div>
       
        <p class="Bar">目前位置：場地查詢</p>
       
        <form class="Search_Place">
            <div class="Select">
                <select name="Type">
                    <option value="" disabled selected>選擇類型</option>
                    <%
                    Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        			Connection con=DriverManager.getConnection(DB);
        			Statement smt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        
        			String sql = "SELECT * FROM Classroom_Type_Code ";
        			ResultSet rs = smt.executeQuery(sql);
        			
        			
        			while(rs.next()){
        				out.println("<option  value='" + rs.getString("Type_Code") + "'>" + rs.getString("Type") + "</option>");
        				con.close();
        			}
        			
                    %>
                    
                </select>
                <select name="Buliding">
                    <option value="" disabled selected>選擇大樓</option>
                    <%
                    Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        			 con=DriverManager.getConnection(DB);
        			 smt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        
        			 sql = "SELECT * FROM Building_Code";
        			 rs = smt.executeQuery(sql);
        			
        			
        			while(rs.next()){
        				out.println("<option  value='" + rs.getString("Building_Code") + "'>" + rs.getString("Building_Name") + "</option>");
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
             <%
        	if(request.getParameter("Buliding")!=null || request.getParameter("Type")!=null ){
        		
        		String Buliding = request.getParameter("Buliding");
        		String Type = request.getParameter("Type");
        		
        		Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
   				con=DriverManager.getConnection(DB);
   				smt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
   
   			 	sql = "SELECT * FROM (Classroom_Code AS a LEFT JOIN Classroom_Type_Code AS b ON a.Classroom_Type_Code = b.Type_Code) LEFT JOIN Building_Code AS c ON a.Building_Code = c.Building_Code   WHERE   Building_Code = '" + Buliding + "' AND Classroom_Type_Code ='" + Type+"'";
   			 	rs = smt.executeQuery(sql);
   			 	
   			 	rs.last();
   			 	int count = rs.getRow();
   			 	
   			 	if(count != 0){
   			 		rs.first();
   			 		while(rs.next()){
   			 			out.print("<form action='Rental.jsp' method='get'><li><img src='"+rs.getString("Imgs")+"' alt='圖片死了'><h3>"+ rs.getString("Building_Name") +"</h3><h4>"+rs.getString("Classroom_Code") +"</h4><p>"+rs.getString("Type")+"</p><input type='hidden' name='Classroom_Code'  value='"+ rs.getString("Classroom_Code") +"'>"+" <input type='submit' value='查看教室'></li></form>");
   			 		}
   			 		
   			 	}
   			 	
   			 	else if(Type != null && Buliding == null) {
   			 		
	   			 	sql = "SELECT * FROM (Classroom_Code AS a LEFT JOIN Classroom_Type_Code AS b ON a.Classroom_Type_Code = b.Type_Code) LEFT JOIN Building_Code AS c ON a.Building_Code = c.Building_Code   WHERE    Classroom_Type_Code ='" + Type+"'";
	   			 	rs = smt.executeQuery(sql);
	   			 	while(rs.next()){
			 			out.print("<form action='Rental.jsp' method='get'><li><img src='"+rs.getString("Imgs")+"' alt='圖片死了'><h3>"+ rs.getString("Building_Name") +"</h3><h4>"+rs.getString("Classroom_Code") +"</h4><p>"+rs.getString("Type")+"</p><input type='hidden' name='Classroom_Code'  value='"+ rs.getString("Classroom_Code") +"'>"+" <input type='submit' value='查看教室'></li></form>");
			 		}
	   			 	
   			 	}
   			 	else if(Type == null && Buliding != null){
   			 		sql = "SELECT * FROM (Classroom_Code AS a LEFT JOIN Classroom_Type_Code AS b ON a.Classroom_Type_Code = b.Type_Code) LEFT JOIN Building_Code AS c ON a.Building_Code = c.Building_Code   WHERE   Building_Code = '" + Buliding+"'";
   			 		rs = smt.executeQuery(sql);
   			 		while(rs.next()){
			 			out.print("<form action='Rental.jsp' method='get'><li><img src='"+rs.getString("Imgs")+"' alt='圖片死了'><h3>"+ rs.getString("Building_Name") +"</h3><h4>"+rs.getString("Classroom_Code") +"</h4><p>"+rs.getString("Type")+"</p><input type='hidden' name='Classroom_Code'  value='"+ rs.getString("Classroom_Code") +"'>"+" <input type='submit' value='查看教室'></li></form>");
			 		}
   			 	}
   			 	else{
   			 		out.print("查無相關資料。");
   			 	}
        	}
        	else{
        		out.print("請選擇類別或大樓");
        	}
        	
        	%>

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
    <script src="../Js/User.js" charset="utf-8"></script>
</body>
</html>