package kr.co.smartpayapp.repository.mapper;

import java.util.List;

import kr.co.smartpayapp.repository.vo.EventVO;
import kr.co.smartpayapp.repository.vo.HomeEventInfoVO;

public interface EventMapper {
	public EventVO readEvent(int sellerNo);
	
	public void insertEvent(EventVO event);
	
	public void eventDelete(int sellerNo);
	
	public void eventModify(EventVO event);
	
	public List<HomeEventInfoVO> selectHomeEventInfo();
}
