package kr.co.smartpayapp.repository.mapper;

import java.util.List;

import kr.co.smartpayapp.repository.vo.BuyerVO;

public interface LoginMapper {
	public List<BuyerVO> checkBuyer();
	public BuyerVO selectOneBuyer(BuyerVO buyerVO);
	public int insertBuyer(BuyerVO buyerVO);
	
	public String retrieveBuyer(String userID);
	
}
