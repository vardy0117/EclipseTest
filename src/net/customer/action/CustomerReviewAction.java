package net.customer.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.review.db.ReviewBean;
import net.review.db.ReviewDAO;

public class CustomerReviewAction {

	public ArrayList<ReviewBean> execute(HttpServletRequest request,HttpServletResponse response,String customerNo){
		ReviewDAO rDAO = new ReviewDAO();
		return rDAO.getMyReview(customerNo);
	}
}
