package net.store.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.catalina.Store;

import com.sun.javafx.fxml.BeanAdapter;

import net.ceo.db.CeoBean;


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

	//insertStore 메서드 
	
	public int insertStore(StoreBean sbean) {
	
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
			 pstmt.executeUpdate();
			 
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
	
	
	
	
}
