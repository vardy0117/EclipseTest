package net.ceo.action;

import java.io.PrintWriter;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.ActionForward;
import net.ceo.db.CeoBean;
import net.ceo.db.CeoDAO;
import net.customer.db.CustomerBean;
import net.customer.db.CustomerDAO;



public class CeoLoginAction {
	
	private final static Logger log = Logger.getGlobal();
	
	public boolean execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		log.info("CEOLoginAction execute()");

		
		req.setCharacterEncoding("UTF-8");
		
		
		
		
		CeoBean cb =new CeoBean();
		
		cb.setEmail(req.getParameter("email"));
		// cb.setNickname(req.getParameter("nickname")); 
		cb.setPassword(req.getParameter("password")); 
		System.out.println("ceo login action받은 값 이메일 " + cb.getEmail());
		System.out.println("ceo login action받은 값 비번 : " + cb.getPassword());

		CeoDAO cdao = new CeoDAO();
			
		boolean result = cdao.CheckCeo(cb); // 로그인시 유저 검사
		System.out.println("사장님 반환받은 로그인 result값 : " + result);

		
	
		ActionForward forward = new ActionForward();
	
		
		if(result == true){
			HttpSession session = req.getSession();
			log.info("사장님 로그인 완료!");
			System.out.println("사장님 로그인 성공 result값 " + result); 
	
			
				String email = req.getParameter("email");				
				CeoBean a = cdao.CeoInformation(email);
				
				System.out.println("-----------------------------------------");
				System.out.println(a.getCeoNo() + " - 사장님 객체 내용 번호");
				System.out.println(a.getEmail() + " - 이메일 가져오기");
				System.out.println("-----------------------------------------");
				
				System.out.println("파라미터로 가져온 이메일 값 : " + email);
				
				

				// session.setAttribute("nickname", a.getNickname());
				// session.setAttribute("nickname", a.getNickname());
				session.setAttribute("ceoNo", a.getCeoNo());
				System.out.println("들어가있는 ceo번호 "+ a.getCeoNo());
				session.setAttribute("email", email);
				System.out.println("세션 겟 에트리 뷰트 " + session.getAttribute(a.getCeoNo()));
				
				
				System.out.println("사장님 세션 등록 완료 ");
				// 페이지 이동 설정 (이동 방식, 경로)
				
			
		}else{
			
			 resp.setCharacterEncoding("UTF-8");
			 PrintWriter out = resp.getWriter();
			 resp.setContentType("text/html;charset=UTF-8"); 
			 
			 out.println("<script>"); 
			 out.println("alert('사업자 로그인에 실패하셨습니다. \\n 아이디와 비밀번호 확인 후 다시 로그인해주세요.');"); 
			 out.println("history.back();"); 
			 out.println("</script>");
			System.out.println("로그인 실패 result값 " + result);
			
		
		}
		
		
	
	
	
		

		return result;
		
	} // method
	
	
	

} // class
