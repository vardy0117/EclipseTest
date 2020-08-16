package net.customer.db;

import java.sql.Timestamp;

public class CustomerBean {
	//ÀÚ¹Ùºó 
	private String customerNo;
	private String email;
	private String password;
	private String nickname;
	private Timestamp date;
	private String address;
	private String bname;
	private String phone;
	private String grad;
	private String agreeAD;
	
	public String getCustomerNo() {
		return customerNo;
	}
	public void setCustomerNo(String customerNo) {
		this.customerNo = customerNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getGrad() {
		return grad;
	}
	public void setGrad(String grad) {
		this.grad = grad;
	}
	public String getAgreeAD() {
		return agreeAD;
	}
	public void setAgreeAD(String agreeAD) {
		this.agreeAD = agreeAD;
	}

	
}
