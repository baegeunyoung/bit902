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
	public List<DayAdjustVO> retrieveDayAdjust(int sellerNo) {
		return mapper.retrieveDayAdjust(sellerNo);
	}
	// ---- 일일정산 날짜 선택----
	public List<DayAdjustVO> retrieveDayAdjustRe(Map<String, Object> data) {
		List<DayAdjustVO> allSales = mapper.retrieveDayAdjustRe(data);
		return allSales;
	}
	// ---- 월별정산 첫화면 ----
	public List<MonthAdjustVO> retrieveMonthAdjust(int sellerNo) {
		return mapper.retrieveMonthAdjust(sellerNo);
	}
	// ---- 월별정산 월 선택으로 조회 ----
	public List<MonthAdjustVO> retrieveMonthAdjustRe(Map<String, Object> paramDate) {
		return mapper.retrieveMonthAdjustRe(paramDate);
	}
}
