package kr.co.smartpayweb.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.smartpayweb.repository.mapper.OrderMapper;
import kr.co.smartpayweb.repository.vo.OrderMenuVO;
import kr.co.smartpayweb.repository.vo.OrderVO;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderMapper mapper;
	
	// ---- orderList 조회 ----
	public List<OrderVO> retrieveOreder(int sellerNo) {
		return mapper.retrieveOreder(sellerNo);
	}
	
	// ---- orderMenuMap 생성 ----
	public List<OrderMenuVO> RetrieveOrderMenuList(int oNumber) {
		return mapper.RetrieveOrderMenuList(oNumber);
	}
	
	// ---- 접수 확인 ----
	public void receiveOrder(int receiveNo) {
		mapper.receiveOrder(receiveNo);
	}
	
	// ---- 조리 완료 ----
	public void completeOrder(int completeNo) {
		mapper.completeOrder(completeNo);
	}
}
