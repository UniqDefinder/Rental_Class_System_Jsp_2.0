<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.RCS.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>資料處理中。。。</title>
	<%@include file="Alert.jsp" %>
</head>
<% 
	String Serial_Number = (String)request.getParameter("Serial_Number"),
				Classroom = (String)request.getParameter("Classroom"),
				Rental_Date = (String)request.getParameter("Rental_Date"),
				Term[] = {"08：10至09：00","09：10至10：00","10：10至11：00","11：10至12：00","12：40至13：30","13：40至14：30","14：10至15：30","15：40至16：30","16：40至17：30","17：40至18：30"};
	
	if(Serial_Number !=null && Classroom!=null && Rental_Date!=null){
		DB_CRUD DB = new DB_CRUD();
		DB.replaceNull("SELECT * FROM Rental_Term WHERE Classroom_Code = '"+Classroom+"' AND Rental_Date = #"+Rental_Date+"#",Serial_Number);
		boolean rs = DB.CRUD_B("UPDATE Rental_Record SET Check_State = '已取消申請'  WHERE Rental_Serial_Number = '"+Serial_Number+"'"); 
		
		session.setAttribute("Alert","租借紀錄刪除成功！");
		response.sendRedirect("../Rental_Record.jsp");
		
	}else{
		response.sendRedirect("../Rental_Record.jsp");
		
	}
%>
</html>