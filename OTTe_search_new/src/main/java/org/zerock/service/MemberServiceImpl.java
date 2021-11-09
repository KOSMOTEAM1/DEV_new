package org.zerock.service;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.zerock.domain.MemberVO;
import org.zerock.domain.UserVO;

@Service
public class MemberServiceImpl implements MemberService {

	/*
	 * @Autowired private MemberMapper mapper;
	 */

	@Inject
	SqlSession sql;
	// 회원가입

	private static String namespace = "org.zerock.mapper.MemberMapper";

	@Override
	public void register(MemberVO vo) throws Exception {
		sql.insert(namespace + ".register", vo);
	}

	// Controller에서 보내는 파라미터들을 memberUpdate(MemberVO vo)로 받고
	@Override
	public void memberUpdate(MemberVO vo) throws Exception {

		// 받은 vo를 매퍼로 보내줍니다.
		sql.update(namespace + ".memberUpdate", vo);

	}
	
	
	// Controller에서 보내는 파라미터들을 memberUpdate(MemberVO vo)로 받고
		@Override
		public String randomPw(UserVO vo) throws Exception {

			// 받은 vo를 매퍼로 보내줍니다.
			sql.update(namespace + ".randomPw", vo);
			return null;

		}

	
	
	// 업데이트에서 처리한 내용과 같습니다.
	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		sql.delete(namespace + ".memberDelete", vo);
	}

	// 패스워드 체크
	@Override
	public int passChk(MemberVO vo) throws Exception {
		int result = sql.selectOne(namespace + ".passChk", vo);
		return result;
	}

	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = sql.selectOne(namespace + ".idChk", vo);
		return result;
	}
	
	@Override
	public int emailChk(MemberVO vo) throws Exception {
		int result = sql.selectOne(namespace + ".emailChk", vo);
		return result;
	}
	
	@Override
	public int memChk(MemberVO vo) throws Exception {
		int result = sql.selectOne(namespace + ".memChk", vo);
		return result;
	}
		
}
