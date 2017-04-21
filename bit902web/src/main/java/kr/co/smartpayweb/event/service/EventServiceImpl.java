package kr.co.smartpayweb.event.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.smartpayweb.repository.mapper.EventMapper;
import kr.co.smartpayweb.repository.vo.EventVO;

@Service
public class EventServiceImpl implements EventService{

	@Autowired
	private EventMapper dao;
	
	public void insertEvent(EventVO event) {
		dao.insertEvent(event);
	}
	
}
