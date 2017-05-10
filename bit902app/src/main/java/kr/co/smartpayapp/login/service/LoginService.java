package kr.co.smartpayapp.login.service;

import java.util.List;

import kr.co.smartpayapp.repository.vo.BuyerVO;

public interface LoginService {
	public List<BuyerVO> checkBuyer();
	public int registBuyer(BuyerVO buyerVO);
}
