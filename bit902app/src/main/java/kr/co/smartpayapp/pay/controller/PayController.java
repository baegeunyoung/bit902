package kr.co.smartpayapp.pay.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.smartpayapp.pay.service.PayService;
import kr.co.smartpayapp.repository.vo.BuyerVO;

@RestController
@RequestMapping("/book")
public class PayController {
	@Autowired
	PayService payService;
	
	@CrossOrigin(origins = "*")
	@RequestMapping("/timeCheck.do")
	public List<BuyerVO> bookTimeCheck() {
		System.out.println("체크");
		List<BuyerVO> list = payService.checkBuyer();
		for(BuyerVO l : list) {
			System.out.println(l.getName());
		}
		return list;
	}
	@CrossOrigin(origins = "*")
	@RequestMapping(value = "/regist.do", method = RequestMethod.POST)
	public Map<String,Object> buyerRegist(/*HttpServletRequest request*/@RequestBody BuyerVO buyerVO) {
//		System.out.println(request.getParameter("id"));
//		System.out.println(request.getParameter("password"));
//		System.out.println(request.getParameter("name"));
//		System.out.println(request.getParameter("cellphoneNumber"));
		System.out.println(buyerVO.getId());
		System.out.println(buyerVO.getPassword());
		System.out.println(buyerVO.getName());
		System.out.println(buyerVO.getCellphoneNumber());
		Map<String,Object> msg = new HashMap<>();
		if(payService.registBuyer(buyerVO) == 1 ) {
			msg.put("msg", "등록완료");
		}
		else {
			msg.put("msg", "등록실패");
		}
		
		return msg;
	}
	
}
