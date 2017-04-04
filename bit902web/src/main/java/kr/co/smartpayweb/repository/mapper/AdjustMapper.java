package kr.co.smartpayweb.repository.mapper;

import java.util.Date;
import java.util.List;

import kr.co.smartpayweb.repository.vo.dayAdjustVO;

public interface AdjustMapper {
	public List<dayAdjustVO> retrieveDayAdjust();
}
