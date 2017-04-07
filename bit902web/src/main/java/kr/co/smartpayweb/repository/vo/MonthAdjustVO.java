package kr.co.smartpayweb.repository.vo;

import java.util.Date;

public class MonthAdjustVO {
	private int adjustMonthNo;
	private int totalMonthSales;
	private Date adjustMonthDate;
	private int storeNo;
	
	public int getAdjustMonthNo() {
		return adjustMonthNo;
	}
	public void setAdjustMonthNo(int adjustMonthNo) {
		this.adjustMonthNo = adjustMonthNo;
	}
	public int getTotalMonthSales() {
		return totalMonthSales;
	}
	public void setTotalMonthSales(int totalMonthSales) {
		this.totalMonthSales = totalMonthSales;
	}
	public Date getAdjustMonthDate() {
		return adjustMonthDate;
	}
	public void setAdjustMonthDate(Date adjustMonthDate) {
		this.adjustMonthDate = adjustMonthDate;
	}
	public int getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}
}
