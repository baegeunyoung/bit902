package kr.co.smartpayweb.repository.mapper;

import java.util.List;

import kr.co.smartpayweb.repository.vo.SellerVO;

public interface AdminMapper {
	
	// ---- 미승인자 명단 조회 ----
	public List<SellerVO> NoPermitList();
	// ---- 승인 ----
	public void permit(int permitNo);
}
