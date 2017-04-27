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
		
		System.out.println("주문 임플");
		
		Map<String, Object> myMap = new HashMap<>();
		
		myMap.put("deviceToken", order.get(order.size() - 3).get("token"));
		myMap.put("sellerNo", Integer.parseInt(order.get(order.size() - 2).get("sellerNo")));
		myMap.put("tableNo", Integer.parseInt(order.get(order.size() - 1).get("tableNo")));
		
		mapper.insertOrder(myMap);
		
		int maxOrderNo = mapper.selectMaxOrderNo();
		System.out.println(maxOrderNo);
		
		for (int i = 0 ; i < order.size() - 3; i++) {
			Map<String, Object> menu = new HashMap<>();
			menu.put("orderNo", maxOrderNo);
			menu.put("quantity", order.get(i).get("quantity"));
			menu.put("menuNo", order.get(i).get("menuNo"));
			mapper.insertOrderMenu(menu);
		}
	}
}
