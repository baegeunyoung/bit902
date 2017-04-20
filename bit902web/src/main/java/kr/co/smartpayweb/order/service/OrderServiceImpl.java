package kr.co.smartpayweb.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.smartpayweb.repository.mapper.OrderMapper;
import kr.co.smartpayweb.repository.vo.OrderVO;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderMapper mapper;
	
	// ---- 주문상태 확인 ----
	public List<OrderVO> retrieveOreder(int sellerNo) {
		return mapper.retrieveOreder(sellerNo);
	}
}
