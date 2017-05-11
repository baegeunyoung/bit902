package kr.co.smartpayweb.repository.mapper;

import java.util.List;

import kr.co.smartpayweb.repository.vo.BeaconVO;
import kr.co.smartpayweb.repository.vo.SellerVO;

public interface LoginMapper {

	
	// 로그인
	public SellerVO getSellerInfo(String id) throws Exception;
	
	// 회원가입
	public void insertSeller(SellerVO seller) throws Exception;

	// id로 회원정보 찾기
//	public String searchSeller(String id) throws Exception;
	
	// 회원정보수정
	public SellerVO modifySeller(SellerVO seller) throws Exception;

	// 회원탈퇴
	public void deleteSeller(int sellerNo) throws Exception;
	
	// 회원가입승인
	public void permitSeller(String permit) throws Exception;

	// 비콘정보조회
	public List<BeaconVO> searchBeacon(int sellerNo) throws Exception;
	
//	public List<BuyerVO> searchBuyer(String id, String password) throws Exception;
	
//	public BuyerVO insertBuyer(BuyerVO Buyer) throws Exception;
		
//	public BuyerVO modifyBuyer(BuyerVO Buyer) throws Exception;
	
//	public void deleteBuyer(int buyerNo) throws Exception;
	
	
}
