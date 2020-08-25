package net.order.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


public class OrderAction {

	public void insertOrderList(HttpServletRequest req, HttpServletResponse resp){
		try {
			JSONArray cart = new JSONArray(req.getParameter("cart"));
			for(int i = 0; i < cart.length(); i++)
			{
			    JSONObject object = array.getJSONObject();
			}
			
			
		} catch (JSONException e) {
			
			e.printStackTrace();
		}
	
	}

}
