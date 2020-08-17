package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
       
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcesss(request,response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcesss(request,response);
	}
	
	protected void doProcesss(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		
		// http://localhost:8080/GitTest/hello.do 주소입력시
		// command에 "hello.do"가 저장됨 
		String command = requestURI.substring(contextPath.length()+1);	
		ActionForward forward = null;
		
		// forward속성 view=이동할페이지, redirect=리다이렉트방식인지 디스패치방식인지
		// ----------------------------------------------------------------------
		// 로그인 선택페이지
		if(command.equals("login.do")){
			forward = new ActionForward();
			forward.setView("index.jsp?center=member/selectLogin.jsp");
			forward.execute(request, response);
		}
		
		// 회원가입 선택페이지
		if(command.equals("SelectJoin.do")) {
			forward = new ActionForward();
			forward.setView("index.jsp?center=member/selectJoin.jsp");
			forward.execute(request, response);
		}
		
		// 일반회원가입 페이지
		if(command.equals("CustomerJoin.do")) {
			forward = new ActionForward();
			forward.setView("index.jsp?center=member/customerJoin.jsp");
			forward.execute(request, response);
		}
		
		
	}

}
