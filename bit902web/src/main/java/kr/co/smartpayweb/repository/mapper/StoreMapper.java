package kr.co.smartpayweb.repository.mapper;

import kr.co.smartpayweb.repository.vo.EventVO;
import kr.co.smartpayweb.repository.vo.StoreFileVO;
import kr.co.smartpayweb.repository.vo.StoreVO;

public interface StoreMapper {
	
	
	
	/* =================================================== */
	/* 기본 게시판                                            */
	/* =================================================== */
	//등록
	public void insertStore(StoreVO store) throws Exception;
	
	public StoreVO readStore(int sellerNo);
	
	public void storetModify(StoreVO store);
	
	
	/* =================================================== */
	/* 파일 관련                                             */
	/* =================================================== */
	//등록
	public void insertStoreFile(StoreFileVO storeFile) throws Exception;
}
