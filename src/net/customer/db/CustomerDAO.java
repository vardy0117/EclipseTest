package net.customer.db;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CustomerDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	private Connection getConnection() throws Exception{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/jspmodel2");
		con = ds.getConnection();
		
		return con;
	}
	
	public void resourceClose(){
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		} catch (Exception e) {
			System.out.println("자원 해제 실패! : " + e);
		}
	} // resourceClose()

	public String joinCheckEmail(String email) {
		String result="";
		try {
			 getConnection();
			
			 sql = "select email from customer where email=?";
			 
			 pstmt  = con.prepareStatement(sql);
			 pstmt.setString(1, email);
			
			 rs = pstmt.executeQuery();
			 
			 if(rs.next()){
				 result = "notUsable";
			 } else {
				 result = "useable";			 				
			 }
		} catch (Exception e) {
			System.out.println("joinCheckEmail메소드 내부에서 예외 발생 : " + e);
		} finally {
			resourceClose();
		}
		return result; 		
	} // method

	public String joinCheckPhone(String phone) {
		String result="";
		try {
			 getConnection();
			
			 sql = "select phone from customer where phone=?";
			 
			 pstmt  = con.prepareStatement(sql);
			 pstmt.setString(1, phone);
			
			 rs = pstmt.executeQuery();
			 
			 if(rs.next()){
				 result = "notUsable";
			 } else {
				 result = "useable";			 				
			 }
		} catch (Exception e) {
			System.out.println("joinCheckPhone메소드 내부에서 예외 발생 : " + e);
		} finally {
			resourceClose();
		}
		return result; 		
	} // method()
	
	public boolean insertCustomer(CustomerBean cb) {
		
		int result = 0;
		
		try {
			 getConnection();

			 sql="insert into customer(email, password, nickname, address, bname, phone, agreeAD) "
			 			     + "values(?, ?, ?, ?, ?, ?, ?)";
			
			 pstmt = con.prepareStatement(sql);
			
			 pstmt.setString(1, cb.getEmail());
			 pstmt.setString(2, cb.getPassword());
			 pstmt.setString(3, cb.getNickname());
			 pstmt.setString(4, cb.getAddress());
			 pstmt.setString(5, cb.getBname());
			 pstmt.setString(6, cb.getPhone());
			 pstmt.setString(7, cb.getAgreeAD());
			 
			 result = pstmt.executeUpdate();
			 
			 if(result != 0) {
				 return true;
			 }
			
		} catch (Exception e){
			System.out.println("insertCustomer메소드 내부에서 예외 발생 : " + e);
		} finally {
			resourceClose();
		}
		
		return false;
	} // method
/***********************************************************************************************/
	public boolean CheckCustomer(CustomerBean cb) { // 로그인 검사 
		
		boolean result = false;
		


		try {
			 getConnection();
			 
			sql =" select aes_decrypt(unhex(password), ?) from customer where email = ? ";
			// mysql에 aes 암호 알고리즘(?) 사용 해서 원본 아이디 비밀번호 검사
			
			 
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, cb.getPassword());
			 pstmt.setString(2, cb.getEmail());
			 

		//	 result = pstmt.executeUpdate();
			 rs = pstmt.executeQuery();
			 
			 if(rs.next()) {
				 System.out.println("비밀번호 : " + cb.getPassword() + " 아이디 : " + cb.getEmail());
				 System.out.println("아이디 검사 성공! 사용자가 정보를 맞게 입력함");
				 result = true;
			 }else{
				 System.out.println("사용자가 비밀번호 틀림");
				 System.out.println("비밀번호 : " + cb.getPassword() + " 아이디 : " + cb.getEmail());
				result = false;
			 }
			
		} catch (Exception e){
			System.out.println("CheckCustomer메소드 내부에서 예외 발생 : " + e);
		} finally {
			resourceClose();
		}
		
		return result;
	} // method
	
/***********************************************************************************************/
	
	
} // class
