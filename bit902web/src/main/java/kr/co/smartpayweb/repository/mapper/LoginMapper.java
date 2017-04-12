package kr.co.smartpayweb.repository.mapper;

import kr.co.smartpayweb.repository.vo.SellerVO;

public interface LoginMapper {

	public SellerVO getSellerInfo(String id) throws Exception;
	
//	public List<BuyerVO> searchBuyer(String id, String password) throws Exception;
	
	public void insertSeller(SellerVO seller) throws Exception;
	
//	public BuyerVO insertBuyer(BuyerVO Buyer) throws Exception;
	
//	public SellerVO modifySeller(SellerVO seller) throws Exception;
	
//	public BuyerVO modifyBuyer(BuyerVO Buyer) throws Exception;
	
//	public void deleteSeller(int sellerNo) throws Exception;
	
//	public void deleteBuyer(int buyerNo) throws Exception;
	
	
}
