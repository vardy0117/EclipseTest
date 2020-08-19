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
	
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		log.info("CustomerJoinAction execute()");
		
		req.setCharacterEncoding("UTF-8");
		
		CustomerBean cb =new CustomerBean();
		
		cb.setEmail(req.getParameter("emailId")+"@"+req.getParameter("emailServer"));
		cb.setPassword(req.getParameter("password")); 
		cb.setNickname(req.getParameter("nickname")); 
		cb.setRoadAddress(req.getParameter("roadAddress"));
		cb.setDetailAddress(req.getParameter("detailAddress"));
		cb.setBname(req.getParameter("bname"));
		cb.setPhone(req.getParameter("phoneFront")+req.getParameter("phone"));
		if(req.getParameter("agreeAD") == null) {
			cb.setAgreeAD("F");
		} else { 
			cb.setAgreeAD("T");
		}	
		// 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙
		boolean result = false;
		
		CustomerDAO cdao=new CustomerDAO();
			
		result = cdao.insertCustomer(cb);
		
		if(result == false){
			log.info("회占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙!");
			return null;
		}
				
		// 占쏙옙占쏙옙占쏙옙 占싱듸옙 占쏙옙占쏙옙 (占싱듸옙 占쏙옙占�, 占쏙옙占�)
		ActionForward forward=new ActionForward();
		
		forward.setRedirect(true);
		forward.setView("./CusotmerLogin.do");

		return forward;
		
	} // method

} // class
