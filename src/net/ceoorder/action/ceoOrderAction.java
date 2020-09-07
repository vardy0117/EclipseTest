package net.ceoorder.action;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.orderList.db.OrderListDAO;

public class ceoOrderAction{

	public int uncheckedOrders(HttpServletRequest request, HttpServletResponse response) {

		int count =0;
		int storeNo=Integer.parseInt(request.getParameter("storeNo"));

		OrderListDAO odao = new OrderListDAO();
			count = odao.uncheckedOrders(storeNo);
			
		return count;
	}

	public String GetDeleteOrderAction(HttpServletRequest request, HttpServletResponse response, String ceoNo, int orderNo) {
		System.out.println("GetDeleteOrder 액션 호출");
		
		OrderListDAO odao = new OrderListDAO();
				
		
		boolean CouponBack = odao.CouponBack(orderNo, ceoNo); // 쿠폰 환불처리;
		System.out.println("쿠폰 쿼리 결과 : " + CouponBack);
		
		String Delete = odao.CeoDeleteOrder(orderNo,ceoNo);
		
		System.out.println("주문 delete여부 : " + Delete);
		
		
		return Delete;
	}
	
}
