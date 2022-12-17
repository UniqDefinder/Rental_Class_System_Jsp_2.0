<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
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
				Serial_Number = (String)session.getAttribute("Date")+ft.format(dNow)+(String) session.getAttribute("Access_Id"),
				Apply_Date =ft_2.format(dNow),
				Rental_Term = "";
	
	
	Boolean Class_Date_Check = false,
					isEmpty = true;
//租借編號 = 租借日期+發送時間+帳號 Ex: 22122022235001User
	
	
	int Arrlength = 0;
	
				

	
	
				
				
	
	
    if(Classroom_Code !=null && Date !=null && Reason!=null && Reason!=""&& Term != null   ){

	 	Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
		Connection con=DriverManager.getConnection(DB);
		Statement smt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		String sql = "SELECT * FROM Classroom_Code Where Classroom_Code='"+Classroom_Code+"'";
		ResultSet rs = smt.executeQuery(sql);
	 	rs.last();
	 	
	 	
	 	int count = rs.getRow();
	 	if(count == 0){
	 		response.sendRedirect("Search_Place.jsp");

	 		return;
	 		}else{
	 			Class_Date_Check = true ;
	 		}
	 	con.close();
	}else{
		
		response.sendRedirect("Search_Place.jsp");
		return;
	}
	%>
		 	

	

       <% 
       if(Class_Date_Check == true){
		    Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
			Connection con=DriverManager.getConnection(DB);
			Statement smt= con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			String Sql = "SELECT * FROM Rental_Term WHERE Classroom_Code='"+Classroom_Code+"' AND Rental_Date=#" +Date+"#";  
			ResultSet rs = smt.executeQuery(Sql);  
			rs.last();
			
			int count = rs.getRow();	
			

			Arrlength = Term.length;
			String Insert_Rental_Term = "", //新增時段
						Update_Rental_Term = "", //更新時段
						Rental_Term_Serial_Number = "",
						Total_Term = "";
			
			for(int i=0;i<Arrlength;){
				Total_Term += "<br>["+Term[i]+"] ";
				Update_Rental_Term +=  ",["+Term[i]+"] = '"+Serial_Number+"'";
				Insert_Rental_Term += ",["+Term[i]+"]";
				Rental_Term_Serial_Number += ",'"+Serial_Number+"'";
				i++;
			}
			
			StringBuilder Bulid_Update = new StringBuilder();
			
			Bulid_Update = Bulid_Update.append(Update_Rental_Term);
			
			Bulid_Update.deleteCharAt(0);
			
			Update_Rental_Term = Bulid_Update.toString();
			
			smt.execute("INSERT INTO Rental_Record(Rental_Serial_Number,Classroom,Date_Of_Application,Rental_Date,Rental_Term,Account,Reason,Check_State)  VALUES('"+Serial_Number+"','"+Classroom_Code+"',#"+Apply_Date+"#,#"+Date+"#,'"+Total_Term+"','"+(String) session.getAttribute("Access_Id")+"','"+Reason+"','審核中')");
			
			if(count==0){

				
				smt.execute("INSERT INTO Rental_Term(Classroom_Code,Rental_Date"+Insert_Rental_Term+") VALUES('"+Classroom_Code+"',#"+Date+"#"+Rental_Term_Serial_Number+")");
				con.close();
			 }else{
				
				smt.execute("UPDATE  Rental_Term SET "+Update_Rental_Term+" WHERE Classroom_Code = '"+ Classroom_Code +"' AND Rental_Date = #" + Date + "#");
				con.close();	
			
				 }   
			session.setAttribute("Alert","租借成功！租借編號=「"+Serial_Number+"」。");
			response.sendRedirect("../Rental_Record.jsp");
			
       }else{
    	   response.sendRedirect("../Search_Place.jsp");
    	   return;
       }
       
       %>
       
    