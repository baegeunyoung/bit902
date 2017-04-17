package kr.co.smartpayapp.menu.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.smartpayapp.repository.mapper.MenuMapper;
import kr.co.smartpayapp.repository.vo.MenuVO;
import kr.co.smartpayapp.repository.vo.StoreFileVO;

@Service
public class MenuServiceImpl implements MenuService {
	
	@Autowired
	private MenuMapper dao;
	
//	@Override
//	public Map<String, Object> list(int sellerNo) throws Exception {
//		Map<String, Object> result = new HashMap<>();
//		result.put("menufile", dao.selectStoreFileByNo(sellerNo));
//		result.put("menu", dao.getStoreByStoreNo(sellerNo));
//		return result;
//	}
	@Override
	public Map<String, Object> list(int sellerNo) throws Exception {
		Map<String, Object> result = new HashMap<>();
		result.put("menu",dao.getStoreByStoreNo(sellerNo));
		result.put("menuFile",dao.selectStoreFileByNo(sellerNo));
		System.out.println(result.get("menu"));
	
		return result;
	}

	@Override
	public void write(Map<String, Object> param) throws Exception {
		MenuVO menu = (MenuVO)param.get("menu");
		dao.insertMenu(menu);
		StoreFileVO menuFile = (StoreFileVO)param.get("menuFile");
		System.out.println("메뉴이동결로 저장:" + menuFile.getFilePath());
		if (menuFile != null) {
			System.out.println("파일옴");
			menuFile.setMenuNo(menu.getMenuNo());
			dao.insertMenuFile(menuFile);
			System.out.println("저장됨");
		}
	}
}
