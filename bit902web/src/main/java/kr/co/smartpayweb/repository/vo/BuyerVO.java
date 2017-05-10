package kr.co.smartpayweb.repository.vo;

public class BuyerVO {
	private int buyerNo;
	private String id;
	private String password;
	private String name;
	private String cellphoneNumber;
	private String buyerId;
	
	public String getBuyerId() {
		return buyerId;
	}
	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}
	public int getBuyerNo() {
		return buyerNo;
	}
	public void setBuyerNo(int buyerNo) {
		this.buyerNo = buyerNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCellphoneNumber() {
		return cellphoneNumber;
	}
	public void setCellphoneNumber(String cellphoneNumber) {
		this.cellphoneNumber = cellphoneNumber;
	}
		
}
