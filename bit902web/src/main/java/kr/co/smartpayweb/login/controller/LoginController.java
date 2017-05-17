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
import org.springframework.web.bind.annotation.ResponseBody;

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
			RequestDispatcher rd = request.getRequestDispatcher("../view/login/login.jsp");
			rd.forward(request, response);
			return map;
		
		}
		
		// 아이디와 비밀번호가 일치할 때
		if(id.equals(seller.getId()) && password.equals(seller.getPassword())) {
			SellerVO login = new SellerVO();
			
			login.setId(seller.getId());
			login.setPassword(seller.getPassword());
			
			int sellerNo = seller.getSellerNo();
			String name = seller.getName();
			String cellphoneNumber = seller.getCellphoneNumber();
			
			map.put("msg", "로그인성공");
			session.setAttribute("seller", seller);
			session.setAttribute("id", id);
			session.setAttribute("name", name);
			session.setAttribute("cellphoneNumber", cellphoneNumber);
			session.setAttribute("sellerNo", sellerNo);
			session.setAttribute("permitYn", seller.getPermitYn());
			
			RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
			return map;
		}
		
		// 아이디와 비밀번호 중 하나만 일치할 때
		else {
			map.put("msg", "입력하신 정보가 올바르지 않습니다.");
			RequestDispatcher rd = request.getRequestDispatcher("../view/login/login.jsp");
			rd.forward(request, response);
			return map;
		}
}

	// 로그아웃
		@RequestMapping("/login/logout.do")
		public void logout(HttpSession session,
					HttpServletRequest request, HttpServletResponse response) throws Exception {
			session.invalidate();	
			RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
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
		RequestDispatcher rd = request.getRequestDispatcher("../view/main/main.jsp");
		rd.forward(request, response);
	}
	
	// 회원 정보 조회
	@ResponseBody
	@RequestMapping("/login/searchOneSeller.do")
	public SellerVO searchOneSeller(int sellerNo, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		SellerVO seller = service.searchOneSeller(sellerNo);
		session.setAttribute("id", seller.getId());
		session.setAttribute("name", seller.getName());
		session.setAttribute("cellphoneNumber", seller.getCellphoneNumber());
		return seller;
	}
	
	
	
    //id로 회원정보 찾기 
	@ResponseBody
	@RequestMapping("/login/searchSeller.do")
	public String searchSeller(String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String returnId = service.searchSeller(id);
		if(id.equals(returnId)) {
			return "exist";			
		}
		else {
			return "ok";
		}		
	}
	
	// 회원정보수정 
	@RequestMapping("/login/modifySeller.do")
	public void modifySeller(SellerVO seller, HttpServletRequest request, HttpServletResponse response) throws Exception {
		service.modifySeller(seller);
		RequestDispatcher rd = request.getRequestDispatcher("../view/main/main.jsp");
		rd.forward(request, response);
	}
	
	// 회원탈퇴
		@RequestMapping("/login/deleteSeller.do")
		public void deleteSeller(int sellerNo, 
		HttpServletRequest request, HttpServletResponse response) throws Exception {
			service.deleteSeller(sellerNo);
			RequestDispatcher rd = request.getRequestDispatcher("../view/login/login.jsp");
			rd.forward(request, response);
    }
	

}

