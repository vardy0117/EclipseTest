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
			System.out.println("�ڿ� ���� ����! : " + e);
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
			System.out.println("joinCheckEmail�޼ҵ� ���ο��� ���� �߻� : " + e);
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
			System.out.println("joinCheckPhone�޼ҵ� ���ο��� ���� �߻� : " + e);
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
			 /********************************************/
			 // ��� ����
			 /********************************************/
			 
		/*	 sql="insert into customer(email, password, nickname, address, bname, phone, agreeAD) "
	 			     + "values('?', hex(aes_encrypt(email,?), ?, ?, ?, ?, ?)";*/
			 /*insert into customer (customerNo, email, password, nickname, address, bname, phone, grade,agreeAD) values 
			 (null, 'test12@naver.com', hex(aes_encrypt('test12@naver.com','1234')),'�г���3','����','��ϵ�',01028017891,5,'T' );
			 */
			 
			
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
			System.out.println("insertCustomer�޼ҵ� ���ο��� ���� �߻� : " + e);
		} finally {
			resourceClose();
		}
		
		return false;
	} // method
/***********************************************************************************************/
	public boolean CheckCustomer(CustomerBean cb) { // �α��� �˻� 
		
		boolean result = false;
		


		try {
			 getConnection();
			 
			sql =" select aes_decrypt(unhex(password), ?) as email from customer where email = ? ";
			// mysql�� aes ��ȣ �˰���(?) ��� �ؼ� ���� ���̵� ��й�ȣ �˻�
			
			 /***************************************************************/
			// ��ȣȭ�� ����� ������ �� ����� �����ϴ� ������ ȣȯ�� ���� ȸ�����Խÿ��� ��ȣȭ �� �����Դϴ�
			
			
			 /***************************************************************/
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, cb.getPassword());
			 pstmt.setString(2, cb.getEmail());
			 
			// rs.getString("email");
			 
	
			 rs = pstmt.executeQuery();		 
		
			 rs.next();
			 if(rs.getString("email") != null) { // ������ ���������� �۵��ϸ� ����, ��ȣ�� �ٸ����·� select�� �Ǿ����� �ȸ����� 
				 								// ������ null�� ����  ��й�ȣ Ʋ�������� ����,   
				 								// �׸��� ��ȣȭ�� �ȵ� ������, 
				 								// �� �����ڰ� ���Ƿ� ���� �׽�Ʈ �����ʹ� �� �˻� ����� �ȸ���
				 	
				 
				 System.out.println("���� DB���� : " +  cb.getEmail() );
				 
				 System.out.println("��й�ȣ : " + cb.getPassword() + " ���̵� : " + cb.getEmail());
				 System.out.println("���̵� �˻� ����! ����ڰ� ������ �°� �Է���");
				 System.out.println("�˻� ���� rs.next����" + rs.next());
				 result = true;
			 }else{
				 System.out.println("����ڰ� ��й�ȣ Ʋ��");
				 System.out.println("��й�ȣ : " + cb.getPassword() + " ���̵� : " + cb.getEmail());
				 System.out.println("�˻� ���� rs.next����" + rs.next());
				 result = false;
			 }
			
		} catch (Exception e){
			System.out.println("CheckCustomer�޼ҵ� ���ο��� ���� �߻� : " + e);
		} finally {
			resourceClose();
		}
		
		return result;
	} // method
	
/***********************************************************************************************/
	
	
} // class
