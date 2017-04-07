package kr.co.smartpayweb.Adjust.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.smartpayweb.repository.mapper.AdjustMapper;
import kr.co.smartpayweb.repository.vo.DayAdjustVO;
import kr.co.smartpayweb.repository.vo.MonthAdjustVO;

@Service
public class AdjustServiceImpl implements AdjustService {
	@Autowired
	AdjustMapper mapper;
	
	// ---- 일일정산 첫화면----
	public List<DayAdjustVO> retrieveDayAdjust() {
		return mapper.retrieveDayAdjust();
	}
	// ---- 일일정산 날짜 선택----
	public List<DayAdjustVO> retrieveDayAdjustRe(String dDay) {
		List<DayAdjustVO> allSales = mapper.retrieveDayAdjustRe(dDay);
		return allSales;
	}
	// ---- 월별정산 첫화면 ----
	public List<MonthAdjustVO> retrieveMonthAdjust() {
		return mapper.retrieveMonthAdjust();
	}
	// ---- 월별정산 월 선택으로 조회 ----
	public List<MonthAdjustVO> retrieveMonthAdjustRe(Map<String, String> paramDate) {
		return mapper.retrieveMonthAdjustRe(paramDate);
	}
}
