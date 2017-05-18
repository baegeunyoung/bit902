package kr.co.smartpayapp.home.service;

import java.util.List;

import kr.co.smartpayapp.repository.vo.EventVO;
import kr.co.smartpayapp.repository.vo.HomeEventInfoVO;
import kr.co.smartpayapp.repository.vo.OrderHistoryVO;
import kr.co.smartpayapp.repository.vo.StoreVO;

public interface HomeService {
	
	public EventVO readEvent(int sellerNo);
	
	public void insertEvent(EventVO event);
	
	public void eventDelete(int sellerNo);
	
	public void eventModify(EventVO event);
	
	public List<HomeEventInfoVO> retrieveHomeInfo();
	
	public List<StoreVO> retrieveHomeSearch(String search);
	
	public List<OrderHistoryVO> retrieveOrderHistory(String userName);
}
