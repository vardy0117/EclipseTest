package net.delivengers.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DelivengersDAO {
	 Connection con = null;
	 String sql = "";
	 PreparedStatement pstmt = null;
	 ResultSet rs = null;
	
	private Connection getConnection() throws Exception {
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/jspmodel2");
		con = ds.getConnection();
		return con;
	}
	
	private void resourceClose() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public boolean CheckDelivengers(DelivengersBean db) {
		boolean result = false;

		try {
			 getConnection();
			 
			 sql ="select delivengersNo from delivengers where password = ? and delivengersNo = ?";
			  pstmt = con.prepareStatement(sql);
			  pstmt.setString(1, db.getPassword());
			  pstmt.setString(2, db.getDelivengersNo());

			 rs = pstmt.executeQuery();		 

			if (rs.next()) {
				result = true;
			}

		} catch (Exception e){
			System.out.println("CheckDelivengers inner error"+e);

		} finally {
			resourceClose();
		}
		
		return result;
	} // method

}
