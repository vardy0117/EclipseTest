package net.ceo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CeoLogoutAction {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.getSession().removeAttribute("email");
		request.getSession().removeAttribute("ceoNo");
		
	}
}
