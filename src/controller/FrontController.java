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
		
		// http://localhost:8080/GitTest/hello.do 에서
		// hello.do 만 추출
		String command = requestURI.substring(contextPath.length()+1);	
		ActionForward forward = null;
		
		// 예시
		// ----------------------------------------------------------------------
		if(command.equals("login.do")){
			forward = new ActionForward();
			forward.setView("index.jsp?center=member/selectLogin.jsp");
			forward.execute(request, response);
		}
		
	}

}
