package kr.co.smartpayapp.event.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.smartpayapp.repository.mapper.EventMapper;
import kr.co.smartpayapp.repository.vo.EventVO;
import kr.co.smartpayapp.repository.vo.HomeEventInfoVO;

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
	
	public List<HomeEventInfoVO> retrieveHomeInfo() {
		return dao.selectHomeEventInfo();
	}
}
