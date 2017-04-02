package kr.co.easybook.book.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.easybook.repository.mapper.PayMapper;
import kr.co.easybook.repository.vo.BuyerVO;

@Service
public class PayServiceImpl implements PayService{
	@Autowired
	PayMapper mapper;
	public List<BuyerVO> checkBuyer() {
		return mapper.selectBuyer();
	}
}
