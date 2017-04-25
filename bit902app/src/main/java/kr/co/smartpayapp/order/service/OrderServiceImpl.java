package kr.co.smartpayapp.order.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.smartpayapp.repository.mapper.OrderMapper;
import kr.co.smartpayapp.repository.vo.OrderVO;

@Service 
public class OrderServiceImpl implements OrderService {
	@Autowired
	OrderMapper mapper;
	
	public int registOrder(OrderVO orderVO){
		return mapper.insertOrder(orderVO);
	}
}
