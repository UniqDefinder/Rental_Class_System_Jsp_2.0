<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<div class="Header">
        <div class="Head">
            <img src="../Images/System_Logo.png" alt="">
            <h1>教室租借系統</h1>
        </div>
        <div class="Logout">
            <p>歡迎！<%= session.getAttribute("Access_Id") %></p>
            <a  href="Page_Function/Logout.jsp">登出</a>
        </div>
    </div>