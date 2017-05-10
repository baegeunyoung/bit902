package kr.co.smartpayapp.login.service;

import java.util.List;

import kr.co.smartpayapp.repository.vo.BuyerVO;

public interface LoginService {
	public List<BuyerVO> checkBuyer();
	public BuyerVO selectOneBuyer(BuyerVO buyerVO);
	public int registBuyer(BuyerVO buyerVO);
}
