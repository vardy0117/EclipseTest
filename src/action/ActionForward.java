package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.customer.db.CustomerDAO;

public class ActionForward {
	private boolean isRedirect = false;
	private String view = null;
	
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	public String getView() {
		return view;
	}
	public void setView(String view) {
		this.view = view;
	}
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		if(isRedirect) {
			response.sendRedirect(view);	//�����̷�Ʈ ���
		} else{
			RequestDispatcher rdis = request.getRequestDispatcher(view);	//����ġ ���
			rdis.forward(request, response);
		}
	}
	
	
	
}
