package kr.co.smartpayapp.home.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.smartpayapp.home.service.HomeService;
import kr.co.smartpayapp.repository.vo.HomeEventInfoVO;
import kr.co.smartpayapp.repository.vo.StoreVO;

@RestController
@RequestMapping("/home")
@CrossOrigin(origins = "*")
public class HomeController {
	@Autowired
	private HomeService homeService;
    
    @RequestMapping("/homeInfo.do")
    public List<HomeEventInfoVO> HomeInfo() throws Exception {
    	List<HomeEventInfoVO> infoList = new ArrayList<>();
    	infoList = homeService.retrieveHomeInfo();
    	return infoList;
    }
    @RequestMapping("/homeSearch.do")
    public List<StoreVO> HomeSearch(@RequestBody String search) throws Exception {
    	List<StoreVO> infoList = new ArrayList<>();
    	infoList = homeService.retrieveHomeSearch(search);
    	return infoList;
    }

}
