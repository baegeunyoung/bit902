package kr.co.smartpayweb.beacon.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.smartpayweb.beacon.service.BeaconService;
import kr.co.smartpayweb.repository.vo.BeaconVO;

@Controller
@RequestMapping("/beacon")
public class BeaconController extends HttpServlet {

	private BeaconService service;
	
	@ResponseBody
	@RequestMapping("/searchBeacon.do")
	public List<BeaconVO> searchBeacon(HttpSession session, String selNo,
		                               HttpServletRequest request, HttpServletResponse response) throws Exception {
		int sellerNo = (int)session.getAttribute(selNo);
		List<BeaconVO> list = service.searchBeacon(sellerNo);
		// 데이터 공유하기
		session.setAttribute("list", list);
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/insertBeacon.do")
	public Map<String, Object> insertBeacon(BeaconVO beacon) throws Exception {
		Map<String, Object> map = new HashMap<>();
		return service.insertBeacon(beacon);
	}
		
	@ResponseBody
	@RequestMapping("/modifyBeacon.do")
	public Map<String, Object> modifyBeacon(BeaconVO beacon) throws Exception {
		Map<String, Object> map = new HashMap<>();
		return service.modifyBeacon(beacon);
	}
	
	@ResponseBody
	@RequestMapping("/deleteBeacon.do")
	public void deleteBeacon(BeaconVO beacon) throws Exception {
		service.deleteBeacon(beacon);
	}
	
	
	
}
