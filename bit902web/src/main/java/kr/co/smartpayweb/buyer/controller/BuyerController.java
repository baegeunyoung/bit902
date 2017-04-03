package kr.co.smartpayweb.buyer.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.smartpayweb.buyer.service.BuyerService;
import kr.co.smartpayweb.repository.vo.BuyerVO;

@Controller
@RequestMapping("/buyer")
public class BuyerController {
	@Autowired
	BuyerService buyerService;
	
	@RequestMapping("/list.do")
	public void retrieveBuyer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		System.out.println("체크");
		List<BuyerVO> list = buyerService.checkBuyer();
		for(BuyerVO l : list) {
			System.out.println(l.getName());
		}
		request.setAttribute("list", list);
		RequestDispatcher rd = request.getRequestDispatcher("/view/jsp/buyer/list.jsp");
		rd.forward(request, response);
		
	}
	
}
