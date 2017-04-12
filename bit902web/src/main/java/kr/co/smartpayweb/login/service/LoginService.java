package kr.co.smartpayweb.login.service;

import kr.co.smartpayweb.repository.vo.SellerVO;

public interface LoginService {

	public SellerVO login(String id) throws Exception;
	
//	public Map<String, Object> searchBuyer(String id, String password) throws Exception;
	
//	public Map<String, Object> insertBuyer(BuyerVO buyer) throws Exception;
	
	public void insertSeller(SellerVO seller) throws Exception;
	
//	public Map<String, Object> modifyBuyer(BuyerVO buyer) throws Exception;
	
//	public Map<String, Object> modifySeller(SellerVO seller) throws Exception;
	
//	public void deleteBuyer(int buyerNo) throws Exception;
	
//	public void deleteSeller(int sellerNo) throws Exception;
	 
}
