package kr.co.smartpayapp.login.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.smartpayapp.login.service.LoginService;
import kr.co.smartpayapp.repository.vo.BuyerVO;


public class LoginController {
	@Autowired
	LoginService loginService;
	
	@CrossOrigin(origins = "*")
	@RequestMapping("/timeCheck.do")
	public List<BuyerVO> checkBuyer() {
		List<BuyerVO> list = loginService.checkBuyer();
		for(BuyerVO l : list) {
		}
		return list;
	}
	
	@CrossOrigin(origins = "*")
	@RequestMapping("/selectOneBuyer.do")
	public BuyerVO selectOneBuyer(@RequestBody BuyerVO buyerVO) {
		System.out.println(buyerVO.getId());
		BuyerVO buyer = loginService.selectOneBuyer(buyerVO);
		return buyer;
	}
	
	@CrossOrigin(origins = "*")
	@RequestMapping(value = "/regist.do", method = RequestMethod.POST)
	public Map<String,Object> buyerRegist(/*HttpServletRequest request*/@RequestBody BuyerVO buyerVO) {
		Map<String,Object> msg = new HashMap<>();
		if(loginService.registBuyer(buyerVO) == 1 ) {
			msg.put("msg", "등록완료");
		}
		else {
			msg.put("msg", "등록실패");
		}
		return msg;
	}
	
}