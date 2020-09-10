package net.admin.action;

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

public class adminAction {
	
/****************************************************************/
	// 어드민 영역
	public String AdmingetdeliveryAction(String delivengersNo) { // 관리자가 배달원 조회 액션
		AdminDao cdao = new AdminDao();
		JSONArray array = new JSONArray();
		
		array = cdao.AdmingetDelivengersList();
		
		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("delivengerslist", array);
		
		return jsonObj.toJSONString();
	}
	
	
	public String AdminStoreList(String delivengersNo) { // 관리자가 가게 조회 액션
		AdminDao cdao = new AdminDao();
		JSONArray array = new JSONArray();
		
		array = cdao.AdmingetStoreList();
		
		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("adminstorelist", array);
		
		return jsonObj.toJSONString();
	}
	
	
	public String AdminCustomerList(String delivengersNo) { // 관리자가 가게 조회 액션
		AdminDao cdao = new AdminDao();
		JSONArray array = new JSONArray();
		
		array = cdao.AdminCustomerList();
		
		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("admincustomerlist", array);
		
		return jsonObj.toJSONString();
	}
	
	
	


}
