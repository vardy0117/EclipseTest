package net.orderList.db;

public class OrderJoinBean {
	
	/********************************************************************/
	//마이페이지에서 주문리스트 확인 전용 조인 ean
	/********************************************************************/
	String OrderNo;
	String CustomerNo;
	String name;
	String price;
	public String getOrderNo() {
		return OrderNo;
	}
	public void setOrderNo(String orderNo) {
		OrderNo = orderNo;
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
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "OrderJoinBean [OrderNo=" + OrderNo + ", CustomerNo=" + CustomerNo + ", name=" + name + ", price="
				+ price + "]";
	}
	
}
