package kr.co.smartpayweb.Adjust.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.smartpayweb.repository.mapper.AdjustMapper;
import kr.co.smartpayweb.repository.vo.dayAdjustVO;

@Service
public class AdjustServiceImpl implements AdjustService {
	@Autowired
	AdjustMapper mapper;
	
	// ---- 일일정산 첫화면----
	public List<dayAdjustVO> retrieveDayAdjust() {
		return mapper.retrieveDayAdjust();
	}
}
