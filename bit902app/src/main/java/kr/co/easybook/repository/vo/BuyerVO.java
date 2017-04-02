package kr.co.easybook.repository.vo;

public class BuyerVO {
	private int buyerNo;
	private String id;
	private String password;
	private String name;
	private String phoneNumber;
	private String addrCity;
	private String addrGu;
	private String addrDong;
	private String addrHouseNumber;
	private int totalPoint;
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
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getAddrCity() {
		return addrCity;
	}
	public void setAddrCity(String addrCity) {
		this.addrCity = addrCity;
	}
	public String getAddrGu() {
		return addrGu;
	}
	public void setAddrGu(String addrGu) {
		this.addrGu = addrGu;
	}
	public String getAddrDong() {
		return addrDong;
	}
	public void setAddrDong(String addrDong) {
		this.addrDong = addrDong;
	}
	public String getAddrHouseNumber() {
		return addrHouseNumber;
	}
	public void setAddrHouseNumber(String addrHouseNumber) {
		this.addrHouseNumber = addrHouseNumber;
	}
	public int getTotalPoint() {
		return totalPoint;
	}
	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
	}
	
}
