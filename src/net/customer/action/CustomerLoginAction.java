package net.customer.action;

import java.io.PrintWriter;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.ActionForward;
import net.customer.db.CustomerBean;
import net.customer.db.CustomerDAO;



public class CustomerLoginAction {
	
	private final static Logger log = Logger.getGlobal();
	
	public boolean execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		log.info("CustomerLoginAction execute()");
		System.out.println("로그인 액션");
		log.info("로그인 테스트 호출");
		
		req.setCharacterEncoding("UTF-8");
		
		
		
		
		CustomerBean cb =new CustomerBean();
		
		cb.setEmail(req.getParameter("email"));
		cb.setNickname(req.getParameter("nickname")); 
		cb.setPassword(req.getParameter("password")); 

		CustomerDAO cdao=new CustomerDAO();
			
		boolean result = cdao.CheckCustomer(cb); // 로그인시 유저 검사
		System.out.println("반환받은 로그인 result값 : " + result);

		
	
		ActionForward forward = new ActionForward();
	
		
		if(result == true){
			HttpSession session=req.getSession();
			log.info("로그인 완료!");
			System.out.println("로그인 성공 result값 " + result); 
	
			
			//	String nickname=req.getParameter("nickname");
				String email = req.getParameter("email");
				
				// cdao.CustomerInformation(email);
				
				CustomerBean a = cdao.CustomerInformation(email);
				
				System.out.println("-----------------------------------------");
				System.out.println(a.getCustomerNo() + " - 객체 내용 번호");
				System.out.println(a.getNickname() + " - 객체 닉네임 가져오기");
				System.out.println("-----------------------------------------");
				
				System.out.println("파라미터로 가져온 이메일 값 : " + email);
				
				

				// session.setAttribute("nickname", a.getNickname());
				session.setAttribute("nickname", a.getNickname());
				session.setAttribute("customerNo", a.getCustomerNo());
				session.setAttribute("email", email);
	
				
				
				System.out.println("세션 등록 완료 ");
				// 페이지 이동 설정 (이동 방식, 경로)
			
		}else{
			
		System.out.println("고갱님 로그인 실패됨");
			
			
		
		}
		
		
	
	
	
		

		return result;
		
	} // method

} // class
