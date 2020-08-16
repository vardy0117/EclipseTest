package net.customer.action;

import javax.servlet.http.HttpServletRequest;

public class ActionForward {
	//이동 방식
	private boolean isRedirect=false; 
	//true sendRedirect()
	//false  forward()
	
	// 페이지 이동 경로
	private String path=null;
	
	// 페이지 이동 방식 (getter 메소드)
	public boolean isRedirect() {
		return isRedirect;
	}
	
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
}
