package kr.co.smartpayweb.login.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.smartpayweb.login.service.LoginService;
import kr.co.smartpayweb.repository.vo.SellerVO;

@Controller
public class LoginController extends HttpServlet{

	@Autowired
	private LoginService service;
		
	// 로그인
	@RequestMapping("/login/login.do")
	public Map<String, Object> login(
			String id, String password, HttpSession session,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		Map<String, Object> map = new HashMap<>();
		SellerVO seller = service.login(id);
		
		// 아이디나 비밀번호가 db에 없을 때
		if(seller == null) {
			map.put("msg", "입력하신 정보가 올바르지 않습니다.");
			System.out.println("2");
			RequestDispatcher rd = request.getRequestDispatcher("../view/login/login.jsp");
			rd.forward(request, response);
			return map;
		
		}
		
		// 아이디와 비밀번호가 일치할 때
		if(id.equals(seller.getId()) && password.equals(seller.getPassword())) {
			SellerVO login = new SellerVO();
			login.setId(seller.getId());
			login.setPassword(seller.getPassword());
			System.out.println(seller.getId() + seller.getPassword());
			map.put("msg", "로그인성공");
			session.setAttribute("seller", seller);
			session.setAttribute("id", id);
//			request.setAttribute("id", id);
			RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
			return map;
		}
		
		// 아이디와 비밀번호 중 하나만 일치할 때
		else {
			map.put("msg", "입력하신 정보가 올바르지 않습니다.");
			System.out.println("4");
			RequestDispatcher rd = request.getRequestDispatcher("../view/login/login.jsp");
			rd.forward(request, response);
			return map;
		}
}

	// 로그아웃
		@RequestMapping("/login/logout.do")
		public void logout(HttpSession session,
					HttpServletRequest request, HttpServletResponse response) throws Exception {
//		    Map<String, Object> map = new HashMap<>();
			session.invalidate();	
//			map.put("msg", "로그아웃되었습니다.");
//			response.sendRedirect("../view/login/login.jsp");
			RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
//			return map;	
		}

	// 회원가입승인
	@RequestMapping("/login/permitSeller.do")
	public void permitSeller(String permit) throws Exception {
		service.permitSeller(permit);
	}

		
	// 회원가입
	@RequestMapping("/login/insertSeller.do")
	public void insertSeller(SellerVO seller, 
	HttpServletRequest request, HttpServletResponse response) throws Exception {
		service.insertSeller(seller);
		RequestDispatcher rd = request.getRequestDispatcher("../view/login/login.jsp");
		rd.forward(request, response);
	}
	
	// 회원정보수정 관련 db 찾기
//	@RequestMapping("/login/searchSeller.do")
//	public String searchSeller(HttpSession session) throws Exception {
//		return service.searchSeller(session); 
				
//	}
	
	// 회원정보수정 
	@RequestMapping("/login/modifySeller.do")
	public Map<String, Object> modifySeller(SellerVO seller) throws Exception {
		Map<String, Object> map = new HashMap<>();
		return service.modifySeller(seller);
	}
	
	// 회원탈퇴
		@RequestMapping("/login/deleteSeller.do")
		public void deleteSeller(int sellerNo, 
		HttpServletRequest request, HttpServletResponse response) throws Exception {
			service.deleteSeller(sellerNo);
			RequestDispatcher rd = request.getRequestDispatcher("../view/login/login.jsp");
			rd.forward(request, response);
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
//	@RequestMapping("/modifyBuyer.do")
//	public Map<String, Object> modifyBuyer(BuyerVO buyer) throws Exception {
//		Map<String, Object> map = new HashMap<>();
//		return service.modifyBuyer(buyer);
//	}
	
//	@ResponseBody
//	@RequestMapping("/deleteBuyer.do")
//	public void deleteBuyer(int buyerNo) throws Exception {
//		service.deleteBuyer(buyerNo);
	

	
}
