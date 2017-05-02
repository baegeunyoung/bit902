package kr.co.smartpayweb.repository.mapper;

import java.util.List;

import kr.co.smartpayweb.repository.vo.MenuVO;
import kr.co.smartpayweb.repository.vo.StoreFileVO;

public interface MenuMapper {

	
	//메뉴등록
	public void insertMenu(MenuVO menu) throws Exception;
	//메뉴조회
	public List<MenuVO> getStoreByStoreNo(int sellerNo) throws Exception;
	//메뉴 삭제
	public void delete(int menuNo) throws Exception;
	
	//메뉴파일
	public void insertMenuFile(StoreFileVO menuFile) throws Exception;
	public List<MenuVO> selectStoreFileByNo(int sellerNo) throws Exception;
	
	public List<MenuVO> updateFormStoreFileByNo(int menuNo) throws Exception;
	public List<MenuVO> updateForm(int menuNo) throws Exception;
}
