package kr.co.smartpayweb.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.smartpayweb.repository.mapper.AdminMapper;
import kr.co.smartpayweb.repository.vo.SellerVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminMapper mapper;
	
	// ---- 미승인자 명단 조회 ----
	public List<SellerVO> NoPermitList() throws Exception {
		List<SellerVO> NoPermitList = mapper.NoPermitList();
		return NoPermitList;
	}
	// ---- 승인 ----
	public void permit(int permitNo) throws Exception {
		mapper.permit(permitNo);
	}
}
