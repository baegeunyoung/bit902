package kr.co.smartpayapp.stamp.service;

import java.util.List;

import kr.co.smartpayapp.repository.vo.BuyerStampVO;

public interface StampService {
	// allStamp 조회
	public List<BuyerStampVO> allStamp() throws Exception;
}
