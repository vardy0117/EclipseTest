package net.review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import net.review.db.ReviewBean;
import net.review.db.ReviewDAO;



public class writeReviewAction {
	public int insertReview(HttpServletRequest request, HttpServletResponse response,MultipartRequest multi) {

		//String contents = multi.getParameter("contents").replace("<br>", "\\n");	필요없음
		
		ReviewBean rBean = new ReviewBean();
		rBean.setOrderNo(multi.getParameter("orderNo"));
		rBean.setCustomerNo(multi.getParameter("customerNo"));
		rBean.setStoreNo(multi.getParameter("storeNo"));
		rBean.setContents(multi.getParameter("contents"));
		
		//rBean.setContents(contents);	필요없음
		
		rBean.setPoints(multi.getParameter("points"));
		rBean.setImage(multi.getFilesystemName("image"));
		
		ReviewDAO rDAO = new ReviewDAO();
		int result = rDAO.insertReview(rBean);
		
		return result;
	}
}
