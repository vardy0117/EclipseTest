package net.review.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

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
   
   // **************모든 리뷰 리스트를 가져오는 쿼리문**************
   public ArrayList<ReviewBean> getReview(int storeNo){
      ArrayList<ReviewBean> list = new ArrayList<ReviewBean>();
      ReviewBean rBean;
      
      try {
         con = getConnection();
         sql = "select * from review where storeNo=? order by date desc limit 0,2";
         pstmt=con.prepareStatement(sql);
         pstmt.setInt(1, storeNo);
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
   
   
   
   // storeNo에 해당하는 모든 리뷰 정보를 가져오는 메소드
   public ArrayList<ReviewBean> getStoreReview(int storeNo,int pageNum){
	      ArrayList<ReviewBean> list = new ArrayList<ReviewBean>();
	      ReviewBean rBean;
	      
	      try {
	         con = getConnection();
	         sql = "select * from review where storeNo=? order by date desc limit ?,6";
	         pstmt=con.prepareStatement(sql);
	         pstmt.setInt(1, storeNo);
	         pstmt.setInt(2, (pageNum-1)*6);
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
	         System.out.println("getStoreReview() 내에서 예외 발생 : "+e);
	         e.printStackTrace();
	      } finally {
	         resourceClose();
	      }
	      
	      return list;
	   }
   
   
   public int getStoreReviewCount(int storeNo){
	    int result = 0;  
	   	ReviewBean rBean;
	      
	      try {
	         con = getConnection();
	         sql = "select count(*) from review where storeNo=?";
	         pstmt=con.prepareStatement(sql);
	         pstmt.setInt(1, storeNo);
	         rs = pstmt.executeQuery();
	         while(rs.next()){
	        	 result = rs.getInt(1);
	         }
	               
	      } catch (Exception e) {
	         System.out.println("getStoreReviewCount() 내에서 예외 발생 : "+e);
	         e.printStackTrace();
	      } finally {
	         resourceClose();
	      }
	      
	      return result;
	   }
   
   
   // **************limit으로 2개씩 리뷰 리스트를 가져오는 쿼리문**************

   public JSONArray getReview(int storeNo,int startNum){
	      ArrayList<ReviewBean> list = new ArrayList<ReviewBean>();
	      JSONArray jsonArr = new JSONArray();
	      ReviewBean rBean;
	      JSONObject jsonObj;
	      try {
	         con = getConnection();
	         sql = "select * from review where storeNo=? order by date desc limit ?,2";
	         pstmt=con.prepareStatement(sql);
	         pstmt.setInt(1, storeNo);
	         pstmt.setInt(2, startNum);
	         rs = pstmt.executeQuery();
	         while(rs.next()){
	        	rBean = new ReviewBean();
	        	jsonObj = new JSONObject();
	        	jsonObj.put("reviewNo", rs.getString(1));
	        	jsonObj.put("orderNo", rs.getString(2));
	        	jsonObj.put("customerNo", rs.getString(3));
	        	jsonObj.put("storeNo", rs.getString(4));
	        	jsonObj.put("contents", rs.getString(5));
	        	jsonObj.put("points", rs.getString(6));
	        	jsonObj.put("image", rs.getString(7));
	        	jsonObj.put("date", rs.getTimestamp(8).toString());
	        	jsonObj.put("comment", rs.getString(9));
	        	
	        	
	        	sql="select nickname from customer where customerNo=?";
	        	pstmt=con.prepareStatement(sql);
	        	pstmt.setString(1, rs.getString(3));
	        	ResultSet rs2;
	        	rs2 = pstmt.executeQuery();
	        	if(rs2.next()){
	        		jsonObj.put("nickname", rs2.getString(1));
	        	}
	        	
	        	sql="select name from orderMenu where orderNo=?";
	        	pstmt=con.prepareStatement(sql);
	        	pstmt.setString(1, rs.getString(2));
	        	ResultSet rs3;
	        	String menus="";
	        	rs3 = pstmt.executeQuery();
	        	if(rs3.next()){
					menus+=rs3.getString(1);
				}
				while(rs3.next()){
					menus+="+"+rs3.getString(1);
				}
				jsonObj.put("orderMenu", menus);
	        	
	        	
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
	        	jsonArr.add(jsonObj);
	         }
	               
	      } catch (Exception e) {
	         System.out.println("오버로딩된 getReview() 내에서 예외 발생 : "+e);
	         e.printStackTrace();
	      } finally {
	         resourceClose();
	      }
	      
	      return jsonArr;
	   }
   
   
   
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

	public ArrayList<ReviewBean> getMyReview(String customerNo,int pageNum) {
		
		ArrayList<ReviewBean> reviewList = new ArrayList<ReviewBean>();
		ReviewBean rBean;
		try {
			con = getConnection();
			sql="select * from review where customerNo=? order by date desc limit ?,6";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, customerNo);
			pstmt.setInt(2, (pageNum-1)*6);
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
				reviewList.add(rBean);
			}
					
		} catch (Exception e) {
			System.out.println("getMyReview()내에서 예외 발생");
			e.printStackTrace();
		} finally {
			resourceClose();
		}
		
		return reviewList;
	}

	public int getAllReviewCount(String customerNo) {
		int count = 0;
		try {
			con=getConnection();
			sql = "select count(*) from review where customerNo=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, customerNo);
			rs = pstmt.executeQuery();
			if(rs.next()){
				count=rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getAllReviewCount() 내에서 예외발생");
			e.printStackTrace();
		} finally {
			resourceClose();
		}
		
		return count;
	}

	// ceoStore.jsp에서 해당 리뷰에 사장님의 댓글을 추가하는 작업
	public int updateCommentByReview(String reviewNo, String comment) {
		int result = 0;
		try {
			con=getConnection();
			sql="update review set comment=? where reviewNo=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, comment);
			pstmt.setString(2, reviewNo);
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("insertCommentByReview() 내에서 예외 발생");
			e.printStackTrace();
		} finally {
			resourceClose();
		}
		
		return result;
		
	}

	public int deleteComment(String reviewNo) {
		int result = 0;
		try {
			con=getConnection();
			sql="update review set comment=null where reviewNo=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, reviewNo);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteComment() 내에서 예외발생 : "+e);
			e.printStackTrace();
		} finally {
			
			resourceClose();
		}
		
		return result;
	}

	// 리뷰 작성하는 메소드 (INSERT)
	public int insertReview(ReviewBean rBean) {
		int result = 0;
		try {
			con = getConnection();
			sql="insert into review(orderNo,customerNo,storeNo,contents,points,image,date) values(?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rBean.getOrderNo());
			pstmt.setString(2, rBean.getCustomerNo());
			pstmt.setString(3, rBean.getStoreNo());
			pstmt.setString(4, rBean.getContents());
			pstmt.setString(5, rBean.getPoints());
			pstmt.setString(6, rBean.getImage());
			result= pstmt.executeUpdate();
			if(result>0){
				sql="update store set reviewCount=reviewCount+1,points=points+? where storeNo=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(rBean.getPoints()));
				pstmt.setString(2, rBean.getStoreNo());
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			System.out.println("insertReview() 내에서 예외 발생  :");
			e.printStackTrace();
		} finally {
			resourceClose();
		}
		
		
		
		return result;
	}
	
	
	
	
	
	   
}