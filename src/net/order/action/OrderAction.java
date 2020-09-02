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
import net.coupon.db.CouponDAO;
import net.orderList.db.OrderListBean;
import net.orderList.db.OrderListDAO;
import net.orderMenu.db.OrderMenuDAO;


public class OrderAction {
	
	public int insertOrderList(HttpServletRequest request, HttpServletResponse response) throws ParseException, JSONException {		
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(request.getParameter("deliveryInfo"));
		JSONObject deliveryInfo = (JSONObject) obj;
		OrderListBean oBean = new OrderListBean();
		
		oBean.setCustomerNo((String) request.getSession().getAttribute("customerNo"));
		oBean.setStoreNo(request.getParameter("storeNo"));
		oBean.setRoadAddress((String) deliveryInfo.get("roadAddress")); 
		oBean.setDetailAddress((String) deliveryInfo.get("detailAddress"));
		oBean.setPhone((String) deliveryInfo.get("phone"));
		oBean.setPayment((String) deliveryInfo.get("payment"));
		oBean.setRequest((String) deliveryInfo.get("request"));
		oBean.setCouponNo((String) deliveryInfo.get("couponNo"));
	
		OrderListDAO odao = new OrderListDAO();
		int orderNo = odao.insertOrderList(oBean);
		
		
		if(deliveryInfo.get("couponNo")!=null && !deliveryInfo.get("couponNo").equals("false")){
			CouponDAO cdao = new CouponDAO();
			int couponNo = Integer.parseInt((String) deliveryInfo.get("couponNo"));
			
			cdao.updateUsedCoupon(couponNo);
		};
		
		
		return orderNo;
	}

	public void insertOrderMenu(HttpServletRequest req, HttpServletResponse resp, int orderNo) throws ParseException, JSONException{
		JSONArray cart = new JSONArray(req.getParameter("cart"));

		OrderMenuDAO odao = new OrderMenuDAO();
		odao.insertOrderMenu(cart, orderNo);
		
		System.out.println("성공!");
	
	}
	
	
	public void GetOrderDetail(HttpServletRequest request, HttpServletResponse response, String customerNo) throws Exception{
		OrderListBean oBean = new OrderListBean();
		// oBean.setCustomerNo((String) request.getSession().getAttribute("customerNo"));
		String number = (String) request.getSession().getAttribute("customerNo");
		OrderListDAO odao = new OrderListDAO();
		odao.GetOrderDetail(number);
		System.out.println("OrderDetail Action 호출!");
		System.out.println("전달받은 고객 number : " + number);
	
	}


}
