<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<%@ page import="com.RCS.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//if(session.getAttribute("Access_Type") !="1"){
//	response.sendRedirect("../Index.jsp");
//登入控管
//}
session.setAttribute("Access_Id","User");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>資料傳送中....</title>
    <%@include file="DB_Path&Alert.jsp" %>
</head>



<%
	java.util.Date dNow = new java.util.Date();
	SimpleDateFormat ft = new SimpleDateFormat ("HHmmss");
	SimpleDateFormat ft_2 = new SimpleDateFormat ("MM/dd/yyyy");
	String Classroom_Code = (String)session.getAttribute("Classroom_Code") ,
				Date = (String)session.getAttribute("Date") ,
				Reason = request.getParameter("Reason"),
				Term[] = (String[])request.getParameterValues("T") ,
				Serial_Number = Date.replaceAll("/", "")+ft.format(dNow)+(String) session.getAttribute("Access_Id"),
				Apply_Date =ft_2.format(dNow),
				Rental_Term = "";
	
	DB_CRUD DB = new DB_CRUD();
	
	Boolean Class_Date_Check = false,
					isEmpty = true;
//租借編號 = 租借日期+發送時間+帳號 Ex: 22122022235001User
	
	
	int Arrlength = 0;
	
				

	
	
	
				
				
	
	
    if(Classroom_Code !=null && Date !=null && Reason!=null && Reason!=""&& Term != null   ){


        ResultSet rs =DB.getResultSet("SELECT * FROM Classroom_Code Where Classroom_Code='"+Classroom_Code+"'");
	 	rs.last();
	 	
	 	
	 	int count = rs.getRow();
	 	if(count == 0){
	 		response.sendRedirect("../Search_Place.jsp");

	 		return;
	 		}else{
	 			Class_Date_Check = true ;
	 		}
	}else{
		
		response.sendRedirect("../Search_Place.jsp");
		return;
	}
	%>
		 	

	

       <% 
       if(Class_Date_Check == true){
    	    ResultSet rs =DB.getResultSet("SELECT * FROM Rental_Term WHERE Classroom_Code='"+Classroom_Code+"' AND Rental_Date=#" +Date+"#");
			rs.last();
			
			int count = rs.getRow();	
			

			Arrlength = Term.length;
			String Insert_Rental_Term = "", //新增時段
						Update_Rental_Term = "", //更新時段
						Rental_Term_Serial_Number = "",
						Total_Term = "";
			
			for(int i=0;i<Arrlength;){
				Total_Term += "["+Term[i]+"] ";
				Update_Rental_Term +=  ",["+Term[i]+"] = '"+Serial_Number+"'";
				Insert_Rental_Term += ",["+Term[i]+"]";
				Rental_Term_Serial_Number += ",'"+Serial_Number+"'";
				i++;
			}
			
			StringBuilder Bulid_Update = new StringBuilder();
			
			Bulid_Update = Bulid_Update.append(Update_Rental_Term);
			
			Bulid_Update.deleteCharAt(0);
			
			Update_Rental_Term = Bulid_Update.toString();
			
			
			DB.CRUD("INSERT INTO Rental_Record(Rental_Serial_Number,Classroom,Date_Of_Application,Rental_Date,Rental_Term,Account,Reason,Check_State)  VALUES('"+Serial_Number+"','"+Classroom_Code+"',#"+Apply_Date+"#,#"+Date+"#,'"+Total_Term+"','"+(String) session.getAttribute("Access_Id")+"','"+Reason+"','審核中')");
			
			if(count==0){

				DB.CRUD("INSERT INTO Rental_Term(Classroom_Code,Rental_Date"+Insert_Rental_Term+") VALUES('"+Classroom_Code+"',#"+Date+"#"+Rental_Term_Serial_Number+")");

			 }else{
				 DB.CRUD("UPDATE  Rental_Term SET "+Update_Rental_Term+" WHERE Classroom_Code = '"+ Classroom_Code +"' AND Rental_Date = #" + Date + "#");
	
				 }   
			session.setAttribute("Alert","租借成功！租借編號=「"+Serial_Number+"」。");
			response.sendRedirect("../Rental_Record.jsp");
			
       }else{
    	   response.sendRedirect("../Search_Place.jsp");
    	   return;
       }
       
       %>
       
    