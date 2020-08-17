package net.customer.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;

public interface Action {
	
	public ActionForward execute(HttpServletRequest req,HttpServletResponse resp) throws Exception;

	public void outData(HttpServletRequest req,HttpServletResponse resp) throws Exception;

}
