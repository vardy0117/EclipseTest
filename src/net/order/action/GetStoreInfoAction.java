package net.order.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdk.nashorn.internal.runtime.regexp.joni.Regex;
import net.review.db.ReviewBean;
import net.review.db.ReviewDAO;
import net.store.db.StoreBean;
import net.store.db.StoreDAO;

public class GetStoreInfoAction {

	public void getStroeInfo(HttpServletRequest req, HttpServletResponse resp, int storeNo) {
		StoreBean sbean = null;
		StoreDAO sdao = new StoreDAO();
		
		sbean = sdao.getStoreInfo(storeNo);
		// ReviewBean star =  review.AvgReview(storeNo);
		ReviewBean star =  new ReviewBean();
		ReviewDAO review = new ReviewDAO();
		
		System.out.println("GetStoreInformation.java -> 반환 받은 별 평균 값 가져오기 값 : " + star.getPoints());
		star = review.AvgReview(storeNo);

		req.setAttribute("storeInfo", sbean);
		req.setAttribute("storereview", star); // 리뷰만 단독으로 세션 등록 ㅋㅋ;;
		System.out.println("review bean내용 : " + star.toString());
		
	
	}

}
