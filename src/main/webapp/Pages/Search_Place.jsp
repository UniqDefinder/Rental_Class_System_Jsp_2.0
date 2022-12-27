<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.RCS.*"%>
<%
if(session.getAttribute("Access_Type") ==null){
	response.sendRedirect("../Index.jsp");
//登入控管
}
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
    <%@include file="Page_Function/Alert.jsp" %>
</head>
<body>
    	
    <%@include file="Page_Function/Header.jsp" %>

    <div class="Search Container">
        <%@include file="Page_Function/Tabs.jsp" %>
       
        <p class="Bar">目前位置：場地查詢</p>
       
        <form class="Search_Place">
            <div class="Select">
                <select name="Type">
                    <option value="" disabled selected>選擇類型</option>
                    <%
                    DB_CRUD DB = new DB_CRUD();
                    ResultSet rs =DB.getResultSet("SELECT * FROM Classroom_Type_Code ");
        			
        			
        			while(rs.next()){
        				out.println("<option  value='" + rs.getString("Type_Code") + "'>" + rs.getString("Type") + "</option>");
        				
        			}
                    %>
                    
                </select>
                <select name="Buliding">
                    <option value="" disabled selected>選擇大樓</option>
                    <%
                    
                    rs =DB.getResultSet("SELECT * FROM Building_Code");
        			
        			
        			while(rs.next()){
        				out.println("<option  value='" + rs.getString("Building_Code") + "'>" + rs.getString("Building_Name") + "</option>");
        			}
        			
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
        		
        		rs =DB.getResultSet("SELECT * FROM (Classroom_Code AS a LEFT JOIN Classroom_Type_Code AS b ON a.Classroom_Type_Code = b.Type_Code) LEFT JOIN Building_Code AS c ON a.Building_Code = c.Building_Code   WHERE   Building_Code = '" + Buliding + "' AND Classroom_Type_Code ='" + Type+"'");
   			 	
   			 	rs.last();
   			 	int count = rs.getRow();
   			 	
   			 	if(count != 0){
   			 		rs.first();
   			 		while(rs.next()){
   			 			out.print("<form action='Rental.jsp' method='get'><li><img src='"+rs.getString("Imgs")+"' alt='圖片死了'><h3>"+ rs.getString("Building_Name") +"</h3><h4>"+rs.getString("Classroom_Code") +"</h4><p>"+rs.getString("Type")+"</p><input type='hidden' name='Classroom_Code'  value='"+ rs.getString("Classroom_Code") +"'>"+" <input type='submit' value='查看教室'></li></form>");
   			 		}
   			 		
   			 	}
   			 	
   			 	else if(Type != null && Buliding == null) {
   			 		rs =DB.getResultSet("SELECT * FROM (Classroom_Code AS a LEFT JOIN Classroom_Type_Code AS b ON a.Classroom_Type_Code = b.Type_Code) LEFT JOIN Building_Code AS c ON a.Building_Code = c.Building_Code   WHERE    Classroom_Type_Code ='" + Type+"'");
	   			 	
	   			 	while(rs.next()){
			 			out.print("<form action='Rental.jsp' method='get'><li><img src='"+rs.getString("Imgs")+"' alt='圖片死了'><h3>"+ rs.getString("Building_Name") +"</h3><h4>"+rs.getString("Classroom_Code") +"</h4><p>"+rs.getString("Type")+"</p><input type='hidden' name='Classroom_Code'  value='"+ rs.getString("Classroom_Code") +"'>"+" <input type='submit' value='查看教室'></li></form>");
			 		}
	   			 	
   			 	}
   			 	else if(Type == null && Buliding != null){
   			 		rs =DB.getResultSet("SELECT * FROM (Classroom_Code AS a LEFT JOIN Classroom_Type_Code AS b ON a.Classroom_Type_Code = b.Type_Code) LEFT JOIN Building_Code AS c ON a.Building_Code = c.Building_Code   WHERE   Building_Code = '" + Buliding+"'");
   			 		
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

    <jsp:include page="Page_Function/Footer.jsp"></jsp:include>
    <script src="../Js/User.js" charset="utf-8"></script>
</body>
</html>