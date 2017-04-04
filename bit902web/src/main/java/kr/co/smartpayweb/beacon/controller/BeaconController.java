package kr.co.smartpayweb.beacon.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.smartpayweb.beacon.service.BeaconService;
import kr.co.smartpayweb.repository.vo.BeaconVO;

@Controller
@RequestMapping("/beacon")
public class BeaconController {

	private BeaconService service;
	
//	@ResponseBody
//	@RequestMapping("/searchBeacon.do")
//	public BeaconVO searchBeacon(int beaconNo) throws Exception {
//		return service.searchBeacon(beaconNo);
//	}
	
	@ResponseBody
	@RequestMapping("/insertBeacon.do")
	public Map<String, Object> insertBeacon(BeaconVO beacon) throws Exception {
		Map<String, Object> map = new HashMap<>();
		return service.insertBeacon(beacon);
	}
		
//	@ResponseBody
//	@RequestMapping("/modifyBeacon.do")
//	public Map<String, Object> modifyBeacon(BeaconVO beacon) throws Exception {
//		Map<String, Object> map = new HashMap<>();
//		return service.modifyBeacon(beacon);
//	}
	
//	@ResponseBody
//	@RequestMapping("/deleteBeacon.do")
//	public void deleteBeacon(int beaconNo) throws Exception {
//		service.deleteBeacon(beaconNo);
//	}
	
	
	
}
