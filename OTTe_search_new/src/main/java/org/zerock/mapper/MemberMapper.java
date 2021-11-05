package org.zerock.mapper;

import org.zerock.domain.MemberVO;

public interface MemberMapper {
	
	// 회원가입
	public void register(MemberVO vo) throws Exception;
}
