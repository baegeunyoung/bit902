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
			
//			login.setSellerNo(seller.getSellerNo());
			System.out.println(seller.getId() + seller.getPassword() + seller.getSellerNo());
			int sellerNo = seller.getSellerNo();
			String name = seller.getName();
			String cellphoneNumber = seller.getCellphoneNumber();
			
//			List<BeaconVO> beacon = service.searchBeacon(sellerNo);
//			Map<String, List<BeaconVO>> beaconList = new HashMap<String, List<BeaconVO>>();
//			beaconList.put("beacon2", beacon);
//			
//			for(int i=0; i<=beaconList.size();i++) {
//			session.setAttribute("beacon3", beaconList.get(i));
//			System.out.println(beaconList.get(i) + "비콘정보조회");
//			
//			}
			//for(int i=0; i<=beaconList.size(); i++) {
//				map.put(beaconList);
				//Map<String, Object> map2 = new HashMap<String, Object>();
//				map2.put("beacon" + i, beaconList.get(i).getBeaconNo());
//				map2.put("serial" + i, beaconList.get(i).getSerialNo());
//				map2.put("table" + i, beaconList.get(i).getTableNo());
				//map.putAll(map2);
				//}
			
//			System.out.println(beaconList.get(0));
//			
//			for(int i=0; i<=beaconList.size(); i++){
//				
//			map.put("sellerNo", beaconList.get(i).getSellerNo());
//			map.put("beaconNo", beaconList.get(i).getBeaconNo());
//			map.put("serialNo", beaconList.get(i).getSerialNo());
//			map.put("tableNo", beaconList.get(i).getTableNo());
//			}
			
			System.out.println(sellerNo);
			map.put("msg", "로그인성공");
			System.out.println(cellphoneNumber+"핸드폰번호");
			session.setAttribute("seller", seller);
			session.setAttribute("id", id);
			session.setAttribute("name", name);
			session.setAttribute("cellphoneNumber", cellphoneNumber);
			session.setAttribute("sellerNo", sellerNo);
			session.setAttribute("permitYn", seller.getPermitYn());
			
			
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
		System.out.println(seller);
		service.insertSeller(seller);
		RequestDispatcher rd = request.getRequestDispatcher("../view/login/login.jsp");
		rd.forward(request, response);
	}
	
	// 회원 정보 조회
	@ResponseBody
	@RequestMapping("/login/searchOneSeller.do")
	public SellerVO searchOneSeller(int sellerNo, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		SellerVO seller = service.searchOneSeller(sellerNo);
		
		System.out.println(seller+"주소값");
		session.setAttribute("id", seller.getId());
		session.setAttribute("name", seller.getName());
		session.setAttribute("cellphoneNumber", seller.getCellphoneNumber());
		System.out.println(seller.getCellphoneNumber()+"핸");
		System.out.println(seller.getId()+"아이디");
		System.out.println(seller.getName()+"이름");
		return seller;
	}
	
	// id 찾기
	@ResponseBody
	@RequestMapping("/login/findSellerId.do")
	public String findSellerId(SellerVO seller, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = service.findSellerId(seller);
		System.out.println(2);
		return id;
	}
	
	// 비밀번호 찾기
	@ResponseBody
	@RequestMapping("/login/findSellerPassword.do")
	public String findSellerPassword(SellerVO seller, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String password = service.findSellerPassword(seller);
		return password;
	}
	
    //id로 회원정보 찾기 
	@ResponseBody
	@RequestMapping("/login/searchSeller.do")
	public String searchSeller(String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(id);
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

