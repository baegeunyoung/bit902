package kr.co.smartpayweb.menu.service;

import java.util.Map;

public interface MenuService {
	
	public Map<String, Object> list(int sellerNo) throws Exception;
//	public Map<String, Object> list() throws Exception;

	public void write(Map<String, Object> param) throws Exception;
	
}	
