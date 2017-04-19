package kr.co.smartpayapp.repository.vo;

public class OnlyMyStampVO {
	private String name;
	private int buyerStampNo;
	private int sellerStampNo;
	private int stampCount;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getBuyerStampNo() {
		return buyerStampNo;
	}
	public void setBuyerStampNo(int buyerStampNo) {
		this.buyerStampNo = buyerStampNo;
	}
	public int getSellerStampNo() {
		return sellerStampNo;
	}
	public void setSellerStampNo(int sellerStampNo) {
		this.sellerStampNo = sellerStampNo;
	}
	public int getStampCount() {
		return stampCount;
	}
	public void setStampCount(int stampCount) {
		this.stampCount = stampCount;
	}
}
