package kr.co.smartpayweb.event.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.smartpayweb.event.service.EventService;
import kr.co.smartpayweb.repository.vo.EventVO;
import kr.co.smartpayweb.repository.vo.SellerVO;

@Controller
@RequestMapping("/event")
public class EventController {
	
	@Autowired
	private EventService eventService;
		
	// 이벤트 등록하기
	@RequestMapping("/regist.do")
	public void eventInsert(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		EventVO event = new EventVO();
		SellerVO seller = (SellerVO)session.getAttribute("seller");
				
		event.setSellerNo(seller.getSellerNo());
		event.setEventContent(request.getParameter("content"));
		
		eventService.insertEvent(event);
		RequestDispatcher rd = request.getRequestDispatcher("/event/read.do");
		rd.forward(request, response);
		
	}
	
	// 이벤트 읽기
	@RequestMapping("/read.do")
	public void eventRead(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		SellerVO seller = (SellerVO)session.getAttribute("seller");
		int sellerNo = seller.getSellerNo();
		EventVO event = eventService.readEvent(sellerNo);
		
		request.setAttribute("event", event);
		RequestDispatcher rd = request.getRequestDispatcher("/view/event/registForm.jsp");
		rd.forward(request, response);
	}
	
	// 이벤트 삭제하기
	@RequestMapping("/delete.do")
	public void eventDelete(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		SellerVO seller = (SellerVO)session.getAttribute("seller");
		int sellerNo = seller.getSellerNo();
		eventService.eventDelete(sellerNo);
		
		RequestDispatcher rd = request.getRequestDispatcher("/event/read.do");
		rd.forward(request, response);
	}
	
	// 이벤트 수정하기
	@RequestMapping("/modify.do")
	public void eventModify(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		EventVO event = new EventVO();
		SellerVO seller = (SellerVO)session.getAttribute("seller");
		int sellerNo = seller.getSellerNo();
		event.setSellerNo(sellerNo);
		event.setEventContent(request.getParameter("content"));
		eventService.eventModify(event);
		
		RequestDispatcher rd = request.getRequestDispatcher("/event/read.do");
		rd.forward(request, response);
	}
}
