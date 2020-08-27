package net.review.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReviewDAO {
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
   
   
   /******************************************************************************************/
   public ArrayList<ReviewBean> getReview(String storeNo){
      ArrayList<ReviewBean> list = new ArrayList<ReviewBean>();
      ReviewBean rBean;
      
      try {
         con = getConnection();
         sql = "select * from review where storeNo=? order by date desc";
         pstmt=con.prepareStatement(sql);
         pstmt.setString(1, storeNo);
         rs = pstmt.executeQuery();
         while(rs.next()){
        	rBean = new ReviewBean();
            rBean.setReviewNo(rs.getString(1));
            rBean.setOrderNo(rs.getString(2));
            rBean.setCustomerNo(rs.getString(3));
            rBean.setStoreNo(rs.getString(4));
            rBean.setContents(rs.getString(5));
            rBean.setPoints(rs.getString(6));
            rBean.setImage(rs.getString(7));
            rBean.setDate(rs.getTimestamp(8));
            rBean.setComment(rs.getString(9));
            list.add(rBean);
         }
               
      } catch (Exception e) {
         System.out.println("getReview() 내에서 예외 발생 : "+e);
         e.printStackTrace();
      } finally {
         resourceClose();
      }
      
      return list;
   }
   
}