package net.store.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import net.store.db.StoreBean;
import net.store.db.StoreDAO;

public class GetStoreMoreAction {

	public List<StoreBean> moreStoreAction(HttpServletRequest request, HttpServletResponse response, String orderSido, int startNum) throws Exception {

		request.setCharacterEncoding("UTF-8");
		List<StoreBean> result = new ArrayList<StoreBean>();

		System.out.println("Ajax Action : more store.do에서 받은 파라메터 값 orderSido :" +orderSido);
		System.out.println("Ajax Action : more store.do에서 받은 파라메터 값 startNum : " +startNum);
		
		StoreDAO store = new StoreDAO();
			result = store.GetMoreStore((String) request.getSession().getAttribute("orderSido"),startNum);
			// 시도는 스트링으로 받고 limit검색용은 int로 받음
		return result;
	} // method
	
	
	// 더보기 클릭했을때 다음 스토어 가져오는 작업을 위한 메소드
		public void GetStoreMore(HttpServletRequest request, HttpServletResponse response,String orderSido,int startNum){

			System.out.println("GetStoreMoreAction 받은 Sido : " + orderSido);
			System.out.println("GetStoreMoreAction 받은 StartNum : " + startNum);
			
			StoreDAO storedao = new StoreDAO();
			JSONArray StoreArr = storedao.GetMoreStore(orderSido, startNum);
			request.setAttribute("StoreArr", StoreArr);
			
			System.out.println("StoreArr 겟 에트리뷰트  내용 : " + request.getAttribute("StoreArr"));
			System.out.println("StoreArr 내용 : " + StoreArr);
		}
	
}
