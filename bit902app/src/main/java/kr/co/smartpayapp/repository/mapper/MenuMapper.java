package kr.co.smartpayapp.repository.mapper;
import java.util.List;

import kr.co.smartpayapp.repository.vo.MenuVO;
import kr.co.smartpayapp.repository.vo.StoreFileVO;

public interface MenuMapper {

	
	//메뉴등록
	public void insertMenu(MenuVO menu) throws Exception;
	//메뉴조회
	public List<MenuVO> getStoreByStoreNo(int sellerNo) throws Exception;
//	public List<MenuVO> getStoreByStoreNo() throws Exception;
	
	
	//메뉴파일
	public void insertMenuFile(StoreFileVO menuFile) throws Exception;
	public List<MenuVO> selectStoreFileByNo(int sellerNo) throws Exception;

}
