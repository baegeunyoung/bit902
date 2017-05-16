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
	
	// 이건뭐지??
	@CrossOrigin(origins = "*")
	@RequestMapping("/timeCheck.do")
	public List<BuyerVO> checkBuyer() {
		List<BuyerVO> list = service.checkBuyer();
		for(BuyerVO l : list) {
		}
		return list;
	}
	
	// 로그인
	@CrossOrigin(origins = "*")
	@RequestMapping("/selectOneBuyer.do")
	public BuyerVO selectOneBuyer(@RequestBody BuyerVO buyerVO) {
		BuyerVO buyer = service.selectOneBuyer(buyerVO);
		return buyer;
	}
	
	// 회원가입
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
	
	// 아이디 중복 검사
	@CrossOrigin(origins = "*")
	@RequestMapping(value = "/validity.do", method = RequestMethod.POST)
	public Map<String, Object> validityCheck(@RequestBody BuyerVO buyerVO) {
		Map<String, Object> msg = new HashMap<>();
		
		String userID = service.retrieveBuyer(buyerVO.getId());
			
		if(buyerVO.getId().equals(userID)) {
			msg.put("msg", "이 아이디는 사용할 수 없습니다");
			msg.put("flag", true);
			return msg;
		} else {
			msg.put("msg", "이 아이디는 사용할 수 있습니다");
			msg.put("flag", false);
			return msg;
		}	
	}
}