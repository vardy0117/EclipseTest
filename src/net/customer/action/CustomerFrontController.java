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

		// ���� ��û �ּ� ��������
		String requestURI=req.getRequestURI();
		
		String contextPath=req.getContextPath();
			
		String command=requestURI.substring(contextPath.length());
		
		ActionForward forward=null;
		
		Action action=null;
		
		
		// command : ��û �������� �����ּ�
		// foward : ��û �������� �̵��� ���(boolean������ ǥ��), ���(���ڿ�)�� �����ϴ� ��ü
		// �� �̿��Ͽ� ��û �������� �̵��� ������ ������ �ϰڽ��ϴ�.
		switch(command){ 
			case "/SelectJoin.me" : // ȸ�� ���� ���� ������ ��û
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("./index.jsp?center=member/selectJoin.jsp");
			break;		
		
			case "/CustomerJoin.me" : // �Ϲ� ȸ�� ���� ������ ��û
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("./index.jsp?center=member/customerJoin.jsp");
			break; 

			case "/JoinCheck.me" : // ��ȿ�� üũ	
				action = new CustomerJoinAction();
			try {
				action.outData(req, resp);
			} catch (Exception e) {
				System.out.println("��ȿ�� üũ" + e);
			};
			break;
				
			case "/CustomerJoinAction.me": // �Ϲ� ȸ�� ���� ó�� ��û			
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
					System.out.println("�α��ο���"+e);
				}
			
			case "/Logout.me" :
			
				action=new LogoutAction();
				try {
					 forward=action.execute(req, resp);
				
				} catch (Exception e) {
					System.out.println("�α׾ƿ�����" + e);
				}
			break;*/
			
			case "/index.jsp" :
				forward=new ActionForward();
				forward.setRedirect(true);
				forward.setPath("./index.jsp");
			break;	
					
			
			
			/********************************************/
			case "/CustomerLoginAction.me": // �Ϲݰ� �α��� ó�� ����	
				action = new CustomerLoginAction();
			try{
				forward = action.execute(req, resp);
				System.out.println("login.me ȣ��");
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			break;
			
			/********************************************/
			case "/CustomerLogin.me" : // �Ϲ� �� �α��� â
				forward=new ActionForward();
				forward.setRedirect(true);
				forward.setPath("./index.jsp?center=member/customerLogin.jsp");
			break;	
			/********************************************/
			
			/********************************************/
			case "/BusinessLogin.me" : // ����� �� �α��� â
				forward=new ActionForward();
				forward.setRedirect(true);
				forward.setPath("./index.jsp?center=member/businessLogin.jsp");
			break;	
			/********************************************/
			
			
			
		} // switch��
	
		// ��û �ּҷ� �������� �̵��մϴ�.
		if(forward!=null){
			if(forward.isRedirect()){
				resp.sendRedirect(forward.getPath());
			
			} else {
				RequestDispatcher despatcher = req.getRequestDispatcher(forward.getPath());
			}
		} // if��
		
	} // method
	
	
} // class
