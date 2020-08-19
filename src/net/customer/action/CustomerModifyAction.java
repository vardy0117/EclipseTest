package net.customer.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import net.customer.db.CustomerBean;
import net.customer.db.CustomerDAO;

public class CustomerModifyAction {

	public int execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		String oldPass = request.getParameter("oldPass");
		
		CustomerBean cBean = new CustomerBean();
		cBean.setCustomerNo(request.getParameter("customerNo"));
		cBean.setEmail(request.getParameter("email"));
		if(request.getParameter("password").equals("")){
			cBean.setPassword(oldPass);
		}else{
			cBean.setPassword(request.getParameter("password"));
		}
		cBean.setNickname(request.getParameter("nickname"));
		cBean.setPhone(request.getParameter("phone"));
		cBean.setRoadAddress(request.getParameter("roadAddress"));
		cBean.setDetailAddress(request.getParameter("detailAddress"));

		CustomerDAO cDAO = new CustomerDAO();
		int result = cDAO.updateMember(cBean);

		return result;
	}
	
}