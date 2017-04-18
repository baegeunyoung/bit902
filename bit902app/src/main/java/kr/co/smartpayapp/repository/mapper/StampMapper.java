package kr.co.smartpayapp.repository.mapper;

import java.util.List;

import kr.co.smartpayapp.repository.vo.BuyerStampVO;

public interface StampMapper {
	// allStamp 조회
	public List<BuyerStampVO> allStamp() throws Exception;
}
