package net.delivery.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.orderList.db.OrderListBean;

public class DeliveryDAO {
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
	
	public void insertDelveryInfo(DeliveryBean dbean) {
		try {
			con = getConnection();
		
			sql="insert into delivery(delivengersNo, storeNo, orderNo, roadAddress, detailAddress, customerPhone) value(?,?,?,?,?,?)";
		
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, /*Integer.parseInt(dbean.getDelivengersNo())*/ 1);
			pstmt.setInt(2, Integer.parseInt(dbean.getStoreNo()));
			pstmt.setInt(3, Integer.parseInt(dbean.getOrderNo()));
			pstmt.setString(4, dbean.getRoadAddress());
			pstmt.setString(5, dbean.getDetailAddress());
			pstmt.setString(6, dbean.getCustomerPhone());
			
			pstmt.executeUpdate();

			}catch (Exception e) {
				System.out.println("insertDelveryInfo inner error : " +e);
			}finally {
				resourceClose();
			}
		
	}

	public List<DeliveryBean> getDeliveryInfo(DeliveryBean dbean) {
		List<DeliveryBean> list = new ArrayList<DeliveryBean>();
		try {
			con = getConnection();
		
			sql="select* from delivery where storeNo=? and deliveryCheck='F'"; // and delivengersNo=?
		
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(dbean.getStoreNo()));	
			// pstmt.setInt(2, Integer.parseInt(dbean.getDelivengersNo());
			
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				DeliveryBean dBean = new DeliveryBean();
				dBean.setDelivengersNo(/*rs.getString("delivengersNo")*/ "1");
				dBean.setStoreNo(rs.getString("storeNo"));
				dBean.setOrderNo(rs.getString("orderNo"));
				dBean.setRoadAddress(rs.getString("roadAddress"));
				dBean.setDetailAddress(rs.getString("detailAddress"));
				dBean.setCustomerPhone(rs.getString("customerPhone"));
				dBean.setDepartureTime(rs.getTimestamp("departureTime"));
				dBean.setArrivalTime(rs.getTimestamp("arrivalTime"));
				
				list.add(dBean);
			}
			
			}catch (Exception e) {
				System.out.println("getDeliveryInfo inner error : " +e);
			}finally {
				resourceClose();
			}
		return list;
		
		
	}
}
