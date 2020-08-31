package net.customer.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.review.db.ReviewDAO;

public class CustomerReviewAction {

	public void execute(HttpServletRequest request,HttpServletResponse response,String customerNo){
		ReviewDAO rDAO = new ReviewDAO();
		rDAO.getMyReview(customerNo);
	}
}
