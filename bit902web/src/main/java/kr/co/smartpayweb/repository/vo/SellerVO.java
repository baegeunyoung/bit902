package kr.co.smartpayweb.repository.vo;

public class SellerVO {

	private int sellerNo;
	private String id;
	private String password;
	private String name;
	private String cellphoneNumber;
	private String permitYn;
	
	public int getSellerNo() {
		return sellerNo;
	}
	public void setSellerNo(int sellerNo) {
		this.sellerNo = sellerNo;
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
	public String getPermitYn() {
		return permitYn;
	}
	public void setPermitYn(String permitYn) {
		this.permitYn = permitYn;
	}
	
}
