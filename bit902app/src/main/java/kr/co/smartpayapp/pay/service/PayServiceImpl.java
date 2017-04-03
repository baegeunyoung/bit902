package kr.co.smartpayapp.pay.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.smartpayapp.repository.mapper.PayMapper;
import kr.co.smartpayapp.repository.vo.BuyerVO;

@Service
public class PayServiceImpl implements PayService{
	@Autowired
	PayMapper mapper;
	public List<BuyerVO> checkBuyer() {
		return mapper.selectBuyer();
	}
}