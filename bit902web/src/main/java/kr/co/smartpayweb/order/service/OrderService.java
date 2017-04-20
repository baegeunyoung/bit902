package kr.co.smartpayweb.order.service;

import java.util.List;

import kr.co.smartpayweb.repository.vo.OrderVO;

public interface OrderService {
	// ---- 주문상태 확인 ----
	public List<OrderVO> retrieveOreder(int sellerNo);
}
