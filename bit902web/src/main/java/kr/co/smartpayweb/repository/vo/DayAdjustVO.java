package kr.co.smartpayweb.repository.vo;

import java.util.Date;

public class DayAdjustVO {
	private int dayAdjustNo;
	private int dayTotalNumber;
	private int dayTotalSales;
	private Date dayAdjustDate;
	private int storeNo;
	private String storeName;
	private int menuNo;
	private String menuName;
	public int getDayAdjustNo() {
		return dayAdjustNo;
	}
	public void setDayAdjustNo(int dayAdjustNo) {
		this.dayAdjustNo = dayAdjustNo;
	}
	public int getDayTotalNumber() {
		return dayTotalNumber;
	}
	public void setDayTotalNumber(int dayTotalNumber) {
		this.dayTotalNumber = dayTotalNumber;
	}
	public int getDayTotalSales() {
		return dayTotalSales;
	}
	public void setDayTotalSales(int dayTotalSales) {
		this.dayTotalSales = dayTotalSales;
	}
	public Date getDayAdjustDate() {
		return dayAdjustDate;
	}
	public void setDayAdjustDate(Date dayAdjustDate) {
		this.dayAdjustDate = dayAdjustDate;
	}
	public int getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public int getMenuNo() {
		return menuNo;
	}
	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
}
