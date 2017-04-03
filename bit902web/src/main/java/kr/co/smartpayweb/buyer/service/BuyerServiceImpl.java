package kr.co.smartpayweb.buyer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.smartpayweb.repository.mapper.BuyerMapper;
import kr.co.smartpayweb.repository.vo.BuyerVO;
@Service
public class BuyerServiceImpl implements BuyerService{
	@Autowired
	BuyerMapper mapper;
	public List<BuyerVO> checkBuyer() {
		return mapper.selectBuyer();
	}
}
