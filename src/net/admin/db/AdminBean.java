package net.admin.db;

public class AdminBean {

	private int adminNo;
	private String adminPassword;
	private String adminLevel;
	
	public int getAdminNo() {
		return adminNo;
	}
	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}
	public String getAdminPassword() {
		return adminPassword;
	}
	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}
	public String getAdminLevel() {
		return adminLevel;
	}
	public void setAdminLevel(String adminLevel) {
		this.adminLevel = adminLevel;
	}
	@Override
	public String toString() {
		return "daminBean [adminNo=" + adminNo + ", adminPassword=" + adminPassword + ", adminLevel=" + adminLevel
				+ "]";
	}
	
	
	
}
