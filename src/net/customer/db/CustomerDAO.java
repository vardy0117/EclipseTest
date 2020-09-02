package net.customer.db;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
			System.out.println("占쌘울옙 占쏙옙占쏙옙 占쏙옙占쏙옙! : " + e);
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
			System.out.println("joinCheckEmail占쌨소듸옙 占쏙옙占싸울옙占쏙옙 占쏙옙占쏙옙 占쌩삼옙 : " + e);
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
			System.out.println("joinCheckPhone占쌨소듸옙 占쏙옙占싸울옙占쏙옙 占쏙옙占쏙옙 占쌩삼옙 : " + e);
		} finally {
			resourceClose();
		}
		return result; 		
	} // method()
	
	public int insertCustomer(CustomerBean cb) {
		
		int result = 0;
		
		try {
			 getConnection();

			 sql="insert into customer(email, password, nickname, roadAddress, detailAddress, bname, phone, agreeAD, sido) "
			 			     + "values(?, ?, ?, ?, ?, ?, ?,?,?)";

/*********占쏙옙호 占쏙옙占� 占쏙옙占쏙옙**************/			 
/* sql="insert into customer(customerNo, email, password, nickname, address, bname, phone, agreeAD) "
	 			     + "values(null, ?, hex(aes_encrypt(?,?)), ?, ?, ?, ?, ?)";
*/

			 
			
			 pstmt = con.prepareStatement(sql);
			 
			 pstmt.setString(1, cb.getEmail());
			 pstmt.setString(2, cb.getPassword());
			 pstmt.setString(3, cb.getNickname());
			 pstmt.setString(4, cb.getRoadAddress());
			 pstmt.setString(5, cb.getDetailAddress());
			 pstmt.setString(6, cb.getBname());
			 pstmt.setString(7, cb.getPhone());
			 pstmt.setString(8, cb.getAgreeAD());
			 pstmt.setString(9, cb.getSido());
			 
			/*// 占쏙옙호화 占쏙옙占쏙옙
			 pstmt.setString(1, cb.getEmail());
			 pstmt.setString(2, cb.getEmail());
			 pstmt.setString(3, cb.getPassword());
			 pstmt.setString(4, cb.getNickname());
			 pstmt.setString(5, cb.getAddress());
			 pstmt.setString(6, cb.getBname());
			 pstmt.setString(7, cb.getPhone());
			 pstmt.setString(8, cb.getAgreeAD());
			 */
			 result = pstmt.executeUpdate();
			 
			 if(result != 0) {
				 return 1;
			 }
			
		} catch (Exception e){
			System.out.println("insertCustomer 오류 발생: " + e);
		} finally {
			resourceClose();
		}
		
		return result;
	} // method
/***********************************************************************************************/
	public boolean CheckCustomer(CustomerBean cb) { // 占싸깍옙占쏙옙 占싯삼옙 
	
		boolean result = false;
		


		try {
			 getConnection();
			 
//			sql ="select aes_decrypt(unhex(password), ?) as email from customer where email = ? ";
			 sql ="select email from customer where password = ? and email = ?";

			 

			 pstmt = con.prepareStatement(sql);
			  pstmt.setString(1, cb.getPassword());
			  pstmt.setString(2, cb.getEmail());

			 
			 rs = pstmt.executeQuery();		 

			if (rs.next()) {
				System.out.println("占싸깍옙占쏙옙 占쏙옙占쏙옙");
				result = true;

			}
	
			 

			
		} catch (Exception e){
			System.out.println("CheckCustomer占쌨소듸옙 占쏙옙占싸울옙占쏙옙 占쏙옙占쏙옙 占쌩삼옙 : " + e);
		} finally {
			resourceClose();
		}
		
		return result;
	} // method

	public CustomerBean CustomerInformation (String email) {
		
		CustomerBean cb = new CustomerBean();
		 try {
			getConnection();
			String sql2 = "select * from customer where email=?";
			pstmt = con.prepareStatement(sql2);
			pstmt.setString(1, email);
			System.out.println("sql2 CustomerInformation 완료");
			rs = pstmt.executeQuery();
			rs.next();
			/************************************************************************************/
			
			cb.setNickname(rs.getString("nickname"));
			cb.setCustomerNo(rs.getString("customerNo"));
			cb.setPhone(rs.getString("phone"));
			/************************************************************************************/
			// 占싸깍옙占싸쏙옙 占쏙옙占쏙옙 select 占쌔쇽옙 占쏙옙占쏙옙占쏙옙占쏙옙
			System.out.println("-----------------------CustomerInformation ------------------------------------");
			System.out.println("customer dao 닉네임 값  :  " + cb.getNickname());
			System.out.println("customer dao 고객번호 값 customerNo :  " + cb.getCustomerNo());
			System.out.println("customer dao 폰번호 값 customerNo :  " + cb.getPhone());
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		
		return cb;
		
	}
/***********************************************************************************************/
	public CustomerBean getCustomer(String customerNo){
		CustomerBean cBean = new CustomerBean();
		try {
			con=getConnection();
			sql="select * from customer where customerNo=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, customerNo);
			rs = pstmt.executeQuery();
			if(rs.next()){
				cBean.setCustomerNo(rs.getString(1));
				cBean.setEmail(rs.getString(2));
				cBean.setPassword(rs.getString(3));
				cBean.setNickname(rs.getString(4));
				cBean.setRoadAddress(rs.getString(5));
				cBean.setDetailAddress(rs.getString(6));
				cBean.setBname(rs.getString(7));
				cBean.setPhone(rs.getString(8));
				cBean.setGrad(rs.getString(9));
				cBean.setAgreeAD(rs.getString(10));
				cBean.setSido(rs.getString(11));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose();
		}
		return cBean;
	}
	
/***********************************************************************************************/
	// update Customer
	public int updateMember(CustomerBean cBean){
		int result = 0;
		try {
			con = getConnection();
			sql="update customer set password=?,nickname=?,phone=?,roadAddress=?,detailAddress=?,bname=?,sido=? "
					+ "where customerNo=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, cBean.getPassword());
			pstmt.setString(2, cBean.getNickname());
			pstmt.setString(3, cBean.getPhone());
			pstmt.setString(4, cBean.getRoadAddress());
			pstmt.setString(5, cBean.getDetailAddress());
			pstmt.setString(6, cBean.getBname());
			pstmt.setString(7, cBean.getSido());
			pstmt.setString(8, cBean.getCustomerNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose();
		}
		return result;
	}
/***********************************************************************************************/
	
	public int deleteCustomer(String customerNo){
		int result = 0;
		
		try {
			con=getConnection();
			sql="delete from customer where customerNo=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, customerNo);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose();
		}
		
		return result;
	}

	// store.jsp 리뷰란에서 고객번호로 글 구분짓는거 말고 고객닉네임으로 구분 짓다가 잠시 보류 - 이태우- 
public String getNickName(String customerNo) {
	
	List<String> list = new ArrayList<String>();
	String nickName="";
	try {
		con = getConnection();
		sql = "select nickname from customer where customerNo=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, customerNo);
		rs = pstmt.executeQuery();
		while(rs.next()){
			nickName = rs.getString("nickname");
			list.add(nickName);
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		resourceClose();
	}
	return nickName;
}

	
	
	
	
	
} // class
