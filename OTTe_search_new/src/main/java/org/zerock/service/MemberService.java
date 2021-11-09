package org.zerock.service;

import org.zerock.domain.MemberVO;
import org.zerock.domain.UserVO;

public interface MemberService {

	public void register(MemberVO vo) throws Exception;

	public void memberUpdate(MemberVO vo) throws Exception;

	public void memberDelete(MemberVO vo) throws Exception;

	public int passChk(MemberVO vo) throws Exception;

	public int idChk(MemberVO vo) throws Exception;
	
	public int emailChk(MemberVO vo) throws Exception;
	
	public int memChk(MemberVO vo) throws Exception;
	
	public String randomPw(UserVO vo) throws Exception;
	
	
	

}
