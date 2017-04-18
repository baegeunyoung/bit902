package kr.co.smartpayapp.stamp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.smartpayapp.repository.mapper.StampMapper;
import kr.co.smartpayapp.repository.vo.BuyerStampVO;

@Service
public class StampServiceImpl implements StampService {
	
	@Autowired
	private StampMapper mapper;
	
	// allStamp 조회
	public List<BuyerStampVO> allStamp() throws Exception {
		return mapper.allStamp();
	}
}
