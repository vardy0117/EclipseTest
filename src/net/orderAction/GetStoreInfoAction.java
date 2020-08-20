package net.orderAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdk.nashorn.internal.runtime.regexp.joni.Regex;
import net.store.db.StoreBean;
import net.store.db.StoreDAO;

public class GetStoreInfoAction {

	public StoreBean getStroeInfo(HttpServletRequest req, HttpServletResponse resp, int storeNo) {
		StoreBean sbean = null;
		
		StoreDAO sdao = new StoreDAO();
		
		sbean = sdao.getStoreInfo(storeNo);
		System.out.println(sbean.getStoreNo());
			
		req.setAttribute("storeInfo", sbean);
	
		return sbean;
	}

}
