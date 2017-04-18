package kr.co.smartpayweb.admin.service;

import java.util.List;

import kr.co.smartpayweb.repository.vo.SellerVO;

public interface AdminService {
	
	// ---- 미승인자 명단 조회 ----
	public List<SellerVO> NoPermitList() throws Exception;
	// ---- 승인 ----
	public void permit(int permitNo) throws Exception;
	// ---- 거절 ----
	public void refuse(int refuseNo) throws Exception;
}
