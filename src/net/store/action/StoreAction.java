package net.store.action;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import net.store.db.StoreBean;
import net.store.db.StoreDAO;

public class StoreAction {
	public int insertStore(HttpServletRequest request, HttpServletResponse response, MultipartRequest multi) {
		
		int storeNo = 0;
		
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
			
			String image_name = (String)e.nextElement();
			if( image_name.equals("image")) {
				String filename = image_name;
				image = multi.getFilesystemName(filename);
				break;
			}
		}
		
		
		
		
		StoreBean storeBean = new StoreBean();
		storeBean.setName(name);
		storeBean.setCeoNo((String)request.getSession().getAttribute("ceoNo"));
		storeBean.setRoadAddress(roadAddress);
		storeBean.setDetailAddress(detailAddress);
		storeBean.setCategory(category);
		storeBean.setPhone(phone);
		storeBean.setStoreHours(storeHours);
		storeBean.setDeliveryArea(deliveryArea);
		storeBean.setMessage(message);
		storeBean.setImage(image);
		storeBean.setRegNo(regNo);
		storeBean.setSido(sido);
		System.out.println("ff"+storeBean);
		System.out.println("ff"+storeBean.toString());
		
		StoreDAO storeDAO = new StoreDAO();
		storeNo = storeDAO.insertStore(storeBean);
		
		
		return storeNo;
	}

	//업체관리 
	public void getCeoStore(HttpServletRequest request, HttpServletResponse response, String ceoNo) {
		StoreDAO s = new StoreDAO();
		List<StoreBean> list = s.getCeoStore(ceoNo);
	
		request.setAttribute("ceoStorelist",list );
		
	}

	public void updateStore(HttpServletRequest request, HttpServletResponse response, MultipartRequest multi) {
		
		StoreBean sbean = new StoreBean();
		StoreDAO s = new StoreDAO();
		
		String storeNo = multi.getParameter("storeNo");
		
		sbean.setStoreNo(storeNo);
		sbean.setName(multi.getParameter("name"));
		sbean.setRoadAddress(multi.getParameter("roadAddress"));
		sbean.setDetailAddress(multi.getParameter("detailAddress"));
		sbean.setCategory(multi.getParameter("category"));
		sbean.setPhone(multi.getParameter("phone"));
		sbean.setStoreHours(multi.getParameter("opentime") + "~" + multi.getParameter("closetime"));
		sbean.setMessage(multi.getParameter("message"));
		sbean.setDeliveryArea(multi.getParameter("deliveryArea"));
		sbean.setRegNo(multi.getParameter("regNo"));
		sbean.setSido(multi.getParameter("sido"));
		
		if(multi.getParameter("fileFlag").equals("true")) {
			Enumeration e = multi.getFileNames();
			String image_name = (String)e.nextElement();
			String filename = image_name;
			sbean.setImage(multi.getFilesystemName(filename));
		} else {
			sbean.setImage( s.getStoreInfo(Integer.parseInt(storeNo)).getImage() );
		}
		
		
		s.updateStore(sbean);
		
		
		System.out.println(sbean);
		
	}

	public String getStoreNameByStoreNo(HttpServletRequest request, HttpServletResponse response, String storeNo) {
		StoreDAO sDAO = new StoreDAO();
		return sDAO.getStoreName(storeNo);
	}
}
