package kr.co.smartpayweb.dayAdjust.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.smartpayweb.dayAdjust.service.AdjustService;

@Controller
@RequestMapping("/adjust")
public class AdjustController {
	@Autowired
	AdjustService adjustService;
	
	@RequestMapping("/dayAdjust.do")
	public void retrieveDayAdjust(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		
	}
	
}
