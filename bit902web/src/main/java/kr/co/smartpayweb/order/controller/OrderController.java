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
	
	// ---- orderList 조회 ----
	@RequestMapping("/state.do")
	@ResponseBody
	public ModelAndView retrieveOreder(HttpSession session) throws Exception {
		
		SellerVO seller = (SellerVO)session.getAttribute("seller");
		int sellerNo =  seller.getSellerNo();
		
		List<OrderVO> orderList = orderService.retrieveOreder(sellerNo);
		for (int i = 0 ; i < orderList.size() ; i++) {
			OrderVO orderVO = orderList.get(i);
			orderVO.setOrderMenuList(orderService.RetrieveOrderMenuList(orderVO.getOrderNo()));
		}
		
		ModelAndView mav = new ModelAndView("order/order");
		mav.addObject("orderList", orderList);
		return mav;
	}
}
