<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<%@ page import="com.RCS.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(session.getAttribute("Access_Type") ==null){
	session.setAttribute("Alert","您無權存取此網頁，或超過存取期限！將自動跳轉登入頁面！");
	response.sendRedirect("../../Index.jsp");
//登入控管
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>資料傳送中....</title>
    <%@include file="../../Pages/Page_Function/Alert.jsp" %>
</head>
<body>


<%
	List<String> Arr = new ArrayList<String>();
	DB_CRUD DB = new DB_CRUD();
	
	String Values ="";
	
	for(int i = 0 ; request.getParameter("Ob"+i)!=null;){
		Arr.add((String) request.getParameter("Ob"+i));
		i++;
	}
	//Arr[]：(資料表名稱,欄位名稱,欄位值,依序編輯的物件1,依序編輯的物件2...)
	
	
	for(int i =1; i<Arr.size(); ){
		Values += "'"+Arr.get(i)+"'";
		if(i != Arr.size()-1) Values += ",";
		i++;
	}
	
	
	
  	try{
 		
		DB.CRUD("INSERT INTO "+Arr.get(0)+" VALUES ("+Values+")");
	 	session.setAttribute("Alert","新增成功！");
		response.sendRedirect("../Ad_Class.jsp") ;
		
	}catch(SQLException e){
		out.print("錯誤："+e);
	}   
	
	%>
		 	
       </body>
    </html>