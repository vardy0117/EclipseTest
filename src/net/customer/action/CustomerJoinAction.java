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
	
	public void customerJoin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		log.info("CustomerJoinAction execute()");
		
		request.setCharacterEncoding("UTF-8");
		
		CustomerBean cb =new CustomerBean();
		
		cb.setEmail(request.getParameter("emailId")+"@"+request.getParameter("emailServer"));
		cb.setPassword(request.getParameter("password")); 
		cb.setNickname(request.getParameter("nickname")); 
		cb.setRoadAddress(request.getParameter("roadAddress"));
		cb.setDetailAddress(request.getParameter("detailAddress"));
		cb.setBname(request.getParameter("bname"));
		cb.setPhone(request.getParameter("phoneFront")+request.getParameter("phone"));
		cb.setSido(request.getParameter("sido"));
		
		
		if(request.getParameter("agreeAD") == null) {
			cb.setAgreeAD("F");
		} else { 
			cb.setAgreeAD("T");
		}	
		// result =0 이면 로그인 실패 회원가입 실패  
		int result = 0;
		
		CustomerDAO cdao=new CustomerDAO();
			
		result = cdao.insertCustomer(cb);
		
		if(result == 0){
			log.info("customerJoin 실패@@");
		}
		
	} // method

} // class
