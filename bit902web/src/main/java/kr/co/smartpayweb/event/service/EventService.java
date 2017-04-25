package kr.co.smartpayweb.event.service;

import kr.co.smartpayweb.repository.vo.EventVO;

public interface EventService {
	
	public EventVO readEvent(int sellerNo);
	
	public void insertEvent(EventVO event);
	
	public void eventDelete(int sellerNo);
	
	public void eventModify(EventVO event);
}
