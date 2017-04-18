package kr.co.smartpayapp.repository.vo;

public class BuyerStampVO {
	private int buyerStampNo;
	private int buyerNo;
	private int stampCount;
	private int sellerStampNo;
	public int getBuyerStampNo() {
		return buyerStampNo;
	}
	public void setBuyerStampNo(int buyerStampNo) {
		this.buyerStampNo = buyerStampNo;
	}
	public int getBuyerNo() {
		return buyerNo;
	}
	public void setBuyerNo(int buyerNo) {
		this.buyerNo = buyerNo;
	}
	public int getStampCount() {
		return stampCount;
	}
	public void setStampCount(int stampCount) {
		this.stampCount = stampCount;
	}
	public int getSellerStampNo() {
		return sellerStampNo;
	}
	public void setSellerStampNo(int sellerStampNo) {
		this.sellerStampNo = sellerStampNo;
	}
}
