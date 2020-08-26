package net.order.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.menu.db.MenuBean;
import net.review.db.ReviewBean;
import net.review.db.ReviewDAO;

public class GetStoreReviewAction {

	public void getStoreReview(HttpServletRequest request, HttpServletResponse response, int storeNo) {
		List<ReviewBean> reviewList = new ArrayList<ReviewBean>();
		
		ReviewDAO rdao = new ReviewDAO();
		reviewList = rdao.getReview(Integer.toString(storeNo));
		
		request.setAttribute("reviewList", reviewList);
	}

}
