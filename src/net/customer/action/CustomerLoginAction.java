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
		System.out.println("반환받은 로그인 result값 : " + result);
		
	

		
		if(result == false){
			PrintWriter out = resp.getWriter();
			req.setCharacterEncoding("utf-8");
			 resp.setContentType("text/html;charset=UTF-8"); 
			 out.println("<script>"); 
			 out.println("alert('로그인에 실패하셨습니다. 아이디와 비밀번호 확인 후 다시 로그인해주세요.');"); 
			 out.println("history.back();"); 
			 out.println("");
			 out.println("</script>");
			System.out.println("로그인 실패 result값 " + result);
			return null;
			
		}else{
			log.info("로그인 완료!");
			req.setAttribute("loginResult", result);
			System.out.println("로그인 성공 result값 " + result);
		}
				
		// 페이지 이동 설정 (이동 방식, 경로)
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./index.jsp"); 
		

		return forward;
		
	} // method

} // class
