package kr.co.smartpayapp.stamp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.smartpayapp.repository.vo.BuyerStampVO;
import kr.co.smartpayapp.repository.vo.OnlyMyStampVO;
import kr.co.smartpayapp.stamp.service.StampService;

@RestController
@RequestMapping("/stamp")
@CrossOrigin(origins = "*")
public class StampController {
	
	@Autowired
	StampService service;

	@RequestMapping("/onlyMyStamp.do")
	public List<OnlyMyStampVO> onlyMyStamp(@RequestBody int myNo) throws Exception {
		return service.onlyMyStamp(myNo);
	}
}
