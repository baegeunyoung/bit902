package kr.co.smartpayweb.event.service;

import java.util.Map;

import kr.co.smartpayweb.repository.vo.EventVO;

public interface EventService {
	
	public EventVO readEvent(int sellerNo);
	
	public boolean insertEvent(Map<String, Object> event);
	
	public void eventDelete(int sellerNo);
	
	public void eventModify(EventVO event);
}
