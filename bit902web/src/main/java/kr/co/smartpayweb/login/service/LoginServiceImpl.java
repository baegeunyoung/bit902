package kr.co.smartpayweb.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.smartpayweb.repository.mapper.LoginMapper;
import kr.co.smartpayweb.repository.vo.SellerVO;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginMapper dao;
	
	public SellerVO login(String id) throws Exception {
		return dao.getSellerInfo(id);
		
		
	}
	
//	public Map<String, Object> searchBuyer(String id, String password) throws Exception {
//		Map<String, Object> map = new HashMap<>();
//		map.put("list", dao.searchBuyer(id, password));
//		return map;
//	}
	
	public void insertSeller(SellerVO seller) throws Exception {	
		dao.insertSeller(seller);
	}
	
//	public Map<String, Object> insertBuyer(BuyerVO buyer) throws Exception {
//		Map<String, Object> map = new HashMap<>();
//		map.put("list" , dao.insertBuyer(buyer));
//		return map;
//    }
	
//	public Map<String, Object> modifySeller(SellerVO seller) throws Exception {
//		Map<String, Object> map = new HashMap<>();
//		map.put("list", dao.modifySeller(seller));
//		return map;
//	}
	
//	public Map<String, Object> modifyBuyer(BuyerVO buyer) throws Exception {
//		Map<String, Object> map = new HashMap<>();
//		map.put("list", dao.modifyBuyer(buyer));
//		return map;
//	}
	
//	public void deleteSeller(int sellerNo) throws Exception {
//		dao.deleteSeller(sellerNo);
//	}
	
//	public void deleteBuyer(int buyerNo) throws Exception {
//		dao.deleteBuyer(buyerNo);
//	}

}
