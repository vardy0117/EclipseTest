package net.order.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.customer.db.CustomerBean;
import net.customer.db.CustomerDAO;
import net.menu.db.MenuBean;
import net.review.db.ReviewBean;
import net.review.db.ReviewDAO;

public class GetStoreReviewAction {

	public void getStoreReview(HttpServletRequest request, HttpServletResponse response, int storeNo) {
		
		//HashMap<String, ReviewBean> reviewMap = new HashMap<>();
		
		List<ReviewBean> reviewList = new ArrayList<ReviewBean>();
		
		ReviewDAO rdao = new ReviewDAO();
		reviewList = rdao.getReview(Integer.toString(storeNo));
		
		
		

		// store.jsp 리뷰란에서 고객번호로 글 구분짓는거 말고 고객닉네임으로 구분 짓다가 잠시 보류 - 이태우- 
//		List<String> nickNameList = new ArrayList<String>();
//		String nickName="";
//		CustomerDAO cDAO = new CustomerDAO();
//		for(int i=0; i<reviewList.size();i++){
//			String customerNo = rdao.getReview(Integer.toString(storeNo)).get(i).getCustomerNo());
//			nickName = cDAO.getNickName(customerNo);
//			nickNameList.add(nickName);
//		}
		
		request.setAttribute("reviewList", reviewList);
//		request.setAttribute("nickNameList", nickNameList);
	}

}
