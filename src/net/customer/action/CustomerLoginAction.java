package net.customer.action;

import java.io.PrintWriter;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.customer.db.CustomerBean;
import net.customer.db.CustomerDAO;



public class CustomerLoginAction implements Action {
	
	private final static Logger log = Logger.getGlobal();
	
	@Override
	public void outData(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		req.setCharacterEncoding("UTF-8");
		
		String check = req.getParameter("check");
		String email = req.getParameter("email");

					
		CustomerDAO cdao=new CustomerDAO();
					
		

		// 페이지 이동 설정 (이동 방식, 경로)
		PrintWriter out = resp.getWriter();
	
	} // method
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		log.info("CustomerLoginAction execute()");
		System.out.println("로그인 액션");
		log.info("로그인 테스트 호출");
		req.setCharacterEncoding("UTF-8");
		
		CustomerBean cb =new CustomerBean();
		
		cb.setEmail(req.getParameter("email"));
		cb.setPassword(req.getParameter("password")); 

		CustomerDAO cdao=new CustomerDAO();
			
		boolean result = cdao.CheckCustomer(cb); // 로그인시 유저 검사
		System.out.println("반환받은 로그인 result값" + result);
		
		if(result != false){
			log.info("로그인 완료!");
			return null;
		}
				
		// 페이지 이동 설정 (이동 방식, 경로)
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./index.jsp"); 
		

		return forward;
		
	} // method

} // class
