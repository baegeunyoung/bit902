package kr.co.smartpayapp.repository.vo;

public class EventVO {

	private int eventNo;
	private String eventContent;
	private int sellerNo;
	private String token;
	
	public int getEventNo() {
		return eventNo;
	}
	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}
	public String getEventContent() {
		return eventContent;
	}
	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}
	public int getSellerNo() {
		return sellerNo;
	}
	public void setSellerNo(int storeNo) {
		this.sellerNo = storeNo;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	
	
	
	
}
