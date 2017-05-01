package kr.co.smartpayweb.event.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.smartpayweb.repository.mapper.EventMapper;
import kr.co.smartpayweb.repository.vo.EventVO;
import kr.co.smartpayweb.repository.vo.StoreFileVO;

@Service
public class EventServiceImpl implements EventService{

	@Autowired
	private EventMapper dao;

	@Override
	public EventVO readEvent(int sellerNo) {
		return dao.readEvent(sellerNo);
	}

	@Override
	public boolean insertEvent(Map<String, Object> event) {
		EventVO eventVO = (EventVO)event.get("eventVO");
		dao.insertEvent(eventVO);
		StoreFileVO fileVO = (StoreFileVO)event.get("fileVO");
		fileVO.setEventNo(eventVO.getEventNo());
		int result = dao.insertEventFileInfo(fileVO);
		if (result != 0) {
			return true;
		}
		return false;
	}

	@Override
	public void eventDelete(int sellerNo) {
		int eventNo = dao.selectEventNO(sellerNo);
		dao.eventFileInfoDelete(eventNo);
		dao.eventDelete(sellerNo);
		
	}

	@Override
	public void eventModify(EventVO event) {
		dao.eventModify(event);	
	}	
}
