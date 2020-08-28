
package net.menu.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MenuDAO {
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
			System.out.println("resourceClose Error! : " + e);
		}
	} // resourceClose()

	public List<MenuBean> getStoreMenu(int storeNo) {
		
		List<MenuBean> menuList = new ArrayList<MenuBean>();
		
		try {
			 con = getConnection();
			 
			 sql = "select * from menu where storeNo=?";
			 
			 pstmt = con.prepareStatement(sql);
			 
			 pstmt.setInt(1, storeNo);
			 
			 rs = pstmt.executeQuery();
			 
			 while(rs.next()){
				 MenuBean mBean = new MenuBean();
					 mBean.setStoreNo(rs.getString("storeNo"));
					 mBean.setName(rs.getString("name"));
					 mBean.setPrice(rs.getInt("price"));
					 mBean.setImage(rs.getString("image"));
					 mBean.setCategory(rs.getString("category"));
					 mBean.setMenuNo(rs.getString("menuNo"));
					 menuList.add(mBean);
			 }
			
		} catch (Exception e) {
			System.out.println("getStoreMenu Inner Error : "+e);
		} finally {
			resourceClose();
		}
		
		return menuList;
	}

	public List<String> getMenuCategory(int storeNo) {
		List<String> categoryList = new ArrayList<String>();
		
		try {
			 con = getConnection();
			 
			 sql = "select distinct category from menu where storeNo=?";
			 
			 pstmt = con.prepareStatement(sql);
			 
			 pstmt.setInt(1, storeNo);
			 
			 rs = pstmt.executeQuery();
			 
			 while(rs.next()){
				 categoryList.add(rs.getString("category"));
			 }
			
		} catch (Exception e) {
			System.out.println("getStoreMenu Inner Error : "+e);
		} finally {
			resourceClose();
		}
		
		return categoryList;
	}


	public void insertMenus(List<MenuBean> mList) {
		try {
			 con = getConnection();
			 
			 sql="insert into menu(name, price, image, category, storeNo) values(?, ?, ?, ? ,?)";
			 
			 pstmt = con.prepareStatement(sql);
			 
			 for(MenuBean mbean : mList){
			 
				 pstmt.setString(1,mbean.getName());
				 pstmt.setInt(2,mbean.getPrice());
				 pstmt.setString(3, mbean.getImage());
				 pstmt.setString(4,mbean.getCategory());
				 pstmt.setString(5, mbean.getStoreNo());
				
				 pstmt.executeUpdate();
			 } 
			
		} catch (Exception e){
			System.out.println("menu insert inner Error : " + e);
		} finally {
			resourceClose();
		}
		
	}

	
	public MenuBean getMenu(int menuNo) {
		MenuBean mBean = new MenuBean();
		
		try {
			 con = getConnection();
			 
			 sql = "select * from menu where menuNo=?";
			 
			 pstmt = con.prepareStatement(sql);
			 
			 pstmt.setInt(1, menuNo);
			 
			 rs = pstmt.executeQuery();
			 
			 if(rs.next()){
				 mBean.setStoreNo(rs.getString("storeNo"));
				 mBean.setName(rs.getString("name"));
				 mBean.setPrice(rs.getInt("price"));
				 mBean.setImage(rs.getString("image"));
				 mBean.setCategory(rs.getString("category"));
				 mBean.setMenuNo(rs.getString("menuNo"));
			 }
			
		} catch (Exception e) {
			System.out.println("getMenu Inner Error : "+e);
		} finally {
			resourceClose();
		}
		
		return mBean;
	}
	
	
	
	
}

