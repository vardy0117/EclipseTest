
package action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.ceo.db.CeoDAO;
import net.customer.db.CustomerBean;
import net.customer.db.CustomerDAO;
import net.store.db.StoreBean;
import net.store.db.StoreDAO;

public class AjaxAction {
	public String emailCheckFromCustomer(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");

		String email = request.getParameter("email");
		String result = "notUsable";

		CustomerDAO cdao = new CustomerDAO();
			result = cdao.joinCheckEmail(email);
		
		return result;
	} // method
	
	public String emailCheckFromCeo(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");

		String email = request.getParameter("email");
		String result = "notUsable";

		CeoDAO cdao = new CeoDAO();
			result = cdao.joinCheckEmail(email);
		
		return result;
	} // method
	
	public String getCustomer(String customerNo) {
		CustomerDAO cdao = new CustomerDAO();
		CustomerBean cbean = cdao.getCustomer(customerNo);
		
		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("customerNo", cbean.getCustomerNo());
		jsonObj.put("email", cbean.getEmail());
		jsonObj.put("password", cbean.getPassword());
		jsonObj.put("roadAddress", cbean.getRoadAddress());
		jsonObj.put("detailAddress", cbean.getDetailAddress());
		jsonObj.put("bname", cbean.getBname());
		jsonObj.put("phone", cbean.getPhone());
		jsonObj.put("grade", cbean.getGrad());
		jsonObj.put("agreeAD", cbean.getAgreeAD());
		jsonObj.put("sido", cbean.getSido());
				
		return jsonObj.toJSONString();
	}
	
	

	public List<StoreBean> moreStoreAction(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		List<StoreBean> result = new ArrayList<StoreBean>();
		String orderSido = request.getParameter("orderSido");
		 int startNum = Integer.parseInt(request.getParameter("startNum")); //현재 보여지는 리뷰 수
		System.out.println("Ajax Action : more store.do에서 받은 파라메터 값 orderSido :" +orderSido);
		System.out.println("Ajax Action : more store.do에서 받은 파라메터 값 startNum : " +startNum);
		
		StoreDAO store = new StoreDAO();
			result = store.UserGetMoreStore((String) request.getSession().getAttribute("orderSido"),startNum);
			// 시도는 스트링으로 받고 limit검색용은 int로 받음
		return result;
	} // method
}
