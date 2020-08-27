package net.orderMenu.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
		    
		   sql = "insert into orderMenu(orderNo, name, quantity, price) values(?, ? ,? ,?)";
		    
		   pstmt = con.prepareStatement(sql);
		    
		   int i = 0;
		   for (i=0; i<cart.length(); i++){
			   JSONObject order = cart.getJSONObject(i);
			   
			    pstmt.setInt(1, orderNo);
			    pstmt.setString(2, order.getString("name"));
			    pstmt.setInt(3, order.getInt("quantity"));
			    pstmt.setInt(4, order.getInt("price"));
			    
			    pstmt.executeUpdate();
		    }
		    
	   } catch (Exception e) {
 
	   } finally {
		   resourceClose();
	   }
		
	}

}
