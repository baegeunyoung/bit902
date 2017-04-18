package kr.co.smartpayapp.repository.vo;

public class SellerStampVO {
	private int sellerStampNo;
	private int maxStampSize;
	private int storeNo;
	private String stampSavingOption;
	public int getSellerStampNo() {
		return sellerStampNo;
	}
	public void setSellerStampNo(int sellerStampNo) {
		this.sellerStampNo = sellerStampNo;
	}
	public int getMaxStampSize() {
		return maxStampSize;
	}
	public void setMaxStampSize(int maxStampSize) {
		this.maxStampSize = maxStampSize;
	}
	public int getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}
	public String getStampSavingOption() {
		return stampSavingOption;
	}
	public void setStampSavingOption(String stampSavingOption) {
		this.stampSavingOption = stampSavingOption;
	}
}
