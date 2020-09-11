package net.customer.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import net.customer.db.CustomerBean;
import net.customer.db.CustomerDAO;

public class CustomerModifyAction {
	private final static Logger log = Logger.getGlobal();
	public int execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		String oldPass = request.getParameter("oldPass");
		CustomerBean cBean = new CustomerBean();
		
		System.out.println("oldPassword : " + oldPass);
		cBean.setCustomerNo(request.getParameter("customerNo"));
		cBean.setEmail(request.getParameter("email"));
		System.out.println("CustomerModfiyAction 실행");
		CustomerDAO cDAO = new CustomerDAO();
		int result =0;
		if(request.getParameter("password").equals("")){
			// cBean.setPassword(oldPass);
			// 패스워드 교체가 없을경우 본 if문 접근 , 암호화에서 원래 키를 못가져오게 되어있어서 함수 한개 추가
			System.out.println("사용자가 암호 변경안함 기존 값 그대로 둠 입력값 없음");
			cBean.setPassword(request.getParameter("password"));
			cBean.setNickname(request.getParameter("nickname"));
			cBean.setPhone(request.getParameter("phone"));
			cBean.setRoadAddress(request.getParameter("roadAddress"));
			cBean.setDetailAddress(request.getParameter("detailAddress"));
			cBean.setBname(request.getParameter("bname"));
			cBean.setSido(request.getParameter("sido"));
			System.out.println(cBean.getBname()+" : 패스워드 변경 제외후 함수 실행");
			result = cDAO.updateMemberNoPassword(cBean); 
		}else{
			cBean.setPassword(request.getParameter("password"));
			cBean.setNickname(request.getParameter("nickname"));
			cBean.setPhone(request.getParameter("phone"));
			cBean.setRoadAddress(request.getParameter("roadAddress"));
			cBean.setDetailAddress(request.getParameter("detailAddress"));
			cBean.setBname(request.getParameter("bname"));
			cBean.setSido(request.getParameter("sido"));
			System.out.println(cBean.getBname()+"!#@@!#!#!@# 액션비네임");

			result = cDAO.updateMember(cBean);
		}
	

		return result;
	}
	
}