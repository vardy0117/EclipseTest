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
			System.out.println("자원해제 도중 에러 발생!");
		}
	}
	
	public void connectTest() {
		try {
			con = getConnection();
			resourceClose();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("CeoDAO.java -> connectTest() 메서드 내부 에러");
		}
		
	}
	
}
