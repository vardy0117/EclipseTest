package net.customer.action;

import java.io.PrintWriter;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import net.customer.db.CustomerBean;
import net.customer.db.CustomerDAO;

public class CustomerJoinAction{
	
	private final static Logger log = Logger.getGlobal();

	public void outData(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		req.setCharacterEncoding("UTF-8");
		
		String check = req.getParameter("check");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String result = "notUsable";
					
		CustomerDAO cdao=new CustomerDAO();
					
		switch (check) {
			case "emailCk":
				result = cdao.joinCheckEmail(email);
			break;
			
			case "phoneCk":
				result = cdao.joinCheckPhone(phone);
			break;
		}
		
		// ������ �̵� ���� (�̵� ���, ���)
		PrintWriter out = resp.getWriter();
		out.print(result);
	} // method
	
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		log.info("CustomerJoinAction execute()");
		
		req.setCharacterEncoding("UTF-8");
		
		CustomerBean cb =new CustomerBean();
		
		System.out.println(req.getAttribute("agreeAD"));
		// ���Խ� customerNo�� grade�� ���� Auto-Increment, 5�� DB�� ����
		cb.setEmail(req.getParameter("emailId")+"@"+req.getParameter("emailServer"));
		cb.setPassword(req.getParameter("password")); 
		cb.setNickname(req.getParameter("nickname")); 
		cb.setAddress(req.getParameter("roadAddress")+" "+req.getParameter("detailAddress"));
		cb.setBname(req.getParameter("bname"));
		cb.setPhone(req.getParameter("phoneFront")+req.getParameter("phone"));
		if(req.getParameter("agreeAD") == null) {
			cb.setAgreeAD("F");
		} else { 
			cb.setAgreeAD("T");
		}	
		// ���� ���� ����
		boolean result = false;
		
		CustomerDAO cdao=new CustomerDAO();
			
		result = cdao.insertCustomer(cb);
		
		if(result == false){
			log.info("ȸ�� ���� ����!");
			return null;
		}
				
		// ������ �̵� ���� (�̵� ���, ���)
		ActionForward forward=new ActionForward();
		
		forward.setRedirect(true);
		forward.setView("./CusotmerLogin.do ");

		return forward;
		
	} // method

} // class
