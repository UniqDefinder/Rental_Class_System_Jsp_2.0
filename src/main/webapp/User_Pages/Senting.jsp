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
</head>

<%!String
/*DB ="jdbc:ucanaccess://C:\\Users\\login\\eclipse-workspace\\Rental_Class_System_Jsp_2.0\\src\\main\\webapp\\NtunhsClassroom.accdb;";*/
DB ="jdbc:ucanaccess://C:\\Users\\User\\Desktop\\Rental_Class_System_Jsp_2.0\\src\\main\\webapp\\NtunhsClassroom.accdb;";
%>
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
				Rental_Term = "",
				Rental_Term_Serial_Number = "";
	
	
	Boolean Class_Date_Check = false,
					isEmpty = true;
//租借編號 = 租借日期+發送時間+帳號 Ex: 22122022235001User
	
	
	int Arrlength = 0;
	
				

	
	
				
				
	
	
    if(Classroom_Code !=null && Date !=null && Reason!=null && Term[0]!=null){
	 	Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
		Connection con=DriverManager.getConnection(DB);
		Statement smt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		String sql = "SELECT * FROM Classroom_Code Where Classroom_Code='"+Classroom_Code+"'";
		ResultSet rs = smt.executeQuery(sql);
	 	rs.last();
	 	
		int count = rs.getRow();
		sql = "SELECT * FROM Rental_Term WHERE Classroom_Code='"+Classroom_Code+"' AND Rental_Date=#"+Date+"#";
		rs = smt.executeQuery(sql);
		
		for(int i = 0 ; i<Arrlength;){
			if(rs.getString(Term[i]) != null){ isEmpty = false; break;};
			i++;
		}//偵測時段是否被租借
		
	 	if(count == 0 && isEmpty == false){
	 		response.sendRedirect("User_Search_Place.jsp");
	 		return;
	 		}else{
	 			Class_Date_Check = true ;
	 		}
	 	con.close();
	}else{
		
		response.sendRedirect("User_Search_Place.jsp");
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
			con.close();
			int count = rs.getRow();	
			
			Arrlength = Term.length;
			for(int i=0;i<Arrlength;){
				
				Rental_Term = Rental_Term +",["+Term[i]+"]";
				Rental_Term_Serial_Number = Rental_Term_Serial_Number+",'"+Serial_Number+"'";
				i++;
			}
			
			 if(count==0){
				con=DriverManager.getConnection(DB);
				smt= con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
				smt.execute("INSERT INTO Rental_Record(Rental_Serial_Number,Classroom,Date_Of_Application,Rental_Date,Account,Reason,Check_State)  VALUES('"+Serial_Number+"','"+Classroom_Code+"',#"+Apply_Date+"#,#"+Date+"#,'"+(String) session.getAttribute("Access_Id")+"','"+Reason+"','?')");
				
				
				String sql = "INSERT INTO Rental_Term(Classroom_Code,Rental_Date"+Rental_Term+") VALUES('"+Classroom_Code+"',#"+Date+"#"+Rental_Term_Serial_Number+")";
				smt.execute(sql);
				
			 }else{
				 return;
				 }   
			 
       }else{
    	   response.sendRedirect("User_Search_Place.jsp");
    	   return;
       }
       %>
    