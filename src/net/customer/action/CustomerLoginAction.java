package net.customer.action;

import java.io.PrintWriter;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.ActionForward;
import net.customer.db.CustomerBean;
import net.customer.db.CustomerDAO;
import net.event.db.EventDAO;



public class CustomerLoginAction {
	
	private final static Logger log = Logger.getGlobal();
	
	public boolean execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		log.info("CustomerLoginAction execute()");
		System.out.println("로그인 액션");
		log.info("로그인 테스트 호출");
		
		req.setCharacterEncoding("UTF-8");
		
		String email = req.getParameter("email");
		
		
		
		CustomerBean cb =new CustomerBean();
		
		cb.setEmail(req.getParameter("email"));
		cb.setNickname(req.getParameter("nickname")); 
		cb.setPassword(req.getParameter("password")); 

		CustomerDAO cdao=new CustomerDAO();
			
		boolean result = cdao.CheckCustomer(cb); // 로그인시 유저 검사
		System.out.println("반환받은 로그인 result값 : " + result);

	
		
		if(result){ // 암호화 안되어있는 계정도 경우 넣어놈
			HttpSession session=req.getSession();
			log.info("로그인 완료!");
			System.out.println("로그인 성공 result값 " + result); 
	
			
			//	String nickname=req.getParameter("nickname");
		
				// cdao.CustomerInformation(email);
				
				CustomerBean a = cdao.CustomerInformation(email);
				
				System.out.println("-----------------------------------------");
				System.out.println(a.getCustomerNo() + " - 객체 내용 번호");
				System.out.println(a.getNickname() + " - 객체 닉네임 가져오기");
				System.out.println("-----------------------------------------");
				
				System.out.println("파라미터로 가져온 이메일 값 : " + email);
				
				session.setAttribute("email", email);
				session.setAttribute("nickname", a.getNickname());
				session.setAttribute("customerNo", a.getCustomerNo());
				session.setAttribute("phone", a.getPhone());
				System.out.println("세션 폰번호 값 " + session.getAttribute("phone"));
				session.setAttribute("sido", a.getSido());
				
				
				System.out.println("세션 등록 완료 ");
				
				cdao.deleteLastCouponsAfterLogin(Integer.parseInt(a.getCustomerNo()));
				System.out.println("유효기간 지난 쿠폰 삭제");
				// 페이지 이동 설정 (이동 방식, 경로)
				
				System.out.println("룰렛 응모권 지급 로직");
				EventDAO eventDAO = new EventDAO();
				eventDAO.giveEventTicketAfterLogin(Integer.parseInt(a.getCustomerNo()));
			
				System.out.println("로그인 성공 아이디 : " + email);
			
		}else{
			System.out.println("고갱님 로그인 실패됨");
			log.info("로그인 성공했는데 이 메시지 뜨면 암호화 안된 고객이 로그인에 성공한경우임");
			log.info("로그인 함수를 2개 호출하기 때문에 발생하는 메시지");
			System.out.println("로그인 실패 아이디 : " + email);
		}
		
		
	
	
	
		

		return result;
		
	} // method

	
	
	
public int Aesexecute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		log.info("CustomerLoginAction execute()  (암호화 안된 고객)");
		System.out.println("aesnotcheck 로그인 액션  (암호화 안된 고객)");
		log.info("aesnotcheck 로그인 테스트 호출  (암호화 안된 고객)");
		
		req.setCharacterEncoding("UTF-8");
		
		
		
		
		CustomerBean cb =new CustomerBean();
		
		cb.setEmail(req.getParameter("email"));
		cb.setNickname(req.getParameter("nickname")); 
		cb.setPassword(req.getParameter("password")); 

		CustomerDAO cdao=new CustomerDAO();
			
	
		int aesnotcheck = cdao.NotAesCheckCustomer(cb);
		System.out.println("aesnotcheck 반환받은 로그인 result값  (암호화 안된 고객) : " + aesnotcheck);

	
		
		if(aesnotcheck == 1){ // 암호화 안되어있는 계정도 경우 넣어놈
			HttpSession session=req.getSession();
			log.info("aesnotcheck 로그인 완료!");
			System.out.println("aesnotcheck 로그인 성공 result값 (암호화 안된 고객) " + aesnotcheck); 
	
			
			//	String nickname=req.getParameter("nickname");
				String email = req.getParameter("email");
				
				// cdao.CustomerInformation(email);
				
				CustomerBean a = cdao.CustomerInformation(email);
				
				System.out.println("-----------------------------------------");
				System.out.println(a.getCustomerNo() + " - aesnotcheck 객체 내용 번호");
				System.out.println(a.getNickname() + " - aesnotcheck 객체 닉네임 가져오기");
				System.out.println("-----------------------------------------");
				
				System.out.println("aesnotcheck 파라미터로 가져온 이메일 값  (암호화 안된 고객) : " + email);
				
				session.setAttribute("email", email);
				session.setAttribute("nickname", a.getNickname());
				session.setAttribute("customerNo", a.getCustomerNo());
				session.setAttribute("phone", a.getPhone());
				System.out.println("세션 폰번호 값 " + session.getAttribute("phone"));
				session.setAttribute("sido", a.getSido());
				
				
				System.out.println("세션 등록 완료  (암호화 안된 고객) ");
				
				cdao.deleteLastCouponsAfterLogin(Integer.parseInt(a.getCustomerNo()));
				System.out.println("유효기간 지난 쿠폰 삭제  (암호화 안된 고객)");
				// 페이지 이동 설정 (이동 방식, 경로)
				
				System.out.println("룰렛 응모권 지급 로직  (암호화 안된 고객)");
				EventDAO eventDAO = new EventDAO();
				eventDAO.giveEventTicketAfterLogin(Integer.parseInt(a.getCustomerNo()));
			
		
			
		}else{
			System.out.println("aesnotcheck 고갱님 로그인 실패됨");
			log.info("로그인 성공했는데 이 메시지 뜨면 암호화 된 고객이 로그인에 성공한경우임");
			log.info("로그인 함수를 2개 호출하기 때문에 발생하는 메시지");
		
		}
		
		
	
	
	
		

		return aesnotcheck;
		
	} // method



public void magicsession(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	
	
	System.out.println("누군가가 세션으로 접속함 ");

	
	req.setCharacterEncoding("UTF-8");
	
	
	
	
	CustomerBean cb =new CustomerBean();
	
	cb.setEmail("Anonymous@naver.com");
	cb.setNickname("Anonymous"); 
	cb.setCustomerNo("9999"); 
	cb.setPassword("1234");
		HttpSession session=req.getSession();
		log.info("테스터용 익명 계정 로그인 완료!");

			session.setAttribute("email", "Anonymous@naver.com");
			session.setAttribute("nickname","Anonymous");
			session.setAttribute("customerNo", "9999");
			session.setAttribute("phone", "01012341234");
			session.setAttribute("sido", "서울");
		
	
	
} // method
} // class
