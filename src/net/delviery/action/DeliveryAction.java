package net.delviery.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import net.delivengers.db.DelivengersBean;
import net.delivery.db.DeliveryBean;
import net.delivery.db.DeliveryDAO;
import net.orderList.db.OrderListBean;
import net.orderList.db.OrderListDAO;

public class DeliveryAction {

	public int insertDelvieryInfo(DeliveryBean dbean) {
		int result=0;
		
		DeliveryDAO ddao = new DeliveryDAO();
		result=ddao.insertDelveryInfo(dbean);
		
		return result;
	}

	public JSONObject getDeliveryInfo(HttpServletRequest request, HttpServletResponse response, String orderNo) {
		DeliveryDAO ddao = new DeliveryDAO();
		JSONObject jobj = new JSONObject();
		jobj = ddao.getDeliveryInfo(orderNo);
		
		return jobj;
	}

	public String getDeliveryList(HttpServletRequest request, HttpServletResponse response, String delivengersNo) {
		DeliveryDAO ddao = new DeliveryDAO();
	
		JSONArray array = new JSONArray();
		array = ddao.getDeliveryList(delivengersNo);
		
		JSONObject totalObject = new JSONObject();
		
		totalObject.put("list",array);
		
		String list = totalObject.toJSONString();
		
		return list;
	}
}
