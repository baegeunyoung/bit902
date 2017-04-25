package kr.co.smartpayapp.order.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.smartpayapp.order.service.OrderService;
import kr.co.smartpayapp.repository.vo.OrderVO;

@RestController
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	OrderService orderService;
	
	@CrossOrigin(origins = "*")
	@RequestMapping(value = "/regist.do", method = RequestMethod.POST)
	public Map<String,Object> buyerRegist(/*HttpServletRequest request*/@RequestBody OrderVO orderVO) {
		System.out.println("이클립스");
		Map<String,Object> msg = new HashMap<>();
		if(orderService.registOrder(orderVO) == 1 ) {
			msg.put("msg", "주문완료");
		}
		else {
			msg.put("msg", "주문실패");
		}
		return msg;
	}

}
