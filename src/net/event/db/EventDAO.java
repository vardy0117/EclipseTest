package net.event.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class EventDAO {
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
			System.out.println("EventDAO 클래스 자원해제 에러 : " + e);
		}
	} // resourceClose()
	
	public int giveEventTicketAfterLogin(int customerNo) {
		int result = 0;
		try {
			con = getConnection();
			System.out.println("오늘 이전자 쿠폰 삭제");
			sql = "delete from roulette where customerNo = ? and date < curdate();";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, customerNo);
			pstmt.executeUpdate();
			
			sql = "select * from roulette where customerNo = ? and date = curdate()";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, customerNo);
			rs = pstmt.executeQuery();
			if(!rs.next()){
				System.out.println(customerNo + "번 회원 오늘자 쿠폰 지급한적 없음 지급 요청");
				sql = "insert into roulette (customerNo, date) values (?, curdate())";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, customerNo);
				result = pstmt.executeUpdate();
				if(result == 1) System.out.println(customerNo + "번 회원 응모권 지급 성공");
			}
		} catch (Exception e) {
			System.out.println("EventDAO내 giveEventTicketAfterLogin 메소드 에러 : " + e);
		} finally {
			resourceClose();
		}
		return result;
	}
	
	public boolean getTicket(int customerNo) {
		boolean result = false;
		
		try {
			con = getConnection();
			sql = "select * from roulette where customerNo = ? and used = 'F'";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, customerNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = true;
			}
		} catch (Exception e) {
			System.out.println("EventDAO내 getTicket 메소드 에러 : " + e);
		} finally {
			resourceClose();
		}
		
		return result;
	}

	public boolean hasUsableTicket(int customerNo) {
		boolean result = false;
		try {
			con = getConnection();
			sql = "select * from roulette where customerNo = ? and used = 'F'";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, customerNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) result = true;
		} catch (Exception e) {
			System.out.println("EventDAO내 hasUsableTicket 메소드 에러 : " + e);
		} finally {
			resourceClose();
		}
		
		return result;
	}
	
	public int useTicket(int customerNo) {
		int result = 0;
		
		try {
			con = getConnection();
			sql = "update roulette set used = 'T' where customerNo = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, customerNo);
			
			if(pstmt.executeUpdate() == 1){
				//꽝(25%) -> 4 
				//5%(25%) -> 5
				//10%(20%) -> 1
				//20%(15%) -> 3
				//30%(10%) -> 2
				//50%(5%) -> 6
				Random random = new Random();
				int randNum = random.nextInt(100) + 1;
				if(randNum <= 25) {
					result = 4;
				} else if(randNum <= 50) {
					result = 5;
				} else if(randNum <= 70) {
					result = 1;
				} else if(randNum <= 85) {
					result = 3;
				} else if(randNum <= 95) {
					result = 2;
				} else if(randNum <= 100) {
					result = 6;
				}
			} else {
				result = -1;
			}
			
		} catch (Exception e) {
			System.out.println("EventDAO내 useTicket 메소드 에러 : " + e);
		} finally {
			resourceClose();
		}
		
		return result;
	}
}
