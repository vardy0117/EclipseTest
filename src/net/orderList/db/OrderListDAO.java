package net.orderList.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.orderMenu.db.OrderMenuBean;
import net.store.db.StoreBean;

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
		int storeNo = 0;
		
		try {
			 getConnection();

			 sql="insert into orderList(customerNo, storeNo, roadAddress, detailAddress, phone)" +
				 " values(?,?,?,?,?)";
			 
			 pstmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			 
			 pstmt.setInt(1, Integer.parseInt(oBean.getCustomerNo()));
			 pstmt.setInt(2, Integer.parseInt(oBean.getStoreNo()));
			 pstmt.setString(3, oBean.getRoadAddress());
			 pstmt.setString(4, oBean.getDetailAddress());
			 pstmt.setString(5, oBean.getPhone());
			
			 pstmt.executeUpdate();
			 
			 rs = pstmt.getGeneratedKeys();
			 
			 
			 if(rs.next()) {
				 storeNo = rs.getInt(1);
			 }
			 
			
		} catch (Exception e){
			System.out.println("insertOrderList inner Error : " + e);
		} finally {
			resourceClose();
		}
		
		return storeNo;
		
	}
	
	
	
	public   List<OrderJoinBean>  GetOrderDetail(String  number) { 
		 List<OrderJoinBean> orderlist = new ArrayList<OrderJoinBean>();		
		OrderJoinBean join = null ;
		
		try {
			 getConnection();

			// sql = "select orderNo, customerNo, storeNo from orderList where customerNo = ? ";
			sql = "select a.orderNo, a.customerNo, b.name, b.price "
					+ "from orderList a, orderMenu b "
					+ "where a.orderNo = b.orderNo and customerNo = ?";

			 pstmt = con.prepareStatement(sql);
			 
			 pstmt.setString(1, number);
			 System.out.println("OrderListDao에 SELECT에 가지고온 customerNo : " + number);
			 System.out.println("sql " + sql);
			 rs = pstmt.executeQuery();
			 while(rs.next()) {
				 join = new OrderJoinBean();
				 
				 join.setOrderNo(rs.getString(1));
				 join.setCustomerNo(rs.getString(2));
				 join.setName(rs.getString(3));
				 
				 join.setPrice(rs.getString(4));
				 orderlist.add(join);

				
			 }
			
		} catch (Exception e){
			System.out.println("GetOrderDetail Error : " + e);
		} finally {
			resourceClose();
		}
		
		return orderlist  ;
		
	}
	

}
