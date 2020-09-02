package net.order.action;

import java.util.ArrayList;

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
		oBean.setRoadAddress((String) request.getSession().getAttribute("orderRoadAddress")); 
		oBean.setDetailAddress((String) request.getSession().getAttribute("orderDetailAddress"));
		//oBean.setRoadAddress("나나");
		//oBean.setDetailAddress("나나");
		System.out.println("일반 주소 확인중 " + request.getSession().getAttribute("orderRoadAddress"));
		System.out.println("oBean주소 받기 " + oBean.getDetailAddress());
		System.out.println("oBean주소 받기 " + oBean.getRoadAddress());
		System.out.println("상세 주소 확인중 " + request.getSession().getAttribute("orderDetailAddress"));
		
		oBean.setPhone((String) request.getSession().getAttribute("phone"));
		
		OrderListDAO odao = new OrderListDAO();
		int orderNo = odao.insertOrderList(oBean);
		
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

	// 리뷰작성 안된 주문목록 가져오기
	public ArrayList<OrderListBean> getUnReviewOrder(HttpServletRequest request, HttpServletResponse response,String customerNo) {
		OrderListDAO oDAO = new OrderListDAO();
		int unReviewPageNo;
		if(request.getParameter("unReviewPageNo")==null){
			unReviewPageNo=1;
		}else{
			unReviewPageNo=Integer.parseInt(request.getParameter("unReviewPageNo"));
		}
		
		return oDAO.getUnReviewOrder(customerNo,unReviewPageNo);
	}

	public int getUnAllReviewCount(HttpServletRequest request, HttpServletResponse response, String customerNo) {
		
		OrderListDAO oDAO = new OrderListDAO();
		return oDAO.getUnAllReviewCount(customerNo);
	}


}
