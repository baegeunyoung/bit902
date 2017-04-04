package kr.co.smartpayweb.beacon.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import kr.co.smartpayweb.repository.mapper.BeaconMapper;
import kr.co.smartpayweb.repository.vo.BeaconVO;

public class BeaconServiceImpl implements BeaconService {

	@Autowired
	private BeaconMapper dao;
	
//	public BeaconVO searchBeacon(int beaconNo) throws Exception {
//		dao.searchBeacon(beaconNo);
//	}
	
	public Map<String, Object> insertBeacon(BeaconVO beacon) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("list", dao.insertBeacon(beacon));
		return map;
	}
	
//	public Map<String, Object> modifyBeacon(BeaconVO beacon) throws Exception {
//	Map<String, Object> map = new HashMap<>();
//	map.put("list", dao.modifyBeacon(beacon));
//	return map;	
//	}

//	public void deleteBeacon(int beaconNo) throws Exception {
//		dao.deleteBeacon(beaconNo);
//	}
	
}
