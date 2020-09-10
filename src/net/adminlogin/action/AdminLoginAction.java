package net.adminlogin.action;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import net.admin.db.AdminBean;
import net.admin.db.adminDAO;

public class AdminLoginAction {
	private final static Logger log = Logger.getGlobal();
	
	public int execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HttpSession session = req.getSession();
		
		log.info("AdminLoginAction execute()");

		req.setCharacterEncoding("UTF-8");
		
		AdminBean abean= new AdminBean();
		abean.setAdminNo(Integer.parseInt(req.getParameter("adminNo")));
		abean.setAdminPassword(req.getParameter("password"));
	 
		adminDAO adao= new adminDAO();
		int result = adao.CheckAdmin(abean); // 로그인시 유저 검사
		System.out.println("사장님 반환받은 로그인 result값 : " + result);

		if(result==1){
			session.setAttribute("adminNo", abean.getAdminNo());
			
		}else {
			System.out.println("로그인 실패!");
		}
		
	
		
	return result;	
	}
}
