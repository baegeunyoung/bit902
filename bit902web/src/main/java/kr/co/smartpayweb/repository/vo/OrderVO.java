package kr.co.smartpayweb.repository.vo;

import java.util.Date;

public class OrderVO {
	private int orderNo;
	private int storeNo;
	private int menuNo;
	private Date orderDate;
	private int beaconNo;
	private String content;
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}
	public int getMenuNo() {
		return menuNo;
	}
	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}
	public Date getDate() {
		return orderDate;
	}
	public void setDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public int getBeaconNo() {
		return beaconNo;
	}
	public void setBeaconNo(int beaconNo) {
		this.beaconNo = beaconNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
