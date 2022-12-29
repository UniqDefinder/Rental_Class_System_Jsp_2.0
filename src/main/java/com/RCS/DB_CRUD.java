package com.RCS;

import java.sql.*;

public class DB_CRUD {
	
	private String //DB ="jdbc:ucanaccess://C:\\Users\\login\\eclipse-workspace\\Rental_Class_System_Jsp_2.0\\src\\main\\webapp\\NtunhsClassroom.accdb;";
						  DB ="jdbc:ucanaccess://C:\\Users\\User\\Desktop\\Rental_Class_System_Jsp_2.0\\src\\main\\webapp\\NtunhsClassroom.accdb;";
	
	public void CRUD (String Sql) throws ClassNotFoundException, SQLException {
		
	 	Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
		Connection con=DriverManager.getConnection(DB);
		Statement smt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		smt.execute(Sql);
		con.close();
		}
	
	
	
	public boolean CRUD_B(String Sql) throws ClassNotFoundException, SQLException {
		
	 	Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
		Connection con=DriverManager.getConnection(DB);
		Statement smt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		boolean Err = smt.execute(Sql);
		con.close();
		return (Err);
		}
	
	
	public ResultSet getResultSet (String Sql) throws ClassNotFoundException, SQLException {
		
 	Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
	Connection con=DriverManager.getConnection(DB);
	Statement smt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	ResultSet rs = smt.executeQuery(Sql);
	con.close();
	return rs;
	
	}
	
	public void replaceNull (String Sql , String Data ) throws ClassNotFoundException, SQLException {
		
	 	Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
		Connection con=DriverManager.getConnection(DB);
		Statement smt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
		ResultSet rs = smt.executeQuery(Sql);
		rs.last();
		int count = rs.getRow();
		
		 for(int i = 3 ; count !=0 && i <= 12 ;){ 
			 rs.getString(i);
			  if(rs.wasNull() == false && rs.getString(i).equals(Data) ){rs.updateString(i,"");} 
			  i++;
		  
		 }
		 rs.updateRow(); 
		
		con.close();
		
	    }
			
public void updateString (String Sql ,String Index, String Data ) throws ClassNotFoundException, SQLException {
		
	 	Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
		Connection con=DriverManager.getConnection(DB);
		Statement smt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
		ResultSet rs = smt.executeQuery(Sql);
		rs.last();
		
		rs.updateString(Index,Data);
		rs.updateRow(); 
		
		con.close();
		
	    }
	

	
}
