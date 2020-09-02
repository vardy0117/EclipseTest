package net.order.action;

import java.util.ArrayList;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONTokener;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import javafx.beans.binding.StringExpression;
import net.orderList.db.OrderJoinBean;
import net.orderList.db.OrderListBean;
import net.orderList.db.OrderListDAO;
import net.orderMenu.db.OrderMenuBean;
import net.orderMenu.db.OrderMenuDAO;
import net.review.db.ReviewBean;
import net.review.db.ReviewDAO;
import net.store.db.StoreBean;
import net.store.db.StoreDAO;


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
	
	
	public  void GetOrderDetail(HttpServletRequest request, HttpServletResponse response, String customerNo) throws Exception{

		OrderListDAO odao = new OrderListDAO();
		List<OrderJoinBean> orderlist = new ArrayList<OrderJoinBean>();
		List<OrderJoinBean> orderlist2 = new ArrayList<OrderJoinBean>();
		OrderJoinBean join = new OrderJoinBean();
		
		orderlist = odao.GetOrderDetail(customerNo); // orderlist 테이블 
		orderlist2 = odao.GetOrderStoreName(join.getStoreName());
		System.out.println("GetOrderDetail 서버 겟스토어 네임 " + join.getStoreName());
		
		System.out.println("OrderDetail Action 호출!");
		System.out.println("전달받은 고객 number : " + customerNo);
		
		request.setAttribute("orderlist", orderlist);
		request.setAttribute("orderlist2", orderlist2);
		
		System.out.println("join내용 : " + orderlist);


		System.out.println("request getAttribute " + orderlist.toString());
		
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
