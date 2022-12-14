<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="UTF-8"%>
<%!String 
DB ="jdbc:ucanaccess://C:\\Users\\login\\eclipse-workspace\\Rental_Class_System_Jsp_2.0\\src\\main\\webapp\\NtunhsClassroom.accdb;";
/*DB ="jdbc:ucanaccess://C:\\Users\\User\\Desktop\\Rental_Class_System_Jsp_2.0\\src\\main\\webapp\\NtunhsClassroom.accdb;";*/
%>


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
   
    <%
  		//公告
  		
  		
  		
	    if(session.getAttribute("Alert") != null && (String)session.getAttribute("Alert") != ""){
	    	out.print("<script>alert('"+(String) session.getAttribute("Alert")+"');</script>");
	    	session.setAttribute("Alert","");
	    }
    
	    if(request.getParameter("Account") !=null &&request.getParameter("Password") !=null){
	        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
			Connection con=DriverManager.getConnection(DB);
			Statement smt= con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			String getpaperdata = "SELECT * FROM User WHERE Account='"+request.getParameter("Account")+"' AND Password='" +request.getParameter("Password")+"'";
			ResultSet rs = smt.executeQuery(getpaperdata);
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
						response.sendRedirect("Pages/Search_Place.jsp");
						break;
						
					case 3:
						session.setAttribute("Access_Type","3");
						session.setAttribute("Access_Id",request.getParameter("Account"));
						session.setAttribute("Alert","管理員登入成功！");
						session.setMaxInactiveInterval(10*60);
						response.sendRedirect("Pages/Admin.jsp");
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