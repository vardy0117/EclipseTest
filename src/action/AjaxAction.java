package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.customer.db.CustomerDAO;

public class AjaxAction {
	public void emailCheckFromCustomer(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");

		String email = request.getParameter("email");
		String result = "notUsable";

		CustomerDAO cdao = new CustomerDAO();
			result = cdao.joinCheckEmail(email);
		
		PrintWriter out = response.getWriter();
		out.print(result);
	} // method
	
	public void emailCheckFromCeo(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");

		String email = request.getParameter("email");
		String result = "notUsable";

		CustomerDAO cdao = new CustomerDAO();
			result = cdao.joinCheckEmail(email);
		
		PrintWriter out = response.getWriter();
		out.print(result);
	} // method
}
