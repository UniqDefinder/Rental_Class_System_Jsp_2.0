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
	<%@include file="DB_Path&Alert.jsp" %>
</head>
<% 
	String Serial_Number = (String)request.getParameter("Serial_Number"),
				Term[] = {"08：10至09：00","09：10至10：00","10：10至11：00","11：10至12：00","12：40至13：30","13：40至14：30","14：10至15：30","15：40至16：30","16：40至17：30","17：40至18：30"},
				Delet = "";
	
	for(int i =0 ; i<10;){ Delet+= ",["+Term[i] +"]='"+Serial_Number+"'"; i++;}
	
	StringBuilder Update = new StringBuilder();
	
	Update = Update.append(Delet);
	
	Update.deleteCharAt(0);
	
	Delet = Update.toString();
	
	
	out.print(Delet);
	
	/* try{
		
		DB_CRUD DB = new DB_CRUD();
        boolean rs = DB.CRUD_B("DELETE FROM Rental_Record WHERE Serial_Number = '"+Serial_Number+"'");
        rs = DB.CRUD_B("UPDATE Table SET 08：10至09：00 = 'value1', column2 = 'value2' WHERE condition;");
        
        
	}catch(SQLException e){
		out.print("資料刪除錯誤，請重新再試。錯誤代碼："+e);
	} */


%>






</html>