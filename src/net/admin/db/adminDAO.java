package net.admin.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sun.org.apache.regexp.internal.recompile;

public class adminDAO {
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


	public int CheckAdmin(AdminBean abean) {
		int result= 0;
		try {
			con =getConnection();
			sql="select adminNo from admin where adminNo=? and adminPassword=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, abean.getAdminNo());
			pstmt.setString(2, abean.getAdminPassword());
			rs=	pstmt.executeQuery();
			
			if(rs.next()){
				result=1;
			}
			
		} catch (Exception e) {
			
		}finally {
			resourceClose();
		}
		
		
		return result;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	}