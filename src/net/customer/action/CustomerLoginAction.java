package net.customer.action;

import java.io.PrintWriter;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
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
					
		

		// ������ �̵� ���� (�̵� ���, ���)
		PrintWriter out = resp.getWriter();
	
	} // method
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		log.info("CustomerLoginAction execute()");
		System.out.println("�α��� �׼�");
		log.info("�α��� �׽�Ʈ ȣ��");
		req.setCharacterEncoding("UTF-8");
		
		
		
		
		CustomerBean cb =new CustomerBean();
		
		cb.setEmail(req.getParameter("email"));
		cb.setPassword(req.getParameter("password")); 

		CustomerDAO cdao=new CustomerDAO();
			
		boolean result = cdao.CheckCustomer(cb); // �α��ν� ���� �˻�
		System.out.println("��ȯ���� �α��� result�� : " + result);
		
	

		
		if(result == false){
		
			 resp.setCharacterEncoding("UTF-8");
			 PrintWriter out = resp.getWriter();
			 resp.setContentType("text/html;charset=UTF-8"); 
			 
			 out.println("<script>"); 
			 out.println("alert('�α��ο� �����ϼ̽��ϴ�. \\n ���̵�� ��й�ȣ Ȯ�� �� �ٽ� �α������ּ���.');"); 
			 out.println("history.back();"); 
			 out.println("</script>");
			System.out.println("�α��� ���� result�� " + result);
			return null;
			
		}else{
			log.info("�α��� �Ϸ�!");
			// req.setAttribute("loginResult", result); // �̰� �뵵�� ������?????????????
			System.out.println("�α��� ���� result�� " + result); 
			
			/**********************************/
			// ���� �α����� ������ ������ �ִ� ������ ����
			// Ʋ�ȴ��� �¾Ҵ����� Ȯ���ϴ� �� 
			/**********************************/
			
		}
				
		// ������ �̵� ���� (�̵� ���, ���)
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setView("./index.jsp"); 
		

		return forward;
		
	} // method

} // class
