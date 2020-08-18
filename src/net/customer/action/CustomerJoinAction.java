package net.customer.action;

import java.io.PrintWriter;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import net.customer.db.CustomerBean;
import net.customer.db.CustomerDAO;

public class CustomerJoinAction implements Action {
	
	private final static Logger log = Logger.getGlobal();
	
	@Override
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
		
		// 페이지 이동 설정 (이동 방식, 경로)
		PrintWriter out = resp.getWriter();
		out.print(result);
	} // method
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		log.info("CustomerJoinAction execute()");
		
		req.setCharacterEncoding("UTF-8");
		
		CustomerBean cb =new CustomerBean();
		
		System.out.println(req.getAttribute("agreeAD"));
		// 가입시 customerNo와 grade는 각각 Auto-Increment, 5로 DB에 저장
		cb.setEmail(req.getParameter("emailId")+"@"+req.getParameter("emailServer"));
		cb.setPassword(req.getParameter("password")); 
		cb.setNickname(req.getParameter("nickname")); 
		cb.setAddress(req.getParameter("roadAddress")+" "+req.getParameter("detailAddress"));
		cb.setBname(req.getParameter("bname"));
		cb.setPhone(req.getParameter("phoneFront")+req.getParameter("phone"));
		if(req.getParameter("agreeAD").equals("T")) {
			cb.setAgreeAD("T");
		} else { 
			cb.setAgreeAD("F");
		}	
		// 가입 성공 여부
		boolean result = false;
		
		CustomerDAO cdao=new CustomerDAO();
			
		result = cdao.insertCustomer(cb);
		
		if(result == false){
			log.info("회원 가입 실패!");
			return null;
		}
				
		// 페이지 이동 설정 (이동 방식, 경로)
		ActionForward forward=new ActionForward();
		
		forward.setRedirect(true);
		forward.setView("./CusotmerLogin.me");

		return forward;
		
	} // method

} // class
