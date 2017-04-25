package kr.co.smartpayweb.event.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.smartpayweb.repository.mapper.EventMapper;
import kr.co.smartpayweb.repository.vo.EventVO;

@Service
public class EventServiceImpl implements EventService{

	@Autowired
	private EventMapper dao;

	@Override
	public EventVO readEvent(int sellerNo) {
		return dao.readEvent(sellerNo);
	}

	@Override
	public void insertEvent(EventVO event) {
		dao.insertEvent(event);
	}

	@Override
	public void eventDelete(int sellerNo) {
		dao.eventDelete(sellerNo);
		
	}

	@Override
	public void eventModify(EventVO event) {
		dao.eventModify(event);	
	}	
}
