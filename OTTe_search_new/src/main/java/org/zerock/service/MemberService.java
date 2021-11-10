package org.zerock.service;

import org.zerock.domain.UserVO;

public interface MemberService {

	public void register(UserVO vo) throws Exception;

	public void memberUpdate(UserVO vo) throws Exception;

	public void memberDelete(UserVO vo) throws Exception;

	public int passChk(UserVO vo) throws Exception;

	public int idChk(UserVO vo) throws Exception;
	
	public int emailChk(UserVO vo) throws Exception;
	
	public int memChk(UserVO vo) throws Exception;
	
	public String randomPw(UserVO vo) throws Exception;
	
	
	

}
