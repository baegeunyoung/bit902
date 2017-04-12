package kr.co.smartpayweb.repository.vo;

import java.util.Date;

public class MonthAdjustVO {
	private int monthAdjustNo;
	private int monthTotalSales;
	private Date monthAdjustDate;
	private int storeNo;
	public int getMonthAdjustNo() {
		return monthAdjustNo;
	}
	public void setMonthAdjustNo(int monthAdjustNo) {
		this.monthAdjustNo = monthAdjustNo;
	}
	public int getMonthTotalSales() {
		return monthTotalSales;
	}
	public void setMonthTotalSales(int monthTotalSales) {
		this.monthTotalSales = monthTotalSales;
	}
	public Date getMonthAdjustDate() {
		return monthAdjustDate;
	}
	public void setMonthAdjustDate(Date monthAdjustDate) {
		this.monthAdjustDate = monthAdjustDate;
	}
	public int getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}
}
