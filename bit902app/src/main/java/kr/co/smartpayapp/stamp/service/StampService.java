package kr.co.smartpayapp.stamp.service;

import java.util.List;

import kr.co.smartpayapp.repository.vo.BuyerStampVO;
import kr.co.smartpayapp.repository.vo.OnlyMyStampVO;

public interface StampService {

	public List<OnlyMyStampVO> onlyMyStamp(int myNo) throws Exception;
}
