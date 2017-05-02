package kr.co.smartpayweb.menu.service;

import java.util.Map;

import kr.co.smartpayweb.repository.vo.MenuVO;

public interface MenuService {
	//메뉴 조회
	public Map<String, Object> list(int sellerNo) throws Exception;
	//메뉴 등록
	public void write(Map<String, Object> param) throws Exception;
	//메뉴 삭제(활성화 비활성화 상태변경)-db유지
	public void delete(int menuNo) throws Exception;
	//메뉴 변경form으로 이동 
	public Map<String, Object> updateForm(int menuNo) throws Exception;
	//메뉴 변경
	public void menuUpdate(MenuVO menu) throws Exception;
	
}	
