package net.coupon.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CouponDAO {
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
	
	public List<CouponBean> getCoupons(String customerNo) {
		List<CouponBean> couponList = new ArrayList<CouponBean>();
		
		try {
			con = getConnection();
			
			sql = "select *  from coupon "
				+ "where customerNo=? and used='F' and "
			    + "expDate>=DATE_FORMAT(NOW(),'%y-%m-%d')";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(customerNo));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				CouponBean cBean = new CouponBean();
				
				cBean.setCouponNo(rs.getString("couponNo"));
				cBean.setName(rs.getString("name"));
				cBean.setDiscount(rs.getInt("discount"));
				cBean.setExpDate(rs.getTimestamp("expDate"));
				
				couponList.add(cBean);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			resourceClose();
		}
		
		return couponList;
	}

	public void updateUsedCoupon(int couponNo) {
		try {
			con = getConnection();
			
			sql = "update coupon "
				+ "set used='F' "
			    + "where couponNo=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, couponNo);
			
			rs = pstmt.executeQuery();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			resourceClose();
		}
		
	}

}
