package kr.co.smartpayapp.stamp.service;

import java.util.List;

import kr.co.smartpayapp.repository.vo.BuyerStampVO;
import kr.co.smartpayapp.repository.vo.OnlyMyStampVO;

public interface StampService {
	// allStamp 조회
	public List<BuyerStampVO> allStamp();
	
	public List<OnlyMyStampVO> onlyMyStamp(int myNo) throws Exception;
}
