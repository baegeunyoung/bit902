package kr.co.smartpayweb.dayAdjust.service;

import java.util.Date;
import java.util.List;

import kr.co.smartpayweb.repository.vo.AdjustVO;

public interface AdjustService {
	public List<AdjustVO> retrieveDayAdjust(Date date);
}
