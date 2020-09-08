package net.delviery.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.delivery.db.DeliveryBean;
import net.delivery.db.DeliveryDAO;
import net.orderList.db.OrderListBean;
import net.orderList.db.OrderListDAO;

public class DeliveryAction {

	public void insertDelvieryInfo(DeliveryBean dbean) {
		DeliveryDAO ddao = new DeliveryDAO();
		
		ddao.insertDelveryInfo(dbean);
	}

	public void getDeliveryInfo(HttpServletRequest request, HttpServletResponse response, DeliveryBean dbean) {
		DeliveryDAO ddao = new DeliveryDAO();
		
		List<DeliveryBean> list = new ArrayList<DeliveryBean>();
		list = ddao.getDeliveryInfo(dbean);
		
		request.setAttribute("list", list);
		
	}

}
