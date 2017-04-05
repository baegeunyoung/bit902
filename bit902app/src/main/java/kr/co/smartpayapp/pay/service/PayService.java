package kr.co.smartpayapp.pay.service;

import java.util.List;

import kr.co.smartpayapp.repository.vo.BuyerVO;

public interface PayService {
	public List<BuyerVO> checkBuyer();
	public int registBuyer(BuyerVO buyerVO);
	
}
