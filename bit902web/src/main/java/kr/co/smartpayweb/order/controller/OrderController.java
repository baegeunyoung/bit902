package kr.co.smartpayweb.order.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.smartpayweb.order.service.OrderService;
import kr.co.smartpayweb.repository.vo.OrderVO;
import kr.co.smartpayweb.repository.vo.SellerVO;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	OrderService orderService;
	
	// ---- 주문상태 확인 ----
	@RequestMapping("/state.do")
	@ResponseBody
	public ModelAndView retrieveOreder(HttpSession session) throws Exception {
		
		SellerVO seller = (SellerVO)session.getAttribute("seller");
		int sellerNo =  seller.getSellerNo();
		
		List<OrderVO> orderList = orderService.retrieveOreder(sellerNo);
		System.out.println(orderList.get(0).getOrderContent());
		
		ModelAndView mav = new ModelAndView("order/order");
		mav.addObject("orderList", orderList);
		return mav;
	}
}
