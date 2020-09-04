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
	String storeName; // alias해서 나오는 컬럼
	String ea, menu;
	String roadAddress; // 앞에 도로명 
	String detailAddress; // 상세주소
	String request; // 요청 사항
	
	
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public String getEa() {
		return ea;
	}
	public void setEa(String ea) {
		this.ea = ea;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
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
	public String getRoadAddress() {
		return roadAddress;
	}
	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	@Override
	public String toString() {
		return "OrderJoinBean [orderNo=" + orderNo + ", customerNo=" + customerNo + ", storeNo=" + storeNo + ", name="
				+ name + ", price=" + price + ", storeName=" + storeName + ", ea=" + ea + ", menu=" + menu
				+ ", roadAddress=" + roadAddress + ", detailAddress=" + detailAddress + ", request=" + request + "]";
	}
	




}
