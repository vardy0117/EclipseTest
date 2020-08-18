package net.customer.action;

import java.io.PrintWriter;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.ActionForward;
import net.customer.db.CustomerBean;
import net.customer.db.CustomerDAO;



public class CustomerLogoutAction implements Action {
	
	private final static Logger log = Logger.getGlobal();

	

	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		HttpSession session=req.getSession();
			
		session.invalidate();

		System.out.println("로그아웃 처리 함수 호출");

		PrintWriter out=resp.getWriter();
		resp.setCharacterEncoding("UTF-8");
	    resp.setContentType("text/html;charset=UTF-8"); 
		 
		out.println("<script>");
		out.println("alert('안녕히가세요');");
		out.println("location.href='./index.jsp';");
		out.println("</script>");
		out.close();
	
		ActionForward forward = new ActionForward();
	
		return null;
		
	} // method



	@Override
	public void outData(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// TODO Auto-generated method stub
		
	}

} // class
