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
import net.ceo.action.CeoJoinAction;
import net.ceo.action.CeoLoginAction;

import net.ceo.action.CeoLogoutAction;

import net.ceo.action.CeoModifyAction;
import net.ceo.db.CeoBean;
import net.ceo.db.CeoDAO;

import net.customer.action.CustomerJoinAction;
import net.customer.action.CustomerLoginAction;
import net.customer.action.CustomerLogoutAction;
import net.customer.action.CustomerModifyAction;
import net.customer.db.CustomerBean;
import net.customer.db.CustomerDAO;
import net.orderAction.GetStoreInfoAction;
import net.orderAction.GetStoreMenuAction;


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
		/*
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
		}*/
		
		// >CustomerJoinCheck >customerJoin.jsp
		if(command.equals("CustomerJoinCheck.do")) {
			AjaxAction ajax = new AjaxAction();
			String result="";
			try {
				 result = ajax.emailCheckFromCustomer(request, response);
			} catch (Exception e) {
					e.printStackTrace();
			}
			
			PrintWriter out = response.getWriter();
			out.print(result);
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
		
		// >customerJoinExecute >customerLogin.jsp
		if(command.equals("CustomerJoinAction.do")) {
			CustomerJoinAction action = new CustomerJoinAction();
				try {
					action.customerJoin(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setView("index.jsp?center=member/customerLogin.jsp");	
			forward.execute(request, response);
		}
		
		// >Login.jsp
		if(command.equals("CustomerLogin.do")) {
			forward = new ActionForward();
			forward.setView("index.jsp?center=member/customerLogin.jsp");
			forward.execute(request, response);
		}
		
		if(command.equals("CustomerLoginAction.do")) {
			CustomerLoginAction action = new CustomerLoginAction() ;
			boolean result = false;
			try {
				 forward = new ActionForward();
				 result = action.execute(request, response);
				 if(result){
					 forward.setRedirect(true);
					 forward.setView("index.jsp"); // 사장님 전용페이지가 없어서 일단 여기로 했습니당
					 System.out.println("사장님 로그인 리다이렉트 작동 " + forward.getView());
				 } else {
					 response.setContentType("text/html;charset=UTF-8"); 
					 PrintWriter out = response.getWriter();
					 
					 
					 out.println("<script>"); 
					 out.println("alert('로그인에 실패하셨습니다. \\n 아이디와 비밀번호 확인 후 다시 로그인해주세요.');"); 
					 out.println("location.href= 'CustomerLogin.do' "); 
					 
					// forward.setView("index.jsp?center=member/customerLogin.jsp");
					 out.println("</script>");
					System.out.println("로그인 실패 result값 " + result);
				 }

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
			}else if(password != null && !cBean.getPassword().equals(password)){
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('비밀번호가 다릅니다.'); location.href='./CustomerModifyIntro.do';</script>");
				out.flush();
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
		
		// >ceoJoin.jsp
		if(command.equals("CeoJoin.do")) {
			forward = new ActionForward();
			forward.setView("ceoIndex.jsp?center=member/ceoJoin.jsp");
			forward.execute(request, response);
		}
				
		// CeoJoinCheck >CeoJoin.jsp
		if(command.equals("CeoJoinCheck.do")) {
			AjaxAction ajax = new AjaxAction();
			String result="";
			try {
				result=ajax.emailCheckFromCeo(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			PrintWriter out = response.getWriter();
			out.print(result);
		}		
				
		// CeoJoinAction > CeoLogin.jsp
		if(command.equals("CeoJoinAction.do")) {
			CeoJoinAction action = new CeoJoinAction();		
			try {
				action.ceoJoin(request, response);
				forward.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setView("index.jsp?center=member/ceoLogin.jsp");	
			forward.execute(request, response);
		}
				
		if(command.equals("CeoLogin.do")) {
			forward = new ActionForward();
			forward.setView("ceoIndex.jsp?center=member/ceoLogin.jsp");
			forward.execute(request, response);
		}		
	
		if(command.equals("CeoLoginAction.do")) {
			CeoLoginAction action = new CeoLoginAction() ;
			boolean result = false;
			try {
				 forward = new ActionForward();
				 result = action.execute(request, response);
				 if(result){
					 forward.setRedirect(true);
					 forward.setView("ceoIndex.jsp"); // 사장님 전용페이지가 없어서 일단 여기로 했습니당
					 System.out.println("사장님 로그인 리다이렉트 작동 " + forward.getView());
				 } else {
					 response.setContentType("text/html;charset=UTF-8"); 
					 PrintWriter out = response.getWriter();
									
					  
					 out.println("<script>"); 
					 out.println("alert('사업자 로그인에 실패하셨습니다. \\n 아이디와 비밀번호 확인 후 다시 로그인해주세요.');"); 
					  out.println("history.back();"); 
					// out.println("location.href= 'CustomerLogin.do' "); 
					 out.println("</script>");
					System.out.println("사업자 로그인 실패 result값 " + result);
				 }

				forward.execute(request, response);
				
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
		
/*		if(command.equals("Store.do")) {
			String storeNo = request.getParameter("storeNo");
			// storeNo를 받아서 storeDAO에서 bean(model)을 찾고 request에 넣은뒤 store.jsp로 이동해 사용
			// 아마도? 리뷰도 여기화면 하단에서 뿌려줄듯
			// 지금은 우선 storeNo만 request에 저장
			request.setAttribute("storeNo", storeNo);
			
			forward = new ActionForward();
			forward.setView("index.jsp?center=store/store.jsp");
			forward.execute(request, response);
		}*/

		if(command.equals("Store.do")) {
			int storeNo = Integer.parseInt(request.getParameter("storeNo"));
			
			try {
				GetStoreInfoAction action1 = new GetStoreInfoAction();
					action1.getStroeInfo(request, response, storeNo);
				
				GetStoreMenuAction action2 = new GetStoreMenuAction();
					action2.getStoreMenu(request, response, storeNo);
				
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setView("index.jsp?center=store/store.jsp");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			forward.execute(request, response);
		}
		
		
		// 회원수정페이지에서 회원탈퇴하기 버튼 클릭했을때 이동됨.
		if(command.equals("deleteCustomer.do")){
			forward = new ActionForward();
			// DB에서 delete 작업을 수행할때 필요한 customerNo을 가지고 옴
			String customerNo = (String)request.getSession().getAttribute("customerNo");
			CustomerDAO cDAO = new CustomerDAO();
			int result = cDAO.deleteCustomer(customerNo);
			if(result==1){
				request.getSession().invalidate();	//세션 초기화
				forward.setView("./");
				forward.execute(request, response);
			}
		}

		
		
		if(command.equals("CeoLogOut.do")) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setView("ceoIndex.jsp");
			CeoLogoutAction action = new CeoLogoutAction();
			try {
				action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			forward.execute(request, response);
		}

		
		if(command.equals("addStore.do")) {
			if(request.getSession().getAttribute("ceoNo") == null) {
				response.setContentType("text/html;charset=UTF-8"); 
				PrintWriter out = response.getWriter();
				out.print("<script>alert('로그인을 해주세요.'); location.href='./CeoLogin.do';</script>");
				return;
			}
			forward = new ActionForward();
			forward.setView("ceoIndex.jsp?center=ceoStore/addStore.jsp");
			forward.execute(request, response);
		}
		
		if(command.equals("manageStore.do")) {
			if(request.getSession().getAttribute("ceoNo") == null) {
				response.setContentType("text/html;charset=UTF-8"); 
				PrintWriter out = response.getWriter();
				out.print("<script>alert('로그인을 해주세요.'); location.href='./CeoLogin.do';</script>");
				return;
			}
			forward = new ActionForward();
			forward.setView("ceoIndex.jsp?center=ceoStore/manageStore.jsp");
			forward.execute(request, response);
		}

		if(command.equals("CeoModifyIntro.do")){
			String password = request.getParameter("password");
			String ceoNo = (String)request.getSession().getAttribute("ceoNo");
			CeoDAO cDAO = new CeoDAO();
			CeoBean cBean = cDAO.getCeo(ceoNo);
			
			// 비밀번호가 공백이 아니고 DB와 일치하는 경우
			if(password != null && password.equals(cBean.getPassword())){
				//System.out.println("비밀번호 일치");
				forward = new ActionForward();
				forward.setView("./CeoModify.do");
				forward.execute(request, response);
			}else if(password != null && !password.equals(cBean.getPassword())){
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('비밀번호가 다릅니다.'); location.href='./CeoModifyIntro.do';</script>");
				out.flush();
				
			// ceoNo가 존재할때 즉 로그인을 하고 회원수정버튼을 클릭했을때
			}else if(ceoNo != null){
				forward = new ActionForward();
				forward.setView("ceoIndex.jsp?center=member/ceoModifyIntro.jsp");
				forward.execute(request, response);
			}
		}
		  
		if(command.equals("CeoModify.do")){
			String ceoNo = (String)request.getSession().getAttribute("ceoNo");
			if(ceoNo!=null){
				forward=new ActionForward();
				
				CeoDAO cDAO= new CeoDAO();
				CeoBean cBean = cDAO.getCeo(ceoNo);
				request.setAttribute("cBean", cBean);
				forward.setView("ceoIndex.jsp?center=member/ceoModify.jsp");
				forward.execute(request, response);
			}
		}
		if(command.equals("CeoModifyAction.do")){
			CeoModifyAction action = new CeoModifyAction();
			try {
				int result = action.execute(request, response);
				if(result==1){
					request.getSession().setAttribute("email", request.getParameter("email"));
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.print("<script>alert('수정완료'); location.href='./ceoIndex.jsp';</script>");
				}else{
					System.out.println("수정실패");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(command.equals("deleteCeo.do")){
			forward = new ActionForward();
			// DB에서 delete 작업을 수행할때 필요한 customerNo을 가지고 옴
			String ceoNo = (String)request.getSession().getAttribute("ceoNo");
			CeoDAO cDAO = new CeoDAO();
			int result = cDAO.deleteCeo(ceoNo);
			if(result==1){
				request.getSession().invalidate();	//세션 초기화
				forward.setView("./");
				forward.execute(request, response);
			}
		}
		
	}

}
