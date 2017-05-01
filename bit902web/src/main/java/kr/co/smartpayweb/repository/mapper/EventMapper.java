package kr.co.smartpayweb.repository.mapper;

import kr.co.smartpayweb.repository.vo.EventVO;
import kr.co.smartpayweb.repository.vo.StoreFileVO;

public interface EventMapper {
	public EventVO readEvent(int sellerNo);
	
	public void insertEvent(EventVO event);
	
	public void eventDelete(int sellerNo);
	
	public void eventModify(EventVO event);

	//public int selectEventNO(int sellerNo);
	
	public int insertEventFileInfo(StoreFileVO fileVO);
}
