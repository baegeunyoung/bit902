package kr.co.smartpayweb.store.service;

import java.util.Map;

import kr.co.smartpayweb.repository.vo.StoreVO;

public interface StoreService {

	public String permitYN(int sellerNo) throws Exception;
	
	public void write(Map<String, Object> param) throws Exception;
	
	public  StoreVO readStore(int sellerNo);
	
	public void storetModify(StoreVO store);
		
	

}
