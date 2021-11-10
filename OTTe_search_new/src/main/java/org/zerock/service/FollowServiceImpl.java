package org.zerock.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.ContentsVO;
import org.zerock.domain.FollowVO;
import org.zerock.mapper.FollowMapper;

@Service
//@Repository
public class FollowServiceImpl implements FollowService {

	@Autowired
	private FollowMapper FollowMapper;

	@Transactional
	@Override
	public void addFollow(Integer contentsid, Integer usernum) throws Exception {
		Map<String, Integer> paramMap = new HashMap<>();
		System.out.println("contentsid");
		System.out.println("usernum");
		paramMap.put("contentsid", contentsid);
		paramMap.put("usernum", usernum);
		FollowMapper.addFollow(paramMap);
		
		System.out.println("paraMap");
	}

	@Override
	public void removeFollow(ContentsVO contentsvo) throws Exception {
		FollowMapper.removeFollow(contentsvo);

	}

	@Override
	public FollowVO checkFollow(Integer contentsid, Integer usernum) throws Exception {
		Map<String, Integer> paramMap = new HashMap<>();
		
		paramMap.put("contentsid", contentsid);
		paramMap.put("usernum", usernum);
		
		System.out.println("test@@@@@@@@"+FollowMapper.checkFollow(paramMap));
		return FollowMapper.checkFollow(paramMap);
	
	}


}
