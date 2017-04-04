package kr.co.smartpayweb.beacon.service;

import java.util.Map;

import kr.co.smartpayweb.repository.vo.BeaconVO;

public interface BeaconService {

//	public BeaconVO searchBeacon(int beaconNo) throws Exception;
	
	public Map<String, Object> insertBeacon(BeaconVO beacon) throws Exception;
		
//	public Map<String, Object> modifyBeacon(BeaconVO beacon) throws Exception;
	
//	public void deleteBeacon(int beaconNo) throws Exception;
}
