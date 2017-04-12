package kr.co.smartpayweb.Adjust.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.smartpayweb.Adjust.service.AdjustService;
import kr.co.smartpayweb.repository.vo.DayAdjustVO;
import kr.co.smartpayweb.repository.vo.MonthAdjustVO;
import kr.co.smartpayweb.repository.vo.SellerVO;

@Controller
@RequestMapping("/adjust")
public class AdjustController {
	@Autowired
	AdjustService adjustService;
	
	// ---- 일일정산 첫화면 ----
	@RequestMapping("/dayAdjust.do")
	public ModelAndView retrieveDayAdjust(HttpSession session) throws ServletException, IOException {
		
		SellerVO seller = (SellerVO)session.getAttribute("seller");
		System.out.println("dd" + seller.getSellerNo());
		
		List<DayAdjustVO> retrieveDayAdjust = adjustService.retrieveDayAdjust();
		System.out.println("콘트롤러 첫화면" + retrieveDayAdjust.size());
		ModelAndView mav = new ModelAndView("adjust/dayAdjust");
		mav.addObject("retrieveDayAdjust", retrieveDayAdjust);
		return mav;
	}
	
	// ---- 일일정산 날짜로 조회 ----
	@RequestMapping("/dayAdjustRe.do")
	@ResponseBody
	public List<DayAdjustVO> retrieveDayAdjustRe(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String dDay = request.getParameter("dDay");
		System.out.println(dDay);
		
		List<DayAdjustVO> retrieveDayAdjust = adjustService.retrieveDayAdjustRe(dDay);
		System.out.println("콘트롤러 달력누르고" + retrieveDayAdjust.size());
		return retrieveDayAdjust;
	}
	
	// ---- 월별정산 첫화면 ----
	@RequestMapping("/monthAdjust.do")
	public ModelAndView retrieveMonthAdjust() throws ServletException, IOException {
		
		List<MonthAdjustVO> retrieveMonthAdjust = adjustService.retrieveMonthAdjust();
		System.out.println("콘트롤러 첫화면 : " + retrieveMonthAdjust.size());
		
		ModelAndView mav = new ModelAndView("adjust/monthAdjust");
		mav.addObject("retrieveMonthAdjust", retrieveMonthAdjust);
		return mav;
	}
	
	// ---- 월별정산 월 선택으로 조회 ----
	@RequestMapping("/monthAdjustRe.do")
	@ResponseBody
	public List<MonthAdjustVO> retrieveMonthAdjustRe(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cYear = request.getParameter("cYear");
		String cMonth = request.getParameter("cMonth");
		System.out.println(cYear);
		System.out.println(cMonth);
		Map<String, String> paramDate = new HashMap<String, String>();
		paramDate.put("cYear", cYear);
		paramDate.put("cMonth", cMonth);
		
		List<MonthAdjustVO> retrieveMonthAdjust = adjustService.retrieveMonthAdjustRe(paramDate);
		System.out.println("콘트롤러 달력누르고 : " + retrieveMonthAdjust.size());
		return retrieveMonthAdjust;
	}
}
