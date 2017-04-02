package kr.co.easybook.repository.mapper;

import java.util.List;

import kr.co.easybook.repository.vo.BuyerVO;

public interface PayMapper {
	public List<BuyerVO> selectBuyer();
}
