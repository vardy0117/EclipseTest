package net.ceo.action;

import java.io.UnsupportedEncodingException;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import net.ceo.db.CeoBean;
import net.ceo.db.CeoDAO;
import net.customer.db.CustomerBean;
import net.customer.db.CustomerDAO;

public class CeoJoinAction {
	
	private final static Logger log = Logger.getGlobal();

	public void ceoJoin(HttpServletRequest req, HttpServletResponse res) throws UnsupportedEncodingException {
		
		log.info("CustomerJoinAction execute()");
		
		req.setCharacterEncoding("UTF-8");
		
		CeoBean cb =new CeoBean();
		
		cb.setEmail(req.getParameter("emailId")+"@"+req.getParameter("emailServer"));
		cb.setPassword(req.getParameter("password")); 
		cb.setName(req.getParameter("name"));
		cb.setPhone(req.getParameter("phoneFront")+req.getParameter("phone"));
		
		// ex
		boolean result = false;
		
		CeoDAO cdao=new CeoDAO();
			
		result = cdao.insertCeo(cb);
		
		if(result == false){
			log.info("CeoJoin Fail!");
		}
	}

}
