package kr.co.smartpayapp.repository.mapper;

import java.util.List;

import kr.co.smartpayapp.repository.vo.BuyerStampVO;
import kr.co.smartpayapp.repository.vo.OnlyMyStampVO;

public interface StampMapper {
	// allStamp 조회
	public List<BuyerStampVO> allStamp();
	
	public List<OnlyMyStampVO> onlyMyStamp(int myNo) throws Exception;
}
