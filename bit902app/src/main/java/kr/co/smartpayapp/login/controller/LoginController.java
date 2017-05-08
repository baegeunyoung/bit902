package kr.co.smartpayapp.login.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.smartpayapp.login.service.LoginService;
import kr.co.smartpayapp.repository.vo.BuyerVO;

@RestController
@RequestMapping("/payment")
@CrossOrigin(origins = "*")
public class LoginController {
	@Autowired
	LoginService loginService;
	
	@RequestMapping("/buyerCheck.do")
	public List<BuyerVO> bookTimeCheck() {
		List<BuyerVO> list = loginService.checkBuyer();
		for(BuyerVO l : list) {
		}
		return list;
	}
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
