package kr.co.smartpayweb.menu.service;

import java.util.List;
import java.util.Map;

import kr.co.smartpayweb.repository.vo.MenuVO;

public interface MenuService {
	
	public Map<String, Object> list(int sellerNo) throws Exception;

	public void write(Map<String, Object> param) throws Exception;

	public void delete(int menuNo) throws Exception;
	
	public List<MenuVO> updateForm(int menuNo) throws Exception;
}	
