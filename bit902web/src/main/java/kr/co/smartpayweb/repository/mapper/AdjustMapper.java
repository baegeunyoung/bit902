package kr.co.smartpayweb.repository.mapper;

import java.util.Date;
import java.util.List;

import kr.co.smartpayweb.repository.vo.dayAdjustVO;

public interface AdjustMapper {
	
	// ---- 일일정산 첫화면----
	public List<dayAdjustVO> retrieveDayAdjust();
}
