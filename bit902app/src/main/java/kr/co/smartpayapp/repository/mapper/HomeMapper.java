package kr.co.smartpayapp.repository.mapper;

import java.util.List;

import kr.co.smartpayapp.repository.vo.EventVO;
import kr.co.smartpayapp.repository.vo.HomeEventInfoVO;
import kr.co.smartpayapp.repository.vo.OrderHistoryVO;
import kr.co.smartpayapp.repository.vo.StoreVO;

public interface HomeMapper {
	public EventVO readEvent(int sellerNo);
	
	public void insertEvent(EventVO event);
	
	public void eventDelete(int sellerNo);
	
	public void eventModify(EventVO event);
	
	public List<HomeEventInfoVO> selectHomeEventInfo();
	
	public List<StoreVO> selectHomeSearch(String search);
	
	public List<OrderHistoryVO> selectOrderHistory(String userName);
}
