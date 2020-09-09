package net.order.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import jdk.nashorn.internal.ir.RuntimeNode.Request;
import net.customer.db.CustomerBean;
import net.customer.db.CustomerDAO;
import net.menu.db.MenuBean;
import net.orderMenu.db.OrderMenuDAO;
import net.review.db.ReviewBean;
import net.review.db.ReviewDAO;

public class GetStoreReviewAction {

	public void getStoreReview(HttpServletRequest request, HttpServletResponse response, int storeNo) {
		List<ReviewBean> reviewList = new ArrayList<ReviewBean>();
		
		ReviewDAO rdao = new ReviewDAO();
		reviewList = rdao.getReview(storeNo);
		
		// 모든 리뷰의 개수를 가져옴
		int count = rdao.getAllReviewCountByStoreNo(storeNo);
		request.setAttribute("count", count);
		
		// 닉네임을 가져와서 리뷰에 뿌려줌
		List<String> nickNameList = new ArrayList<String>();
		String nickName="";
		CustomerDAO cDAO = new CustomerDAO();
		for(int i=0; i<reviewList.size();i++){
			String customerNo = reviewList.get(i).getCustomerNo();
			nickName = cDAO.getNickName(customerNo);
			nickNameList.add(nickName);
		}
		
		// 주문목록을 가져와서 리뷰에 뿌려줌
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("nickNameList", nickNameList);
		
		// 메뉴정보 가져오는 작업
		ArrayList<String> menuList = new ArrayList<String>();
		
		for(int i=0;i<reviewList.size();i++){
			String orderNo = reviewList.get(i).getOrderNo();
			OrderMenuDAO omDAO = new OrderMenuDAO();
			System.out.println("메뉴정보출력 : " + omDAO.getMenusToString(orderNo));
			menuList.add(omDAO.getMenusToString(orderNo));
		}
		
		request.setAttribute("menuListInReview",menuList);
	}
	
	// 더보기 클릭했을때 다음 리뷰를 가져오는 작업을 위한 메소드
	public void getStoreReviewMore(HttpServletRequest request, HttpServletResponse response,int storeNo,int startNum){
		ReviewDAO rDAO = new ReviewDAO();
		JSONArray jsonArr = rDAO.getReview(storeNo,startNum);
		
		// 더보기 클릭했을때 나오는 jsonArr리스트에 메뉴정보담아주기
//		for(int i =0;i<jsonArr.size();i++){
//			OrderMenuDAO omDAO = new OrderMenuDAO();
//			jsonArr.add(omDAO.getMenusToString(rDAO.getReview(storeNo).get(i).getOrderNo()));
//			
//		}
		request.setAttribute("jsonArr", jsonArr);
	}
	

}
