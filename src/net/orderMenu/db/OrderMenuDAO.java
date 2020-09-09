package net.orderMenu.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.simple.parser.JSONParser;

public class OrderMenuDAO {
	Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "";
   
    private Connection getConnection() throws Exception{
    	Context init = new InitialContext();
        DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/jspmodel2");
        con = ds.getConnection();
      
      return con;
   }
   
   public void resourceClose(){
      try {
         if(rs!=null) rs.close();
         if(pstmt!=null) pstmt.close();
         if(con!=null) con.close();
      } catch (Exception e) {
         System.out.println("resourceClose! : " + e);
      }
   } // resourceClose()
	   
	
   public void insertOrderMenu(JSONArray cart, int orderNo) {     
	   try {
		   
		   con = getConnection();
		    
		   sql = "insert into orderMenu(orderNo, name, basePrice, quantity, price) values(?, ?, ?, ?, ?)";
		    
		   pstmt = con.prepareStatement(sql);
		    
		   int i = 0;
		   for (i=0; i<cart.length(); i++){
			   JSONObject order = cart.getJSONObject(i);
			   
			    pstmt.setInt(1, orderNo);
			    pstmt.setString(2, order.getString("name"));
			    pstmt.setInt(3, order.getInt("basePrice"));
			    pstmt.setInt(4, order.getInt("quantity"));
			    pstmt.setInt(5, order.getInt("price"));
			    
			    pstmt.executeUpdate();
		    }
		    
	   } catch (Exception e) {
		   	e.printStackTrace();
	   } finally {
		   resourceClose();
	   }
		
	}
   
   public List<OrderMenuBean> getOrderMenuList(int orderNo){
	   
	   	List<OrderMenuBean> orderMenuList = new ArrayList<OrderMenuBean>();
	   
	   	try {
		
	   		con = getConnection();
	   		sql="select * from orderMenu where orderNo=? ";
	   		pstmt=con.prepareStatement(sql);
	   		pstmt.setInt(1, orderNo);
	   		
	   		rs=pstmt.executeQuery();
	   		while(rs.next()){
	   			OrderMenuBean obean = new OrderMenuBean();
	   			obean.setOrderNo(rs.getString(1));
	   			obean.setName(rs.getString(2));
	   			obean.setPrice(rs.getString(3));
	   			obean.setQuantity(rs.getString(4));
	   			obean.setTotalPrice(rs.getInt(5));
	   			orderMenuList.add(obean);
	   		}
	   		
	   		
		} catch (Exception e) {
			System.out.println("getOrderMenuList inner error : "+e);
		} finally {
			resourceClose();
		}
	   
	   return orderMenuList;
	 
   }

	public String getMenusToString(String orderNo) {
		String menus="";
		try {
			con=getConnection();
			sql ="select name from orderMenu where orderNo=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, orderNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				menus+=rs.getString(1);
			}
			while(rs.next()){
				menus+="+"+rs.getString(1);
			}
		} catch (Exception e) {
			System.out.println("getMenusToString() 내에서 예외 발생");
			e.printStackTrace();
		} finally {
			resourceClose();
		}
		
		
		return menus;
	}

}
