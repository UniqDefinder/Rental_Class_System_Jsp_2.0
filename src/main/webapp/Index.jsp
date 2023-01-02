<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.RCS.*"%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Css/Css_Reset.css">
    <link rel="stylesheet" href="Css/Header_Footer.css">
    <link rel="stylesheet" href="Css/Index_Style.css">
    <title>登入 - 教室租借系統 - 國立臺北護理健康大學</title>
    
   <%@include file="Pages/Page_Function/Alert.jsp" %>
   
    <%
	    if(request.getParameter("Account") !=null &&request.getParameter("Password") !=null){
	    	
	    	DB_CRUD DB = new DB_CRUD();
            ResultSet rs =DB.getResultSet("SELECT * FROM User WHERE Account='"+request.getParameter("Account")+"' AND Password='" +request.getParameter("Password")+"'");
			
			if(rs.next()){
				
				int i = Integer.parseInt(rs.getString("User_Type"));
				
					switch (i){
					case 1:
						session.setAttribute("Access_Type","1");
						session.setAttribute("Access_Id",request.getParameter("Account"));
						session.setAttribute("Alert","使用者登入成功！");
						session.setMaxInactiveInterval(10*60);
						response.sendRedirect("Pages/Search_Place.jsp");
						break;
						
					case 2:
						session.setAttribute("Access_Type","2");
						session.setAttribute("Access_Id",request.getParameter("Account"));
						session.setAttribute("Alert","審核者登入成功！");
						session.setMaxInactiveInterval(10*60);
						response.sendRedirect("Pages/Approval.jsp");
						break;
						
					case 3:
						session.setAttribute("Access_Type","3");
						session.setAttribute("Access_Id",request.getParameter("Account"));
						session.setAttribute("Alert","管理員登入成功！");
						session.setMaxInactiveInterval(10*60);
						response.sendRedirect("Ad_Pages/Ad_Class.jsp");
						break;
					}
			}else{
				session.setAttribute("Alert","登入失敗！");
			}
				
		}
	
    
  	
%>
</head>
<body>
        <div class="Header">
            <div class="Head">
                <img src="Images/System_Logo.png" alt="">
                <h1>教室租借系統</h1>
            </div>
        </div>
        <div class="Container">
            <form class="Login"  method="post">
                <h2>歡迎來到教室租借系統網</h2>
                <input type="text" id="Account" name="Account" placeholder="學號/教職員帳號">
                <input type="password" id="Password" name="Password"  placeholder="密碼">
                <input class="Login_Btn" type="submit" value="登錄">
                <a href="">忘記密碼？</a>
            </form>
        </div>
        <jsp:include page="Pages/Page_Function/Footer.jsp"></jsp:include>
 
</body>

</html>