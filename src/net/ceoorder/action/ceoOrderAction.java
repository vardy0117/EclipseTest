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
	
}
