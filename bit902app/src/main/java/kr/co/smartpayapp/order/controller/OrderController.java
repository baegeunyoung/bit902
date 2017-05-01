package kr.co.smartpayapp.order.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.smartpayapp.order.service.OrderService;

@RestController
@RequestMapping("/order")
@CrossOrigin(origins = "*")
public class OrderController {
	
	@Autowired
	OrderService orderService;
	
	@CrossOrigin(origins = "*")
	@RequestMapping(value = "/regist.do", method = RequestMethod.POST)
	public ModelAndView orderRegist(@RequestBody ArrayList<HashMap<String,String>> order) throws Exception {
		
		orderService.registOrder(order);
		
		ModelAndView mav = new ModelAndView("http://14.32.66.123:10002/bit902web/order/state.do");
		return mav;
	}
}
