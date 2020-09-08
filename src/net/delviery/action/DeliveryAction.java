package net.delviery.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

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

	public JSONObject getDeliveryInfo(HttpServletRequest request, HttpServletResponse response, String orderNo) {
		DeliveryDAO ddao = new DeliveryDAO();
		JSONObject jobj = new JSONObject();
		jobj = ddao.getDeliveryInfo(orderNo);
		
		return jobj;
	}

}
