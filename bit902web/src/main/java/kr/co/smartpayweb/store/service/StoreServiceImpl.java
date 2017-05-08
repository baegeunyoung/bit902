package kr.co.smartpayweb.store.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.smartpayweb.repository.mapper.StoreMapper;
import kr.co.smartpayweb.repository.vo.StoreFileVO;
import kr.co.smartpayweb.repository.vo.StoreVO;

@Service
public class StoreServiceImpl implements StoreService{
	
	@Autowired
	private StoreMapper dao;

	@Override
	public void write(Map<String, Object> param) throws Exception {
		StoreVO store = (StoreVO)param.get("store");
		dao.insertStore(store);
		StoreFileVO storeFile = (StoreFileVO)param.get("storeFile");
		if (storeFile != null) {
			storeFile.setStoreNo(store.getStoreNo());
			dao.insertStoreFile(storeFile);
		}
	}

	@Override
	public StoreVO readStore(int sellerNo) {
		return dao.readStore(sellerNo);
	}
	
	@Override
	public void storetModify(StoreVO store) {
		dao.storetModify(store);	
	}	

}
