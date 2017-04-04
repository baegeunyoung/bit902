package kr.co.smartpayweb.repository.mapper;

import kr.co.smartpayweb.repository.vo.StoreFileVO;
import kr.co.smartpayweb.repository.vo.StoreVO;

public interface StoreMapper {
	
	
	
	/* =================================================== */
	/* 기본 게시판                                            */
	/* =================================================== */
	//등록
	public void insertStore(StoreVO store) throws Exception;
	
	
	
	
	/* =================================================== */
	/* 파일 관련                                             */
	/* =================================================== */
	//등록
	public void insertStoreFile(StoreFileVO storeFile) throws Exception;
}
