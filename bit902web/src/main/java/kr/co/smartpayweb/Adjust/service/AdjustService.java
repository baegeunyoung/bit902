package kr.co.smartpayweb.Adjust.service;

import java.util.List;
import java.util.Map;

import kr.co.smartpayweb.repository.vo.DayAdjustVO;
import kr.co.smartpayweb.repository.vo.MonthAdjustVO;

public interface AdjustService {
	
	// ---- 일일정산 첫화면----
	public List<DayAdjustVO> retrieveDayAdjust();
	// ---- 일일정산 날짜 선택----
	public List<DayAdjustVO> retrieveDayAdjustRe(String dDay);
	// ---- 월별정산 첫화면 ----
	public List<MonthAdjustVO> retrieveMonthAdjust();
	// ---- 월별정산 월 선택으로 조회 ----
	public List<MonthAdjustVO> retrieveMonthAdjustRe(Map<String, String> paramDate);
}
