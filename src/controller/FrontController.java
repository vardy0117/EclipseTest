package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import net.customer.action.Action;
import net.customer.action.CustomerLoginAction;


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
		
		// http://localhost:8080/GitTest/hello.do 二쇱�����μ��
		// command�� "hello.do"媛� ���λ�� 
		String command = requestURI.substring(contextPath.length()+1);	
		ActionForward forward = null;
		Action action=null;
		
		// forward���� view=�대�������댁�, redirect=由щ�ㅼ�대���몃갑���몄� ���ㅽ�⑥�諛⑹���몄�
		// ----------------------------------------------------------------------
		// 濡�洹몄�� �������댁�
		if(command.equals("login.do")){
			forward = new ActionForward();
			forward.setView("index.jsp?center=member/selectLogin.jsp");
			forward.execute(request, response);
		}
		
		// ����媛��� �������댁�
		if(command.equals("SelectJoin.do")) {
			forward = new ActionForward();
			forward.setView("index.jsp?center=member/selectJoin.jsp");
			forward.execute(request, response);
		}
		
		// ����媛����� ���⑥�� 泥댄��
		if(command.equals("JoinCheck.do")) {
			forward = new ActionForward();
			try {
				forward.outData(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// �쇰�����媛��� ���댁�
		if(command.equals("CustomerJoin.do")) {
			forward = new ActionForward();
			forward.setView("index.jsp?center=member/customerJoin.jsp");
			forward.execute(request, response);
		}
		
		if(command.equals("CustomerLogin.do")) {
			forward = new ActionForward();
			forward.setView("index.jsp?center=member/customerLogin.jsp");
			forward.execute(request, response);
		}
		
		if(command.equals("CustomerLoginAction.do")) {
			action = new CustomerLoginAction();
		
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		/**************************************************************************************/
		if(forward!=null){ 
			if(forward.isRedirect()){

				response.sendRedirect(forward.getView());
				
				
			}else{
				
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getView());
				dispatcher.forward(request, response);
			}
		}//if 
		/**************************************************************************************/
		
		
	}

}
