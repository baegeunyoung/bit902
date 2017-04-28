package kr.co.smartpayapp.repository.mapper;

import java.util.Map;

public interface OrderMapper {
	public void insertOrder(Map<String, Object> myMap);
	public int selectMaxOrderNo();
	public void insertOrderMenu(Map<String, Object> menu);
	public int selectCount(Map<String, Object> menu);
	public void insertDayAdjust(Map<String, Object> menu);
	public void updateDayAdjust(Map<String, Object> menu);
	public int selectDate(Map<String, Object> menu);
	public void insertMonthAdjust(Map<String, Object> menu);
	public void updateMonthAdjust(Map<String, Object> menu);	
}
