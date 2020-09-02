package net.customer.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.review.db.ReviewBean;
import net.review.db.ReviewDAO;

public class CustomerReviewAction {

	public ArrayList<ReviewBean> execute(HttpServletRequest request,HttpServletResponse response,String customerNo){
		ReviewDAO rDAO = new ReviewDAO();
		if(request.getParameter("writedPageNo")==null){
			return rDAO.getMyReview(customerNo,1);
		}else{
			return rDAO.getMyReview(customerNo,Integer.parseInt(request.getParameter("writedPageNo")));
		}
		
		
	}

	public int getAllReviewCount(HttpServletRequest request, HttpServletResponse response, String customerNo) {
		int count=0;
		ReviewDAO rDAO = new ReviewDAO();
		count = rDAO.getAllReviewCount(customerNo);
		return count;
	}
}
