package net.ceo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.ceo.db.CeoBean;
import net.ceo.db.CeoDAO;

public class CeoModifyAction {
	public int execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		CeoDAO cDAO = new CeoDAO();
		CeoBean cBean = new CeoBean();
		String oldPass = request.getParameter("oldPass");
		
		cBean.setEmail(request.getParameter("email"));
		if(request.getParameter("password").equals("")){
			cBean.setPassword(request.getParameter("oldPass"));
		}else{
			cBean.setPassword(request.getParameter("password"));
		}
		cBean.setName(request.getParameter("name"));
		cBean.setPhone(request.getParameter("phone"));
		cBean.setCeoNo(request.getParameter("ceoNo"));
		request.setAttribute("email", request.getParameter("email"));
		
		int result = cDAO.updateCeo(cBean);
		return result;
		
	}
}
