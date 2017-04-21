package kr.co.smartpayweb.event.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.smartpayweb.event.service.EventService;
import kr.co.smartpayweb.repository.vo.EventVO;

@Controller
@RequestMapping("/event")
public class EventController {
	
	@Autowired
	private EventService eventService;
	
	@RequestMapping("/regist.do")
	public void eventInsert(EventVO event) {
		eventService.insertEvent(event);
	}
}
