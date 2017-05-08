package kr.co.smartpayapp.repository.mapper;

import java.util.List;

import kr.co.smartpayapp.repository.vo.BuyerVO;

public interface LoginMapper {
	public List<BuyerVO> selectBuyer();
	public int insertBuyer(BuyerVO buyerVO);
}
