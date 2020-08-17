package net.customer.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CustomerFrontController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 가상 요청 주소 가져오기
		String requestURI=req.getRequestURI();
		
		String contextPath=req.getContextPath();
			
		String command=requestURI.substring(contextPath.length());
		
		ActionForward forward=null;
		
		Action action=null;
		
		
		// command : 요청 페이지의 가상주소
		// foward : 요청 페이지로 이동할 방식(boolean값으로 표현), 경로(문자열)을 저장하는 객체
		// 를 이용하여 요청 페이지로 이동에 관련한 설정을 하겠습니다.
		switch(command){ 
			case "/SelectJoin.me" : // 회원 가입 구분 페이지 요청
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("./index.jsp?center=member/selectJoin.jsp");
			break;		
		
			case "/CustomerJoin.me" : // 일반 회원 가입 페이지 요청
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("./index.jsp?center=member/customerJoin.jsp");
			break; 

			case "/JoinCheck.me" : // 유효성 체크	
				action = new CustomerJoinAction();
			try {
				action.outData(req, resp);
			} catch (Exception e) {
				System.out.println("유효성 체크" + e);
			};
			break;
				
			case "/CustomerJoinAction.me": // 일반 회원 가입 처리 요청			
				action = new CustomerJoinAction();
			try{
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
/*			case "/CustomerLogIn.me" :
				action=new CustomerLogIn.me();
				try {
					forward=action.execute(req, resp);
				} catch (Exception e) {
					System.out.println("로그인에러"+e);
				}
			
			case "/Logout.me" :
			
				action=new LogoutAction();
				try {
					 forward=action.execute(req, resp);
				
				} catch (Exception e) {
					System.out.println("로그아웃에러" + e);
				}
			break;*/
			
			case "/index.jsp" :
				forward=new ActionForward();
				forward.setRedirect(true);
				forward.setPath("./index.jsp");
			break;	
					
			
			
			/********************************************/
			case "/CustomerLoginAction.me": // 일반고객 로그인 처리 과정	
				action = new CustomerLoginAction();
			try{
				forward = action.execute(req, resp);
				System.out.println("login.me 호출");
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			break;
			
			/********************************************/
			case "/CustomerLogin.me" : // 일반 고객 로그인 창
				forward=new ActionForward();
				forward.setRedirect(true);
				forward.setPath("./index.jsp?center=member/customerLogin.jsp");
			break;	
			/********************************************/
			
			/********************************************/
			case "/BusinessLogin.me" : // 사업자 고객 로그인 창
				forward=new ActionForward();
				forward.setRedirect(true);
				forward.setPath("./index.jsp?center=member/businessLogin.jsp");
			break;	
			/********************************************/
			
			
			
		} // switch문
	
		// 요청 주소로 페이지를 이동합니다.
		if(forward!=null){
			if(forward.isRedirect()){
				resp.sendRedirect(forward.getPath());
			
			} else {
				RequestDispatcher despatcher = req.getRequestDispatcher(forward.getPath());
			}
		} // if문
		
	} // method
	
	
} // class
