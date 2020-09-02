package net.orderList.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class OrderListDAO {
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
			System.out.println("resourceClose Error! : " + e);
		}
	} // resourceClose()
	
	public int insertOrderList(OrderListBean oBean) {
		int orderNo = 0;
		
		try {
			 getConnection();

			 sql="insert into orderList(customerNo, storeNo, roadAddress, detailAddress, phone, request, payment, couponNo)" +
				 " values(?,?,?,?,?,?,?,?)";
			 
			 pstmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			 
			 pstmt.setInt(1, Integer.parseInt(oBean.getCustomerNo()));
			 pstmt.setInt(2, Integer.parseInt(oBean.getStoreNo()));
			 pstmt.setString(3, oBean.getRoadAddress());
			 pstmt.setString(4, oBean.getDetailAddress());
			 pstmt.setString(5, oBean.getPhone());
			 pstmt.setString(6, oBean.getRequest());
			 pstmt.setString(7, oBean.getPayment());
			 pstmt.setString(8, oBean.getCouponNo());
			 
			 pstmt.executeUpdate();
			 
			 rs = pstmt.getGeneratedKeys();
			 
			 
			 if(rs.next()) {
				 orderNo = rs.getInt(1);
			 }
			 
			 
			
		} catch (Exception e){
			System.out.println("insertOrderList inner Error : " + e);
			e.printStackTrace();
		} finally {
			resourceClose();
		}
		
		return orderNo;
		
	}
	
	
	
	public int GetOrderDetail(String  number) { 
		// 리스트 방식으로 변경해야 됨
		int test =0;
		
		try {
			 getConnection();

			 sql = "select * from orderList where customerNo = ? ";
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, number);
			 System.out.println("OrderListDao에 SELECT에 가지고온 customerNo : " + number);
			
			 rs = pstmt.executeQuery();
			 

			 
			 if(rs.next()) {
				 test = rs.getInt(1);
				 System.out.println("test값 결과 " + test);
			 }
			 
			
		} catch (Exception e){
			System.out.println("GetOrderDetail Error : " + e);
		} finally {
			resourceClose();
		}
		
		return test;
		
	}

}
