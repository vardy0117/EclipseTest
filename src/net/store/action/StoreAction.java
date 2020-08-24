package net.store.action;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import net.store.db.StoreBean;
import net.store.db.StoreDAO;

public class StoreAction {
	public int insertStore(HttpServletRequest request, HttpServletResponse response, MultipartRequest multi) {
		
		int result = 0;
		
		String name = multi.getParameter("name");
		String roadAddress = multi.getParameter("roadAddress");
		String detailAddress = multi.getParameter("detailAddress");
		String category = multi.getParameter("category");
		String phone = multi.getParameter("phone1") + multi.getParameter("phone2");
		String opentime = multi.getParameter("opentime");
		String closetime = multi.getParameter("closetime");
		String storeHours = opentime + "~" + closetime;
		String deliveryArea = multi.getParameter("deliveryArea");
		String message = multi.getParameter("message");
		String sido = multi.getParameter("sido");
		String regNo = multi.getParameter("regNo");
		String image = "";
		
		Enumeration e = multi.getFileNames();
		while(e.hasMoreElements()) {
			String filename = (String)e.nextElement();
			image = multi.getFilesystemName(filename);
		}
		
		StoreBean storeBean = new StoreBean();
		storeBean.setName(name);
		storeBean.setCeoNo((String)request.getSession().getAttribute("ceoNo"));
		storeBean.setRoadAddress(roadAddress);
		storeBean.setDetailAddress(detailAddress);
		storeBean.setCategory(category);
		storeBean.setPhone(phone);
		storeBean.setStoreHours(storeHours);
		storeBean.setMessage(message);
		storeBean.setImage(image);
		storeBean.setRegNo(regNo);
		storeBean.setSido(sido);
		
		
		StoreDAO storeDAO = new StoreDAO();
		result = storeDAO.insertStore(storeBean);
		
		
		
		
		
		
		
		
		
		
		
		return result;
	}
}
