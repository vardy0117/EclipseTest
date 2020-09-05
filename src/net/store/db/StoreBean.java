package net.store.db;

public class StoreBean {

	private String storeNo;
	private String ceoNo;
	private String name;
	private String roadAddress;
	private String detailAddress;
	private String category;
	private String phone;
	private String storeHours;
	private String message;
	private String image;
	private String points;
	private String orderCount;  
	private String deliveryArea;
	private String regNo;
	private String sido;
	
	
	public String getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(String storeNo) {
		this.storeNo = storeNo;
	}
	public String getCeoNo() {
		return ceoNo;
	}
	public void setCeoNo(String ceoNo) {
		this.ceoNo = ceoNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getStoreHours() {
		return storeHours;
	}
	public void setStoreHours(String storeHours) {
		this.storeHours = storeHours;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getPoints() {
		return points;
	}
	public void setPoints(String points) {
		this.points = points;
	}
	public String getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(String orderCount) {
		this.orderCount = orderCount;
	}
	public String getDeliveryArea() {
		return deliveryArea;
	}
	public void setDeliveryArea(String deliveryArea) {
		this.deliveryArea = deliveryArea;
	}
	public String getRegNo() {
		return regNo;
	}
    public void setRegNo(String regNo) {

    this.regNo = regNo;

}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	@Override
	public String toString() {
		return "StoreBean [storeNo=" + storeNo + ", ceoNo=" + ceoNo + ", name=" + name + ", roadAddress=" + roadAddress
				+ ", detailAddress=" + detailAddress + ", category=" + category + ", phone=" + phone + ", storeHours="
				+ storeHours + ", message=" + message + ", image=" + image + ", points=" + points + ", orderCount="
				+ orderCount + ", deliveryArea=" + deliveryArea + ", regNo=" + regNo + ", sido=" + sido + "]";
	}

	
	
	
	
}
