package kr.co.smartpayweb.repository.mapper;

import java.util.List;
import java.util.Map;

import kr.co.smartpayweb.repository.vo.DayAdjustVO;
import kr.co.smartpayweb.repository.vo.MonthAdjustVO;

public interface AdjustMapper {
	
	// ---- 일일정산 첫화면----
	public List<DayAdjustVO> retrieveDayAdjust(int sellerNo);
	// ---- 일일정산 날짜 선택----
	public List<DayAdjustVO> retrieveDayAdjustRe(String dDay);
	// ---- 월별정산 첫화면 ----
	public List<MonthAdjustVO> retrieveMonthAdjust();
	// ---- 월별정산 월 선택으로 조회 ----
	public List<MonthAdjustVO> retrieveMonthAdjustRe(Map<String, String> paramDate);
}
