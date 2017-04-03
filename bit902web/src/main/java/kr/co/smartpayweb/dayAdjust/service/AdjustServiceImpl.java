package kr.co.smartpayweb.dayAdjust.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.smartpayweb.repository.mapper.AdjustMapper;
import kr.co.smartpayweb.repository.vo.AdjustVO;

@Service
public class AdjustServiceImpl implements AdjustService {
	@Autowired
	AdjustMapper mapper;
	public List<AdjustVO> retrieveDayAdjust(Date date) {
		return mapper.retrieveDayAdjust(date);
	}
}
