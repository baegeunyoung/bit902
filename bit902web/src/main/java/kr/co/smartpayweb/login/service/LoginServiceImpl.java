package kr.co.smartpayweb.login.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.smartpayweb.repository.mapper.LoginMapper;
import kr.co.smartpayweb.repository.vo.BeaconVO;
import kr.co.smartpayweb.repository.vo.SellerVO;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginMapper dao;
	
	// 로그인
	public SellerVO login(String id) throws Exception {
		return dao.getSellerInfo(id);
	}
	
	// 회원가입
	public void insertSeller(SellerVO seller) throws Exception {	
		dao.insertSeller(seller);
	}
	
	// id로 회원정보 찾기 
	public String searchSeller(String id) throws Exception {
	 	return dao.searchSeller(id);
	}
		
	// 회원정보수정
	public Map<String, Object> modifySeller(SellerVO seller) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("list", dao.modifySeller(seller));
		return map;
	}
	
	// 회원탈퇴
		public void deleteSeller(int sellerNo) throws Exception {
			dao.deleteSeller(sellerNo);
		}
		
	// 회원가입승인
		public void permitSeller(String permit) throws Exception {
			dao.permitSeller(permit);
		}
		
		//비콘 정보 조회
		public List<BeaconVO> searchBeacon(int sellerNo) throws Exception {
			return dao.searchBeacon(sellerNo);
		}
	
//	public Map<String, Object> searchBuyer(String id, String password) throws Exception {
//	Map<String, Object> map = new HashMap<>();
//	map.put("list", dao.searchBuyer(id, password));
//	return map;
//}

//	public Map<String, Object> insertBuyer(BuyerVO buyer) throws Exception {
//		Map<String, Object> map = new HashMap<>();
//		map.put("list" , dao.insertBuyer(buyer));
//		return map;
//    }
	
//	public Map<String, Object> modifyBuyer(BuyerVO buyer) throws Exception {
//		Map<String, Object> map = new HashMap<>();
//		map.put("list", dao.modifyBuyer(buyer));
//		return map;
//	}
	
//	public void deleteBuyer(int buyerNo) throws Exception {
//		dao.deleteBuyer(buyerNo);
//	}

}

