<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
    
<%!String 
DB ="jdbc:ucanaccess://C:\\Users\\login\\eclipse-workspace\\Rental_Class_System_Jsp_2.0\\src\\main\\webapp\\NtunhsClassroom.accdb;";
//DB ="jdbc:ucanaccess://C:\\Users\\User\\Desktop\\Rental_Class_System_Jsp_2.0\\src\\main\\webapp\\NtunhsClassroom.accdb;";
%>

<% //公告
    if(session.getAttribute("Alert") != null && (String)session.getAttribute("Alert") != ""){
    	out.print("<script>alert('"+(String) session.getAttribute("Alert")+"');</script>");
    	session.setAttribute("Alert","");
    }
%>