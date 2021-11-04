package org.zerock.service;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.zerock.domain.MemberVO;


@Service
public class MemberServiceImpl implements MemberService {
	
	/*
	 * @Autowired private MemberMapper mapper;
	 */
	
	@Inject
	SqlSession sql;
	// 회원가입

	private static String namespace ="org.zerock.mapper.MemberMapper";
	
	@Override
	public void register(MemberVO vo) throws Exception {
		sql.insert(namespace+".register", vo);
	}

	
}