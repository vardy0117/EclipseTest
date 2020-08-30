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
   
//   public ArrayList<ReviewBean> getReview(String storeNo){
//	      ArrayList<ReviewBean> list = new ArrayList<ReviewBean>();
//	      ReviewBean rBean;
//	      
//	      try {
//	         con = getConnection();
//	         sql = "select * from review where storeNo=? order by date desc limit 0,2";
//	         pstmt=con.prepareStatement(sql);
//	         pstmt.setString(1, storeNo);
//	         rs = pstmt.executeQuery();
//	         while(rs.next()){
//	        	rBean = new ReviewBean();
//	            rBean.setReviewNo(rs.getString(1));
//	            rBean.setOrderNo(rs.getString(2));
//	            rBean.setCustomerNo(rs.getString(3));
//	            rBean.setStoreNo(rs.getString(4));
//	            rBean.setContents(rs.getString(5));
//	            rBean.setPoints(rs.getString(6));
//	            rBean.setImage(rs.getString(7));
//	            rBean.setDate(rs.getTimestamp(8));
//	            rBean.setComment(rs.getString(9));
//	            list.add(rBean);
//	         }
//	               
//	      } catch (Exception e) {
//	         System.out.println("getReview() 내에서 예외 발생 : "+e);
//	         e.printStackTrace();
//	      } finally {
//	         resourceClose();
//	      }
//	      
//	      return list;
//	   }
   
   
   
   public ReviewBean AvgReview (int storeNo) { // 업체에 대한 별점 평균 
	   ReviewBean review = new ReviewBean();
	  
	   
	      try {
	         con = getConnection();
	         sql = "select TRUNCATE(avg(points),0) as points from review  where StoreNo = ?";
	         /*반올림 없애기 0자리수 까지*/ ;
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, storeNo);
	         rs = pstmt.executeQuery();
	         System.out.println("들어간 스토어 번호값 : " + storeNo);
	
	       
	         if(rs.next()) {
	  
	        	  String point= rs.getString("points");
	        	  review.setPoints(rs.getString("points"));
		         System.out.println(storeNo + "번 사업장에서 받은 리뷰 평균 : " + review.getPoints());
		       
	        	  System.out.println(storeNo + "번 avgReview함수 호출 : " + review.getPoints());
	        	 System.out.println("리뷰 포인트 값 " + point);
	        	 
	         }else{
	        	  System.out.println("avgReview함수 호출할게 음서용 : " + review.getPoints());
	         }
	         
	      } catch (Exception e) {
	          System.out.println("AvgReview() 내에서 예외 발생 : " + e);
	          e.printStackTrace();
	       } finally {
	          resourceClose();
	       }
	return review;
	   
   }
   
}