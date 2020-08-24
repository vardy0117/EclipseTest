package net.menu.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import net.menu.db.MenuBean;
import net.menu.db.MenuDAO;

public class MenuAction {

	public void insertStore(HttpServletRequest request, HttpServletResponse response, MultipartRequest multi) {
		
		int menuCnt = Integer.parseInt(multi.getParameter("menuCnt"));
		
		
		List<MenuBean> menuList = new ArrayList();
		
		for(int i=1; i<=menuCnt; i++) {
			MenuBean menuBean = new MenuBean();
			
			String menu_image = multi.getParameter("menu_image" + i);
			String menu_category = multi.getParameter("menu_category" + i);
			String menu_name = multi.getParameter("menu_name" + i);
			int menu_price = Integer.parseInt(multi.getParameter("menu_price" + i));
			
			menuBean.setImage(menu_image);
			menuBean.setCategory(menu_category);
			menuBean.setName(menu_name);
			menuBean.setPrice(menu_price);
			
			menuList.add(menuBean);
		}
		
		MenuDAO menuDAO = new MenuDAO();
		menuDAO.insertMenus(menuList);
		
	}
}
