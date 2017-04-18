package kr.co.smartpayapp.stamp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.smartpayapp.repository.vo.BuyerStampVO;
import kr.co.smartpayapp.stamp.service.StampService;

@RestController
@RequestMapping("/stamp")
public class StampController {
	
	@Autowired
	StampService service;
	
	// allStamp 조회
	@CrossOrigin(origins = "*")
	@RequestMapping(value="/allStamp.do")
	public List<BuyerStampVO> allStamp() throws Exception {
		List<BuyerStampVO> allStamp = service.allStamp();
		return allStamp;
	}
}
