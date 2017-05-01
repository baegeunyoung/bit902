package kr.co.smartpayweb.event.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.smartpayweb.event.service.EventService;
import kr.co.smartpayweb.repository.vo.EventVO;
import kr.co.smartpayweb.repository.vo.SellerVO;
import kr.co.smartpayweb.repository.vo.StoreFileVO;

@Controller
@RequestMapping("/event")
public class EventController {
	
	@Autowired
	private EventService eventService;
		
	// 이벤트 등록하기
	@RequestMapping("/regist.do")
	public String eventInsert(MultipartHttpServletRequest mRequest, RedirectAttributes attr, HttpSession session) throws Exception {
		/*
		EventVO event = new EventVO();
		SellerVO seller = (SellerVO)session.getAttribute("seller");
		
				
		event.setSellerNo(seller.getSellerNo());
		event.setEventContent(request.getParameter("content"));
		event.setEventTitle(request.getParameter("title"));
		
		eventService.insertEvent(event);
		RequestDispatcher rd = request.getRequestDispatcher("/view/event/regist.jsp");
		rd.forward(request, response);
		
		*/
		
		
		
		//---------------------------------
		
		Map<String, Object> event = new HashMap<>();
		ServletContext context = mRequest.getServletContext();
		
		String path = context.getRealPath("/upload");
		
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
		String datePath = sdf.format(new Date());
		
		String savePath = path + datePath;
		File f = new File(savePath);
		if (!f.exists()) f.mkdirs();
		
		SellerVO seller = (SellerVO)session.getAttribute("seller");
		int sellerNo = seller.getSellerNo();
		System.out.println("컨트롤러셀러넘버:" + sellerNo);
		// 게시판과 파일 테이블에 저장할 글번호를 조회
		EventVO eventVO = new EventVO();
		
		eventVO.setSellerNo(sellerNo);
		eventVO.setEventContent(mRequest.getParameter("content"));
		eventVO.setEventTitle(mRequest.getParameter("title"));
		event.put("eventVO", eventVO);
				
		
		MultipartFile  file = mRequest.getFile("attachFile");
		String oriName = file.getOriginalFilename();
		if (oriName != null && !oriName.equals("")) {
			// 확장자 처리
			String ext = "";
			// 뒤쪽에 있는 . 의 위치 
			int index = oriName.lastIndexOf(".");
			if (index != -1) {
				// 파일명에서 확장자명(.포함)을 추출
				ext = oriName.substring(index);
			}
			
			// 파일 사이즈
			long fileSize = file.getSize();
			System.out.println("파일 사이즈 : " + fileSize);
			
			// 고유한 파일명 만들기	
			String systemName = "event-" + UUID.randomUUID().toString() + ext;
			System.out.println("저장할 파일명 : " + systemName);
		
			// 임시저장된 파일을 원하는 경로에 저장
			file.transferTo(new File(savePath + "/" + systemName));
			StoreFileVO fileVO = new StoreFileVO();
			fileVO.setOriName(oriName);
			fileVO.setSystemName(systemName);
			fileVO.setFilePath(datePath);
			fileVO.setFileSize(fileSize);
			fileVO.setSellerNo(sellerNo);
			event.put("fileVO", fileVO);
			
		}
		if(eventService.insertEvent(event)) {
			attr.addFlashAttribute("msg", "게시물이 등록되었습니다");
		}
		else {
			attr.addFlashAttribute("msg", "등록실패! 다시 시도해 주세요.");
		}
		
		return "/menu/list";
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
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/event/regist.jsp");
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
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/event/regist.jsp");
		rd.forward(request, response);
	}
}
