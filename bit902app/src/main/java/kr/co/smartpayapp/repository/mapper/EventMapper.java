package kr.co.smartpayapp.repository.mapper;

import kr.co.smartpayapp.repository.vo.EventVO;

public interface EventMapper {
	public EventVO readEvent(int sellerNo);
	
	public void insertEvent(EventVO event);
	
	public void eventDelete(int sellerNo);
	
	public void eventModify(EventVO event);
}
