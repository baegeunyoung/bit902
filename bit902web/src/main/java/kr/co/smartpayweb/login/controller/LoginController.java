package kr.co.smartpayweb.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.smartpayweb.login.service.LoginService;
import kr.co.smartpayweb.repository.vo.SellerVO;

@Controller
public class LoginController {

	@Autowired
	private LoginService service;
	
	@ResponseBody
	@RequestMapping("/login/logout.do")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/index.jsp";	
	}
	
	@ResponseBody
	@RequestMapping("/login/login.do")
	public String login(
			String id, String password, HttpSession session,
			RedirectAttributes attr) throws Exception {
		
		SellerVO seller = service.login(id);
		if(seller == null) {
			attr.addAttribute("msg", "입력하신 정보가 올바르지 않습니다.");
			return "redirect:/login/loginForm";
		
		}
		
		if(id.equals(seller.getId()) && password.equals(seller.getPassword())) {
			SellerVO login = new SellerVO();
			login.setId(seller.getId());
			login.setPassword(seller.getPassword());
			
			session.setAttribute("seller", seller);
			return "redirect:/index.jsp";
		}
		else {
			attr.addAttribute("msg", "입력하신 정보가 올바르지 않습니다.");
			return "redirect:/login/loginForm";
		}
		
	}
	
//	@ResponseBody
//	@RequestMapping("/searchSeller.do")
//	public SellerVO searchSeller(SellerVO seller) throws Exception {
//		System.out.println(seller);
//		return service.searchSeller(seller);
//	}
//	
//	@ResponseBody
//	@RequestMapping("/searchBuyer.do")
//	public Map<String, Object> searchBuyer(String id, String password) throws Exception {
//		Map<String, Object> map = new HashMap<>();
//		return service.searchBuyer(id, password);
//	}
	
//	@ResponseBody
//	@RequestMapping("/insertBuyer.do")
//	public Map<String, Object> insertBuyer(BuyerVO buyer) throws Exception {
//		Map<String, Object> map = new HashMap<>();
//		return service.insertBuyer(buyer);
//	}
	
//	@ResponseBody
//	@RequestMapping("/insertSeller.do")
//	public Map<String, Object> insertSeller(SellerVO seller) throws Exception {
//		Map<String, Object> map = new HashMap<>();
//		return service.insertSeller(seller);
//	}
	
//	@ResponseBody
//	@RequestMapping("/modifyBuyer.do")
//	public Map<String, Object> modifyBuyer(BuyerVO buyer) throws Exception {
//		Map<String, Object> map = new HashMap<>();
//		return service.modifyBuyer(buyer);
//	}
	
//	@ResponseBody
//	@RequestMapping("/modifySeller.do")
//	public Map<String, Object> modifySeller(SellerVO seller) throws Exception {
//		Map<String, Object> map = new HashMap<>();
//		return service.modifySeller(seller);
//	}
	
//	@ResponseBody
//	@RequestMapping("/deleteBuyer.do")
//	public void deleteBuyer(int buyerNo) throws Exception {
//		service.deleteBuyer(buyerNo);
//	}
	
//	@ResponseBody
//	@RequestMapping("/deleteSeller.do")
//	public void deleteSeller(int sellerNo) throws Exception {
//		service.deleteSeller(sellerNo);
//	}
	
}
