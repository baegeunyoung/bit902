package kr.co.smartpayweb.order.service;

import java.util.List;

import kr.co.smartpayweb.repository.vo.OrderMenuVO;
import kr.co.smartpayweb.repository.vo.OrderVO;

public interface OrderService {
	// ---- orderList 조회 ----
	public List<OrderVO> retrieveOreder(int sellerNo);
	// ---- orderMenuMap 생성 ----
	public List<OrderMenuVO> RetrieveOrderMenuList(int oNumber);
}
