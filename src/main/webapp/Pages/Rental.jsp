<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.RCS.*"%>
<%
if(session.getAttribute("Access_Type") ==null){
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
    <title>租借教室 - 國立臺北護理健康大學</title>
    <%@include file="Page_Function/DB_Path&Alert.jsp" %>
    <%
String Classroom_Code = request.getParameter("Classroom_Code");
String Date = request.getParameter("Date");

session.setAttribute("Classroom_Code",Classroom_Code);
session.setAttribute("Date",Date);

%>
<%
    //公告
    if(session.getAttribute("Alert") != null && (String)session.getAttribute("Alert") != ""){
    	out.print("<script>alert('"+(String) session.getAttribute("Alert")+"');</script>");
    	session.setAttribute("Alert","");
    }
    
    %>
</head>
	
<body>

    <%@include file="Page_Function/Header.jsp" %>

    <div class="Rental Container">
        <%@include file="Page_Function/Tabs.jsp" %>
       
       <form onsubmit="return checkForm(this);"  action="Page_Function/Senting.jsp" method="get">
        <p class="Bar">目前位置：場地查詢/租借教室</p>
            <p class="Bar">請選擇日期與時段</p>
            <div class="Date_Time" >
                <div class="Date">
                    <jsp:include page="Page_Function/Calendar.jsp"></jsp:include>
				</div>

                <div class="Time">
                    <table>
                        <tr>
                            <th>上午</th>
                            <th>下午</th>
                        </tr>
        <%
	    if(request.getParameter("Classroom_Code") !=null &&request.getParameter("Date") !=null){
	    	String Term[] = {"08：10至09：00","09：10至10：00","10：10至11：00","11：10至12：00","12：40至13：30","13：40至14：30","14：10至15：30","15：40至16：30","16：40至17：30","17：40至18：30"},
	    				TF_Term[],
	    				Empty_Term[];
	    	TF_Term = new String[10];
	    	Empty_Term = new String[10];
	    	
	    	DB_CRUD DB = new DB_CRUD();
			ResultSet rs =DB.getResultSet("SELECT * FROM Rental_Term WHERE Classroom_Code='"+request.getParameter("Classroom_Code")+"' AND Rental_Date=#" +request.getParameter("Date")+"#");
			
			rs.last();
			
			int count = rs.getRow();
			 if(count != 0){
					for(int i=0;i<10;){
						 if( rs.getString(Term[i]) ==null){
							 Empty_Term[i] = "T";
							 TF_Term[i] = Term[i];
							 i++;
						 }
						 else{
							 Empty_Term[i] = "F";
							 TF_Term[i] = null;
							 i++;
						 }
				 	}
					 
					for(int i=0;i<5;){
							out.print("<tr><td><label><input type='checkbox' id='"+Term[i]+"' name='"+Empty_Term[i]+"' value = '"+TF_Term[i]+"'><span class='Check'>"+Term[i]+"</span></label></td><td><label><input type='checkbox' id='"+Term[i+5]+"'  name='"+Empty_Term[i+5]+"' value = '"+TF_Term[i+5]+"'><span class='Check'>"+Term[i+5]+"</span></label></td></tr>");
							i++;
						}
				 
			}
			else{
				for(int i=0;i<5;){
					out.print("<tr><td><label><input type='checkbox' id='"+Term[i]+"'  name='T' value ='"+Term[i]+"'><span class='Check'>"+Term[i]+"</span></label></td><td><label><input type='checkbox' id='"+Term[i+5]+"'  name='T' value = '"+Term[i+5]+"'><span class='Check'>"+Term[i+5]+"</span></label></td></tr>");
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

   <jsp:include page="Page_Function/Footer.jsp"></jsp:include>
   <script src="../Js/User.js" charset="utf-8"></script>
   <script src="../Js/Rental.js" charset="utf-8"> 
   	let url = location.href;
	if(url.indexOf('Classroom_Code=')==-1 ){window.location.href='Search_Place.jsp';}
	</script>
   
  
</body>
</html>