package net.admin.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import net.customer.db.CustomerBean;
import net.delivengers.db.DelivengersBean;

public class AdminDao {
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

	// admin전용
	public JSONArray AdmingetDelivengersList() {
		JSONArray array= new JSONArray();
		
		try {
			con = getConnection();
		
			sql="select * from delivengers";
		
			pstmt = con.prepareStatement(sql);
		//	pstmt.setInt(1, Integer.parseInt(delivengersNo));	

			rs=pstmt.executeQuery(); 
			while(rs.next()){				
				JSONObject jsonObj = new JSONObject();
			//	jsonObj.put("delivengerNo", delivengersNo);
				jsonObj.put("delivengersNo" ,rs.getString("delivengersNo" ));
				array.add(jsonObj);
			}
			
			}catch (Exception e) {
				System.out.println("getDelivengersList inner error : " +e);
			}finally {
				resourceClose();
			}
		
		return array;
		
	}
	
	
	
	public JSONArray AdmingetStoreList() {
		JSONArray array= new JSONArray();
		
		try {
			con = getConnection();
		
			sql="select ceoNo, email 'ceoEmail', permission from  ceo";
		
			pstmt = con.prepareStatement(sql);
	

			rs=pstmt.executeQuery(); 
			while(rs.next()){				
				JSONObject jsonObj = new JSONObject();
			/*storeNo, ceoNo, storeName, ceoEmail
			 * */
			//	jsonObj.put("storeNo" ,rs.getString("storeNo" ));
				jsonObj.put("ceoNo" ,rs.getString("ceoNo" ));
			//	jsonObj.put("storeName" ,rs.getString("storeName" ));
				jsonObj.put("ceoEmail" ,rs.getString("ceoEmail" ));
				jsonObj.put("permission" ,rs.getString("permission" ));
				array.add(jsonObj);
				
			}
			
			}catch (Exception e) {
				System.out.println("AdmingetStoreList inner error : " +e);
			}finally {
				resourceClose();
			}
		
		return array;
		
	}
	
	public JSONArray AdminCustomerList() {
		JSONArray array= new JSONArray();
		
		try {
			con = getConnection();
		
			sql="select customerNo, email,nickname, bname from customer"; 
		
			pstmt = con.prepareStatement(sql);
	

			rs=pstmt.executeQuery(); 
			while(rs.next()){				
				JSONObject jsonObj = new JSONObject();
	
				jsonObj.put("customerNo" ,rs.getString("customerNo" ));
				jsonObj.put("email" ,rs.getString("email" ));
				jsonObj.put("nickname" ,rs.getString("nickname" ));
				jsonObj.put("bname" ,rs.getString("bname" ));
				array.add(jsonObj);
				
			}
			
			}catch (Exception e) {
				System.out.println("AdminCustomerList inner error : " +e);
			}finally {
				resourceClose();
			}
		
		return array;
		
	}
	
	
	public int updateCeo(String ceoNo){
		int result = 0;
		try {
			con = getConnection();
			sql="update ceo set permission = 'T' where ceoNo = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, ceoNo);
			System.out.println("update ceo no " + ceoNo );
	
			
			result = pstmt.executeUpdate();
			
			System.out.println("update ceo result : " + result );
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose();
		}
		return result;
	}
	
	// 어드민이 메일 대량 발송 할때 사용하는 메서드
public List<CustomerBean> GetUserMail(){
	CustomerBean mailbean = null;
		List<CustomerBean> UserMailList = new ArrayList<CustomerBean>();
		
		try {

			con = getConnection();
			sql = "select email from customer where agreeAD = 'T' ";
			pstmt=con.prepareStatement(sql);
			// pstmt.setString(1, customerNo);
			rs = pstmt.executeQuery();
			while(rs.next()){
				mailbean = new CustomerBean();
				mailbean.setEmail(rs.getString("email"));
				System.out.println("쿼리해서 가져온 광고 발송 가능 메일 리스트 : " + rs.getString("email"));
				UserMailList.add(mailbean);
			}
		} catch (Exception e) {
			System.out.println("get user email 메서드 오류 " + e);
			e.printStackTrace();
		} finally {
			resourceClose();
		}
		return UserMailList;
	}
	
}
