package kr.co.smartpayweb.repository.mapper;

import java.util.List;
import java.util.Map;

import kr.co.smartpayweb.repository.vo.BeaconVO;

public interface BeaconMapper {

	public List<BeaconVO> searchBeacon(int sellerNo) throws Exception;
	
	public Map<String, Object> insertBeacon(BeaconVO beacon) throws Exception;
	
	public Map<String, Object> modifyBeacon(BeaconVO beacon) throws Exception;
	
	public void deleteBeacon(BeaconVO beacon) throws Exception;
	
}