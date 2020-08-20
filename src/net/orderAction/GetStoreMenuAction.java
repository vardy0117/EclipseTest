package net.orderAction;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.fabric.xmlrpc.base.Array;

import action.ActionForward;
import net.menu.db.MenuBean;
import net.menu.db.MenuDAO;
import net.store.db.StoreBean;
import net.store.db.StoreDAO;

public class GetStoreMenuAction {

	public void getStoreMenu(HttpServletRequest req, HttpServletResponse res, int storeNo) throws Exception {
		List<MenuBean> menuList = new ArrayList<MenuBean>();

			MenuDAO mdao = new MenuDAO();

			menuList = mdao.getStoreMenu(storeNo);
					
			req.setAttribute("menuList", menuList);			
	}

}
