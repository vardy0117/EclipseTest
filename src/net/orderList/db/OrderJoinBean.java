package net.orderList.db;

public class OrderJoinBean {
	
	/********************************************************************/
	//마이페이지에서 주문리스트 확인 전용 조인 bean
	/********************************************************************/
	String orderNo;
	String customerNo;
	String storeNo;
	String name; // 메뉴 이름
	String price;
	String storeName; 
	
	
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getCustomerNo() {
		return customerNo;
	}
	public void setCustomerNo(String customerNo) {
		this.customerNo = customerNo;
	}
	public String getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(String storeNo) {
		this.storeNo = storeNo;
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
		return "OrderJoinBean [orderNo=" + orderNo + ", customerNo=" + customerNo + ", storeNo=" + storeNo + ", name="
				+ name + ", price=" + price + ", storeName=" + storeName + "]";
	}


}
