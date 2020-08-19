package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import action.AjaxAction;
import net.customer.action.CustomerJoinAction;
import net.customer.action.CustomerLoginAction;
import net.customer.action.CustomerLogoutAction;
import net.customer.action.CustomerModifyAction;
import net.customer.db.CustomerBean;
import net.customer.db.CustomerDAO;


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
		
		// forward���� view=�대�������댁�, redirect=由щ�ㅼ�대���몃갑���몄� ���ㅽ�⑥�諛⑹���몄�
		// ----------------------------------------------------------------------
		// login
		if(command.equals("login.do")){
			forward = new ActionForward();
			forward.setView("index.jsp?center=member/selectLogin.jsp");
			forward.execute(request, response);
		}
		
		// select join(customer/ceo)
		if(command.equals("SelectJoin.do")) {
			forward = new ActionForward();
			forward.setView("index.jsp?center=member/selectJoin.jsp");
			forward.execute(request, response);
		}
		
		// ajax
		if(command.equals("JoinCheck.do")) {
			AjaxAction ajax = new AjaxAction();
			try {
				ajax.emailCheck(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(command.equals("getCustomer.do")) {
			AjaxAction ajax = new AjaxAction();
			
			String jsonObj = ajax.getCustomer(request.getParameter("customerNo"));
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print(jsonObj);
			
		}
		
		// >customerJoin.jsp
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
			CustomerLoginAction action = new CustomerLoginAction() ;
		
			try {
				forward = action.execute(request, response);
				forward.execute(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		if(command.equals("CustomerJoinAction.do")) {
			CustomerJoinAction action = new CustomerJoinAction();		
			try {
				forward = action.execute(request, response);
				forward.execute(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(command.equals("LogOut.do")) {
			CustomerLogoutAction action = new CustomerLogoutAction() ;
			try {
				forward = action.execute(request, response);
				forward.execute(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(command.equals("CustomerModifyIntro.do")){
			String password = request.getParameter("password");
			String customerNo = (String)request.getSession().getAttribute("customerNo");
			CustomerDAO cDAO = new CustomerDAO();
			CustomerBean cBean = cDAO.getCustomer(customerNo);
			
			if(password != null && cBean.getPassword().equals(password)){
				forward = new ActionForward();
				forward.setView("./CustomerModify.do");
				forward.execute(request, response);
			} 
			
			else if(customerNo != null){
				forward = new ActionForward();
				forward.setView("index.jsp?center=member/customerModifyIntro.jsp");
				forward.execute(request, response);
			}
		}

		
		if(command.equals("CustomerModify.do")){
			
			if(request.getSession().getAttribute("customerNo") != null){
				CustomerDAO cDAO = new CustomerDAO();
				CustomerBean cBean = cDAO.getCustomer((String)request.getSession().getAttribute("customerNo"));
				request.setAttribute("cBean", cBean);
				forward = new ActionForward();
				forward.setView("index.jsp?center=member/customerModify.jsp");
				forward.execute(request, response);
			}
		}
		if(command.equals("CustomerModifyAction.do")){
			CustomerModifyAction action = new CustomerModifyAction();
			try {
				int result = action.execute(request, response);
				request.getSession().setAttribute("nickname", request.getParameter("nickname"));

				if(result==1){
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('수정이 완료 되었습니다.'); location.href='./';</script>");
					out.flush();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	
		if(command.equals("SearchStore.do")) {
			// 받은 값 : roadAddress / detailAddress / bname 
			request.setCharacterEncoding("utf-8");
			
			request.getSession().setAttribute("orderRoadAddress", request.getParameter("roadAddress"));
			request.getSession().setAttribute("orderDetailAddress", request.getParameter("detailAddress"));
			request.getSession().setAttribute("orderBname", request.getParameter("bname"));
			
			forward = new ActionForward();
			forward.setView("index.jsp?center=store/searchStore.jsp");
			forward.execute(request, response);
		}
		
		if(command.equals("Store.do")) {
			String storeNo = request.getParameter("storeNo");
			// storeNo를 받아서 storeDAO에서 bean(model)을 찾고 request에 넣은뒤 store.jsp로 이동해 사용
			// 아마도? 리뷰도 여기화면 하단에서 뿌려줄듯
			// 지금은 우선 storeNo만 request에 저장
			request.setAttribute("storeNo", storeNo);
			
			forward = new ActionForward();
			forward.setView("index.jsp?center=store/store.jsp");
			forward.execute(request, response);
		}




		
	}

}
