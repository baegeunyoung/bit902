package kr.co.smartpayweb.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.smartpayweb.admin.service.AdminService;
import kr.co.smartpayweb.repository.vo.SellerVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	AdminService adminService;
	
	// ---- 미승인자 명단 조회 ----
	@RequestMapping("/admin.do")
	public ModelAndView NoPermitList() throws Exception {
		
		List<SellerVO> NoPermitList = adminService.NoPermitList();
		ModelAndView mav = new ModelAndView("admin/admin");
		mav.addObject("NoPermitList", NoPermitList);
		return mav;
	}
	
	// ---- 승인 ----
	@RequestMapping("/permit.do")
	public void permit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int permitNo = Integer.parseInt(request.getParameter("permitNo"));
		adminService.permit(permitNo);

		request.getRequestDispatcher("admin.do").forward(request, response);
	}
	
	// ---- 거절 ----
	@RequestMapping("/refuse.do")
	public void refuse(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int refuseNo = Integer.parseInt(request.getParameter("refuseNo"));
		adminService.refuse(refuseNo);
		
		request.getRequestDispatcher("admin.do").forward(request, response);
	}
}
