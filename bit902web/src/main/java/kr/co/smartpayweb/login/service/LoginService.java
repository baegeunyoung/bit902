package kr.co.smartpayweb.login.service;

import java.util.Map;

import kr.co.smartpayweb.repository.vo.SellerVO;

public interface LoginService {

	// 로그인
	public SellerVO login(String id) throws Exception;
	
	// 회원가입
	public void insertSeller(SellerVO seller) throws Exception;
	
	// 회원정보수정
	public Map<String, Object> modifySeller(SellerVO seller) throws Exception;
	
	// 회원탈퇴
	public void deleteSeller(int sellerNo) throws Exception;
	
	// 회원가입승인
	public void permitSeller(String permit) throws Exception;

//	public Map<String, Object> searchBuyer(String id, String password) throws Exception;
	
//	public Map<String, Object> insertBuyer(BuyerVO buyer) throws Exception;
		
//	public Map<String, Object> modifyBuyer(BuyerVO buyer) throws Exception;
	
//	public void deleteBuyer(int buyerNo) throws Exception;
	
	 
}
