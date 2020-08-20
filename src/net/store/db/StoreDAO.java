package net.store.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


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
			 }
			
		} catch (Exception e) {
			System.out.println("getStoreInfo() Inner Error : " + e);
			e.printStackTrace();
		} finally {
			resourceClose();
		}
		
		return storeInfo;
	}

}
