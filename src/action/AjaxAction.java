
package action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
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
	
	
	public String getStoreList(HttpServletRequest request, HttpServletResponse response) {
		//System.out.println("프론트컨트롤러 -> ajaxAction.getStoreList() 호출");
		
		String category = request.getParameter("category");
		String startNo = request.getParameter("startNo");
		String currentHour = request.getParameter("currentHour"); 
		String orderSido = (String)request.getSession().getAttribute("orderSido");
		String orderBname = (String)request.getSession().getAttribute("orderBname");
		
		StoreDAO storeDAO = new StoreDAO();
		List<StoreBean> storeList = storeDAO.getStoreList(category, startNo, currentHour, orderSido, orderBname);
		JSONArray jsonArr = new JSONArray();
		
		for(int i=0; i<storeList.size(); i++) {
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("storeNo", storeList.get(i).getStoreNo());
			jsonObj.put("ceoNo", storeList.get(i).getCeoNo());
			jsonObj.put("name", storeList.get(i).getName());
			jsonObj.put("roadAddress", storeList.get(i).getRoadAddress());
			jsonObj.put("detailAddress", storeList.get(i).getDetailAddress());
			jsonObj.put("category", storeList.get(i).getCategory());
			jsonObj.put("phone", storeList.get(i).getPhone());
			jsonObj.put("storeHours", storeList.get(i).getStoreHours());
			jsonObj.put("message", storeList.get(i).getMessage());
			jsonObj.put("image", storeList.get(i).getImage());
			jsonObj.put("points", storeList.get(i).getPoints());
			jsonObj.put("orderCount", storeList.get(i).getOrderCount() == null ? "0" : storeList.get(i).getOrderCount() );
			jsonObj.put("deliveryArea", storeList.get(i).getDeliveryArea());
			jsonObj.put("regNo", storeList.get(i).getRegNo());
			jsonObj.put("sido", storeList.get(i).getSido());
			
			jsonArr.put(jsonObj);
		}
		System.out.println(jsonArr.toString());
		
		return jsonArr.toString();
	}

	
	
}
