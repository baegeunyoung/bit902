package kr.co.smartpayapp.stamp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.smartpayapp.repository.mapper.StampMapper;
import kr.co.smartpayapp.repository.vo.BuyerStampVO;
import kr.co.smartpayapp.repository.vo.OnlyMyStampVO;

@Service
public class StampServiceImpl implements StampService {
	
	@Autowired
	private StampMapper mapper;
	
	public List<OnlyMyStampVO> onlyMyStamp(int myNo) throws Exception {
		List<OnlyMyStampVO> d = mapper.onlyMyStamp(myNo);
		return d;
	}
}
