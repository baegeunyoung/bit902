package kr.co.smartpayweb.repository.mapper;

import java.util.List;

import kr.co.smartpayweb.repository.vo.OrderVO;

public interface OrderMapper {
	// ---- 주문상태 확인 ----
	public List<OrderVO> retrieveOreder(int sellerNo);
}
