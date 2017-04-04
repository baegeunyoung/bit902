package kr.co.smartpayweb.Adjust.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.smartpayweb.Adjust.service.AdjustService;
import kr.co.smartpayweb.repository.vo.dayAdjustVO;

@Controller
@RequestMapping("/adjust")
public class AdjustController {
	@Autowired
	AdjustService adjustService;
	
	@RequestMapping("/dayAdjust.do")
	public List<dayAdjustVO> retrieveDayAdjust() throws ServletException, IOException {
		
		List<dayAdjustVO> retrieveDayAdjust = adjustService.retrieveDayAdjust();
		return retrieveDayAdjust;
	}
	
}
