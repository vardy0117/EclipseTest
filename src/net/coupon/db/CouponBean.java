package net.coupon.db;

import java.sql.Timestamp;

public class CouponBean {
	private String couponNo;
	private String CustomerNo;
	private String name;
	private int discount;
	private Timestamp expDate;
	
	
	
	public String getCouponNo() {
		return couponNo;
	}
	public void setCouponNo(String couponNo) {
		this.couponNo = couponNo;
	}
	public String getCustomerNo() {
		return CustomerNo;
	}
	public void setCustomerNo(String customerNo) {
		CustomerNo = customerNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public Timestamp getExpDate() {
		return expDate;
	}
	public void setExpDate(Timestamp expDate) {
		this.expDate = expDate;
	}
	
	
}
