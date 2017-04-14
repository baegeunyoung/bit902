package kr.co.smartpayweb.Adjust.service;

import java.util.List;
import java.util.Map;

import kr.co.smartpayweb.repository.vo.DayAdjustVO;
import kr.co.smartpayweb.repository.vo.MonthAdjustVO;

public interface AdjustService {
	
	// ---- 일일정산 첫화면----
	public List<DayAdjustVO> retrieveDayAdjust(int sellerNo);
	// ---- 일일정산 날짜 선택----
	public List<DayAdjustVO> retrieveDayAdjustRe(Map<String, Object> data);
	// ---- 월별정산 첫화면 ----
	public List<MonthAdjustVO> retrieveMonthAdjust(int sellerNo);
	// ---- 월별정산 월 선택으로 조회 ----
	public List<MonthAdjustVO> retrieveMonthAdjustRe(Map<String, Object> paramDate);
	// ---- 상품별 월 매출 추이 그래프 ----
	public List<DayAdjustVO> productGraph(Map<String, Object> paramDate);
}
