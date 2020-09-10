package net.delivery.db;

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
	
	public int insertDelveryInfo(DeliveryBean dbean) {
		int result=0;
		try {
			con = getConnection();
		
			sql="insert into delivery(delivengersNo, orderNo) value(?,?)";
		
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(dbean.getDelivengersNo()));
			pstmt.setInt(2, Integer.parseInt(dbean.getOrderNo()));
			
			result=pstmt.executeUpdate();

			}catch (Exception e) {
				System.out.println("insertDelveryInfo inner error : " +e);
			}finally {
				resourceClose();
			}
		
			return result;
	}

	public JSONObject  getDeliveryInfo(String orderNo) {
		DeliveryBean dbean = new DeliveryBean();
		
		JSONObject jsonObj = new JSONObject();
		
		try {
			con = getConnection();
			sql="select * from delivery where orderNo=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(orderNo));
			rs= pstmt.executeQuery();
		
			if(rs.next()){
		
			
			jsonObj.put("storeNo",rs.getString("storeNo"));
			jsonObj.put("orderNo",rs.getString("orderNo" ));
			jsonObj.put("roadAddress", rs.getString("roadAddress"));
			jsonObj.put("detailAddress", rs.getString("detailAddress"));
			jsonObj.put("customerPhone",rs.getString("customerPhone" ));
			jsonObj.put("departureTime", "\""+rs.getTimestamp("departureTime")+"\"");
			jsonObj.put("arrivalTime", "\""+rs.getTimestamp("arrivalTime")+"\"");
			jsonObj.put("DelivengersNo",rs.getString("DelivengersNo"));
		
			}
			
			
			}catch (Exception e) {
				System.out.println("getDeliveryInfo inner error : " +e);
			}finally {
				resourceClose();
			}
	
		return jsonObj;
	}
	
	public JSONArray getDeliveryList(String delivengersNo) {
		JSONArray array= new JSONArray();
		
		try {
			con = getConnection();
		
			sql="select o.orderNo, o.storeNo, o.roadAddress, o.detailAddress, o.phone, o.request, "
			   +"d.departureTime, d.arrivalTime, o.deliveryCheck "
			   +"from delivery d join orderList o "
			   +"on d.orderNo = o.orderNo "
			   +"where d.delivengersNo = ? "
			   +"order by o.deliveryCheck, d.departureTime";
		
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(delivengersNo));	
			// pstmt.setInt(2, Integer.parseInt(dbean.getDelivengersNo());
			
			rs=pstmt.executeQuery(); 
			while(rs.next()){				
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("delivengerNo", delivengersNo);
				jsonObj.put("storeNo",rs.getString("o.storeNo"));
				jsonObj.put("orderNo",rs.getString("o.orderNo" ));
				jsonObj.put("roadAddress", rs.getString("o.roadAddress"));
				jsonObj.put("detailAddress", rs.getString("o.detailAddress"));
				jsonObj.put("customerPhone",rs.getString("o.phone" ));
				jsonObj.put("request", rs.getString("o.request"));
				jsonObj.put("departureTime",rs.getTimestamp("d.departureTime").toString());
				jsonObj.put("arrivalTime", rs.getTimestamp("d.arrivalTime").toString());
				jsonObj.put("deliveryCheck", rs.getString("o.deliveryCheck"));
				
				array.add(jsonObj);
			}
			
			}catch (Exception e) {
				System.out.println("getDeliveryList inner error : " +e);
			}finally {
				resourceClose();
			}
		
		return array;
		
	}

	public void updateArrivalTime(String orderNo) {
		
		try {
			con =getConnection();
			sql="update delivery set arrivalTime=now() where orderNo=?";
			pstmt=	con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(orderNo));
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("updateinneArrivalTimer error :  "+e);
		}finally {
			resourceClose();
		}
		
	}
}
