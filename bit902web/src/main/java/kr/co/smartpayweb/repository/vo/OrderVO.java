package kr.co.smartpayweb.repository.vo;

import java.util.Date;
import java.util.List;

public class OrderVO {
	private int orderNo;
	private int sellerNo;
	private int tableNo;
	private Date orderDate;
	private String orderContent;
	private String deviceToken;
	private String orderState;
	private List<OrderMenuVO> orderMenuList;
	
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getSellerNo() {
		return sellerNo;
	}
	public void setSellerNo(int sellerNo) {
		this.sellerNo = sellerNo;
	}
	public int getTableNo() {
		return tableNo;
	}
	public void setTableNo(int tableNo) {
		this.tableNo = tableNo;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderContent() {
		return orderContent;
	}
	public void setOrderContent(String orderContent) {
		this.orderContent = orderContent;
	}
	public String getDeviceToken() {
		return deviceToken;
	}
	public void setDeviceToken(String deviceToken) {
		this.deviceToken = deviceToken;
	}
	public String getOrderState() {
		return orderState;
	}
	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}
	public List<OrderMenuVO> getOrderMenuList() {
		return orderMenuList;
	}
	public void setOrderMenuList(List<OrderMenuVO> orderMenuList) {
		this.orderMenuList = orderMenuList;
	}
}
