package net.customer.action;

import java.io.PrintWriter;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.corba.se.spi.orbutil.fsm.Action;
import com.sun.corba.se.spi.orbutil.fsm.FSM;
import com.sun.corba.se.spi.orbutil.fsm.Input;

import action.ActionForward;
import net.customer.db.CustomerBean;
import net.customer.db.CustomerDAO;



public class CustomerLogoutAction implements Action {
	
	private final static Logger log = Logger.getGlobal();

	

	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		HttpSession session=req.getSession();
			
		//session.invalidate();
		session.removeAttribute("nickname");
		session.removeAttribute("customerNo");

		System.out.println("로그아웃 처리 함수 호출");

		resp.setContentType("text/html; charset=UTF-8"); 
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter out=resp.getWriter();
		out.println("<script>");
		out.println("alert('로그아웃 되었습니다');");
		out.println("location.href='./';");
		out.println("</script>");
		out.close();

		ActionForward forward = new ActionForward();
	
		return null;
		
	} // method



	@Override
	public void doIt(FSM arg0, Input arg1) {
		// TODO Auto-generated method stub
		
	}





} // class
