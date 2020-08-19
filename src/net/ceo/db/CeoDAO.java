package net.ceo.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.customer.db.CustomerBean;


public class CeoDAO {
	private Connection con = null;
	private String sql = "";
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private Connection getConnection() throws Exception {
		Connection con = null;
		
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/jspmodel2");
		con = ds.getConnection();
		return con;
	}
	
	private void resourceClose() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) rs.close();
			if(con != null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("�ڿ����� ���� ���� �߻�!");
		}
	}
	
	public void connectTest() {
		try {
			con = getConnection();
			resourceClose();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("CeoDAO.java -> connectTest() �޼��� ���� ����");
		}
		
	}

		public String joinCheckEmail(String email) {
		String result="";
		try {
			 getConnection();
			
			 sql = "select email from ceo where email=?";
			 
			 pstmt  = con.prepareStatement(sql);
			 pstmt.setString(1, email);
			
			 rs = pstmt.executeQuery();
			 
			 if(rs.next()){
				 result = "notUsable";
			 } else {
				 result = "useable";			 				
			 }
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			resourceClose();
		}
		return result; 		
	} // method
	
	public boolean insertCeo(CeoBean cb) {
		
		int result = 0;
		
		try {
			 getConnection();

			 sql="insert into ceo(email, password, name, phone) "
			 			     + "values(?, ?, ?, ?)";
			 
			 pstmt = con.prepareStatement(sql);
			 
			 pstmt.setString(1, cb.getEmail());
			 pstmt.setString(2, cb.getPassword());
			 pstmt.setString(3, cb.getName());
			 pstmt.setString(7, cb.getPhone());
	
			 result = pstmt.executeUpdate();
			 
			 if(result != 0) {
				 return true;
			 }
			
		} catch (Exception e){
			System.out.println("insertCustomer inner Error : " + e);
		} finally {
			resourceClose();
		}
		
		return false;
	} // method

}	
