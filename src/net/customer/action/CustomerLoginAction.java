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
		System.out.println("��ȯ���� �α��� result��" + result);
		
		if(result != false){
			log.info("�α��� �Ϸ�!");
			return null;
		}
				
		// ������ �̵� ���� (�̵� ���, ���)
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./index.jsp"); 
		

		return forward;
		
	} // method

} // class
