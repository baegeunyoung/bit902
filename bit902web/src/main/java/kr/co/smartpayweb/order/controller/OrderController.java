package kr.co.smartpayweb.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	
	// ---- 접수 확인 ----
	@RequestMapping("/receive.do")
	public void receiveOrder(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		int receiveNo = Integer.parseInt(request.getParameter("receiveNo"));
		orderService.receiveOrder(receiveNo);
		request.getRequestDispatcher("state.do").forward(request, response);
	}
	
	// ---- 조리 완료 ----
	@RequestMapping("/complete.do")
	public void completeOrder(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		int completeNo = Integer.parseInt(request.getParameter("completeNo"));
		orderService.completeOrder(completeNo);
		request.getRequestDispatcher("state.do").forward(request, response);
	}
}
