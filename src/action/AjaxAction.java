package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import net.customer.db.CustomerBean;
import net.customer.db.CustomerDAO;

public class AjaxAction {
	public void emailCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");

		String email = request.getParameter("email");
		String result = "notUsable";

		CustomerDAO cdao = new CustomerDAO();
			result = cdao.joinCheckEmail(email);
		
		PrintWriter out = response.getWriter();
		out.print(result);
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
				
		return jsonObj.toJSONString();
	}
}
