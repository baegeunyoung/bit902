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
@RequestMapping("/login")
@CrossOrigin(origins = "*")
public class LoginController {
	@Autowired
	private LoginService service;
	
	@CrossOrigin(origins = "*")
	@RequestMapping("/timeCheck.do")
	public List<BuyerVO> checkBuyer() {
		List<BuyerVO> list = service.checkBuyer();
		for(BuyerVO l : list) {
		}
		return list;
	}
	
	@CrossOrigin(origins = "*")
	@RequestMapping("/selectOneBuyer.do")
	public BuyerVO selectOneBuyer(@RequestBody BuyerVO buyerVO) {
		System.out.println(buyerVO.getId());
		BuyerVO buyer = service.selectOneBuyer(buyerVO);
		return buyer;
	}
	
	@CrossOrigin(origins = "*")
	@RequestMapping(value = "/regist.do", method = RequestMethod.POST)
	public Map<String,Object> buyerRegist(/*HttpServletRequest request*/@RequestBody BuyerVO buyerVO) {
		Map<String,Object> msg = new HashMap<>();
				
		if(service.retrieveBuyer(buyerVO.getId()) == null) {
			service.registBuyer(buyerVO);
			msg.put("msg", "등록이 완료되었습니다");
			return msg;
		} else {
			msg.put("msg", "이미등록되있다 하지마라!!");
			return msg;
		}
	}	
}