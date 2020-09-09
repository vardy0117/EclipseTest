package net.delviery.action;

import java.io.UnsupportedEncodingException;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.delivengers.db.DelivengersBean;
import net.delivengers.db.DelivengersDAO;

public class DeliveryLoginAction {
	private final static Logger log = Logger.getGlobal();
	
	public boolean execute(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
			
			log.info("DelivengersLoginAction execute()");

			req.setCharacterEncoding("UTF-8");
			
			DelivengersBean db = new DelivengersBean();
			
			db.setDelivengersNo(req.getParameter("delivengersNo"));
			db.setPassword(req.getParameter("password")); 

			DelivengersDAO ddao = new DelivengersDAO();
				
			boolean result = ddao.CheckDelivengers(db); // 로그인시 유저 검사
			
			if(result == true){
				HttpSession session = req.getSession();				
					session.setAttribute("delivengersNo", db.getDelivengersNo());
					System.out.println("배달원 세션 등록 완료 ");
			}else{
				System.out.println("배달원로그인 실패");
			}
			return result;
	}

}
