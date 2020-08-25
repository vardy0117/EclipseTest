package net.store.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.catalina.Store;

import com.sun.javafx.fxml.BeanAdapter;


import net.ceo.db.CeoBean;
import net.menu.db.MenuBean;


public class StoreDAO {
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
			System.out.println("resourceClose! : " + e);
		}
	} // resourceClose()
	/***********************************************************************/
	public StoreBean getStoreInfo(int storeNo) {
		StoreBean storeInfo = new StoreBean();
		
		try {
			 con = getConnection();
			 
			 sql = "select* from store where storeNo=?";
			 
			 pstmt = con.prepareStatement(sql);
			 pstmt.setInt(1, storeNo);
			 rs = pstmt.executeQuery();
			 
			 if(rs.next()){
				storeInfo.setStoreNo(rs.getString("storeNo"));
				storeInfo.setCeoNo(rs.getString("ceoNo"));
				storeInfo.setName(rs.getString("name"));
				storeInfo.setRoadAddress(rs.getString("roadAddress"));
				storeInfo.setDetailAddress(rs.getString("detailAddress"));
				storeInfo.setCategory(rs.getString("category"));
				storeInfo.setPhone(rs.getString("phone"));
				storeInfo.setStoreHours(rs.getString("storeHours"));
				storeInfo.setMessage(rs.getString("message"));
				storeInfo.setImage(rs.getString("image"));
				storeInfo.setPoints(rs.getString("points"));
				storeInfo.setOrderCount(rs.getString("orderCount"));
				storeInfo.setDeliveryArea(rs.getString("deliveryArea"));
				storeInfo.setRegNo(rs.getString("regNo"));
				storeInfo.setSido(rs.getString("sido"));
			 }
			
		} catch (Exception e) {
			System.out.println("getStoreInfo() Inner Error : " + e);
			e.printStackTrace();
		} finally {
			resourceClose();
		}
		
		return storeInfo;
	}
	/***********************************************************************/
	//insertStore 硫����� 
	
	public int insertStore(StoreBean sbean) {
	
		Integer numero=0;
		int result = 0;
		
		try {
			 getConnection();

			 sql="insert into store(ceoNo, name, roadAddress, detailAddress, category, phone, "
			 		+ "storeHours, message, image, deliveryArea, regNo, sido) "
			 			     + "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			 
			 pstmt = con.prepareStatement(sql);
			 
			 pstmt.setString(1, sbean.getCeoNo());
			 pstmt.setString(2, sbean.getName());
			 pstmt.setString(3, sbean.getRoadAddress());
			 pstmt.setString(4, sbean.getDetailAddress());
			 pstmt.setString(5, sbean.getCategory());
			 pstmt.setString(6, sbean.getPhone());
			 pstmt.setString(7, sbean.getStoreHours());
			 pstmt.setString(8, sbean.getMessage());
			 pstmt.setString(9, sbean.getImage());
			 pstmt.setString(10,sbean.getDeliveryArea());
			 pstmt.setString(11, sbean.getRegNo());
			 pstmt.setString(12, sbean.getSido());
			 
			
			 numero= pstmt.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
			 
			 rs = pstmt.getGeneratedKeys();
			 
			 if(rs.next()) {
				 result = rs.getInt(1);
			 }
			 
			
		} catch (Exception e){
			System.out.println("insertStore inner Error : " + e);
		} finally {
			resourceClose();
		}
		
		
		return result;
		
		
	} // method
	
	/***********************************************************************/
	public List<StoreBean> GetStore(String sido){ // �ㅽ���� ��蹂� 媛��몄�ㅺ린
		List<StoreBean> storelist = new ArrayList<StoreBean>();
		
		try {
			 con = getConnection();
			 
			 sql = "select * from store where sido=?";
			 
			 pstmt = con.prepareStatement(sql);
			 
			 pstmt.setString(1, sido);
			 System.out.println("시도 스토어 받은값 : DAO (sido) : " + sido);
			 
			 rs = pstmt.executeQuery();
			 
			 while(rs.next()){
				 StoreBean mBean = new StoreBean();
					 mBean.setStoreNo(rs.getString("storeNo"));
					 mBean.setCeoNo(rs.getString("ceoNo"));
					 mBean.setName(rs.getString("name"));
					 mBean.setRoadAddress(rs.getString("roadAddress"));
					 mBean.setCategory(rs.getString("category"));
					 mBean.setStoreHours(rs.getString("storeHours"));
					 mBean.setSido(rs.getString("sido"));
					 mBean.setImage(rs.getString("image"));
					 mBean.setMessage(rs.getString("message"));
					 System.out.println("Get 스토어 호출");
					 // ��癒몄��� �ㅼ���� 媛��몄�ㅻ�� 嫄몃� ^^;;;;;;;;;;;;;;;;;;;;;;;;;
					 storelist.add(mBean);
			 }
			
		} catch (Exception e) {
			System.out.println("List<StoreBean> GetStore Error : "+e);
		} finally {
			resourceClose();
		}
		
		
		
		return storelist;
		
	}
	/***********************************************************************/

	
	
	
	
	
	
	
}
