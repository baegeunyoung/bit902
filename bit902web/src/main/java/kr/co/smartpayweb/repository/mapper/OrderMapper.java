package kr.co.smartpayweb.repository.mapper;

import java.util.List;

import kr.co.smartpayweb.repository.vo.OrderMenuVO;
import kr.co.smartpayweb.repository.vo.OrderVO;

public interface OrderMapper {
	// ---- orderList 조회 ----
	public List<OrderVO> retrieveOreder(int sellerNo);
	// ---- orderMenuMap 생성 ----
	public List<OrderMenuVO> RetrieveOrderMenuList(int oNumber);
}
