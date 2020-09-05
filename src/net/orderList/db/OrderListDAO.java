package net.orderList.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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
	
	
	
	public   List<OrderJoinBean>  GetOrderList(String  number) { 
		 List<OrderJoinBean> orderlist = new ArrayList<OrderJoinBean>();		
		OrderJoinBean join = null ;
		
		try {
			 getConnection();
			 
			/*sql = "select a.orderNo, a.customerNo, a.storeNo, b.name, b.price, c.name 'storename' "
					+ "from orderList a, orderMenu b, store c "
					+ "where a.orderNo = b.orderNo and customerNo = ? and "
					+ "c.storeNo =  (select storeNo from store where storeNo = a.storeNo) and a.orderNo=1";

			 
*/
			 sql = "select a.orderNo, a.customerNo, a.storeNo, "
			 		+ "b.name 'storeName', a.deliveryCheck "
			 		+ "from orderList a, store b "
			 		+ "where b.name = (select name from store where storeNo = a.storeNo) "
			 		+ "and customerNo = ? "
			 		+ "order by a.orderNo desc ";
			 
			 pstmt = con.prepareStatement(sql);
			 
			 pstmt.setString(1, number);
			 System.out.println("OrderListDao에 SELECT에 가지고온 customerNo : " + number);

			 rs = pstmt.executeQuery();
			
			 while(rs.next()) {
				 join = new OrderJoinBean();
				 
				  join.setOrderNo(rs.getString(1));
				 join.setCustomerNo(rs.getString(2));
				 join.setStoreNo(rs.getString(3));
				 join.setName(rs.getString(4));
				 join.setDeliveryCheck(rs.getString(5));
				 orderlist.add(join);
	 
			 }
			 
				
			
			
		} catch (Exception e){
			System.out.println("GetOrderDetail Error : " + e);
		} finally {
			resourceClose();
		}
		
		
		
		return orderlist  ;
		
	}
	
	
	public   List<OrderJoinBean>  GetOrderRealDetails(String  customerNo, String orderNo) { 
		 List<OrderJoinBean> orderlist = new ArrayList<OrderJoinBean>();		
		OrderJoinBean join = null ;
		
		try {
			 getConnection();
		/*	 
			sql = "select a.orderNo, a.customerNo, a.storeNo, b.name, b.price, c.name 'storename' "
					+ "from orderList a, orderMenu b, store c "
					+ "where a.orderNo = b.orderNo and customerNo = ? and "
					+ "c.storeNo =  (select storeNo from store where storeNo = a.storeNo) and a.orderNo=1";

			 */

			 sql = "select a.orderNo, a.customerNo, a.storeNo, "
			 		+ "b.name 'menu' , b.quantity 'ea', b.price, "
			 		+ "c.name 'storename', a.roadAddress, a.detailAddress, a.request, a.orderTime,"
			 		+ " a.deliveryCheck, a.orderCheck  from orderList a, "
			 		+ "orderMenu b, store c where a.orderNo = "
			 		+ "b.orderNo and a.customerNo = ? and "
			 		+ "c.storeNo =  (select storeNo from store "
			 		+ "where storeNo=a.storeNo) and a.orderNo = ?";
			 
			 pstmt = con.prepareStatement(sql);
			 
			 pstmt.setString(1, customerNo);
			 pstmt.setString(2, orderNo);
			 System.out.println("GetOrderRealDetails에 SELECT에 가지고온 customerNo : " + customerNo);

			 rs = pstmt.executeQuery();
			
			 while(rs.next()) {
				 join = new OrderJoinBean();
				 
				  join.setOrderNo(rs.getString(1));
				 join.setCustomerNo(rs.getString(2));
				 join.setStoreNo(rs.getString(3));
				 join.setName(rs.getString(4));
				 join.setEa(rs.getString(5));
				 join.setPrice(rs.getString(6));
				 join.setStoreName(rs.getString(7));
				 join.setRoadAddress(rs.getString(8));
				 join.setDetailAddress(rs.getString(9));
				 join.setRequest(rs.getString(10));
				 join.setOrderTime(rs.getString(11));
				 join.setDeliveryCheck(rs.getString(12));
				 join.setOrderCheck(rs.getString(13));
				 orderlist.add(join);
	 
			 }
			 
				
			
			
		} catch (Exception e){
			System.out.println("GetOrderDetail Error : " + e);
		} finally {
			resourceClose();
		}
		
		
		
		return orderlist  ;
		
	}


	
	public   StoreBean  GetReciptCeoInformation(String  customerNo, String orderNo) { // 고객이 주문했던 사업자 정보 가져오기 
		StoreBean ReciptStoreInfo = new StoreBean();
		
		try {
			 getConnection();
	
			sql = "select regNo, name 'storeName', "
					+ "roadAddress, detailAddress, "
					+ "category, phone "
					+ "from store where "
					+ "storeNo = ( select storeNo "
					+ "from orderList	where customerNo = ? and orderNo = ? "
					+ "order by orderNo desc);";
			 
			 pstmt = con.prepareStatement(sql);
			 
			 pstmt.setString(1, customerNo);
			 pstmt.setString(2, orderNo);
			 System.out.println("사업자 정보에 해당하는 영수증 함수 호출");

			 rs = pstmt.executeQuery();
			
			 if(rs.next()){
				 // regNo, name, roadAddress, detailAddress, category, phone
				 ReciptStoreInfo.setRegNo(rs.getString("regNo"));
				 ReciptStoreInfo.setName(rs.getString("storeName")); 
				 ReciptStoreInfo.setRoadAddress(rs.getString("roadAddress"));
				 ReciptStoreInfo.setDetailAddress(rs.getString("detailAddress"));
				 
				 ReciptStoreInfo.setCategory(rs.getString("category"));
				 ReciptStoreInfo.setPhone(rs.getString("phone"));

				 }
				
			
			
		} catch (Exception e){
			System.out.println("GetOrderDeGetReciptCeoInformationtail Error : " + e);
		} finally {
			resourceClose();
		}
		
		
		
		return ReciptStoreInfo  ;
		
	}
	
	// 리뷰작성 안된 주문목록 가져오기
	public ArrayList<OrderListBean> getUnReviewOrder(String customerNo,int startNum) {
		ArrayList<OrderListBean> list = new ArrayList<OrderListBean>();
		OrderListBean oBean;
		try {
			con= getConnection();
			sql="select * from orderList where deliveryCheck ='T' and customerNo=? and orderNo not in (select orderNo from review) limit ?,6";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, customerNo);
			pstmt.setInt(2, (startNum-1)*6);
			rs = pstmt.executeQuery();
			while(rs.next()){
				oBean = new OrderListBean();
				oBean.setOrderNo(rs.getString(1));
				oBean.setCustomerNo(rs.getString(2));
				oBean.setStoreNo(rs.getString(3));
				oBean.setRoadAddress(rs.getString(4));
				oBean.setDetailAddress(rs.getString(5));
				oBean.setPhone(rs.getString(6));
				oBean.setPayment(rs.getString(7));
				oBean.setRequest(rs.getString(8));
				oBean.setOrderTime(rs.getTimestamp(9));
				oBean.setOrderCheck(rs.getString(10));
				oBean.setPrepareTime(rs.getString(11));
				oBean.setDeliveryCheck(rs.getString(12));
				list.add(oBean);
			}
		} catch (Exception e) {
			System.out.println("getUnReviewOrder() 내에서 예외 발생");
			e.printStackTrace();
		} finally {
			resourceClose();
		}
		return list;
	}

	public int getUnAllReviewCount(String customerNo) {
		int count=0;
		try {
			con=getConnection();
			sql="select count(*) from orderList where deliveryCheck ='T' and customerNo=? and orderNo not in (select orderNo from review)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, customerNo);
			rs = pstmt.executeQuery();
			if(rs.next()){
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getUnAllReviewCount() 내에서 예외 발생");
			e.printStackTrace();
		} finally {
			resourceClose();
		}
		
		return count;
	}

	public int uncheckedOrders(int storeNo) {
		int count=0;
		try {
			con=getConnection();
			sql="select count(*) from orderList where storeNo=? and orderCheck ='F'";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, storeNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("uncheckedOrders() 내에서 예외 발생");
			e.printStackTrace();
		} finally {
			resourceClose();
		}
		
		return count;
	}

	public List<OrderListBean> getOrderListByStoreNo(int storeNo) {
		List<OrderListBean> list = new ArrayList<>();

		try {
			con =getConnection();
			sql="SELECT * FROM orderList where storeNo =? order by orderNo desc";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, storeNo);
			rs=pstmt.executeQuery();

			while(rs.next()){
				OrderListBean obean = new OrderListBean();
				obean.setOrderNo(rs.getString(1));
				obean.setCustomerNo(rs.getString(2));
				obean.setStoreNo(rs.getString(3));
				obean.setRoadAddress(rs.getString(4));
				obean.setDetailAddress(rs.getString(5));
				obean.setPhone(rs.getString(6));
				obean.setPayment(rs.getString(7));
				obean.setRequest(rs.getString(8));
				obean.setOrderTime(rs.getTimestamp(9));
				obean.setOrderCheck(rs.getString(10));
				obean.setPrepareTime(rs.getString(11));
				obean.setDeliveryCheck(rs.getNString(12));
				obean.setCouponNo(rs.getString(13));
				list.add(obean);
			}

		} catch (Exception e) {
			System.out.println("getOrderListByStoreNo inner error :"+e);
		}finally {
			resourceClose();
		}
		return list ;

	}

	public boolean CeoDeleteOrder(int orderNo, String ceoNo) {
		// int status = 0;
		int check = 0;
		boolean status = false;
		
		System.out.println("CeoDeleteOrder 함수 호출 ");
		try {
			con =getConnection();
			sql="delete a from orderList a, store b "
					+ "where a.storeNo = b.storeNo and "
					+ "b.ceoNo = ? and a.orderNo = ?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, ceoNo);
			pstmt.setInt(2, orderNo);
			
			
			System.out.println("CeoDeleteOrder 전달받은 ceo번호 : " + ceoNo);
			System.out.println("CeoDeleteOrder 전달받은 orderNo번호 : " + orderNo);
			
			check = pstmt.executeUpdate();
			
			if (check == 0) {
				status = false;
				System.out.println("삭제 불가 check 반환 : " + check);
			}else{
				System.out.println("삭제 완료 " + check);
				status = true;
			}
		
		} catch (Exception e) {
			System.out.println("CeoDeleteOrder inner error :"+e);
		}finally {
			resourceClose();
		}
		System.out.println("CeoDeleteOrder 리턴값 : " + status);
		return status;
	}

	
	
	
	
	public boolean CouponBack(int orderNo) {
		int check = 0;
		boolean status = false;
		
		System.out.println("CouponBack 함수 호출 ");
		try {
			con =getConnection();
			sql="UPDATE coupon b inner join orderList a SET b.used = 'F' "
					+ "WHERE a.couponNo = "
					+ "b.couponNo and a.orderNo = ?";
			
			pstmt=con.prepareStatement(sql);

			pstmt.setInt(1, orderNo);
			
			
			System.out.println("CouponBack 전달받은 orderNo번호 : " + orderNo);
			
			check = pstmt.executeUpdate();
			System.out.println("쿠폰 쿼리 결과 " + check);
			if (check == 0) {
				status = false;
				System.out.println("주문에 쿠폰항목이 존재하지 않음 : " + check);
			}else{
				System.out.println("사용자 쿠폰 원상복구 완료 " + check);
				status = true;
			}
		
		} catch (Exception e) {
			System.out.println("CouponBack inner error :"+e);
		}finally {
			resourceClose();
		}
		System.out.println("CouponBack 리턴값 : " + status);
		return status;
	}
}
