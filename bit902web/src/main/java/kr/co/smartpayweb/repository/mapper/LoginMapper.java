package kr.co.smartpayweb.repository.mapper;

import kr.co.smartpayweb.repository.vo.SellerVO;

public interface LoginMapper {

	
	// 로그인
	public SellerVO getSellerInfo(String id) throws Exception;
	
	// 회원가입
	public void insertSeller(SellerVO seller) throws Exception;

	// 회원 정보 조회
	public SellerVO searchOneSeller(int sellerNo) throws Exception;
	
	// id로 회원정보 찾기
	public String searchSeller(String id) throws Exception;
	
	// 회원정보수정
	public void modifySeller(SellerVO seller) throws Exception;

	// 회원탈퇴
	public void deleteSeller(int sellerNo) throws Exception;
	
	// 회원가입승인
	public void permitSeller(String permit) throws Exception;

}
