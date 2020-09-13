package net.customer.db;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CustomerDAO {
	private final static Logger log = Logger.getGlobal();

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
			System.out.println("자원해제 실패! : " + e);
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
			System.out.println("joinCheckEmail 내부 안에 에러  : " + e);
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
			System.out.println("joinCheckPhone메서드 오류 발생: " + e);
		} finally {
			resourceClose();
		}
		return result; 		
	} // method()
	
	public int insertCustomer(CustomerBean cb) {
		
		int result = 0;
		
		try {
			 getConnection();

			 sql="insert into customer(customerNo, email, password, nickname, roadAddress, detailAddress,bname, phone, agreeAD, sido) "
	 			     + "values(null, ?, hex(aes_encrypt(?,?)), ?, ?, ?, ?,?,?,?)";	 
			 /*sql="insert into customer(email, password, nickname, roadAddress, detailAddress, bname, phone, agreeAD, sido) "
	 			     + "values(?, ?, ?, ?, ?, ?, ?,?,?)";*/
			 pstmt = con.prepareStatement(sql);
			 

			 pstmt.setString(1, cb.getEmail());
			 pstmt.setString(2, cb.getEmail()); // 이메일 키 검증용
			 pstmt.setString(3, cb.getPassword());
			 pstmt.setString(4, cb.getNickname());
			 pstmt.setString(5, cb.getRoadAddress());
			 pstmt.setString(6, cb.getDetailAddress());
			 pstmt.setString(7, cb.getBname());
			 pstmt.setString(8, cb.getPhone());
			 pstmt.setString(9, cb.getAgreeAD());
			 pstmt.setString(10, cb.getSido());
			 
			 // 일반 로그인 전용 (암호화 없이)
		/*	 pstmt.setString(1, cb.getEmail());
			 pstmt.setString(2, cb.getPassword());
			 pstmt.setString(3, cb.getNickname());
			 pstmt.setString(4, cb.getRoadAddress());
			 pstmt.setString(5, cb.getDetailAddress());
			 pstmt.setString(6, cb.getBname());
			 pstmt.setString(7, cb.getPhone());
			 pstmt.setString(8, cb.getAgreeAD());
			 pstmt.setString(9, cb.getSido());*/
			 
		
		
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
	public boolean CheckCustomer(CustomerBean cb) { // 암호화된 고객체크
	
		boolean result = false;
		


		try {
			 getConnection();
			 
		
/*			 sql ="select email from customer where password = ? and email = ?";*/

		sql="select * from customer where email =  ? "
				+ "and password = ? =  "
				+ "(select aes_decrypt(unhex(password),?) " // 패스워드
				+ "as email from customer where email=?)";
	 

			 pstmt = con.prepareStatement(sql);
			 
			 pstmt.setString(1, cb.getEmail());
			 pstmt.setString(2, cb.getPassword());
			 pstmt.setString(3, cb.getPassword()); // 검사용
			 pstmt.setString(4, cb.getEmail());
			 // 기존 select 문
		/*	  pstmt.setString(1, cb.getPassword());
			  pstmt.setString(2, cb.getEmail());*/

			 
			 rs = pstmt.executeQuery();		 

			if (rs.next()) {
				result = true;
				log.info("암호화된 고객 로그인 체크 성공 값 체크 : " + result);

			}else{
				log.info("암호화된 고객 로그인 체크 실패 값 " + result);
			}
	
			 

			
		} catch (Exception e){
			log.info("고객체크 오류 발생 " + e);
		} finally {
			resourceClose();
		}
		
		return result;
	} // method
/***********************************************************/
	public int NotAesCheckCustomer(CustomerBean cb) { // 암호화 안된 고객 체크
		
		int result = 0;
		


		try {
			 getConnection();
			 
		
			 sql ="select email from customer where password = ? and email = ?";

	 

			 pstmt = con.prepareStatement(sql);
			 

			  pstmt.setString(1, cb.getPassword());
			  pstmt.setString(2, cb.getEmail());

			 
			 rs = pstmt.executeQuery();		 

			if (rs.next()) {
				result = 1;
				log.info("암호화 안된 고객 로그인 체크 성공 값 체크 : " + result);

			}else{
				log.info("암호화 안된 로그인 체크 실패 값 " + result);
			}
	
			 

			
		} catch (Exception e){
			log.info("고객체크 오류 발생 " + e);
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
			System.out.println("-----------------------CustomerInformation ------------------------------------");
			System.out.println("customer dao 닉네임 값  :  " + cb.getNickname());
			System.out.println("customer dao 고객번호 값 customerNo :  " + cb.getCustomerNo());
			System.out.println("customer dao 폰번호 값 customerNo :  " + cb.getPhone());
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			resourceClose();
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
	
	/****************************************************/
	public CustomerBean AesCheckCustomer(String email, String password){ // 암호 확인후 고객 정보 조회해주는  함수
		CustomerBean cBean = new CustomerBean();
		try {
			con=getConnection();

			sql="select * from customer where email =  ? "
					+ "and password = ? =  "
					+ "(select aes_decrypt(unhex(password),?) " // 패스워드
					+ "as email from customer where email=?)";
			
			 log.info("AesCheckCustomer (암호화된 패스워드로 정보 확인) 받은 이메일 정보 : " + email);
			 
			pstmt=con.prepareStatement(sql);
			 pstmt.setString(1, email);
			 pstmt.setString(2, password);
			 pstmt.setString(3, password); // 검사용
			 pstmt.setString(4, email);
			 
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
			log.info("AesCheckCustomer 오류 발생 " + e);
		} finally {
			resourceClose();
		}
		return cBean;
	}
	
	/***********************************************************************************************/
	/*public CustomerBean AesNoCustomer(String email, String password){ // 암호화가 되어있지 않은 고객 정보 호출 함수
		CustomerBean cBean = new CustomerBean();
		try {
			con=getConnection();

			// 암호화가 안되어있는 고객 정보를 호출함 (회원정보 수정란에서 사용하는 함수) 
			sql="select * from customer where email = ? and password = ? ";
			
			 log.info("AesNoCustomer No 암호화 고객  정보 확인) 받은 이메일 정보 : " + email);
			 
			pstmt=con.prepareStatement(sql);
			 pstmt.setString(1, email);
			 pstmt.setString(2, password);
			 
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
			log.info("AesNoCustomer 오류 발생 " + e);
		} finally {
			resourceClose();
		}
		return cBean;
	}*/
/***********************************************************************************************/
	// update Customer
	public int updateMember(CustomerBean cBean){
		int result = 0;
		try {
			con = getConnection();
	sql="UPDATE customer SET  password = "
			+ "hex(aes_encrypt(?, ?)), nickname=?,phone=?,roadAddress=?,detailAddress=?,bname=?,sido=? "
			+ "where email = ? and customerNo = ?";


	pstmt=con.prepareStatement(sql);
	pstmt.setString(1, cBean.getEmail());
	pstmt.setString(2, cBean.getPassword());
	pstmt.setString(3, cBean.getNickname());
	pstmt.setString(4, cBean.getPhone());
	pstmt.setString(5, cBean.getRoadAddress());
	pstmt.setString(6, cBean.getDetailAddress());
	pstmt.setString(7, cBean.getBname());
	pstmt.setString(8, cBean.getSido());	
	pstmt.setString(9, cBean.getEmail()); // 중복아님, 이메일 확인용 
	pstmt.setString(10, cBean.getCustomerNo());
			
			
	log.info("게터로 받은 패스워드 : " + cBean.getPassword());
	log.info("게터로 받은 이메일 : " + cBean.getEmail());
			// 암호화 안된 버전
		/*	sql="update customer set password=?,nickname=?,phone=?,roadAddress=?,detailAddress=?,bname=?,sido=? "
					+ "where customerNo=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, cBean.getPassword());
			pstmt.setString(2, cBean.getNickname());
			pstmt.setString(3, cBean.getPhone());
			pstmt.setString(4, cBean.getRoadAddress());
			pstmt.setString(5, cBean.getDetailAddress());
			pstmt.setString(6, cBean.getBname());
			pstmt.setString(7, cBean.getSido());
			pstmt.setString(8, cBean.getCustomerNo());*/
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			log.info("고객정보 수정 메서드 오류 발생 " + e);
			e.printStackTrace();
		} finally {
			resourceClose();
		}
		log.info("회원정보 수정 액션 result 값 : " + result);
		return result;
	}
	
	
	
	
	// update Customer, 사용자가 패스워드 변경을 하지않은경우
	// 암호화 된 키 값을 원래대로 돌리는 문구가 없어서 update가 null값 인경우 본 함수로 대체함
		public int updateMemberNoPassword(CustomerBean cBean){
			int result = 0;
			try {
				con = getConnection();
		sql="UPDATE customer SET nickname=?,phone=?,roadAddress=?,detailAddress=?,bname=?,sido=? "
				+ "where email = ? and customerNo = ?";


		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, cBean.getNickname());
		pstmt.setString(2, cBean.getPhone());
		pstmt.setString(3, cBean.getRoadAddress());
		pstmt.setString(4, cBean.getDetailAddress());
		pstmt.setString(5, cBean.getBname());
		pstmt.setString(6, cBean.getSido());	
		pstmt.setString(7, cBean.getEmail()); // 중복아님, 이메일 확인용 
		pstmt.setString(8, cBean.getCustomerNo());
				
				
		log.info("updateMemberNoPassword 게터로 받은 패스워드 : " + cBean.getPassword());
		log.info("updateMemberNoPassword 게터로 받은 패스워드 : " + cBean.getEmail());
		
				result = pstmt.executeUpdate();
			} catch (Exception e) {
				log.info("고객정보 수정 메서드 오류 발생 " + e);
				e.printStackTrace();
			} finally {
				resourceClose();
			}
			log.info("updateMemberNoPassword 회원정보 수정 액션 result 값 : " + result);
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

	
	public void deleteLastCouponsAfterLogin(int customerNo) {
		try {
			con = getConnection();
			sql = "delete from coupon where expDate<DATE_FORMAT(NOW(),'%Y-%m-%d') and customerNo = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, customerNo);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteLastCouponsAfterLogin메서드 내부 에러 : " + e);
		} finally {
			resourceClose();
		}
	}
	
	
	
	
} // class
