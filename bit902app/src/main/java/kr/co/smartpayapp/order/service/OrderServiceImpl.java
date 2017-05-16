package kr.co.smartpayapp.order.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.smartpayapp.repository.mapper.OrderMapper;

@Service 
public class OrderServiceImpl implements OrderService {
	@Autowired
	OrderMapper mapper;
	
	public void registOrder(ArrayList<HashMap<String,String>> order){
		
		Map<String, Object> myMap = new HashMap<>();
		
		myMap.put("deviceToken", order.get(order.size() - 5).get("token"));
		int sNo = Integer.parseInt(order.get(order.size() - 4).get("sellerNo"));
		myMap.put("sellerNo", sNo);
		myMap.put("tableNo", Integer.parseInt(order.get(order.size() - 3).get("tableNo")));
		myMap.put("orderContent", order.get(order.size() - 2).get("orderContent"));
		myMap.put("userName", order.get(order.size() - 1).get("userName"));
		
		mapper.insertOrder(myMap);
		
		int maxOrderNo = mapper.selectMaxOrderNo();
		
		for (int i = 0 ; i < order.size() - 4; i++) {
			Map<String, Object> menu = new HashMap<>();
			if (Integer.parseInt(order.get(i).get("quantity")) != 0) {
				menu.put("orderNo", maxOrderNo);
				menu.put("quantity", Integer.parseInt(order.get(i).get("quantity")));
				menu.put("menuNo", order.get(i).get("menuNo"));
				mapper.insertOrderMenu(menu);
				menu.put("dayTotalSales", Integer.parseInt(order.get(i).get("quantity")) * Integer.parseInt(order.get(i).get("price")));
				menu.put("menuName", order.get(i).get("name"));
				
				int count = mapper.selectCount(menu);
				if (count == 0) {
					mapper.insertDayAdjust(menu);					
				} else if (count > 0) {
					mapper.updateDayAdjust(menu);
				}
				
				int dateCount = mapper.selectDate(menu);
				if (dateCount == 0) {
					mapper.insertMonthAdjust(menu);
				} else if (dateCount == 1) {
					mapper.updateMonthAdjust(menu);
				}
			}
		}
	}
}
