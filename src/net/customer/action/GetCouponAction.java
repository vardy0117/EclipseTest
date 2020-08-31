package net.customer.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import net.coupon.db.CouponBean;
import net.coupon.db.CouponDAO;


public class GetCouponAction {

	public String getCoupons(String customerNo){
		CouponDAO cdao = new CouponDAO();
		JSONArray couponList = new JSONArray();
		
		List<CouponBean> list = new ArrayList<CouponBean>();
		list = cdao.getCoupons(customerNo);
		
		for (CouponBean cBean : list){
			JSONObject jsonObj = new JSONObject();
			
			jsonObj.put("couponNo", cBean.getCouponNo());
			jsonObj.put("name", cBean.getName());
			jsonObj.put("discount", cBean.getDiscount());

			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			String date = formatter.format(cBean.getExpDate());
			jsonObj.put("expDate", date);
		
			couponList.add(jsonObj);
		}
		
		JSONObject totalObject = new JSONObject();
		
		totalObject.put("couponList", couponList);
		
		String jsonInfo = totalObject.toJSONString();

		return jsonInfo;
	}

}
