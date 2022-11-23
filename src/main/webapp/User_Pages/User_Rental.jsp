<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="UTF-8"%>
<%
//if(session.getAttribute("Access_Type") !="1"){
//	response.sendRedirect("../Index.jsp");
//登入控管
//}
%>

<%!String 
DB ="jdbc:ucanaccess://C:\\Users\\login\\eclipse-workspace\\Rental_Class_System_Jsp_2.0\\src\\main\\webapp\\NtunhsClassroom.accdb;";
/* DB ="jdbc:ucanaccess://C:\\Users\\User\\Desktop\\Rental_Class_System_Jsp_2.0\\src\\main\\webapp\\NtunhsClassroom.accdb;"; */
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
</head>
	
<body>
    <div class="Header">
        <div class="Head">
            <img src="../Images/System_Logo.png" alt="">
            <h1>教室租借系統</h1>
        </div>
        <div class="Logout">
            <p>歡迎！<%= session.getAttribute("Access_Id") %></p>
            <a href="">登出</a>
        </div>
    </div>

    <div class="Rental Container">
        <ul class="Tabs">
            <li><a href="">場地租借/查詢</a></li>
            <li><a href="">租借紀錄</a></li>
            <li><a href="">系統公告</a></li>
        </ul>
        <div class="Img"></div>
       
       <form onsubmit="return checkForm(this);"  action="User_Rental_Final.jsp" method="get">
        <p class="Bar">目前位置：場地查詢/租借教室</p>
            <p class="Bar">請選擇日期與時段</p>
            <div class="Date_Time" >
                <div class="Date">
                    <jsp:include page="../rili.jsp"></jsp:include>
				</div>

                <div class="Time">
                    <table>
                        <tr>
                            <th>上午</th>
                            <th>下午</th>
                        </tr>
        <%
	    if(request.getParameter("Classromm_Code") !=null &&request.getParameter("Date") !=null){
	    	String Term[] = {"8:10~9:00","9:10~10:00","10:10~11:00","11:10~12:00","12:40~13:30","13:40~14:30","14:10~15:30","15:40~16:30","16:40~17:30","17:40~18:30"};
	    	String TF_Term[];
	    	TF_Term = new String[10];
	    	Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
			Connection con=DriverManager.getConnection(DB);
			Statement smt= con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			String Sql = "SELECT * FROM Rental_Term WHERE Classroom_Code='"+request.getParameter("Classromm_Code")+"' AND Rental_Date=#" +request.getParameter("Date")+"#";  
			
			ResultSet rs = smt.executeQuery(Sql);  
			rs.last();
			int count = rs.getRow();
			 if(count != 0){
					for(int i=0;i<10;){
						 if( rs.getString(Term[i]) ==null){
							 TF_Term[i] = "T";
							 i++;
						 }
						 else{
							 TF_Term[i] = null;
							 i++;
						 }
				 	}
					 
					for(int i=0;i<5;){
							out.print("<tr><td><label><input type='checkbox' name='"+Term[i]+"' value = '"+TF_Term[i]+"'><span class='Check'>"+Term[i]+"</span></label></td><td><label><input type='checkbox' name='"+Term[i+5]+"' value = '"+TF_Term[i+5]+"'><span class='Check'>"+Term[i+5]+"</span></label></td></tr>");
							i++;
						}
				 
			}
			else{
				for(int i=0;i<5;){
					out.print("<tr><td><label><input type='checkbox' name='"+Term[i]+"' value ='T'><span class='Check'>"+Term[i]+"</span></label></td><td><label><input type='checkbox' name='"+Term[i+5]+"' value = 'T'><span class='Check'>"+Term[i+5]+"</span></label></td></tr>");
					i++;
				}
			} 
			
	    }  
		%>
                    </table>
                </div>
                
            </div>
            <p class="Bar">租借事由</p>
            <div class="Reason">
                <input class="Reason_Text" id="Reason" type="text" name="Reason">
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
   <script src="../Js/Rental.js" charset="utf-8">
   		let url = location.href;
		if(url.indexOf('Classromm_Code=')==-1 ){
		window.location.href='../User_Pages/User_Search_Place.jsp';
		}
   </script>
   <%
	session.setAttribute("Classromm_Code",request.getParameter("Classromm_Code"));
	session.setAttribute("Date",request.getParameter("Date"));
	
	%>
</body>
</html>