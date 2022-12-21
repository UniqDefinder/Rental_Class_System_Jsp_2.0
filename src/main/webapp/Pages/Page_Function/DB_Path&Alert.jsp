<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>


<% //公告
    if(session.getAttribute("Alert") != null && (String)session.getAttribute("Alert") != ""){
    	out.print("<script>alert('"+(String) session.getAttribute("Alert")+"');</script>");
    	session.setAttribute("Alert","");
    }
%>