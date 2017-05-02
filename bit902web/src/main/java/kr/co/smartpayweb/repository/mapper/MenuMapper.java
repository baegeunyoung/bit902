package kr.co.smartpayweb.repository.mapper;

import java.util.List;

import kr.co.smartpayweb.repository.vo.MenuVO;
import kr.co.smartpayweb.repository.vo.StoreFileVO;

public interface MenuMapper {

/*메뉴관련*/	
	//메뉴등록
	public void insertMenu(MenuVO menu) throws Exception;
	//메뉴조회
	public List<MenuVO> getStoreByStoreNo(int sellerNo) throws Exception;
	//메뉴 삭제
	public void delete(int menuNo) throws Exception;
	//메뉴변경 form으로 이동기
	public List<MenuVO> updateForm(int menuNo) throws Exception;
	//메뉴 변경
	public void menuUpdate(MenuVO menu) throws Exception;

/*메뉴 이미지 관련*/	
	//메뉴이미지 등록
	public void insertMenuFile(StoreFileVO menuFile) throws Exception;
	//메뉴이미지 조회
	public List<MenuVO> selectStoreFileByNo(int sellerNo) throws Exception;
	//메뉴변경 from으로 이동시 
	public List<StoreFileVO> updateFormStoreFileByNo(int menuNo) throws Exception;
	
}
