package net.order.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONTokener;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import javafx.beans.binding.StringExpression;
import net.orderList.db.OrderListBean;
import net.orderList.db.OrderListDAO;
import net.orderMenu.db.OrderMenuBean;
import net.orderMenu.db.OrderMenuDAO;


public class OrderAction {
	
	public int insertOrderList(HttpServletRequest request, HttpServletResponse response) {

		OrderListBean oBean = new OrderListBean();
		
		oBean.setStoreNo(request.getParameter("storeNo"));
		oBean.setCustomerNo((String) request.getSession().getAttribute("customerNo"));
		//oBean.setRoadAddress((String) request.getSession().getAttribute("roadAddress")); 
		oBean.setRoadAddress((String) request.getSession().getAttribute("orderRoadAddress")); 
		oBean.setDetailAddress((String) request.getSession().getAttribute("orderDetailAddress"));
		
		// oBean.setDetailAddress("나나");
		System.out.println("일반 주소 확인중 " + request.getSession().getAttribute("orderRoadAddress"));
		System.out.println("oBean주소 받기 " + oBean.getDetailAddress());
		System.out.println("oBean주소 받기 " + oBean.getRoadAddress());
		System.out.println("상세 주소 확인중 " + request.getSession().getAttribute("orderDetailAddress"));
		// oBean.setDetailAddress((String) request.getSession().getAttribute("detailAddress"));
		
		
		oBean.setPhone((String) request.getSession().getAttribute("phone"));
		
		OrderListDAO odao = new OrderListDAO();
		int orderNo = odao.insertOrderList(oBean);
		
		return orderNo;
	}


	public void insertOrderMenu(HttpServletRequest req, HttpServletResponse resp, int orderNo) throws ParseException, JSONException{
		String jsonString = req.getParameter("cart");
		

		//JSONArray cart = new JSONArray(req.getParameter("cart"));
		JSONArray cart = new JSONArray("[{'name':'food1','basePrice':10000,'quantity':1,'price':10000}','{'name':'food2','basePrice':12000,'quantity':1,'price':12000}']");
		//cart = JSONArray.fromObject()
		
		
		//JSONParser parser = new JSONParser();
		//cart = (JSONArray) parser.parse(req.getParameter("cart"));
		System.out.println(cart);
		
		
		OrderMenuDAO odao = new OrderMenuDAO();
		odao.insertOrderMenu(cart, orderNo);
		
		System.out.println("성공!");
	
	}


}
